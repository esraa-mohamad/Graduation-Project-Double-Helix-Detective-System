import 'package:double_helix_detective_system/app/constants.dart';

extension NonNullString on String?{
  String orEmpty(){
    if(this == null){
      return AppConstants.empty;
    }else{
      return this!;
    }
  }
}

extension NonNullDateTime on DateTime? {
  DateTime orNow() {
    if (this == null) {
      return DateTime.now();
    } else {
      return this!;
    }
  }
}


extension NonNullInteger on int?{
  int orZero(){
    if(this == null){
      return AppConstants.zero;
    }else{
      return this!;
    }
  }
}