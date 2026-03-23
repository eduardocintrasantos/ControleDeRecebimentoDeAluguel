import 'package:controle_de_recebimento_de_aluguel/app/router/app_router.dart';
import 'package:controle_de_recebimento_de_aluguel/features/casa/model/model_casa.dart';
import 'package:controle_de_recebimento_de_aluguel/features/casa/view_model/casa_view_model.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/model/model_imobiliaria.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/view_model/imobiliaria_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CasaPage extends ConsumerWidget {
  const CasaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(casaViewModelProvider);
    final imobiliarias = ref.watch(imobiliariaViewModelProvider).valueOrNull ?? [];
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: const Text('Casas'),
        centerTitle: false,
        backgroundColor: colorScheme.surfaceContainerLowest,
      ),
      body: switch (state) {
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncError(:final error) => Center(child: Text('Erro: $error')),
        AsyncData(:final value) when value.isEmpty => _EmptyState(),
        AsyncData(:final value) => _CasaList(
            casas: value,
            imobiliarias: imobiliarias,
          ),
        _ => const SizedBox.shrink(),
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRouter.casaNova),
        icon: const Icon(Icons.add),
        label: const Text('Nova casa'),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.home_outlined, size: 64, color: colorScheme.outline),
          const SizedBox(height: 16),
          Text(
            'Nenhuma casa cadastrada',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: colorScheme.outline),
          ),
          const SizedBox(height: 8),
          Text(
            'Toque em + para adicionar',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: colorScheme.outlineVariant),
          ),
        ],
      ),
    );
  }
}

class _CasaList extends ConsumerWidget {
  final List<ModelCasa> casas;
  final List<ModelImobiliaria> imobiliarias;

  const _CasaList({required this.casas, required this.imobiliarias});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
      itemCount: casas.length,
      itemBuilder: (context, index) {
        final casa = casas[index];
        final imobiliaria = imobiliarias.cast<ModelImobiliaria?>().firstWhere(
              (i) => i?.id == casa.idImobiliaria,
              orElse: () => null,
            );
        return _CasaCard(casa: casa, nomeImobiliaria: imobiliaria?.descricao);
      },
    );
  }
}

class _CasaCard extends StatelessWidget {
  final ModelCasa casa;
  final String? nomeImobiliaria;

  const _CasaCard({required this.casa, this.nomeImobiliaria});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final fmt = DateFormat('dd/MM/yyyy');

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: casa.status
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          child: Icon(
            Icons.home_outlined,
            color: casa.status
                ? colorScheme.onPrimaryContainer
                : colorScheme.outline,
          ),
        ),
        title: Text(
          '${casa.rua}, ${casa.numero}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (nomeImobiliaria != null)
              Row(
                children: [
                  Icon(Icons.business_outlined, size: 14, color: colorScheme.outline),
                  const SizedBox(width: 4),
                  Text(nomeImobiliaria!,
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            Row(
              children: [
                Icon(Icons.calendar_today_outlined, size: 14, color: colorScheme.outline),
                const SizedBox(width: 4),
                Text(
                  '${fmt.format(casa.dataInicio)} – ${fmt.format(casa.dataFinal)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.attach_money, size: 14, color: colorScheme.outline),
                const SizedBox(width: 4),
                Text(
                  'R\$ ${casa.valorAluguel.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chip(
              label: Text(
                casa.status ? 'Ativo' : 'Inativo',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: casa.status
                          ? colorScheme.onPrimaryContainer
                          : colorScheme.outline,
                    ),
              ),
              backgroundColor: casa.status
                  ? colorScheme.primaryContainer
                  : colorScheme.surfaceContainerHighest,
              padding: EdgeInsets.zero,
              side: BorderSide.none,
            ),
          ],
        ),
        onTap: () => context.push(AppRouter.casaEditar, extra: casa),
      ),
    );
  }
}
