import 'package:contact_app/models/contact_model.dart';

DataBase dataBase = DataBase();

class DataBase {
  Map<String, Map<String, Object>> _database = {};

  bool createData({required Contact contact}) {
    if (_database.containsKey(contact.name)) {
      return false;
    } else {
      _database[contact.name] = contact.toJson();
      return true;
    }
  }

  Contact? readData({required String name}) {
    if(_database.containsKey(name)) {
      return Contact.fromJson(_database[name]!);
    }else {
      return null;
    }
  }

  bool updateData({required String name, required Contact contact}) {
    if (_database.containsKey(name)) {
      _database.remove(name);
      _database[contact.name] = contact.toJson();
      return true;
    }else {
      return false;
    }
  }

  bool deleteData({required String name}) {
    try {
      _database.remove(name);
      return true;
    }catch(e) {
      return false;
    }
  }

  List<Contact> readAllData() => _database.values.map((item) => Contact.fromJson(item)).toList();
}
