import 'package:gestion_de_tareas/models/tarea.dart';
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
    String path = join(await getDatabasesPath(), 'tareas.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tareas(id INTEGER PRIMARY KEY, titulo TEXT, descripcion TEXT, fechaVencimiento TEXT, estado TEXT)',
        );
      },
    );
  }

  Future<void> insertarTarea(Tarea tarea) async {
    final db = await database;
    await db.insert(
      'tareas',
      tarea.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Tarea>> obtenerTareas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tareas');
    return List.generate(maps.length, (i) {
      return Tarea(
        id: maps[i]['id'],
        titulo: maps[i]['titulo'],
        descripcion: maps[i]['descripcion'],
        fechaVencimiento: maps[i]['fechaVencimiento'],
        estado: maps[i]['estado'],
      );
    });
  }

  Future<void> actualizarTarea(Tarea tarea) async {
    final db = await database;
    await db.update(
      'tareas',
      tarea.toMap(),
      where: 'id = ?',
      whereArgs: [tarea.id],
    );
  }

  Future<void> eliminarTarea(int id) async {
    final db = await database;
    await db.delete('tareas', where: 'id = ?', whereArgs: [id]);
  }
}
