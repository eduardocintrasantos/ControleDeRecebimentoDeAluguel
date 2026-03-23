import 'package:controle_de_recebimento_de_aluguel/core/database/isar_service.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/model/model_titulo.dart';
import 'package:isar/isar.dart';

class TituloRepository {
  final _db = IsarService.db;

  Future<List<ModelTitulo>> getAll() async {
    return await _db.modelTitulos.where().findAll();
  }

  Future<List<ModelTitulo>> getByCasaIds(List<int> casaIds) async {
    return await _db.modelTitulos
        .filter()
        .anyOf(casaIds, (q, id) => q.idCasaEqualTo(id))
        .findAll();
  }

  Future<ModelTitulo?> getById(int id) async {
    return await _db.modelTitulos.get(id);
  }

  Future<void> save(ModelTitulo titulo) async {
    await _db.writeTxn(() async {
      await _db.modelTitulos.put(titulo);
    });
  }

  Future<void> marcarBaixado(int id) async {
    final titulo = await _db.modelTitulos.get(id);
    if (titulo == null) return;
    titulo.status = true;
    titulo.dataRecebimento = DateTime.now();
    await _db.writeTxn(() async {
      await _db.modelTitulos.put(titulo);
    });
  }

  Future<void> desmarcarBaixado(int id) async {
    final titulo = await _db.modelTitulos.get(id);
    if (titulo == null) return;
    titulo.status = false;
    titulo.dataRecebimento = null;
    await _db.writeTxn(() async {
      await _db.modelTitulos.put(titulo);
    });
  }

  Future<void> delete(int id) async {
    await _db.writeTxn(() async {
      await _db.modelTitulos.delete(id);
    });
  }
}
