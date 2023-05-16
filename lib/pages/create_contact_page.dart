import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/builder.dart';
import 'package:contact_app/pages/intro_page.dart';

import '../service/io_service.dart';
import '../database/database.dart';

class CreateContactPage extends Builder {
  @override
  void builder() {
    super.builder();
    print("\t\t Create Contact Page");

    String name = "";
    String email = "";
    String number = "";

    while(name.isEmpty || email.isEmpty || number.isEmpty) {
      if(name.isEmpty) {
        name = io.inputText("Enter your Name :");
      }
      if(email.isEmpty) {
        email = io.inputText("Enter your email :");
      }
      if(number.isEmpty) {
        number = io.inputText("Enter your Number :");
      }
    }
    Contact contact = Contact(id: name.codeUnits.join(""), name: name, email: email, number: number);
    bool isCreated = dataBase.createData(contact: contact);

    print("\t\t${isCreated ? "| Contact Successfuly Created |" : "| Failed Contact |"}");

    String command = io.inputText("Continue(yes) or Back(default no):");

    switch(command) {
      case "yes" : {
        builder();
      }
      default : {
        IntroPage();
      }
    }

  }
}