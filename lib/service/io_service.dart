import 'dart:io';

IOService io = IOService();

class IOService {
  console(Object text) {
    stdout.write("$text");
  }

  String readText() {
    return stdin.readLineSync() ?? "";
  }


  int readNumber() {
    String txt = stdin.readLineSync() ?? "";
    return int.tryParse(txt) ?? -1;
  }

  String inputText(Object text) {
    console(text);
    return readText();
  }


  int inputNum(Object text) {
    console(text);
    return readNumber();
  }
}