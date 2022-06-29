class Entity {
  final int id;
  final String titulo;
  final String subtitulo;

  Entity(this.id, this.titulo, this.subtitulo);

  @override
  String toString() {
    return 'ConteudoCard{titulo: $titulo, subtitulo: $subtitulo}';
  }
}