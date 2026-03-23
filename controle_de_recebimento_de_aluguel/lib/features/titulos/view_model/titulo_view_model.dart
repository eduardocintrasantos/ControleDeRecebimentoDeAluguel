import 'package:controle_de_recebimento_de_aluguel/features/casa/repository/casa_repository.dart';
import 'package:controle_de_recebimento_de_aluguel/features/casa/view_model/casa_view_model.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/model/model_titulo.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/repository/titulo_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tituloRepositoryProvider = Provider((_) => TituloRepository());

final tituloViewModelProvider =
    AsyncNotifierProvider<TituloViewModel, List<ModelTitulo>>(
  TituloViewModel.new,
);

class TituloViewModel extends AsyncNotifier<List<ModelTitulo>> {
  late TituloRepository _repository;
  late CasaRepository _casaRepository;

  int? _imobiliariaId;
  int? _mes;
  int? _ano;

  int? get imobiliariaId => _imobiliariaId;
  int? get mes => _mes;
  int? get ano => _ano;

  @override
  Future<List<ModelTitulo>> build() async {
    _repository = ref.read(tituloRepositoryProvider);
    _casaRepository = ref.read(casaRepositoryProvider);
    return await _carregar();
  }

  Future<List<ModelTitulo>> _carregar() async {
    List<ModelTitulo> titulos;

    if (_imobiliariaId != null) {
      final casas = await _casaRepository.getByImobiliaria(_imobiliariaId!);
      final ids = casas.map((c) => c.id).toList();
      titulos = ids.isEmpty ? [] : await _repository.getByCasaIds(ids);
    } else {
      titulos = await _repository.getAll();
    }

    if (_mes != null) titulos = titulos.where((t) => t.mes == _mes).toList();
    if (_ano != null) titulos = titulos.where((t) => t.ano == _ano).toList();

    titulos.sort((a, b) {
      final cmpAno = a.ano.compareTo(b.ano);
      return cmpAno != 0 ? cmpAno : a.mes.compareTo(b.mes);
    });

    return titulos;
  }

  void setFiltro({int? imobiliariaId, int? mes, int? ano}) {
    _imobiliariaId = imobiliariaId;
    _mes = mes;
    _ano = ano;
    ref.invalidateSelf();
  }

  void limparFiltros() {
    _imobiliariaId = null;
    _mes = null;
    _ano = null;
    ref.invalidateSelf();
  }

  Future<void> marcarBaixado(int id) async {
    await _repository.marcarBaixado(id);
    ref.invalidateSelf();
  }

  Future<void> desmarcarBaixado(int id) async {
    await _repository.desmarcarBaixado(id);
    ref.invalidateSelf();
  }
}
