import 'package:intl/intl.dart';

class AppConstants {

  static const String  baseUrl = "https://dna-testing-system.onrender.com";
  static const String empty="";
  static const int zero=0;
  static const Duration apiTimeOut =  Duration(milliseconds: 60000);
  static const String token = "Token";
}

// convert date from date time to string
// class MyDateTime {
//   late final DateTime dateTime;
//
//   MyDateTime(this.dateTime);
//
//   Map<String, dynamic> toJson() {
//     return {
//       'dateTime': dateTime.toIso8601String(), // Convert DateTime to string
//     };
//   }
// }
class MyDateTime {
  late final DateTime dateTime;

  MyDateTime(this.dateTime);

  String formattedDate({String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(dateTime);
  }

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime.toIso8601String(), // Convert DateTime to string
    };
  }
}