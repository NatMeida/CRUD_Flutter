// ignore_for_file: sort_child_properties_last

import 'package:crud/partials/layout.dart';
import 'package:crud/widgets/lista_produtos.dart';
import 'package:flutter/material.dart';
import '../model/produto.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<Produto> listaBusca = [];
  String nomeBusca = "";

  @override
  Widget build(BuildContext context) {
    return BaseLayout(context,
        title: "Lista de Produtos Cadastrados",
        body: Column(children: [
          const SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Nome do Produto',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                fillColor: Colors.purple[200],
                filled: true,
                prefixIcon: const Icon(Icons.search)),
            onChanged: (String nome) {
              setState(() {
                nomeBusca = nome;
              });
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(child: ListaProdutos(nome: nomeBusca)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text(
              "Voltar",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[200],
                elevation: 10,
                shadowColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ]));
  }
}
