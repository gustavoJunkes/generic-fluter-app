import 'package:bytebank/models/entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  getDatabasesPath().then((value) {
    print("Database path: " + value);
  });

  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, "generic-app-2.db");
    return openDatabase(path, onCreate: (db, version) {
      db.execute("CREATE TABLE entidade (id INTEGER PRIMARY KEY, titulo TEXT, subtitulo TEXT)");
    }, version: 1);
  });
}

Future<int> save(Entity entity) {
  return createDatabase().then((db) {
    final Map<String, dynamic> mapEntity = Map();
    mapEntity['titulo'] = entity.titulo;
    mapEntity['subtitulo'] = entity.subtitulo;

    return db.insert("entidade", mapEntity);
  });
}

Future<List<Entity>> findAll() {
 return createDatabase().then((db) {
    return db.query("entidade").then((maps) {
      List<Entity> entities = List.empty(growable: true);
      for (Map<String, dynamic> map in maps) {
        Entity entity = Entity(
          map['id'],
          map['titulo'],
          map['subtitulo'],
        );
        entities.add(entity);
      }
      return entities;
    });
  });
}
