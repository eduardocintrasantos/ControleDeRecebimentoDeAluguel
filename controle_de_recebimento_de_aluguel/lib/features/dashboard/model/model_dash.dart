import 'package:controle_de_recebimento_de_aluguel/features/casa/model/model_casa.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/model/model_titulo.dart';

class TituloAtrasado {
  final ModelTitulo titulo;
  final ModelCasa casa;
  final String nomeImobiliaria;

  TituloAtrasado({
    required this.titulo,
    required this.casa,
    required this.nomeImobiliaria,
  });
}

class DashboardData {
  final double totalMes;
  final double recebidoMes;
  final double faltaMes;
  final List<TituloAtrasado> atrasados;

  DashboardData({
    required this.totalMes,
    required this.recebidoMes,
    required this.faltaMes,
    required this.atrasados,
  });
}
