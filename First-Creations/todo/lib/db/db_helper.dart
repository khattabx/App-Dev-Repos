// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'task';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('not null db');
      return;
    } else {
      try {
        String _path = await getDatabasesPath() + 'Task.db';
        debugPrint('in database path');
        _db = await openDatabase(_path, version: _version,
            onCreate: (Database db, int version) async {
          debugPrint('creating a new one');
          await db.execute(
            'CREATE TABLE $_tableName ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'title STRING, note TEXT, date STRING, '
            'startTime STRING, endTime STRING, '
            'remind INTEGER, repeat STRING, '
            'color INTEGER, '
            'isCompleted INTEGER)',
          );
        });
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task? task) async {
    if (_db == null) {
      await initDb();
    }
    print('Insert Function called');
    try {
      return await _db!.insert(_tableName, task!.toJson());
    } catch (e) {
      print('We are here');
      return 90000;
    }
  }

  static Future<int> deleteAll() async {
    if (_db == null) {
      await initDb();
    }
    print('Delete Function called');
    return await _db!.delete(_tableName,);
  }
  static Future<int> delete(Task task) async {
    if (_db == null) {
      await initDb();
    }
    print('Delete Function called');
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    if (_db == null) {
      await initDb();
    }
    print('Query Function called');
    return await _db!.query(_tableName);
  }

  static Future<int> update(int id) async {
    if (_db == null) {
      await initDb();
    }
    print('Update Function called');
    return await _db!.rawUpdate('''
  UPDATE $_tableName
  SET isCompleted = ?
  WHERE id = ?
  ''', [1, id]);
  }
}


//-----------------------------------------------------------------------------

/*
Fixes applied in this code:

1. Duplicate Field Name in Table Creation:
   - Issue: The field "startTime" was repeated twice in the table schema, causing a database creation error.
   - Fix: The second occurrence of "startTime" was renamed to "endTime" to avoid duplication.

2. Null Database Access (`_TypeError`):
   - Issue: The null check operator (`!`) was used on `_db` without ensuring it was initialized, causing a runtime error.
   - Fix: Added a condition to check if `_db` is null and call `initDb()` to initialize it before any database operation.

3. Missing `initDb()` Calls in CRUD Methods:
   - Issue: Methods like `insert`, `delete`, `query`, and `update` assumed `_db` was already initialized, leading to potential errors if `initDb()` was not called explicitly.
   - Fix: Added checks in each method to ensure `_db` is initialized by calling `initDb()` if necessary.
*/



// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:todo/models/task.dart';

// class DBHelper {
//   static Database? _db;
//   static const int _version = 1;
//   static const String _tableName = 'task';

//   static Future<void> initDb() async {
//     if (_db != null) {
//       debugPrint('not null db');
//       return;
//     } else {
//       try {
//         String _path = await getDatabasesPath() + 'Task.db';
//         debugPrint('in database path');
//         _db = await openDatabase(_path, version: _version,
//             onCreate: (Database db, int version) async {
//           debugPrint('creating a new one');
//           await db.execute(
//             'CREATE TABLE $_tableName ('
//             'id INTEGER PRIMARY KEY AUTOINCREMENT, '
//             'title STRING, note TEXT, date STRING, '
//             'startTime STRING, startTime STRING, '
//             'remind INTEGER, repeat STRING, '
//             'color INTEGER, '
//             'isCompleted INTEGER)',
//           );
//         });
//       } catch (e) {
//         print(e);
//       }
//     }
//   }

//   static Future<int> insert(Task? task) async {
//     print('Insert Function called');
//     try {
//       return await _db!.insert(_tableName, task!.toJson());
//     } catch (e) {
//       print('We are here');
//       return 90000;
//     }
//   }

//   static Future<int> delete(Task task) async {
//     print('Delete Function called');
//     return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
//   }

//   static Future<List<Map<String, dynamic>>> query() async {
//     print('Query Function called');
//     return await _db!.query(_tableName);
//   }

//   static Future<int> update(int id) async {
//     print('Update Function called');
//     return await _db!.rawUpdate('''
//   UPDATE tasks
//   SET isCompleted = ?
//   WHERE id = ?
//   ''', [1, id]);
//   }
// }

//-----------------------------------------------------------------------------