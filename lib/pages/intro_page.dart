import 'package:contact_app/main.dart';
import 'package:contact_app/pages/builder.dart';
import 'package:contact_app/pages/create_contact_page.dart';
import 'package:contact_app/pages/read_all_contact_page.dart';
import 'package:contact_app/pages/search_page.dart';
import '../service/io_service.dart';

class IntroPage extends Builder {
  @override
  void builder() {
    super.builder();
    print("\t\t\ Welcome To Contact App");
    print('''
---------------------
| I. Create Contact   |
---------------------
| II. Search Contact  |
---------------------
| III. All Contacts   |
---------------------
| IV. Exit            |
---------------------

    ''');

    String command = io.inputText("Command :");
    switch(command) {
      case "I": {
        CreateContactPage();
      } break;
      case "II": {
        SearchPage();
      }break;
      case "III": {
        ReadAllContactPage();
      }break;
      case "IV": {
        print("\n\n\n\n\n\n \t\t Thank You Attention");
        return ;
      }break;
      default : {
        print("Not Found Command !");
        builder();
      }break;
    }
  }
}