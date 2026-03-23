import 'package:controle_de_recebimento_de_aluguel/core/database/isar_service.dart';
import 'package:controle_de_recebimento_de_aluguel/features/dashboard/model/model_dash.dart';
import 'package:isar/isar.dart';
import 'package:controle_de_recebimento_de_aluguel/features/casa/model/model_casa.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/model/model_imobiliaria.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/model/model_titulo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewModelProvider =
    AsyncNotifierProvider<DashboardViewModel, DashboardData>(
      DashboardViewModel.new,
    );

class DashboardViewModel extends AsyncNotifier<DashboardData> {
  @override
  Future<DashboardData> build() async {
    return await _carregar();
  }

  Future<DashboardData> _carregar() async {
    final db = IsarService.db;
    final agora = DateTime.now();
    final mesAtual = agora.month;
    final anoAtual = agora.year;

    final todosTitulos = await db.modelTitulos.where().findAll();
    final todasCasas = await db.modelCasas.where().findAll();
    final todasImobiliarias = await db.modelImobiliarias.where().findAll();

    // Títulos do mês atual
    final titulosMes = todosTitulos
        .where((t) => t.mes == mesAtual && t.ano == anoAtual)
        .toList();

    final totalMes = titulosMes.fold(0.0, (s, t) => s + t.valorAluguel);
    final recebidoMes = titulosMes
        .where((t) => t.status)
        .fold(0.0, (s, t) => s + t.valorAluguel);
    final faltaMes = totalMes - recebidoMes;

    // Títulos em atraso: abertos de meses anteriores
    final atrasadosTitulos = todosTitulos.where((t) {
      if (t.status) return false;
      if (t.ano < anoAtual) return true;
      if (t.ano == anoAtual && t.mes < mesAtual) return true;
      return false;
    }).toList();

    // Montar objetos com casa e imobiliária
    final Map<int, ModelCasa> casaMap = {for (final c in todasCasas) c.id: c};
    final Map<int, ModelImobiliaria> imobiliariaMap = {
      for (final i in todasImobiliarias) i.id: i,
    };

    final atrasados = atrasadosTitulos
        .where((t) => casaMap.containsKey(t.idCasa))
        .map((t) {
          final casa = casaMap[t.idCasa]!;
          final imobiliaria = imobiliariaMap[casa.idImobiliaria];
          return TituloAtrasado(
            titulo: t,
            casa: casa,
            nomeImobiliaria:
                imobiliaria?.descricao ?? 'Imobiliária não encontrada',
          );
        })
        .toList();

    atrasados.sort((a, b) {
      final cmpAno = a.titulo.ano.compareTo(b.titulo.ano);
      return cmpAno != 0 ? cmpAno : a.titulo.mes.compareTo(b.titulo.mes);
    });

    return DashboardData(
      totalMes: totalMes,
      recebidoMes: recebidoMes,
      faltaMes: faltaMes,
      atrasados: atrasados,
    );
  }

  Future<void> recarregar() async {
    ref.invalidateSelf();
  }
}
