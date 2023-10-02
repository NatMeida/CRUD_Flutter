import 'package:crud/controller/produtoRepository.dart';
import 'package:crud/model/produto.dart';
import 'package:flutter/material.dart';
class Alterar extends StatefulWidget {
  Produto produto;
  int indice;

  Alterar(this.produto, this.indice, {super.key});

  @override
  State<Alterar> createState() => _AlterarState();
}

class _AlterarState extends State<Alterar> {
  final TextEditingController _campoId = TextEditingController();
  final TextEditingController _campoNome = TextEditingController();
  final TextEditingController _campoDescricao = TextEditingController();
  final TextEditingController _campoPreco = TextEditingController();

  List listaProdutos = ProdutoRepository.getProdutos;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    ProdutoRepository _produtoRepo = new ProdutoRepository();
    inicializa();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Alteração de Produtos",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28,
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey[700],
        ),
        body: Container(
          color: Colors.grey[700],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Preencha os campos:",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 20),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 20),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _campoDescricao,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, digite adescrição do produto';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 20),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ListaPage');
                    },
                    child: Text(
                      'Voltar',
                      style: TextStyle(fontSize: 20, color: Colors.greenAccent),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple[200],
                        elevation: 10,
                        shadowColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        int id = int.parse(_campoId.text);
                        String nome = _campoNome.text;
                        String descricao = _campoDescricao.text;
                        double preco = double.parse(_campoPreco.text);

                        Produto p = new Produto(id, nome, descricao, preco);
                        listaProdutos[widget.indice] = p;

                        limpaCampos();
                      }
                    },
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 20, color: Colors.greenAccent),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple[200],
                        elevation: 10,
                        shadowColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void inicializa() {
    _campoId.text = widget.produto.id.toString();
    _campoNome.text = widget.produto.nome;
    _campoDescricao.text = widget.produto.descricao;
    _campoPreco.text = widget.produto.preco.toString();
  }

  void limpaCampos() {
    _campoId.clear();
    _campoNome.clear();
    _campoDescricao.clear();
    _campoPreco.clear();
  }
}
