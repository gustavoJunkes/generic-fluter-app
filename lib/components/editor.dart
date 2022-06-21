import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController editorController;
  final String titulo;
  final String dica;
  final IconData? icone;

  Editor({
    required this.editorController,
    required this.titulo,
    required this.dica,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: editorController,
        style: TextStyle(fontSize: 24.00),
        decoration: InputDecoration(
          labelText: titulo,
          hintText: dica,
          icon: icone != null ? Icon(this.icone) : null,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}