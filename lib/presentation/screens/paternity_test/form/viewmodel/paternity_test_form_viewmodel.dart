import 'dart:async';
import 'dart:io';

import 'package:double_helix_detective_system/domain/models/models.dart';
import 'package:double_helix_detective_system/domain/usecase/paternity_test_usecase.dart';
import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:double_helix_detective_system/presentation/common/freezed_data_class.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../common/state_renderer/state_renderer.dart';
import '../../../../common/state_renderer/state_renderer_imp.dart';

class PaternityTestViewModel extends BaseViewModel
    with PaternityTestViewModelInputs, PaternityTestViewModelOutputs {
  StreamController<File> fileChildStreamController = BehaviorSubject();
  StreamController<File> fileFatherStreamController = BehaviorSubject();
  StreamController<void> areAllInputsValidStreamController = BehaviorSubject();
  StreamController isPaternityTestDoneSuccessfullyStreamController =
      BehaviorSubject<bool>();
  StreamController resultPaternityTestStreamController =
      BehaviorSubject<PaternityTest>();
  final PaternityTestUseCase _paternityTestUseCase;

  PaternityTestViewModel(this._paternityTestUseCase);

  var paternityTestObject =
      PaternityTestObject(fileChild: File(""), fileFather: File(""));

  @override
  void dispose() {
    fileChildStreamController.close();
    fileFatherStreamController.close();
    areAllInputsValidStreamController.close();
    isPaternityTestDoneSuccessfullyStreamController.close();
    resultPaternityTestStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  testPaternity() async{
    inputState.add(LoadingState(StateRendererType.popupLoadingState));
    (await _paternityTestUseCase.execute(PaternityTestUseCaseInput(
        fileChild: paternityTestObject.fileChild,
        fileFather: paternityTestObject.fileFather
    )))
        .fold(
            (failure) => {
          inputState.add(ErrorState(
              StateRendererType.popupErrorState, failure.message))
        }, (data) {
      inputState.add(ContentState());
      paternityTestInput.add(PaternityTest(prediction: data.prediction));
      isPaternityTestDoneSuccessfullyStreamController.add(true);
    });
  }


  // inputs
  @override
  Sink get areInputsValidInput => areAllInputsValidStreamController.sink;

  @override
  Sink get paternityTestInput =>
     resultPaternityTestStreamController.sink;

  @override
  Sink get fileChildInput => fileChildStreamController.sink;

  @override
  Sink get fileFatherInput => fileFatherStreamController.sink;

  @override
  Stream<bool> get areInputsValidOutput =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  @override
  Stream<PaternityTest> get paternityTestOutput =>
      resultPaternityTestStreamController.stream
          .map((paternityTest) => paternityTest);

  @override
  Stream<File> get fileChildOutput =>fileChildStreamController.stream.map((fileChild) => fileChild);

  @override
  Stream<File> get fileFatherOutput => fileFatherStreamController.stream.map((fileFather) => fileFather);

  @override
  setFileChild(File file) {
    fileChildInput.add(file);
    if (file.path.isNotEmpty) {
      paternityTestObject = paternityTestObject.copyWith(fileChild: file);
    } else {
      paternityTestObject = paternityTestObject.copyWith(fileChild: File(""));
    }
    validate();
  }

  @override
  setFileFather(File file) {
    fileFatherInput.add(file);
    if (file.path.isNotEmpty) {
      paternityTestObject = paternityTestObject.copyWith(fileFather: file);
    } else {
      paternityTestObject = paternityTestObject.copyWith(fileFather: File(""));
    }
    validate();
  }


  bool _areAllInputsValid() {
    return paternityTestObject.fileChild.path.isNotEmpty &&
        paternityTestObject.fileFather.path.isNotEmpty;
  }

  validate() {
    areInputsValidInput.add(null);
  }
}

mixin PaternityTestViewModelInputs {
  Sink get fileChildInput;

  Sink get fileFatherInput;

  Sink get areInputsValidInput;

  setFileChild(File file);

  setFileFather(File file);

  testPaternity();

  Sink get paternityTestInput;
}

mixin PaternityTestViewModelOutputs {
  Stream<File> get fileChildOutput;

  Stream<File> get fileFatherOutput;

  Stream<bool> get areInputsValidOutput;

  Stream<PaternityTest> get paternityTestOutput;
}
