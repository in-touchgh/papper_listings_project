import 'package:flutter/foundation.dart';

class PrintUtils {
  static errorDebugPrint(String msg) {
    if (kDebugMode) {
      print(msg);
    }
  }
}
