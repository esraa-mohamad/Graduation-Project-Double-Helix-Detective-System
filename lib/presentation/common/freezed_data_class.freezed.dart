// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginObject {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginObjectImplCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$LoginObjectImplCopyWith(
          _$LoginObjectImpl value, $Res Function(_$LoginObjectImpl) then) =
      __$$LoginObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginObjectImplCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$LoginObjectImpl>
    implements _$$LoginObjectImplCopyWith<$Res> {
  __$$LoginObjectImplCopyWithImpl(
      _$LoginObjectImpl _value, $Res Function(_$LoginObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginObjectImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginObjectImpl implements _LoginObject {
  _$LoginObjectImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginObjectImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      __$$LoginObjectImplCopyWithImpl<_$LoginObjectImpl>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(
      {required final String email,
      required final String password}) = _$LoginObjectImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PopulationObject {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get nationalId => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;
  String get bloodType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  File get dnaSequence => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PopulationObjectCopyWith<PopulationObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopulationObjectCopyWith<$Res> {
  factory $PopulationObjectCopyWith(
          PopulationObject value, $Res Function(PopulationObject) then) =
      _$PopulationObjectCopyWithImpl<$Res, PopulationObject>;
  @useResult
  $Res call(
      {String name,
      String address,
      String nationalId,
      String phone,
      String gender,
      DateTime birthDate,
      String bloodType,
      String status,
      String description,
      File dnaSequence});
}

/// @nodoc
class _$PopulationObjectCopyWithImpl<$Res, $Val extends PopulationObject>
    implements $PopulationObjectCopyWith<$Res> {
  _$PopulationObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? nationalId = null,
    Object? phone = null,
    Object? gender = null,
    Object? birthDate = null,
    Object? bloodType = null,
    Object? status = null,
    Object? description = null,
    Object? dnaSequence = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: null == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bloodType: null == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dnaSequence: null == dnaSequence
          ? _value.dnaSequence
          : dnaSequence // ignore: cast_nullable_to_non_nullable
              as File,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$populationObjectImplCopyWith<$Res>
    implements $PopulationObjectCopyWith<$Res> {
  factory _$$populationObjectImplCopyWith(_$populationObjectImpl value,
          $Res Function(_$populationObjectImpl) then) =
      __$$populationObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String address,
      String nationalId,
      String phone,
      String gender,
      DateTime birthDate,
      String bloodType,
      String status,
      String description,
      File dnaSequence});
}

/// @nodoc
class __$$populationObjectImplCopyWithImpl<$Res>
    extends _$PopulationObjectCopyWithImpl<$Res, _$populationObjectImpl>
    implements _$$populationObjectImplCopyWith<$Res> {
  __$$populationObjectImplCopyWithImpl(_$populationObjectImpl _value,
      $Res Function(_$populationObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? nationalId = null,
    Object? phone = null,
    Object? gender = null,
    Object? birthDate = null,
    Object? bloodType = null,
    Object? status = null,
    Object? description = null,
    Object? dnaSequence = null,
  }) {
    return _then(_$populationObjectImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: null == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bloodType: null == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dnaSequence: null == dnaSequence
          ? _value.dnaSequence
          : dnaSequence // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$populationObjectImpl implements _populationObject {
  _$populationObjectImpl(
      {required this.name,
      required this.address,
      required this.nationalId,
      required this.phone,
      required this.gender,
      required this.birthDate,
      required this.bloodType,
      required this.status,
      required this.description,
      required this.dnaSequence});

  @override
  final String name;
  @override
  final String address;
  @override
  final String nationalId;
  @override
  final String phone;
  @override
  final String gender;
  @override
  final DateTime birthDate;
  @override
  final String bloodType;
  @override
  final String status;
  @override
  final String description;
  @override
  final File dnaSequence;

  @override
  String toString() {
    return 'PopulationObject(name: $name, address: $address, nationalId: $nationalId, phone: $phone, gender: $gender, birthDate: $birthDate, bloodType: $bloodType, status: $status, description: $description, dnaSequence: $dnaSequence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$populationObjectImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dnaSequence, dnaSequence) ||
                other.dnaSequence == dnaSequence));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, address, nationalId, phone,
      gender, birthDate, bloodType, status, description, dnaSequence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$populationObjectImplCopyWith<_$populationObjectImpl> get copyWith =>
      __$$populationObjectImplCopyWithImpl<_$populationObjectImpl>(
          this, _$identity);
}

abstract class _populationObject implements PopulationObject {
  factory _populationObject(
      {required final String name,
      required final String address,
      required final String nationalId,
      required final String phone,
      required final String gender,
      required final DateTime birthDate,
      required final String bloodType,
      required final String status,
      required final String description,
      required final File dnaSequence}) = _$populationObjectImpl;

  @override
  String get name;
  @override
  String get address;
  @override
  String get nationalId;
  @override
  String get phone;
  @override
  String get gender;
  @override
  DateTime get birthDate;
  @override
  String get bloodType;
  @override
  String get status;
  @override
  String get description;
  @override
  File get dnaSequence;
  @override
  @JsonKey(ignore: true)
  _$$populationObjectImplCopyWith<_$populationObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CompareDnaObject {
  File get fileA => throw _privateConstructorUsedError;
  File get fileB => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompareDnaObjectCopyWith<CompareDnaObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompareDnaObjectCopyWith<$Res> {
  factory $CompareDnaObjectCopyWith(
          CompareDnaObject value, $Res Function(CompareDnaObject) then) =
      _$CompareDnaObjectCopyWithImpl<$Res, CompareDnaObject>;
  @useResult
  $Res call({File fileA, File fileB});
}

/// @nodoc
class _$CompareDnaObjectCopyWithImpl<$Res, $Val extends CompareDnaObject>
    implements $CompareDnaObjectCopyWith<$Res> {
  _$CompareDnaObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileA = null,
    Object? fileB = null,
  }) {
    return _then(_value.copyWith(
      fileA: null == fileA
          ? _value.fileA
          : fileA // ignore: cast_nullable_to_non_nullable
              as File,
      fileB: null == fileB
          ? _value.fileB
          : fileB // ignore: cast_nullable_to_non_nullable
              as File,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompareDnaObjectImplCopyWith<$Res>
    implements $CompareDnaObjectCopyWith<$Res> {
  factory _$$CompareDnaObjectImplCopyWith(_$CompareDnaObjectImpl value,
          $Res Function(_$CompareDnaObjectImpl) then) =
      __$$CompareDnaObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File fileA, File fileB});
}

/// @nodoc
class __$$CompareDnaObjectImplCopyWithImpl<$Res>
    extends _$CompareDnaObjectCopyWithImpl<$Res, _$CompareDnaObjectImpl>
    implements _$$CompareDnaObjectImplCopyWith<$Res> {
  __$$CompareDnaObjectImplCopyWithImpl(_$CompareDnaObjectImpl _value,
      $Res Function(_$CompareDnaObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileA = null,
    Object? fileB = null,
  }) {
    return _then(_$CompareDnaObjectImpl(
      fileA: null == fileA
          ? _value.fileA
          : fileA // ignore: cast_nullable_to_non_nullable
              as File,
      fileB: null == fileB
          ? _value.fileB
          : fileB // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$CompareDnaObjectImpl implements _CompareDnaObject {
  _$CompareDnaObjectImpl({required this.fileA, required this.fileB});

  @override
  final File fileA;
  @override
  final File fileB;

  @override
  String toString() {
    return 'CompareDnaObject(fileA: $fileA, fileB: $fileB)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompareDnaObjectImpl &&
            (identical(other.fileA, fileA) || other.fileA == fileA) &&
            (identical(other.fileB, fileB) || other.fileB == fileB));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileA, fileB);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompareDnaObjectImplCopyWith<_$CompareDnaObjectImpl> get copyWith =>
      __$$CompareDnaObjectImplCopyWithImpl<_$CompareDnaObjectImpl>(
          this, _$identity);
}

abstract class _CompareDnaObject implements CompareDnaObject {
  factory _CompareDnaObject(
      {required final File fileA,
      required final File fileB}) = _$CompareDnaObjectImpl;

  @override
  File get fileA;
  @override
  File get fileB;
  @override
  @JsonKey(ignore: true)
  _$$CompareDnaObjectImplCopyWith<_$CompareDnaObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchIdentificationObject {
  File get file => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchIdentificationObjectCopyWith<SearchIdentificationObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchIdentificationObjectCopyWith<$Res> {
  factory $SearchIdentificationObjectCopyWith(SearchIdentificationObject value,
          $Res Function(SearchIdentificationObject) then) =
      _$SearchIdentificationObjectCopyWithImpl<$Res,
          SearchIdentificationObject>;
  @useResult
  $Res call({File file, String status});
}

/// @nodoc
class _$SearchIdentificationObjectCopyWithImpl<$Res,
        $Val extends SearchIdentificationObject>
    implements $SearchIdentificationObjectCopyWith<$Res> {
  _$SearchIdentificationObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchIdentificationObjectImplCopyWith<$Res>
    implements $SearchIdentificationObjectCopyWith<$Res> {
  factory _$$SearchIdentificationObjectImplCopyWith(
          _$SearchIdentificationObjectImpl value,
          $Res Function(_$SearchIdentificationObjectImpl) then) =
      __$$SearchIdentificationObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File file, String status});
}

/// @nodoc
class __$$SearchIdentificationObjectImplCopyWithImpl<$Res>
    extends _$SearchIdentificationObjectCopyWithImpl<$Res,
        _$SearchIdentificationObjectImpl>
    implements _$$SearchIdentificationObjectImplCopyWith<$Res> {
  __$$SearchIdentificationObjectImplCopyWithImpl(
      _$SearchIdentificationObjectImpl _value,
      $Res Function(_$SearchIdentificationObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? status = null,
  }) {
    return _then(_$SearchIdentificationObjectImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchIdentificationObjectImpl implements _SearchIdentificationObject {
  _$SearchIdentificationObjectImpl({required this.file, required this.status});

  @override
  final File file;
  @override
  final String status;

  @override
  String toString() {
    return 'SearchIdentificationObject(file: $file, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchIdentificationObjectImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchIdentificationObjectImplCopyWith<_$SearchIdentificationObjectImpl>
      get copyWith => __$$SearchIdentificationObjectImplCopyWithImpl<
          _$SearchIdentificationObjectImpl>(this, _$identity);
}

abstract class _SearchIdentificationObject
    implements SearchIdentificationObject {
  factory _SearchIdentificationObject(
      {required final File file,
      required final String status}) = _$SearchIdentificationObjectImpl;

  @override
  File get file;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$SearchIdentificationObjectImplCopyWith<_$SearchIdentificationObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MissingSearchObject {
  File get file => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MissingSearchObjectCopyWith<MissingSearchObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissingSearchObjectCopyWith<$Res> {
  factory $MissingSearchObjectCopyWith(
          MissingSearchObject value, $Res Function(MissingSearchObject) then) =
      _$MissingSearchObjectCopyWithImpl<$Res, MissingSearchObject>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class _$MissingSearchObjectCopyWithImpl<$Res, $Val extends MissingSearchObject>
    implements $MissingSearchObjectCopyWith<$Res> {
  _$MissingSearchObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MissingSearchObjectImplCopyWith<$Res>
    implements $MissingSearchObjectCopyWith<$Res> {
  factory _$$MissingSearchObjectImplCopyWith(_$MissingSearchObjectImpl value,
          $Res Function(_$MissingSearchObjectImpl) then) =
      __$$MissingSearchObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$MissingSearchObjectImplCopyWithImpl<$Res>
    extends _$MissingSearchObjectCopyWithImpl<$Res, _$MissingSearchObjectImpl>
    implements _$$MissingSearchObjectImplCopyWith<$Res> {
  __$$MissingSearchObjectImplCopyWithImpl(_$MissingSearchObjectImpl _value,
      $Res Function(_$MissingSearchObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$MissingSearchObjectImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$MissingSearchObjectImpl implements _MissingSearchObject {
  _$MissingSearchObjectImpl({required this.file});

  @override
  final File file;

  @override
  String toString() {
    return 'MissingSearchObject(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissingSearchObjectImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissingSearchObjectImplCopyWith<_$MissingSearchObjectImpl> get copyWith =>
      __$$MissingSearchObjectImplCopyWithImpl<_$MissingSearchObjectImpl>(
          this, _$identity);
}

abstract class _MissingSearchObject implements MissingSearchObject {
  factory _MissingSearchObject({required final File file}) =
      _$MissingSearchObjectImpl;

  @override
  File get file;
  @override
  @JsonKey(ignore: true)
  _$$MissingSearchObjectImplCopyWith<_$MissingSearchObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
