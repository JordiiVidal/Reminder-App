import 'dart:io';

import 'package:path/path.dart';
import 'package:reminder/models/calendar_model.dart';
import 'package:reminder/models/reminder_model.dart';
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
  insertReminder(ReminderModel reminder) async {
    print('insert');
    final db = await database; //get database

    final res = await db.insert(_table, reminder.toJson());

    return res;
  }

  //DELTE
  deleteReminder(int id) async {
    print('insert');
    final db = await database; //get database

    final res = await db.delete(_table, where: 'id = ?', whereArgs: [id]);

    return res;
  }

  //GET
  Future<ReminderModel> getReminderId(int id) async {
    final db = await database;
    final res = await db
        .query(_table, where: 'id = ?', whereArgs: [id]); //devuelve una lista

    return res.isNotEmpty ? ReminderModel.fromJson(res.first) : null;
  }

  Future<List<ReminderModel>> getReminders() async {
    final db = await database;
    final res = await db.query(
      _table,
    ); //devuelve una lista

    List<ReminderModel> list = res.isNotEmpty
        ? res.map((r) => ReminderModel.fromJson(r)).toList()
        : [];

    return list;
  }

  Future<List<ReminderModel>> getReminderDate(String date) async {
    final db = await database;
    final res = await db.query(_table,
        where: 'date = ?', whereArgs: [date]); //devuelve una lista

    List<ReminderModel> list = res.isNotEmpty
        ? res.map((r) => ReminderModel.fromJson(r)).toList()
        : [];

    return list;
  }

  Future<Map<DateTime, List<ReminderModel>>> getCalendar() async {
    final db = await database;
    final res = await db.query(_table);

    List<ReminderModel> list = res.isNotEmpty
        ? res.map((r) => ReminderModel.fromJson(r)).toList()
        : [];

    return CalendarModel(events: list).getEvents();
  }
}
