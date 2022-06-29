import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../main.dart';
import '../models/entity.dart';

class FormularioCard extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _subtituloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de cards"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                editorController: _tituloController,
                titulo: "Titulo",
                dica: "Qualquer conteúdo aqui é bem vindo"),
            Editor(
              editorController: _subtituloController,
              titulo: "Subtitulo",
              dica: "Subtitulo do card",
              icone: Icons.abc_outlined,
            ),
            ElevatedButton(
              onPressed: () => _criaCardEntidade(context),
              child: Text("Adicionar"),
            )
          ],
        ),
      ),
    );
  }

  void _criaCardEntidade(BuildContext context) {
    final String titulo = _tituloController.text;
    final String subtitulo = _subtituloController.text;
    if (titulo != null && subtitulo != null) {
      final conteudoCard = Entity(0, titulo, subtitulo);
      Navigator.pop(context, conteudoCard);
    }
  }
}
