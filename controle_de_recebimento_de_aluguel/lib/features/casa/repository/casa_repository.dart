import 'package:controle_de_recebimento_de_aluguel/core/database/isar_service.dart';
import 'package:controle_de_recebimento_de_aluguel/features/casa/model/model_casa.dart';
import 'package:isar/isar.dart';

class CasaRepository {
  final _db = IsarService.db;

  Future<List<ModelCasa>> getAll() async {
    return await _db.modelCasas.where().findAll();
  }

  Future<List<ModelCasa>> getByImobiliaria(int idImobiliaria) async {
    return await _db.modelCasas
        .filter()
        .idImobiliariaEqualTo(idImobiliaria)
        .findAll();
  }

  Future<void> save(ModelCasa casa) async {
    await _db.writeTxn(() async {
      await _db.modelCasas.put(casa);
    });
  }

  Future<void> update(ModelCasa casa) async {
    await _db.writeTxn(() async {
      await _db.modelCasas.put(casa);
    });
  }

  Future<void> delete(int id) async {
    await _db.writeTxn(() async {
      await _db.modelCasas.delete(id);
    });
  }
}
