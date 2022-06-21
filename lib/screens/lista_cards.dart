import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/conteudo_card.dart';
import 'formulario_entidade.dart';

class ListaCards extends StatefulWidget {
  // lista imutavel
  final List<ConteudoCard> _listaCardsItem = [];

  @override
  State<StatefulWidget> createState() {
    return ListaCardsState();
  }
}

class ListaCardsState extends State<ListaCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
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
          final Future futuro = Navigator.push(context, MaterialPageRoute(builder: (context) {
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