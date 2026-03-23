import 'package:isar/isar.dart';

part 'model_imobiliaria.g.dart';

@collection
class ModelImobiliaria {
  Id id = Isar.autoIncrement;

  late String descricao;
  String? telefone;
  String? rua;
  String? bairro;
  int? numero;

  ModelImobiliaria({
    required this.descricao,
    this.telefone,
    this.rua,
    this.bairro,
    this.numero,
  });
}
