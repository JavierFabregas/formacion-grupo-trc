import 'dart:io';

import 'package:ejericio_formacion/common/datasources/api/models/Person.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBService{
  static Database _database;
  static final DBService db = DBService._();

  DBService._();

  Future<Database> get database async{
    if(_database != null){
      return _database;
    }else{
      _database = await initDB();
      return _database;
    }
  }

  Future<Database> initDB()async{
    // Ubicación de la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'FavouritesFormacionDB.db');
    print(path);

    // Crear la base de datos
    
    return await openDatabase(
      path,
      version: 1,
      onOpen: (bd){},
      onCreate: (Database db, int version)async{
         await db.execute('''
            CREATE TABLE Favourites(
              id INTEGER PRIMARY KEY,
              email TEXT,
              first_name TEXT,
              last_name TEXT,
              avatar TEXT
            )
         ''');
      }
    );
  }

  Future<int> newPersonRaw(PersonRepo newPerson)async{
    final db = await database;

    final res = await db.rawInsert(
      '''      
      INSERT INTO Favourites(id,email,first_name,last_name,avatar)
        VALUES (
          ${newPerson.id},
          '${newPerson.email}',
          '${newPerson.firstName}',
          '${newPerson.lastName}',
          '${newPerson.avatar}'
        )
      '''
    );


    return res;
  }
  
  Future<int>addnewPerson(PersonRepo newPerson)async{
    final db = await database;
    PersonRepo person = new PersonRepo(
      id :newPerson.id,
      email: newPerson.email,
      firstName: newPerson.firstName,
      lastName :newPerson.lastName,
      avatar :newPerson.avatar,
    );
    final res = await db.insert('Favourites', person.toJson());

    // ID del ultimo registro insertado
    print('person añadido -> ${newPerson.toString()}');
    return res;
  }

  Future<PersonRepo> getPersonById(int id)async{
    final db = await database;
    final res = await db.query('Favourites', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
      ? PersonRepo.fromJson(res.first)
      : null;
  }
}