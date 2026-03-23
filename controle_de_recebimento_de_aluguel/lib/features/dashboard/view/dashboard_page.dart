import 'package:controle_de_recebimento_de_aluguel/features/dashboard/model/model_dash.dart';
import 'package:controle_de_recebimento_de_aluguel/features/dashboard/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _meses = [
  'Janeiro',
  'Fevereiro',
  'Março',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro',
];

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardViewModelProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final agora = DateTime.now();

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: Text('${_meses[agora.month - 1]} ${agora.year}'),
        centerTitle: false,
        backgroundColor: colorScheme.surfaceContainerLowest,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(dashboardViewModelProvider),
          ),
        ],
      ),
      body: switch (state) {
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncError(:final error) => Center(child: Text('Erro: $error')),
        AsyncData(:final value) => _DashboardContent(data: value),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class _DashboardContent extends StatelessWidget {
  final DashboardData data;

  const _DashboardContent({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ResumoMes(data: data),
        if (data.atrasados.isNotEmpty) ...[
          const SizedBox(height: 24),
          _AtrasadosSection(atrasados: data.atrasados),
        ],
      ],
    );
  }
}

class _ResumoMes extends StatelessWidget {
  final DashboardData data;

  const _ResumoMes({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Resumo do mês',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _SummaryCard(
                label: 'Total',
                valor: data.totalMes,
                icon: Icons.account_balance_wallet_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SummaryCard(
                label: 'Recebido',
                valor: data.recebidoMes,
                icon: Icons.check_circle_outline,
                color: Colors.green.shade600,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SummaryCard(
                label: 'A receber',
                valor: data.faltaMes,
                icon: Icons.hourglass_empty_outlined,
                color: data.faltaMes > 0
                    ? Colors.orange.shade700
                    : Colors.green.shade600,
              ),
            ),
          ],
        ),
        if (data.totalMes > 0) ...[
          const SizedBox(height: 12),
          _ProgressBar(recebido: data.recebidoMes, total: data.totalMes),
        ],
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final double valor;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.label,
    required this.valor,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: colorScheme.outline),
            ),
            const SizedBox(height: 4),
            Text(
              'R\$ ${valor.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final double recebido;
  final double total;

  const _ProgressBar({required this.recebido, required this.total});

  @override
  Widget build(BuildContext context) {
    final pct = (recebido / total).clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: pct,
            minHeight: 10,
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation(Colors.green.shade600),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${(pct * 100).toStringAsFixed(0)}% recebido',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ],
    );
  }
}

class _AtrasadosSection extends StatelessWidget {
  final List<TituloAtrasado> atrasados;

  const _AtrasadosSection({required this.atrasados});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: Colors.orange.shade700,
              size: 18,
            ),
            const SizedBox(width: 6),
            Text(
              'Em atraso (${atrasados.length})',
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: Colors.orange.shade700),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...atrasados.map(
          (a) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.orange.shade200),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: Icon(
                  Icons.home_outlined,
                  color: Colors.orange.shade700,
                  size: 20,
                ),
              ),
              title: Text(
                '${a.casa.rua}, ${a.casa.numero}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.business_outlined,
                        size: 13,
                        color: colorScheme.outline,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        a.nomeImobiliaria,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Text(
                    '${_meses[a.titulo.mes - 1]} / ${a.titulo.ano}  •  R\$ ${a.titulo.valorAluguel.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.orange.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
