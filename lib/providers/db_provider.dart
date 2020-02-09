import 'dart:io';

import 'package:path/path.dart';
import 'package:reminder/models/calendar_model.dart';
import 'package:reminder/models/remainder_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DBProvider {
  static String _table = 'Remainders';
  static Database _database;
  static final DBProvider dbProvider =
      DBProvider._(); //constructor privado modelo singleton

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory =
        await getApplicationDocumentsDirectory(); //path raiz
    final path = join(documentsDirectory.path, 'CalendarDB.db'); //path de la db

    return await openDatabase(path,
        version: 1,
        onOpen: (db) => {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE $_table ('
              ' id INTEGER PRIMARY KEY,'
              ' date TEXT,'
              ' subject TEXT,'
              ' description TEXT,'
              ' time TEXT'
              ')');
        });
  }

  //INSERT
  insertRemainder(RemainderModel remainder) async {
    print('insert');
    final db = await database; //get database

    final res = await db.insert(_table, remainder.toJson());

    return res;
  }

  //DELTE
  deleteRemainder(int id) async {
    print('insert');
    final db = await database; //get database

    final res = await db.delete(_table, where: 'id = ?', whereArgs: [id]);

    return res;
  }

  //GET
  Future<RemainderModel> getRemainderId(int id) async {
    final db = await database;
    final res = await db
        .query(_table, where: 'id = ?', whereArgs: [id]); //devuelve una lista

    return res.isNotEmpty ? RemainderModel.fromJson(res.first) : null;
  }

  Future<List<RemainderModel>> getRemainderDate(String date) async {
    final db = await database;
    final res = await db.query(_table,
        where: 'date = ?', whereArgs: [date]); //devuelve una lista

    List<RemainderModel> list = res.isNotEmpty
        ? res.map((r) => RemainderModel.fromJson(r)).toList()
        : [];

    return list;
  }

  Future<Map<DateTime, List<RemainderModel>>> getCalendar() async {
    final db = await database;
    final res = await db.query(_table);

    List<RemainderModel> list = res.isNotEmpty
        ? res.map((r) => RemainderModel.fromJson(r)).toList()
        : [];

    return CalendarModel(events: list).getEvents();
  }
}
