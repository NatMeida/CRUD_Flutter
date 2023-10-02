class Produto {
  //atributos
  num _preco = 0;
  String _nome = "";
  int _id = 0;
  String _descricao = "";

  //construtor
  Produto(this._id, this._nome, this._descricao, this._preco);

  //getters e setters
  String get nome => _nome;
  set nome(String value) => _nome = value;

  num get preco => _preco;
  set preco(num value) => _preco = value;

  int get id => _id;
  set id(int value) => _id = value;

  String get descricao => _descricao;
  set descricao(String value) => _descricao = value;
}