import 'dart:io';

import 'package:testnumber2/testnumber2.dart' as testnumber2;

void main() {
  List<String> number = ["1", "2", "3", "4", "5"];
  {
    int i, j = 0, k = 5, n = 5;

    for (i = 1; i <= 10; i++) {
      if (i <= 5) {
        for (j = 1; j <= 5; j++) {
          if (j != 5) {
            if (j <= i) stdout.write(j);
            if (j > i) stdout.write(" ");
          }
        }

        for (k = 5; k >= 1; k--) {
          if (k <= i)
            stdout.write(k);
          else
            stdout.write(" ");
        }
      } else {
        for (j = 1; j <= 5; j++) {
          if (j != 5) {
            if (j < n) stdout.write(j);
            if (j >= n) stdout.write(" ");
          }
        }

        for (k = 5; k >= 1; k--) {
          if (k < n)
            stdout.write(k);
          else
            stdout.write(" ");
        }
        n--;
      }

      print("");
    }

    print("");
  }
}
