import 'package:controle_de_recebimento_de_aluguel/core/database/isar_service.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/model/model_imobiliaria.dart';
import 'package:isar/isar.dart';

class ImobiliariaRepository {
  final _db = IsarService.db;

  Future<List<ModelImobiliaria>> getAll() async {
    return await _db.modelImobiliarias.where().findAll();
  }

  Future<void> save(ModelImobiliaria imobiliaria) async {
    await _db.writeTxn(() async {
      await _db.modelImobiliarias.put(imobiliaria);
    });
  }

  Future<void> update(ModelImobiliaria imobiliaria) async {
    await _db.writeTxn(() async {
      await _db.modelImobiliarias.put(imobiliaria);
    });
  }

  Future<void> delete(int id) async {
    await _db.writeTxn(() async {
      await _db.modelImobiliarias.delete(id);
    });
  }
}
