import 'package:crud/controller/produto_repository.dart';
import 'package:crud/model/produto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlertExclusao extends StatelessWidget {
  final Produto produto;

  const AlertExclusao({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    final produtoRepository = Provider.of<ProdutoRepository>(context, listen: false);

    return AlertDialog(
      title: const Text("Deseja mesmo excluir?"),
      content: Text(produto.nome),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text("Cancelar")),
        ElevatedButton(
          onPressed: () {
            produtoRepository.remover(produto);
            Navigator.pop(context);
          }, child: const Text("Excluir"))
      ],

    );
  }
}