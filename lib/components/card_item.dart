import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/entity.dart';

class CardItem extends StatelessWidget {
  final Entity _conteudoCard;
  const CardItem(this._conteudoCard);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._conteudoCard.titulo.toString()),
        subtitle: Text(this._conteudoCard.subtitulo.toString()),
      ),
    );
  }
}