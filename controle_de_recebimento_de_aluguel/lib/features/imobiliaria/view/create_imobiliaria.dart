import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/model/model_imobiliaria.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/view_model/imobiliaria_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateImobiliariaPage extends ConsumerStatefulWidget {
  final ModelImobiliaria? imobiliaria;

  const CreateImobiliariaPage({super.key, this.imobiliaria});

  @override
  ConsumerState<CreateImobiliariaPage> createState() =>
      _CreateImobiliariaPageState();
}

class _CreateImobiliariaPageState extends ConsumerState<CreateImobiliariaPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _descricaoController;
  late final TextEditingController _telefoneController;
  late final TextEditingController _ruaController;
  late final TextEditingController _bairroController;
  late final TextEditingController _numeroController;
  bool _salvando = false;

  bool get _isEditing => widget.imobiliaria != null;

  @override
  void initState() {
    super.initState();
    final i = widget.imobiliaria;
    _descricaoController = TextEditingController(text: i?.descricao ?? '');
    _telefoneController = TextEditingController(text: i?.telefone ?? '');
    _ruaController = TextEditingController(text: i?.rua ?? '');
    _bairroController = TextEditingController(text: i?.bairro ?? '');
    _numeroController = TextEditingController(
      text: i?.numero != null ? i!.numero.toString() : '',
    );
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    _telefoneController.dispose();
    _ruaController.dispose();
    _bairroController.dispose();
    _numeroController.dispose();
    super.dispose();
  }

  Future<void> _salvar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _salvando = true);

    final imobiliaria = ModelImobiliaria(
      descricao: _descricaoController.text.trim(),
      telefone: _telefoneController.text.trim().isEmpty
          ? null
          : _telefoneController.text.trim(),
      rua: _ruaController.text.trim().isEmpty ? null : _ruaController.text.trim(),
      bairro: _bairroController.text.trim().isEmpty
          ? null
          : _bairroController.text.trim(),
      numero: int.tryParse(_numeroController.text.trim()),
    );

    if (_isEditing) {
      imobiliaria.id = widget.imobiliaria!.id;
      await ref.read(imobiliariaViewModelProvider.notifier).atualizar(imobiliaria);
    } else {
      await ref.read(imobiliariaViewModelProvider.notifier).salvar(imobiliaria);
    }

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Imobiliária' : 'Nova Imobiliária'),
        centerTitle: false,
        backgroundColor: colorScheme.surfaceContainerLowest,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _SectionLabel(label: 'Dados gerais'),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                labelText: 'Nome *',
                prefixIcon: Icon(Icons.business_outlined),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'Campo obrigatório' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _telefoneController,
              decoration: const InputDecoration(
                labelText: 'Telefone',
                prefixIcon: Icon(Icons.phone_outlined),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
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
                      labelText: 'Rua',
                      prefixIcon: Icon(Icons.location_on_outlined),
                      border: OutlineInputBorder(),
                    ),
                    textCapitalization: TextCapitalization.words,
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
                labelText: 'Bairro',
                prefixIcon: Icon(Icons.map_outlined),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
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
