import 'package:crud/controller/produto_repository.dart';
import 'package:crud/view/cadastrar.dart';
import 'package:crud/view/home_page.dart';
import 'package:crud/view/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ProdutoRepository(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const Home(),
        '/cadastro': (context) => const Cadastro(),
        '/ListaPage': (context) => const ListaPage()
      },
    );
  }
}
