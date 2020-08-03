import 'package:sqflite/sqflite.dart';
import 'journal_entry_dto.dart';
import 'package:flutter/services.dart';
import '../models/entry.dart';

const SQL_CREATE_SCHEMA = 'assets/sql_create_schema.txt';
const SQL_INSERT = 'assets/sql_insert.txt';
const SQL_SELECT = 'assets/sql_select.txt';

class DatabaseManager {
  static const String DATABASE_FILENAME = 'journal.sqlite3.db';

  static DatabaseManager _instance;

  final Database db;

  DatabaseManager._({Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
    String create = await rootBundle.loadString(SQL_CREATE_SCHEMA);
    final db = await openDatabase(DATABASE_FILENAME,
      version: 1,
      onCreate: (Database db, int version) async {
        createTables(db, create);
      }
    );
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({JournalEntryDTO dto}) {
    db.transaction( (txn) async{
      String insert = await rootBundle.loadString(SQL_INSERT);
      await txn.rawInsert(insert,
        [dto.title, dto.body, dto.rating, dto.date]
      );
    });
  }

  Future<List<Entry>> journalEntries() async {
    String select = await rootBundle.loadString(SQL_SELECT);
    final journalRecords = await db.rawQuery(select);
    final entries = journalRecords.map( (record) {
      return Entry(
        title: record['title'],
        body: record['body'],
        rating: record['rating'],
        date: DateTime.parse(record['date'])
      );
    }).toList();
    return entries;
  }
}