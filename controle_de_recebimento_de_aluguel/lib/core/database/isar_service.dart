import 'package:controle_de_recebimento_de_aluguel/features/casa/model/model_casa.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/model/model_imobiliaria.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/model/model_titulo.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static late Isar db;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([
      ModelImobiliariaSchema,
      ModelCasaSchema,
      ModelTituloSchema,
    ], directory: dir.path);
  }
}
