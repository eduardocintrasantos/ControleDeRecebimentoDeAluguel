import 'package:controle_de_recebimento_de_aluguel/features/casa/model/model_casa.dart';
import 'package:controle_de_recebimento_de_aluguel/features/casa/view_model/casa_view_model.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/model/model_imobiliaria.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/view_model/imobiliaria_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreateCasaPage extends ConsumerStatefulWidget {
  final ModelCasa? casa;

  const CreateCasaPage({super.key, this.casa});

  @override
  ConsumerState<CreateCasaPage> createState() => _CreateCasaPageState();
}

class _CreateCasaPageState extends ConsumerState<CreateCasaPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _ruaController;
  late final TextEditingController _bairroController;
  late final TextEditingController _numeroController;
  late final TextEditingController _valorController;
  late final TextEditingController _observacaoController;

  ModelImobiliaria? _imobiliariaSelecionada;
  late DateTime _dataInicio;
  late DateTime _dataFinal;
  late bool _status;
  bool _salvando = false;

  bool get _isEditing => widget.casa != null;
  final _dateFmt = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    final c = widget.casa;
    _ruaController = TextEditingController(text: c?.rua ?? '');
    _bairroController = TextEditingController(text: c?.bairro ?? '');
    _numeroController = TextEditingController(text: c != null ? c.numero.toString() : '');
    _valorController = TextEditingController(
      text: c != null ? c.valorAluguel.toStringAsFixed(2) : '',
    );
    _observacaoController = TextEditingController(text: c?.observacao ?? '');
    _dataInicio = c?.dataInicio ?? DateTime.now();
    _dataFinal = c?.dataFinal ?? DateTime.now().add(const Duration(days: 365));
    _status = c?.status ?? true;
  }

  @override
  void dispose() {
    _ruaController.dispose();
    _bairroController.dispose();
    _numeroController.dispose();
    _valorController.dispose();
    _observacaoController.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isInicio}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isInicio ? _dataInicio : _dataFinal,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;
    setState(() {
      if (isInicio) {
        _dataInicio = picked;
      } else {
        _dataFinal = picked;
      }
    });
  }

  Future<void> _salvar() async {
    if (!_formKey.currentState!.validate()) return;
    if (_imobiliariaSelecionada == null && !_isEditing) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione uma imobiliária')),
      );
      return;
    }

    setState(() => _salvando = true);

    final casa = ModelCasa(
      idImobiliaria: _imobiliariaSelecionada?.id ?? widget.casa!.idImobiliaria,
      rua: _ruaController.text.trim(),
      bairro: _bairroController.text.trim(),
      numero: int.tryParse(_numeroController.text.trim()) ?? 0,
      dataInicio: _dataInicio,
      dataFinal: _dataFinal,
      valorAluguel: double.tryParse(
              _valorController.text.trim().replaceAll(',', '.')) ??
          0.0,
      status: _status,
    );
    casa.observacao = _observacaoController.text.trim();

    if (_isEditing) {
      casa.id = widget.casa!.id;
      await ref.read(casaViewModelProvider.notifier).atualizar(casa);
    } else {
      await ref.read(casaViewModelProvider.notifier).salvar(casa);
    }

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final imobiliarias =
        ref.watch(imobiliariaViewModelProvider).valueOrNull ?? [];

    if (_isEditing && _imobiliariaSelecionada == null) {
      _imobiliariaSelecionada = imobiliarias.cast<ModelImobiliaria?>().firstWhere(
            (i) => i?.id == widget.casa!.idImobiliaria,
            orElse: () => null,
          );
    }

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Casa' : 'Nova Casa'),
        centerTitle: false,
        backgroundColor: colorScheme.surfaceContainerLowest,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _SectionLabel(label: 'Imobiliária'),
            const SizedBox(height: 12),
            DropdownButtonFormField<ModelImobiliaria>(
              initialValue: _imobiliariaSelecionada,
              decoration: const InputDecoration(
                labelText: 'Imobiliária *',
                prefixIcon: Icon(Icons.business_outlined),
                border: OutlineInputBorder(),
              ),
              items: imobiliarias
                  .map((i) => DropdownMenuItem(
                        value: i,
                        child: Text(i.descricao),
                      ))
                  .toList(),
              onChanged: (value) =>
                  setState(() => _imobiliariaSelecionada = value),
              validator: (_) => _imobiliariaSelecionada == null
                  ? 'Selecione uma imobiliária'
                  : null,
            ),
            const SizedBox(height: 24),
            _SectionLabel(label: 'Endereço'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _ruaController,
                    decoration: const InputDecoration(
                      labelText: 'Rua *',
                      prefixIcon: Icon(Icons.location_on_outlined),
                      border: OutlineInputBorder(),
                    ),
                    textCapitalization: TextCapitalization.words,
                    validator: (v) =>
                        v == null || v.trim().isEmpty ? 'Obrigatório' : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _numeroController,
                    decoration: const InputDecoration(
                      labelText: 'Nº',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _bairroController,
              decoration: const InputDecoration(
                labelText: 'Bairro *',
                prefixIcon: Icon(Icons.map_outlined),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Obrigatório' : null,
            ),
            const SizedBox(height: 24),
            _SectionLabel(label: 'Contrato'),
            const SizedBox(height: 12),
            TextFormField(
              controller: _valorController,
              decoration: const InputDecoration(
                labelText: 'Valor do aluguel *',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Obrigatório' : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _DateField(
                    label: 'Início',
                    date: _dataInicio,
                    fmt: _dateFmt,
                    onTap: () => _pickDate(isInicio: true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DateField(
                    label: 'Fim',
                    date: _dataFinal,
                    fmt: _dateFmt,
                    onTap: () => _pickDate(isInicio: false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              value: _status,
              onChanged: (v) => setState(() => _status = v),
              title: const Text('Contrato ativo'),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _observacaoController,
              decoration: const InputDecoration(
                labelText: 'Observações',
                prefixIcon: Icon(Icons.notes_outlined),
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: _salvando ? null : _salvar,
              child: _salvando
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  final String label;
  final DateTime date;
  final DateFormat fmt;
  final VoidCallback onTap;

  const _DateField({
    required this.label,
    required this.date,
    required this.fmt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.calendar_today_outlined),
          border: const OutlineInputBorder(),
        ),
        child: Text(fmt.format(date)),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
