import 'package:idea_note3/data/db_config.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database database;

  /// Open DB Channel
  Future<void> initDatabase() async {
    String path = join(
      await getDatabasesPath(),
      "idea.db",
    );

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute("""
          CREATE TABLE IF NOT EXISTS jh_write_idea (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            motive TEXT,
            content TEXT,
            importance INTEGER,
            feedback TEXT,
            dateTime INTEGER
          )
        """);
      },
    );
  }

  /// CREATE
  Future<int> insertIdeaInfo(IdeaInfo ideaInfo) async {
    return await database.insert(
      "jh_write_idea",
      ideaInfo.toMap(),
    );
  }

  /// READ
  Future<List<IdeaInfo>> selectIdeaInfo() async {
    final List<Map<String, dynamic>> result =
        await database.query("jh_write_idea");

    return List.generate(
      result.length,
      (index) {
        return IdeaInfo.fromMap(result[index]);
      },
    );
  }

  /// UPDATE
  Future<int> updateIdeaInfo(IdeaInfo ideaInfo) async {
    return await database.update(
      "jh_write_idea",
      ideaInfo.toMap(),
      where: "id = ?",
      whereArgs: [ideaInfo.id],
    );
  }

  /// DELETE
  Future<int> deleteIdeaInfo(int id) async {
    return await database.delete(
      "jh_write_idea",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /// Close DB Channel
  Future<void> closeDatabase() async {
    await database.close();
  }
}
