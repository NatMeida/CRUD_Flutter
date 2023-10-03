import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 100),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_florist_outlined,
                color: Colors.greenAccent,
                size: 50,
              ),
              SizedBox(width: 30),
              Text(
                "Floricultura Flor do Campo",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 30),
              Icon(
                Icons.local_florist_outlined,
                color: Colors.greenAccent,
                size: 50,
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
              width: 400,
              height: 3,
              child: Container(color: Colors.greenAccent[200])),
          const SizedBox(height: 25),
          const Text(
            "CONTROLE DE ESTOQUE",
            style: TextStyle(
                fontSize: 23,
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 45),
          SizedBox(
              width: 400,
              height: 3,
              child: Container(color: Colors.greenAccent[200])),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.grass,
                color: Colors.greenAccent,
                size: 50,
              ),
              const SizedBox(width: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ListaPage');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[200],
                    elevation: 10,
                    shadowColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  "Produtos cadastrados",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_circle_outlined,
                color: Colors.greenAccent,
                size: 50,
              ),
              const SizedBox(width: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[200],
                    elevation: 10,
                    shadowColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  "Cadastrar novo produto",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold),
                ),
              ),
           
            ],
            
          ),
            const SizedBox(height: 40),
            Image.asset("assets/floris.jpg", width: 550, height: 300,),
        ],
      )),
    );
  }
}
