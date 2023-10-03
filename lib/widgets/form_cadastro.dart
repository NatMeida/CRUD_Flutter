import 'package:crud/controller/produto_repository.dart';
import 'package:crud/model/produto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormCadastro extends StatefulWidget {
  const FormCadastro({super.key});

  @override
  State<FormCadastro> createState() => _FormCadastroState();
}

class _FormCadastroState extends State<FormCadastro> {
  final _campoId = TextEditingController();
  final _campoNome = TextEditingController();
  final _campoDescricao = TextEditingController();
  final _campoPreco = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final produtoRepo = Provider.of<ProdutoRepository>(context, listen: false);

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
            decoration: InputDecoration(
              labelText: 'ID',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              fillColor: Colors.greenAccent[50],
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
            decoration: InputDecoration(
              labelText: 'Nome',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              fillColor: Colors.greenAccent[50],
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _campoDescricao,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite a descrição do produto';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Descrição',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              fillColor: Colors.greenAccent[50],
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
            decoration: InputDecoration(
              labelText: 'Preço',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              fillColor: Colors.green[50],
              filled: true,
            ),
          ),
          const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[200],
                        elevation: 10,
                        shadowColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Voltar',
                      style: TextStyle(fontSize: 20, color: Colors.greenAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        int id = int.parse(_campoId.text);
                        String nome = _campoNome.text;
                        String descricao = _campoDescricao.text;
                        num preco = num.parse(_campoPreco.text);

                        Produto produto = Produto(id, nome, descricao, preco);
                        produtoRepo.adicionar(produto);

                        limpaCampos();
                        confirmaCadastro();

                        _key.currentState!.reset();
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
        ],
      ),
    );
  }

  void confirmaCadastro() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("O produto foi cadastrado com sucesso!")));
  }

  void limpaCampos() {
    _campoId.clear();
    _campoNome.clear();
    _campoDescricao.clear();
    _campoPreco.clear();
  }
}
