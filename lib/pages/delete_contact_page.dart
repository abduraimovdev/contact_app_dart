import 'dart:io';

import 'package:contact_app/database/database.dart';
import 'package:contact_app/pages/intro_page.dart';

import '../service/io_service.dart';

class DeleteContactPage  {
  DeleteContactPage(String name) {
    builder(name);
  }

  void builder(String name) {
    print("\n\n\t\t Delete Contact ");

    String command = io.inputText("Are Your Sure Yes or Deafult -> No:");

    switch(command.toLowerCase()) {
      case "yes" || "y": {
        bool isSuccess = dataBase.deleteData(name: name);

        print(isSuccess ? "\n\t\t| Successfuly Contact Deleted |" : "\n\t\t| Update Failed |");
        sleep(Duration(seconds: 3));
        IntroPage();
      }break;
      default : {
        print("\n\t\t| Contact Not Deleted ! |");
        IntroPage();
      }break;
    }
  }

}