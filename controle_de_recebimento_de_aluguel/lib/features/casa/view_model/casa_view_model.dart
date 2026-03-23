import 'package:controle_de_recebimento_de_aluguel/features/casa/model/model_casa.dart';
import 'package:controle_de_recebimento_de_aluguel/features/casa/repository/casa_repository.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/model/model_titulo.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/repository/titulo_repository.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/view_model/titulo_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final casaRepositoryProvider = Provider((_) => CasaRepository());
final _tituloRepositoryProvider = Provider((_) => TituloRepository());

final casaViewModelProvider =
    AsyncNotifierProvider<CasaViewModel, List<ModelCasa>>(
  CasaViewModel.new,
);

class CasaViewModel extends AsyncNotifier<List<ModelCasa>> {
  late CasaRepository _repository;
  late TituloRepository _tituloRepository;

  @override
  Future<List<ModelCasa>> build() async {
    _repository = ref.read(casaRepositoryProvider);
    _tituloRepository = ref.read(_tituloRepositoryProvider);
    return await _repository.getAll();
  }

  Future<void> salvar(ModelCasa casa) async {
    await _repository.save(casa);
    await _gerarTitulos(casa);
    ref.invalidateSelf();
    ref.invalidate(tituloViewModelProvider);
  }

  Future<void> atualizar(ModelCasa casa) async {
    await _repository.update(casa);
    ref.invalidateSelf();
  }

  Future<void> deletar(int id) async {
    await _repository.delete(id);
    ref.invalidateSelf();
  }

  Future<void> _gerarTitulos(ModelCasa casa) async {
    var cursor = DateTime(casa.dataInicio.year, casa.dataInicio.month);
    final fim = DateTime(casa.dataFinal.year, casa.dataFinal.month);

    while (!cursor.isAfter(fim)) {
      final titulo = ModelTitulo(
        idCasa: casa.id,
        valorAluguel: casa.valorAluguel,
        mes: cursor.month,
        ano: cursor.year,
        status: false,
        dataRecebimento: null,
      );
      await _tituloRepository.save(titulo);
      cursor = DateTime(cursor.year, cursor.month + 1);
    }
  }
}
