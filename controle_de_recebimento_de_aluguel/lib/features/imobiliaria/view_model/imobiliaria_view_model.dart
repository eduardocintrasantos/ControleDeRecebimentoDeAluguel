import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/model/model_imobiliaria.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/repository/imobiliaria_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imobiliariaRepositoryProvider = Provider((_) => ImobiliariaRepository());

final imobiliariaViewModelProvider =
    AsyncNotifierProvider<ImobiliariaViewModel, List<ModelImobiliaria>>(
  ImobiliariaViewModel.new,
);

class ImobiliariaViewModel extends AsyncNotifier<List<ModelImobiliaria>> {
  late ImobiliariaRepository _repository;

  @override
  Future<List<ModelImobiliaria>> build() async {
    _repository = ref.read(imobiliariaRepositoryProvider);
    return await _repository.getAll();
  }

  Future<void> salvar(ModelImobiliaria imobiliaria) async {
    await _repository.save(imobiliaria);
    ref.invalidateSelf();
  }

  Future<void> atualizar(ModelImobiliaria imobiliaria) async {
    await _repository.update(imobiliaria);
    ref.invalidateSelf();
  }

  Future<void> deletar(int id) async {
    await _repository.delete(id);
    ref.invalidateSelf();
  }
}
