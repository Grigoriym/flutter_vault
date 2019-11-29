import 'dart:core';
import 'dart:io';

import 'package:flutter_vault/src/models/Note.dart';
import 'package:flutter_vault/src/utils/field_constans.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _INSTANCE = new DbHelper.make();

  factory DbHelper() => _INSTANCE;

  static Database _db;

  DbHelper.make();

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, FieldConstants.DB_NAME);
    var myDb = openDatabase(path,
        version: FieldConstants.DB_VERSION, onCreate: _onCreate);
    return myDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE ${FieldConstants.TABLE_NAME} "
        "(${FieldConstants.COLUMN_ID} INTEGER PRIMARY KEY, "
        "${FieldConstants.COLUMN_TEXT} TEXT, "
        "${FieldConstants.COLUMN_DATE} TEXT);");
  }

  Future<int> insertNote(Note note) async {
    var dbClient = await db;
    int count = await dbClient.insert(FieldConstants.TABLE_NAME, note.toMap());
    return count;
  }

  Future<List> getAllNotes() async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM ${FieldConstants.TABLE_NAME} ORDER BY"
            "${FieldConstants.COLUMN_TEXT} ASC");
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    int count = Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT COUNT (*) FROM ${FieldConstants.TABLE_NAME}"));
    return count;
  }

  Future<Note> getSingleItem(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${FieldConstants.TABLE_NAME} WHERE ${FieldConstants.COLUMN_ID} = $id");
    if (result == null) return null;
    return new Note.fromMap(result.first);
  }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    int count = await dbClient.delete(FieldConstants.TABLE_NAME,
        where: "${FieldConstants.COLUMN_ID} = ?", whereArgs: [id]);
    return count;
  }

  Future<int> updateItem(Note note) async {
    var dbClient = await db;
    int count = await dbClient.update(FieldConstants.TABLE_NAME, note.toMap(),
        where: "${FieldConstants.COLUMN_ID} = ?", whereArgs: [note.id]);
    return count;
  }
}
