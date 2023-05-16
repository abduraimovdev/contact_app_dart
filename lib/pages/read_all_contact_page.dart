import 'package:contact_app/database/database.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/builder.dart';
import 'package:contact_app/pages/delete_contact_page.dart';
import 'package:contact_app/pages/intro_page.dart';
import 'package:contact_app/pages/update_contact_page.dart';

import '../service/io_service.dart';

class ReadAllContactPage {
  List<Contact>? contacts;

  ReadAllContactPage({List<Contact>? foundedContact = null})
      : this.contacts = foundedContact ?? dataBase.readAllData() {
    builder();
  }

  void builder() {
    print("\t\t Read All Contact Page");

    for (int i = 0; i < contacts!.length; i++) {
      print('''
----------------------------
| Id : ${i + 1}                
| Name : ${contacts![i].name}
| Email : ${contacts![i].email}
| Number : ${contacts![i].number}
----------------------------
''');
    }

    int command = io.inputNum("Select Contact Id || Default -> Back() :");
    if (command == 0) {
      IntroPage();
    } else {
      command--;
      if (contacts!.length >= command && command >= 0) {
        print("true");
        selectedContact(contacts![command]);
      } else {
        builder();
      }
    }
  }

  void selectedContact(Contact contact) {
    print('''
----------------------------                
| Name : ${contact.name}
| Email : ${contact.email}
| Number : ${contact.number}
----------------------------
''');
    String command = io.inputText('''    
Update(I) 
Delete(II)
Back(III)

Command:''');

    switch (command) {
      case "I":
        {
          UpdateContactPage(contact);
        }
        break;
      case "II":
        {
          DeleteContactPage(contact.name);
        }
        break;
      case "III":
        {
          builder();
        }
        break;
      default:
        {
          selectedContact(contact);
        }
    }
  }
}
