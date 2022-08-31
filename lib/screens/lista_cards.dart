import 'package:bytebank/database/app_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/card_item.dart';
import '../main.dart';
import '../models/entity.dart';
import 'formulario_entidade.dart';

class ListaCards extends StatefulWidget {
  // lista mutavel
  final List<Entity> _listaCardsItem = [];

  @override
  State<StatefulWidget> createState() {
    return ListaCardsState();
  }
}

class ListaCardsState extends State<ListaCards> {
  @override
  Widget build(BuildContext context) {
    findAll().then((valueReturned) {
      widget._listaCardsItem.addAll(valueReturned);
      print("Valores retornados: $valueReturned");
      print('quantidade de cards salvos: $widget._listaCardsItem.length ');
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Listagem de Entidades"),
      ),
      body: ListView.builder(
        itemCount: widget._listaCardsItem.length,
        itemBuilder: (context, indice) {
          final valor = widget._listaCardsItem[indice];
          return CardItem(valor);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future futuro =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioCard();
          }));

          futuro.then((valorRecebido) {
            if (valorRecebido != null) {
              setState(() {
                widget._listaCardsItem.add(valorRecebido);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
