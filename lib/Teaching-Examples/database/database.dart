import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Database {
  // CRUD = [
  //   C => Create
  //   R => Read
  //   U => Update
  //   D => Delete
  // ]

  void DatabaseClass() async {
    // print("Hello Friends");

    final database = openDatabase(
      join(await getDatabasesPath(), 'accounts.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE accounts(id INTEGER PRIMARY KEY, name TEXT, number INTEGER)',
        );
      },
      version: 1,
    );

    Future<void> insertAccounts(CreateAccounts accounts) async {
      final db = await database;

      await db.insert('accounts', accounts.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    Future<List<CreateAccounts>> accounts() async {
      final db = await database;
      final List<Map<String, dynamic>> mapacc = await db.query('accounts');

      return List.generate(mapacc.length, (index) {
        return CreateAccounts(mapacc[index]['id'], mapacc[index]['name'],
            mapacc[index]['number']);
      });
    }

    Future<void> updateAccounts(CreateAccounts accounts) async {
      final db = await database;

      await db.update(
          'accounts',
          accounts.toMap(),
          where: 'id = ?',
          whereArgs: [accounts.id],
      );
    }

    Future<void> deleteAccounts(CreateAccounts accounts) async {
      final db = await database;

      await db.delete(
        'accounts',
        where: 'id = ?',
        whereArgs: [accounts.id],
      );
    }

    // Insert Accounts To Database
    var insertData0 = CreateAccounts(0, "Ali", 123);
    var insertData1 = CreateAccounts(1, "Friend", 256666);
    var insertData2 = CreateAccounts(2, "Poulstar", 23333333);
    await insertAccounts(insertData0);
    await insertAccounts(insertData1);
    await insertAccounts(insertData2);

    // Read Accounts From Database
    print("Create Accounts with This Information");
    print(await accounts());

    print(" --------- ");

    print("Update Accounts with ID 0");
    insertData1 = CreateAccounts(0, "Friend22", 2666774);
    await updateAccounts(insertData1);

    print(await accounts());
    print(" --------- ");

    print("Delete Accounts with ID 2");
    await deleteAccounts(insertData2);
    print(await accounts());

  }
}

class CreateAccounts {
  int id;
  String name;
  int number;

  CreateAccounts(this.id, this.name, this.number);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "number": number,
    };
  }

  @override
  String toString() {
    return '[ id : $id, name : $name, number : $number ]';
  }
}
