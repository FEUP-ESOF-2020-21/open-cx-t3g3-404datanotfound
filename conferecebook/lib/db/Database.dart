import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:ConfereceBook/db/UserModel.dart';

//Maybe we should change this file's name to UsersDatabase.dart, if we create more DB

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) //if database if not null
      return _database;

    _database = await initDB(); //if database is null, create a new one
    return _database;
  }

  Future<dynamic> initDB() async {
    return await openDatabase(
        join(await getDatabasesPath(), "users_database.db"),
        onCreate: (db, version) async { //SQLite code here!
          await db.execute('''    
          CREATE TABLE users(
            email TEXT PRIMARY KEY, 
            password TEXT NOT NULL,
            displayName TEXT NOT NULL,
            cityOfLiving TEXT,
            academicBackground TEXT,
            currentJob TEXT,
            linkedInURL TEXT,
            bio TEXT,
            interests TEXT,
            imageFile BLOB
          );
        ''');
        },
        version: 1
    );
  }

  Future<dynamic> insertUser(newUser) async {   // upon insertion of users
    final db = await database;
    var res = await db.rawInsert('''  
      INSERT INTO users(
        email,
        password,
        displayName,
        cityOfLiving,
        academicBackground,
        currentJob,
        linkedInURL,
        bio,
        interests,
        imageFile
      ) VALUES (?,?,?,?,?,?,?,?,?,?)
    ''', [
      newUser.email,
      newUser.password,
      newUser.displayName,
      newUser.cityOfLiving,
      newUser.academicBackground,
      newUser.currentJob,
      newUser.linkedInURL,
      newUser.bio,
      newUser.interests,
      newUser.imageFile
        ]); //parameters to substitute '?' in SQLite code

    return res;
  }

  Future<dynamic> getAllUsers() async { //to get all created users
    final db = await database;
    var res = await db.query("users");
    if (res.length == 0)
      return null;
    else {
      return res; //all users returned
    }
  }

  Future<dynamic> getUser(String emailUser) async {  //to get a specific user
    final db = await database;
    var res = await db.rawQuery('''
      SELECT * 
      FROM users 
      WHERE email = ?    
    ''', [emailUser]);  //parameter to substitute '?'
    if (res.length == 0)
      return null;
    else {
      return res; //user queried is returned
    }
  }

  Future<void> updateUser(User user) async {  //to update user's info
    // Get a reference to the database.
    final db = await database;

    // Update the given User.
    await db.update(
      'users',
      user.toMap(),
      // Ensure that the User has a matching id.
      where: "email = ?",
      // Pass the User's id as a whereArg to prevent SQL injection.
      whereArgs: [user.email],
    );
  }

  Future<void> deleteUser(String emailUser) async { //to delete one specific user
    // Get a reference to the database.
    final db = await database;

    // Remove the User from the database.
    await db.delete(
      'users',
      // Use a `where` clause to delete a specific user.
      where: "email = ?",
      // Pass the Users' userID as a whereArg to prevent SQL injection.
      whereArgs: [emailUser],
    );
  }

  Future<void> deleteAllUsers() async {   //not a DROP TABLE! Deletes all rows
    // Get a reference to the database.
    final db = await database;

    // Remove the User from the database.
    await db.rawDelete('''
      DELETE FROM users;
    ''') ;
  }
}