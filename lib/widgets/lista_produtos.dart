import 'package:crud/controller/produto_repository.dart';
import 'package:crud/widgets/produto_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListaProdutos extends StatelessWidget {
  String? nome;

  ListaProdutos({super.key, this.nome});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProdutoRepository>(
        builder: (context, produtoRepository, child) {
      final listaBusca = nome == null || nome!.isEmpty
          ? produtoRepository.getProdutos
          : produtoRepository.getProdutos
              .where((element) =>
                  element.nome.toLowerCase().startsWith(nome!.toLowerCase()))
              .toList();

      return ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: listaBusca.length,
        itemBuilder: (BuildContext context, int index) => ProdutoTile(produto: listaBusca[index]),
        separatorBuilder: (BuildContext context, int index) =>
            Divider(thickness: 4, color: Colors.grey[600]),
      );
    });
  }
}
