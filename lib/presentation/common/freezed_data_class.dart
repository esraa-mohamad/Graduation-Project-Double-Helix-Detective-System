// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_class.freezed.dart';


@freezed
class LoginObject with _$LoginObject {

  factory LoginObject({required String email ,required String password}) = _LoginObject ;
}