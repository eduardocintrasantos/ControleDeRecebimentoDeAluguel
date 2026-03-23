import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/model/model_imobiliaria.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/view_model/imobiliaria_view_model.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/model/model_titulo.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/view_model/titulo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _meses = [
  'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
  'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro',
];

class TituloPage extends ConsumerWidget {
  const TituloPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tituloViewModelProvider);
    final imobiliarias = ref.watch(imobiliariaViewModelProvider).valueOrNull ?? [];
    final vm = ref.read(tituloViewModelProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    final anoAtual = DateTime.now().year;
    final anos = List.generate(5, (i) => anoAtual - 2 + i);

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: const Text('Títulos'),
        centerTitle: false,
        backgroundColor: colorScheme.surfaceContainerLowest,
      ),
      body: Column(
        children: [
          _FiltroBar(
            imobiliarias: imobiliarias,
            anos: anos,
            vm: vm,
          ),
          const Divider(height: 1),
          Expanded(
            child: switch (state) {
              AsyncLoading() =>
                const Center(child: CircularProgressIndicator()),
              AsyncError(:final error) =>
                Center(child: Text('Erro: $error')),
              AsyncData(:final value) when value.isEmpty => _EmptyState(),
              AsyncData(:final value) => _TituloList(titulos: value),
              _ => const SizedBox.shrink(),
            },
          ),
        ],
      ),
    );
  }
}

class _FiltroBar extends ConsumerStatefulWidget {
  final List<ModelImobiliaria> imobiliarias;
  final List<int> anos;
  final TituloViewModel vm;

  const _FiltroBar({
    required this.imobiliarias,
    required this.anos,
    required this.vm,
  });

  @override
  ConsumerState<_FiltroBar> createState() => _FiltroBarState();
}

class _FiltroBarState extends ConsumerState<_FiltroBar> {
  ModelImobiliaria? _imobiliaria;
  int? _mes;
  int? _ano;

  void _aplicar() {
    widget.vm.setFiltro(
      imobiliariaId: _imobiliaria?.id,
      mes: _mes,
      ano: _ano,
    );
  }

  void _limpar() {
    setState(() {
      _imobiliaria = null;
      _mes = null;
      _ano = null;
    });
    widget.vm.limparFiltros();
  }

  bool get _temFiltro => _imobiliaria != null || _mes != null || _ano != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<ModelImobiliaria>(
                  initialValue: _imobiliaria,
                  decoration: const InputDecoration(
                    labelText: 'Imobiliária',
                    isDense: true,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Todas')),
                    ...widget.imobiliarias.map((i) => DropdownMenuItem(
                          value: i,
                          child: Text(i.descricao),
                        )),
                  ],
                  onChanged: (v) {
                    setState(() => _imobiliaria = v);
                    _aplicar();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<int>(
                  initialValue: _mes,
                  decoration: const InputDecoration(
                    labelText: 'Mês',
                    isDense: true,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Todos')),
                    ...List.generate(
                      12,
                      (i) => DropdownMenuItem(
                        value: i + 1,
                        child: Text(_meses[i]),
                      ),
                    ),
                  ],
                  onChanged: (v) {
                    setState(() => _mes = v);
                    _aplicar();
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<int>(
                  initialValue: _ano,
                  decoration: const InputDecoration(
                    labelText: 'Ano',
                    isDense: true,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Todos')),
                    ...widget.anos.map((a) => DropdownMenuItem(
                          value: a,
                          child: Text(a.toString()),
                        )),
                  ],
                  onChanged: (v) {
                    setState(() => _ano = v);
                    _aplicar();
                  },
                ),
              ),
              if (_temFiltro) ...[
                const SizedBox(width: 8),
                IconButton.outlined(
                  onPressed: _limpar,
                  icon: const Icon(Icons.filter_alt_off_outlined),
                  tooltip: 'Limpar filtros',
                ),
              ],
            ],
          ),
        ],
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
          Icon(Icons.receipt_long_outlined, size: 64, color: colorScheme.outline),
          const SizedBox(height: 16),
          Text(
            'Nenhum título encontrado',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: colorScheme.outline),
          ),
        ],
      ),
    );
  }
}

class _TituloList extends ConsumerWidget {
  final List<ModelTitulo> titulos;

  const _TituloList({required this.titulos});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      itemCount: titulos.length,
      itemBuilder: (context, index) =>
          _TituloCard(titulo: titulos[index]),
    );
  }
}

class _TituloCard extends ConsumerWidget {
  final ModelTitulo titulo;

  const _TituloCard({required this.titulo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final vm = ref.read(tituloViewModelProvider.notifier);
    final baixado = titulo.status;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: baixado ? colorScheme.primary : colorScheme.outlineVariant,
        ),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: CircleAvatar(
          backgroundColor: baixado
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          child: Icon(
            baixado ? Icons.check : Icons.hourglass_empty_outlined,
            color: baixado
                ? colorScheme.onPrimaryContainer
                : colorScheme.outline,
            size: 20,
          ),
        ),
        title: Text(
          '${_meses[titulo.mes - 1]} / ${titulo.ano}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'R\$ ${titulo.valorAluguel.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            if (baixado && titulo.dataRecebimento != null)
              Text(
                'Recebido em ${_formatarData(titulo.dataRecebimento!)}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: colorScheme.outline),
              ),
          ],
        ),
        trailing: Switch(
          value: baixado,
          onChanged: (_) async {
            if (baixado) {
              await vm.desmarcarBaixado(titulo.id);
            } else {
              await vm.marcarBaixado(titulo.id);
            }
          },
        ),
      ),
    );
  }

  String _formatarData(DateTime data) =>
      '${data.day.toString().padLeft(2, '0')}/'
      '${data.month.toString().padLeft(2, '0')}/'
      '${data.year}';
}
