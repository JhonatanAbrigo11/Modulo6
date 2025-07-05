import 'package:cine_club/models/pelicula.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static final Databasehelper _instacia = Databasehelper._interno();
  factory Databasehelper() => _instacia;
  static Database? _database;
  Databasehelper._interno();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'peliculas.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pelicula(id INTEGER PRIMARY KEY, titulo TEXT, anioEstreno INT, vista INT, fechaCompra TEXT,resumen TEXT)',
        );
      },
    );
  }

  Future<void> insertarPElicula(Pelicula pelicula) async {
    final db = await database;
    await db.insert(
      'pelicula',
      pelicula.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Pelicula>> obtenerPeliculas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pelicula');
    return List.generate(maps.length, (i) {
      return Pelicula.fromMap(maps[i]);
    });
  }

  Future<void> actualizarPelicula(Pelicula pelicula) async {
    final db = await database;
    await db.update(
      'pelicula',
      pelicula.toMap(),
      where: 'id = ?',
      whereArgs: [pelicula.id],
    );
  }

  Future<void> eliminarPelicula(int id) async {
    final db = await database;
    await db.delete('pelicula', where: 'id = ?', whereArgs: [id]);
  }
}
