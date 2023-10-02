import 'package:crud/controller/produtoRepository.dart';
import 'package:crud/view/alterar.dart';
import 'package:flutter/material.dart';

import '../model/produto.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  final listaProdutos = ProdutoRepository.getProdutos;

  List<Produto> listaBusca = [];
  String nomeBusca = "";

  @override
  void initState() {
    listaBusca = List.from(listaProdutos);
    super.initState();
  }

  void atualizaLista(String nome) {
    listaBusca = List.from(listaProdutos);
    setState(() {
      listaBusca = listaProdutos
          .where((element) =>
              (element.nome.toLowerCase().contains(nome.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: Text(
            "Lista de Produtos Cadastrados",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28,
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold),
          ),
          actions: [],
        ),
        body: Column(children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Nome do Produto',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                fillColor: Colors.purple[200],
                filled: true,
                prefixIcon: Icon(Icons.search)),
            onChanged: (String nome) {
              nomeBusca = nome;
              atualizaLista(nome);
            },
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: listaBusca.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${listaBusca[index].nome}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("${listaBusca[index].descricao} | Preço: ${listaBusca[index].preco}", style: TextStyle(fontSize: 16, color: Colors.purple[200], fontWeight: FontWeight.bold)),
                  leading: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: Text(listaBusca[index].nome[0],
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold)

                              )),
                  trailing: SizedBox(
                    width: 70,
                    child: Row(
                      children: [
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return Alterar(
                                          listaProdutos[index], index);
                                    },
                                  ));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.greenAccent,
                                ))),
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  Produto produto = listaBusca[index];
                                  ProdutoRepository.remover(produto);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.greenAccent,
                                ))),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(thickness: 4, color: Colors.grey[600]),

            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              "Voltar",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[200],
                elevation: 10,
                shadowColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ])


        );
  }
}
