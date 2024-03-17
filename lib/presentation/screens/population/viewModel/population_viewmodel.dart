import 'dart:async';
import 'dart:io';

import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:double_helix_detective_system/presentation/common/freezed_data_class.dart';

class PopulationViewModel extends BaseViewModel
    with
        PopulationViewModelInput,
        PopulationViewModelOutput {
  StreamController<String> nameStreamController = StreamController.broadcast();
  StreamController<String> addressStreamController = StreamController
      .broadcast();
  StreamController<String> nationalIdStreamController = StreamController
      .broadcast();
  StreamController<String> phoneStreamController = StreamController.broadcast();
  StreamController<String> genderStreamController = StreamController
      .broadcast();
  StreamController<String> bloodTypeStreamController = StreamController
      .broadcast();
  StreamController<String> statusStreamController = StreamController
      .broadcast();
  StreamController<String> descriptionStreamController = StreamController
      .broadcast();
  StreamController<File> dnaSequenceStreamController = StreamController
      .broadcast();
  StreamController<DateTime> birthDateStreamController = StreamController
      .broadcast();
  var populationObject = PopulationObject(name: "",
      address: "",
      nationalId: "",
      phone: "",
      gender: "",
      birthDate: DateTime(0),
      bloodType: "",
      status: "",
      description: "",
      dnaSequence:File("") );

  @override
  void dispose() {
    nameStreamController.close();
    addressStreamController.close();
    nationalIdStreamController.close();
    phoneStreamController.close();
    genderStreamController.close();
    bloodTypeStreamController.close();
    statusStreamController.close();
    descriptionStreamController.close();
    dnaSequenceStreamController.close();
    birthDateStreamController.close();
    super.dispose();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get addressInput => addressStreamController.sink;

  @override
  Sink get birthDateInput => birthDateStreamController.sink;

  @override
  Sink get bloodTypeInput => bloodTypeStreamController.sink;

  @override
  Sink get descriptionInput => descriptionStreamController.sink;

  @override
  Sink get dnaSequenceInput => dnaSequenceStreamController.sink;

  @override
  Sink get genderInput => genderStreamController.sink;

  @override
  Sink get nameInput => nameStreamController.sink;

  @override
  Sink get nationalIdInput => nationalIdStreamController.sink;

  @override
  Sink get phoneInput => phoneStreamController.sink;

  @override
  Sink get statusInput => statusStreamController.sink;

  @override
  Stream<bool> get addressOutput =>
      addressStreamController.stream.map((address) => _isValidAddress(address));

  @override
  Stream<DateTime> get birthDateOutput =>
      birthDateStreamController.stream.map((date) => date);

  @override
  Stream<bool> get bloodTypeOutput =>
      bloodTypeStreamController.stream.map((bloodType) =>
          _isValidBloodType(bloodType));

  @override
  Stream<bool> get descriptionOutput =>
      descriptionStreamController.stream.map((description) =>
          _isValidDescription(description));

  @override
  Stream<File> get dnaSequenceOutput =>
      dnaSequenceStreamController.stream.map((dnaSequence) =>
          dnaSequence);

  @override
  Stream<bool> get genderOutput =>
      genderStreamController.stream.map((gender) => _isValidGender(gender));

  @override
  Stream<bool> get nameOutput =>
      nameStreamController.stream.map((name) => _isValidName(name));

  @override
  Stream<bool> get nationalIdOutput =>
      nationalIdStreamController.stream.map((nationalId) =>
          _isValidNationalId(nationalId));

  @override
  Stream<bool> get phoneOutput =>
      nationalIdStreamController.stream.map((phone) => _isValidPhone(phone));

  @override
  Stream<bool> get statusOutput =>
      statusStreamController.stream.map((status) => _isValidStatus(status));

  bool _isValidAddress(String address) {
    return address.isNotEmpty;
  }

  bool _isValidName(String name) {
    return name.isNotEmpty;
  }

  bool _isValidPhone(String phone) {
    return phone.isNotEmpty;
  }

  bool _isValidNationalId(String nationalId) {
    return nationalId.isNotEmpty;
  }

  bool _isValidGender(String gender) {
    return gender.isNotEmpty;
  }

  bool _isValidStatus(String status) {
    return status.isNotEmpty;
  }

  bool _isValidDescription(String description) {
    return description.isNotEmpty;
  }

  bool _isValidBloodType(String bloodType) {
    return bloodType.isNotEmpty;
  }
}

mixin PopulationViewModelInput {
  Sink get nameInput;

  Sink get addressInput;

  Sink get nationalIdInput;

  Sink get phoneInput;

  Sink get genderInput;

  Sink get bloodTypeInput;

  Sink get statusInput;

  Sink get descriptionInput;

  Sink get birthDateInput;

  Sink get dnaSequenceInput;
}

mixin PopulationViewModelOutput {
  Stream<bool> get nameOutput;

  Stream<bool> get addressOutput;

  Stream<bool> get nationalIdOutput;

  Stream<bool> get phoneOutput;

  Stream<bool> get genderOutput;

  Stream<bool> get bloodTypeOutput;

  Stream<bool> get statusOutput;

  Stream<bool> get descriptionOutput;

  Stream<DateTime> get birthDateOutput;

  Stream<File> get dnaSequenceOutput;

}