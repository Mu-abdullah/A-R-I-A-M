import 'package:sqflite/sqflite.dart';

class SqlFLite{
  Database? database;
  createDataBase({required String tableName}) async {
    openDatabase(
      '$tableName.db',
      version: 1,
      // create table
      onCreate: (database, version) {
        database
            .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, source TEXT, data TEXT, number TEXT, summary TEXT, status TEXT)')
            .then((value) {
          print('data base created');
        }).catchError((error) {
          print('error when create table ${error.toString()}');
        });
      },
      // open database
      onOpen: (database) {
        getDataFromDataBase(database);
        print('data base opened');
      },
    ).then((value) {
      database = value;

    });
  }

  insertToDataBase({required source, required data,required number, required summary, required state}) async {
    await database!.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO tasks(source, data, number, summary,status)VALUES("$source","$data","$number","$summary" ,"new")')
          .then((value) {
        print('$value inserted successfully ');

        // getDataFromDataBase(database);
        print(value);
      }).catchError((error) {
        print('error when insert new Row ${error.toString()}');
      });
    });
  }

  void getDataFromDataBase(database) {

    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        // if (element['status'] == 'imported') {
        //   importedTasks.add(element);
        // } else if (element['status'] == 'exported') {
        //   exportedTasks.add(element);
        // } else if (element['status'] == 'archive') {
        //   archiveTasks.add(element);
        // }else if (element['status'] == 'new') {
        //   newTasks.add(element);
        // }
      });

    });
  }

  updateToDatabase({required String status, required int id}) async {
    database!.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then((value) {
      getDataFromDataBase(database);

    });
  }

  deleteFromDatabase({required int id}) async {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDataBase(database);

    });
  }
}