import 'package:crud/model/produto.dart';
import 'package:crud/view/alterar.dart';
import 'package:crud/widgets/confirma_exclusao.dart';
import 'package:flutter/material.dart';

class ProdutoTile extends StatelessWidget {
  final Produto produto;
  const ProdutoTile({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(produto.nome,
          style: const TextStyle(
              fontSize: 18,
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold)),
      subtitle: Text("${produto.descricao} | Preço: ${produto.preco}",
          style: TextStyle(
              fontSize: 16,
              color: Colors.purple[200],
              fontWeight: FontWeight.bold)),
      leading: CircleAvatar(
          backgroundColor: Colors.greenAccent,
          child: Text(produto.nome[0],
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold))),
      trailing: SizedBox(
        width: 70,
        child: Row(
          children: [
            Expanded(
                child: IconButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Alterar(produto: produto))),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.greenAccent,
                    ))),
            Expanded(
                child: IconButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AlertExclusao(produto: produto))),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.greenAccent,
                    ))),
          ],
        ),
      ),
    );
  }
}
