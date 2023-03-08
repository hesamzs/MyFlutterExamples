import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class ContactList {
  final String name;
  final String profile;
  final String number;

  const ContactList({
    required this.name,
    required this.profile,
    required this.number,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'profile': profile,
    };
  }
}
class ContactSql{

  static late final Future<Database> database;

  Future connect() async {
    var path = join(await getDatabasesPath(), "contact.db");
    database = openDatabase(
        path,
        onCreate: (database, version) async {
          await database.execute("CREATE TABLE IF NOT EXISTS contacts(name TEXT PRIMARY KEY,number INTEGER,profile TEXT)");
        },
        version: 2
    );
  }

  Future addContact(ContactList contactList) async {
    var db = await database;
    print(contactList.name);
    return db.insert("contacts", contactList.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future removeContact(ContactList contactList) async {
    var db = await database;
    return db.delete("contacts", where: "name = ?", whereArgs: [contactList.name]);
  }

  Future getContacts() async {
    var db = await database;
    List<Map<String, dynamic>> data = await db.query("contacts");
    return List.generate(data.length, (index) {
      return ContactList(name : data[index]["name"],number : data[index]["number"], profile: data[index]["profile"]);
    });
  }
}