import 'package:isar/isar.dart';

part 'model_titulo.g.dart';

@collection
class ModelTitulo {
  Id id = Isar.autoIncrement;

  int idCasa;
  late double valorAluguel;
  late int mes;
  late int ano;
  late bool status;
  late DateTime? dataRecebimento;

  ModelTitulo({
    required this.idCasa,
    required this.valorAluguel,
    required this.mes,
    required this.ano,
    required this.status,
    required this.dataRecebimento,
  });
}
