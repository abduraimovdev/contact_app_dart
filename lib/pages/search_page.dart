import 'dart:io';

import 'package:contact_app/pages/builder.dart';
import 'package:contact_app/pages/intro_page.dart';
import 'package:contact_app/pages/read_all_contact_page.dart';

import '../database/database.dart';
import '../models/contact_model.dart';
import '../service/io_service.dart';

class SearchPage extends Builder {
  @override
  void builder() {
    super.builder();

    print("\t\t Search Page");

    String text = io.inputText("Search(Name, Email, Number) \n Back(I):");

    if(text == "I") IntroPage();
    List<Contact> foundedContact = searching(text);

    if(foundedContact.isNotEmpty) {
      ReadAllContactPage(foundedContact : foundedContact);
    }else {
      print("\n \t\t\t | Contact Not Found ! |");
      sleep(Duration(seconds: 3));
      builder();
    }
  }

  List<Contact> searching(String text) {
    List<Contact> contacts = dataBase.readAllData();
    List<Contact> result = [];
    final regex = RegExp("${text.trim().toLowerCase()}");
    for (var item in contacts) {
      if (regex.hasMatch(item.name.trim().toLowerCase()) ||
          regex.hasMatch(item.email.trim().toLowerCase()) ||
          regex.hasMatch(item.number.trim().toLowerCase())) {
        result.add(item);
      }
    }
    return result;
  }
}
