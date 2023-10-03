import 'package:crud/model/produto.dart';
import 'package:crud/partials/layout.dart';
import 'package:crud/widgets/form_alterar.dart';
import 'package:flutter/material.dart';

class Alterar extends StatelessWidget {
  final Produto produto;

  const Alterar({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {

    return BaseLayout(context,
        title: "Alteração de Produtos",
        body: Container(
          color: Colors.grey[700],
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: FormAlterar(produto: produto)),
            ],
          ),
        ));
  }
}
