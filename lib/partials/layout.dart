import 'package:flutter/material.dart';

class BaseLayout extends Scaffold {
  BaseLayout(BuildContext context,
      {super.key, required String title, required Widget body})
      : super(
            appBar: AppBar(
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.grey[700],
            ),
            body: body);
}
