import 'package:contact_app/database/database.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/builder.dart';
import 'package:contact_app/pages/intro_page.dart';

import '../service/io_service.dart';

class UpdateContactPage {
  UpdateContactPage(Contact contact) {
    builder(contact);
  }

  void builder(Contact contact) {
    print("\t\t\t Update Contact Page");
    String name = io.inputText("Default(No) || Update Name :");
    String email = io.inputText("Default(No) || Update email :");
    String number = io.inputText("Default(No) || Update number :");

    bool isSuccess = dataBase.updateData(
      name : contact.name,
      contact: contact.copyWith(
        name: name.isEmpty ? null : name,
        email: email.isEmpty ? null : email,
        number: number.isEmpty ? null : number,
      ),
    );

    print(isSuccess ? "\n\t\t| Successfuly Contact Updated |" : "\n\t\t| Update Failed |");
    IntroPage();
  }
}
