import 'package:controle_de_recebimento_de_aluguel/app/router/app_router.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/model/model_imobiliaria.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/view_model/imobiliaria_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ImobiliariaPage extends ConsumerWidget {
  const ImobiliariaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(imobiliariaViewModelProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: const Text('Imobiliárias'),
        centerTitle: false,
        backgroundColor: colorScheme.surfaceContainerLowest,
      ),
      body: switch (state) {
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncError(:final error) => Center(child: Text('Erro: $error')),
        AsyncData(:final value) when value.isEmpty => _EmptyState(),
        AsyncData(:final value) => _ImobiliariaList(imobiliarias: value),
        _ => const SizedBox.shrink(),
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRouter.imobiliariaNova),
        icon: const Icon(Icons.add),
        label: const Text('Nova imobiliária'),
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
          Icon(Icons.business_outlined, size: 64, color: colorScheme.outline),
          const SizedBox(height: 16),
          Text(
            'Nenhuma imobiliária cadastrada',
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

class _ImobiliariaList extends ConsumerWidget {
  final List<ModelImobiliaria> imobiliarias;

  const _ImobiliariaList({required this.imobiliarias});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
      itemCount: imobiliarias.length,
      itemBuilder: (context, index) {
        final imobiliaria = imobiliarias[index];
        return _ImobiliariaCard(imobiliaria: imobiliaria);
      },
    );
  }
}

class _ImobiliariaCard extends StatelessWidget {
  final ModelImobiliaria imobiliaria;

  const _ImobiliariaCard({required this.imobiliaria});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final inicial = imobiliaria.descricao.isNotEmpty
        ? imobiliaria.descricao[0].toUpperCase()
        : '?';

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
          backgroundColor: colorScheme.primaryContainer,
          child: Text(
            inicial,
            style: TextStyle(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          imobiliaria.descricao,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imobiliaria.telefone != null)
              Row(
                children: [
                  Icon(Icons.phone_outlined, size: 14, color: colorScheme.outline),
                  const SizedBox(width: 4),
                  Text(imobiliaria.telefone!,
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            if (imobiliaria.rua != null || imobiliaria.bairro != null)
              Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 14, color: colorScheme.outline),
                  const SizedBox(width: 4),
                  Text(
                    [
                      if (imobiliaria.rua != null) imobiliaria.rua!,
                      if (imobiliaria.bairro != null) imobiliaria.bairro!,
                    ].join(', '),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
          ],
        ),
        trailing: Icon(Icons.chevron_right, color: colorScheme.outline),
        onTap: () => context.push(AppRouter.imobiliariaEditar, extra: imobiliaria),
      ),
    );
  }
}
