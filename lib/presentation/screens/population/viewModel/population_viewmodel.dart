import 'dart:async';
import 'dart:io';
import 'package:double_helix_detective_system/app/app_prefs.dart';
import 'package:double_helix_detective_system/app/constants.dart';
import 'package:double_helix_detective_system/domain/usecase/add_population_usecase.dart';
import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:double_helix_detective_system/presentation/common/freezed_data_class.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../app/di.dart';
import '../../../common/state_renderer/state_renderer.dart';
import '../../../common/state_renderer/state_renderer_imp.dart';

class PopulationViewModel extends BaseViewModel
    with PopulationViewModelInput, PopulationViewModelOutput {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  StreamController<String> nameStreamController = BehaviorSubject();
  StreamController<String> addressStreamController =
      BehaviorSubject();
  StreamController<String> nationalIdStreamController =
      BehaviorSubject();
  StreamController<String> phoneStreamController = BehaviorSubject();
  StreamController<String> genderStreamController =
      BehaviorSubject();
  StreamController<String> bloodTypeStreamController =
      BehaviorSubject();
  StreamController<String> statusStreamController =
      BehaviorSubject();
  StreamController<String> descriptionStreamController =
      BehaviorSubject();
  StreamController<File> dnaSequenceStreamController =
      BehaviorSubject();
  StreamController<DateTime> birthDateStreamController =
      BehaviorSubject();
  StreamController<void> areAllInputsValidStreamController = BehaviorSubject();
  StreamController isUserAddedSuccessfullyStreamController = BehaviorSubject<bool>();
  var populationObject = PopulationObject(
      name: "",
      address: "",
      nationalId: "",
      phone: "",
      gender: "",
      birthDate: DateTime.now(),
      bloodType: "",
      status: "",
      description: "",
      dnaSequence: File(""));
  final AddPopulationUseCase _addPopulationUseCase;

  PopulationViewModel(this._addPopulationUseCase);

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
    areAllInputsValidStreamController.close();
    isUserAddedSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }


  //inputs
  @override
  add() async {
    inputState.add(LoadingState(StateRendererType.popupLoadingState));
    (await _addPopulationUseCase.execute(AddPopulationInput(
      token:await _appPreferences.getAuthToken()??AppConstants.empty,
      name: populationObject.name,
      address: populationObject.address,
      nationalId: populationObject.nationalId,
      phone: populationObject.phone,
      gender: populationObject.gender,
      birthDate: populationObject.birthDate,
      bloodType:populationObject.bloodType,
      status: populationObject.status,
      description: populationObject.description,
      dnaSequence:populationObject.dnaSequence,
    )))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      inputState.add(ContentState());
      isUserAddedSuccessfullyStreamController.add(true);
    });
  }

  @override
  setAddress(String address) {
    addressInput.add(address);
    if (address.isNotEmpty) {
      populationObject = populationObject.copyWith(address: address);
    } else {
      populationObject = populationObject.copyWith(address: "");
    }
    validate();
  }

  @override
  setBirthDate(DateTime date) {
    birthDateInput.add(date);
    if (date.toString().isNotEmpty) {
      populationObject = populationObject.copyWith(birthDate: date);
    } else {
      populationObject = populationObject.copyWith(birthDate: DateTime.now());
    }
    validate();
  }

  @override
  setBloodType(String bloodT) {
    bloodTypeInput.add(bloodT);
    if (bloodT.isNotEmpty) {
      populationObject = populationObject.copyWith(bloodType: bloodT);
    } else {
      populationObject = populationObject.copyWith(bloodType: "");
    }
    validate();
  }

  @override
  setDescription(String desc) {
    descriptionInput.add(desc);
    if (desc.isNotEmpty) {
      populationObject = populationObject.copyWith(description: desc);
    } else {
      populationObject = populationObject.copyWith(description: "");
    }
    validate();
  }

  @override
  setDnaSeq(File file) {
    dnaSequenceInput.add(file);
    if (file.path.isNotEmpty) {
      populationObject = populationObject.copyWith(dnaSequence: file);
    } else {
      populationObject = populationObject.copyWith(dnaSequence: File(""));
    }
    validate();
  }

  @override
  setGender(String gender) {
    genderInput.add(gender);
    if (gender.isNotEmpty) {
      populationObject = populationObject.copyWith(gender: gender);
    } else {
      populationObject = populationObject.copyWith(gender: "");
    }
    validate();
  }

  @override
  setName(String name) {
    nameInput.add(name);
    if (name.isNotEmpty) {
      populationObject = populationObject.copyWith(name: name);
    } else {
      populationObject = populationObject.copyWith(name: "");
    }
    validate();
  }

  @override
  setNationalId(String nId) {
    nationalIdInput.add(nId);
    if (nId.isNotEmpty) {
      populationObject = populationObject.copyWith(nationalId: nId);
    } else {
      populationObject = populationObject.copyWith(nationalId: "");
    }
    validate();
  }

  @override
  setPhone(String phone) {
    phoneInput.add(phone);
    if (phone.isNotEmpty) {
      populationObject = populationObject.copyWith(phone: phone);
    } else {
      populationObject = populationObject.copyWith(phone: "");
    }
    validate();
  }

  @override
  setStatus(String status) {
    statusInput.add(status);
    if (status.isNotEmpty) {
      populationObject = populationObject.copyWith(status: status);
    } else {
      populationObject = populationObject.copyWith(status: "");
    }
    validate();
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
  Sink get areInputsValidInput => areAllInputsValidStreamController.sink;

//outputs
  @override
  Stream<bool> get addressOutput =>
      addressStreamController.stream.map((address) => _isValidAddress(address));

  @override
  Stream<DateTime> get birthDateOutput =>
      birthDateStreamController.stream.map((date) => date);

  @override
  Stream<bool> get bloodTypeOutput => bloodTypeStreamController.stream
      .map((bloodType) => _isValidBloodType(bloodType));

  @override
  Stream<bool> get descriptionOutput => descriptionStreamController.stream
      .map((description) => _isValidDescription(description));

  @override
  Stream<String?> get descriptionErrorOutput =>
      descriptionOutput.map((isValidDescription) =>
          isValidDescription ? null : AppStrings.errorDescription);

  @override
  Stream<File> get dnaSequenceOutput =>
      dnaSequenceStreamController.stream.map((dnaSequence) => dnaSequence);

  @override
  Stream<bool> get genderOutput =>
      genderStreamController.stream.map((gender) => _isValidGender(gender));

  @override
  Stream<bool> get nameOutput =>
      nameStreamController.stream.map((name) => _isValidName(name));

  @override
  Stream<bool> get nationalIdOutput => nationalIdStreamController.stream
      .map((nationalId) => _isValidNationalId(nationalId));

  @override
  Stream<bool> get phoneOutput =>
      nationalIdStreamController.stream.map((phone) => _isValidPhone(phone));

  @override
  Stream<bool> get statusOutput =>
      statusStreamController.stream.map((status) => _isValidStatus(status));

  @override
  Stream<String?> get statusErrorOutput => statusOutput
      .map((isValidStatus) => isValidStatus ? null : AppStrings.errorStatus);

  @override
  Stream<bool> get areInputsValidOutput =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

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

  bool _areAllInputsValid() {
    return populationObject.description.isNotEmpty &&
        populationObject.status.isNotEmpty &&
        populationObject.dnaSequence.path.isNotEmpty;
  }

  validate() {
    areInputsValidInput.add(null);
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

  Sink get areInputsValidInput;

  add();

  setName(String name);

  setAddress(String address);

  setNationalId(String nId);

  setPhone(String phone);

  setGender(String gender);

  setBloodType(String bloodT);

  setStatus(String status);

  setDescription(String desc);

  setBirthDate(DateTime date);

  setDnaSeq(File file);
}

mixin PopulationViewModelOutput {
  Stream<bool> get nameOutput;

  Stream<bool> get addressOutput;

  Stream<bool> get nationalIdOutput;

  Stream<bool> get phoneOutput;

  Stream<bool> get genderOutput;

  Stream<bool> get bloodTypeOutput;

  Stream<bool> get statusOutput;

  Stream<String?> get statusErrorOutput;

  Stream<bool> get descriptionOutput;

  Stream<String?> get descriptionErrorOutput;

  Stream<DateTime> get birthDateOutput;

  Stream<File> get dnaSequenceOutput;

  Stream<bool> get areInputsValidOutput;
}