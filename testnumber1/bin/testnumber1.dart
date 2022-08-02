import 'dart:io';

import 'package:testnumber1/testnumber1.dart' as testnumber1;

void main() {
  List<String> textlist = [];

  bool end = false;
  List<String> hasil = [];

  while (end == false) {
    stdout.write("Enter a word : ");
    String? text = stdin.readLineSync();
    print(text);
    stdout.write("Again? y/n : ");
    String? choose = stdin.readLineSync();
    if (choose == "n") {
      print("jalan");
      end = true;
    }
    textlist.add(text!);
  }
  int index = -1;
  int total = (textlist.length * 2) - 1;
  for (var i = 0; i < total; i++) {
    if (i > (total / 2).floor()) {
      print("ini jalan");
      index--;
    }
    if (i <= (total / 2).floor()) {
      index++;
    }
    hasil.add(textlist[index]);
  }
  print(hasil);
}
