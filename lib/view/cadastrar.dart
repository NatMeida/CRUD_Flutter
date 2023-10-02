import 'package:crud/controller/produtoRepository.dart';
import 'package:crud/model/produto.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _campoId = TextEditingController();
  final TextEditingController _campoNome = TextEditingController();
  final TextEditingController _campoDescricao = TextEditingController();
  final TextEditingController _campoPreco = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    ProdutoRepository _produtoRepo = new ProdutoRepository();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cadastro de Produtos",
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
                          fillColor: Colors.greenAccent[50],
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
                          fillColor: Colors.greenAccent[50],
                          filled: true,

                        ),
                        
                      ),
                      SizedBox(height: 20),
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
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                          ),
                          fillColor: Colors.greenAccent[50],
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
                          fillColor: Colors.green[50],
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
                      Navigator.pushNamed(context, '/');
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
                        num preco = num.parse(_campoPreco.text);

                        Produto produto = Produto(id, nome, descricao, preco);
                        _produtoRepo.adicionar(produto);

                        limpaCampos();
                        confirmaCadastro();

                        _formKey.currentState!.reset();
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
