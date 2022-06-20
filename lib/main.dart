import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaCards(),
      ),
    );
  }
}

class FormularioCard extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _subtituloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de cards"),
      ),
      body: Column(
        children: [
          Editor(editorController: _tituloController, titulo: "Titulo", dica: "Qualquer conteúdo aqui é bem vindo"),
          Editor(editorController: _subtituloController, titulo: "Subtitulo", dica: "Subtitulo do card", icone: Icons.abc_outlined,),
          ElevatedButton(
            onPressed: () => _criaCardEntidade(context),
            child: Text("Adicionar"),
          )
        ],
      ),
    );
  }

  void _criaCardEntidade(BuildContext context) {
     final String _titulo = this._tituloController.text;
    final String _subtitulo = this._subtituloController.text;

    if (_titulo != null && _subtitulo != null) {
      final conteudoCard = ConteudoCard(_titulo, _subtitulo);
      Navigator.pop(context, conteudoCard);
    }
  }
}

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

class ListaCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: Column(
        children: <Widget>[
          CardItem(ConteudoCard("540.00", "97876543254")),
          CardItem(ConteudoCard("91.00", "4664654545")),
          CardItem(ConteudoCard("200.00", "644512515448")),
          CardItem(ConteudoCard("1500.00", "4664654545")),
          CardItem(ConteudoCard("150.00", "97789165421")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future futuro = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioCard();
          }));
          futuro.then((valorRecebido) => {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final ConteudoCard _conteudoCard;

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

class ConteudoCard {
  final String titulo;
  final String subtitulo;

  ConteudoCard(this.titulo, this.subtitulo);
}
