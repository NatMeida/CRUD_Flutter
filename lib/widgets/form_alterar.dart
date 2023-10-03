import 'package:crud/controller/produto_repository.dart';
import 'package:crud/model/produto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormAlterar extends StatefulWidget {
  final Produto produto;
  const FormAlterar({super.key, required this.produto});

  @override
  State<FormAlterar> createState() => _FormAlterarState();
}

class _FormAlterarState extends State<FormAlterar> {
  final _campoId = TextEditingController();
  final _campoNome = TextEditingController();
  final _campoDescricao = TextEditingController();
  final _campoPreco = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    _campoId.text = widget.produto.id.toString();
    _campoNome.text = widget.produto.nome;
    _campoDescricao.text = widget.produto.descricao;
    _campoPreco.text = widget.produto.preco.toString();
    super.initState();
  }

  void limpaCampos() {
    _campoId.clear();
    _campoNome.clear();
    _campoDescricao.clear();
    _campoPreco.clear();
  }

  @override
  Widget build(BuildContext context) {
    final produtoRepository =
        Provider.of<ProdutoRepository>(context, listen: false);

    return Form(
      key: _key,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Preencha os campos:",
            style: TextStyle(
                fontSize: 22,
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _campoId,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite o ID do produto';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'ID',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _campoNome,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite o nome do produto';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _campoDescricao,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite adescrição do produto';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Descrição',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _campoPreco,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite o preço';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Preço',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              filled: true,
            ),
          ),
          const SizedBox(height: 40, width: 20),
          ElevatedButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                int id = int.parse(_campoId.text);
                String nome = _campoNome.text;
                String descricao = _campoDescricao.text;
                double preco = double.parse(_campoPreco.text);

                final novoProduto = Produto(id, nome, descricao, preco);
                produtoRepository.alterar(widget.produto.id, novoProduto);

                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[200],
                elevation: 10,
                shadowColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text(
              'Salvar',
              style: TextStyle(fontSize: 20, color: Colors.greenAccent),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
