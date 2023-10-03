import 'package:crud/partials/layout.dart';
import 'package:crud/widgets/form_cadastro.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(context,
        title: "Cadastro de produtos",
        body: Container(
          color: Colors.grey[700],
          child: const Column(
            children: [
              Padding(padding: EdgeInsets.all(10), child: FormCadastro()),
            ],
          ),
        ));
  }
}
