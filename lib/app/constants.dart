import 'package:intl/intl.dart';

class AppConstants {

  static const String  baseUrl = "https://dna-testing-system.onrender.com";
  static const String empty="";
  static const int zero=0;
  static const Duration apiTimeOut =  Duration(milliseconds: 60000);
  static const String token = "Token";
}

class MyDateTime {
  late final DateTime dateTime;

  MyDateTime(this.dateTime);

  String formattedDate({String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(dateTime);
  }
}