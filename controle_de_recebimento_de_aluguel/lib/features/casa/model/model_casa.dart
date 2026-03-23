import 'package:isar/isar.dart';

part 'model_casa.g.dart';

@collection
class ModelCasa {
  Id id = Isar.autoIncrement;

  int idImobiliaria;
  late String rua = "";
  late String bairro = "";
  late int numero = 0;
  late DateTime dataInicio = DateTime.now();
  late DateTime dataFinal = DateTime.now();
  late double valorAluguel = 0.0;
  late String observacao = "";
  late bool status = true;

  ModelCasa({
    required this.idImobiliaria,
    required this.rua,
    required this.bairro,
    required this.numero,
    required this.dataInicio,
    required this.dataFinal,
    required this.valorAluguel,
    required this.status,
  });
}
