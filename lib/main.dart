import 'package:bytebank/screens/lista_cards.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';
import 'models/entity.dart';

void main() {
  runApp(ByteBankApp());
  // save(Entity(
  //   1,
  //   "titulo salvo",
  //   "subtitulo salvo",
  // ));
  // save(Entity(
  //   2,
  //   "titulo salvo 22222",
  //   "subtitulo salvo",
  // ));
  // save(Entity(
  //   3,
  //   "titulo salvo 33333",
  //   "subtitulo salvo",
  // ));
  // final cardsRetornados = findAll();
  // cardsRetornados.then((cardsRetornados) {
  //  print(cardsRetornados.length);
  // });
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
      ),
      home: ListaCards(),
    );
  }
}





