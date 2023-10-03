import 'package:crud/model/produto.dart';
import 'package:flutter/foundation.dart';

class ProdutoRepository with ChangeNotifier {
  final List<Produto> _listaProdutos = List.from(floresExemplo);

  ProdutoRepository();

  void adicionar(Produto produto) {
    _listaProdutos.add(produto);
    notifyListeners();
  }

  void remover(Produto produto) {
    _listaProdutos.remove(produto);
    notifyListeners();
  }

  void alterar(int id, Produto novoProduto) {
    int changeIndex = _listaProdutos.indexWhere((element) => element.id == id);
    _listaProdutos[changeIndex] = novoProduto;
    notifyListeners();
  }

  List<Produto> get getProdutos => _listaProdutos;

  void imprimir() {
    for (var i = 0; i < _listaProdutos.length; i++) {
      if (kDebugMode) {
        print(
            "ID: ${_listaProdutos[i].id}, Nome: ${_listaProdutos[i].nome}, Descrição: ${_listaProdutos[i].descricao}, Preço: ${_listaProdutos[i].preco}");
      }
    }

    if (kDebugMode) {
      print("================================================");
    }
  }
}

final floresExemplo = [
  Produto(1, "Rosa Vermelha", "Rosa gallica", 33.70),
  Produto(2, "Rosa Branca", "Rosa alba", 37.80),
  Produto(3, "Regador", "Regador metálico de 500ml", 40.00),
  Produto(4, "Vaso", "Vaso de barro", 20.00),
  Produto(5, "Adubo", "Adubo NPK 10-10-10", 15.00),
  Produto(6, "Pá", "Pá de jardim", 25.00),
  Produto(7, "Luvas", "Luvas de jardinagem", 15.00),
  Produto(8, "Terra", "Terra adubada", 10.00),
  Produto(9, "Fertilizante", "Fertilizante foliar", 20.00),
  Produto(10, "Girassol", "Helianthus annuus", 10.00),
  Produto(11, "Margarida", "Leucanthemum vulgare", 6.00),
  Produto(12, "Orquídea", "Orchidaceae", 50.00),
  Produto(13, "Lírio", "Lilium", 30.00),
  Produto(14, "Tulipa", "Tulipa", 28.00),
  Produto(15, "Cravo", "Dianthus caryophyllus", 10.00),
  Produto(16, "Gérbera", "Gerbera jamesonii", 15.00),
  Produto(17, "Bromélia", "Bromeliaceae", 20.00),
  Produto(18, "Violeta", "Viola", 17.90),
  Produto(19, "Hortênsia", "Hydrangea macrophylla", 30.00),
  Produto(20, "Lavanda", "Lavandula", 22.00),
  Produto(21, "Jasmim", "Jasminum", 10.80),
  Produto(22, "Cravina", "Dianthus caryophyllus", 13.00),
  Produto(23, "Petúnia", "Petunia", 10.00),
  Produto(24, "Begônia", "Begonia", 12.00),
  Produto(25, "Dália", "Dahlia", 7.50)
];
