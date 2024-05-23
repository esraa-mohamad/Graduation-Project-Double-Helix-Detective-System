import 'dart:async';
import 'dart:io';

import 'package:double_helix_detective_system/domain/models/models.dart';
import 'package:double_helix_detective_system/domain/usecase/compare_dna_usecase.dart';
import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:double_helix_detective_system/presentation/common/freezed_data_class.dart';
import 'package:double_helix_detective_system/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../common/state_renderer/state_renderer.dart';


class CompareDnaViewModel extends BaseViewModel with CompareDnaViewModelInputs,CompareDnaViewModelOutputs {


  StreamController<File> fileAStreamController = BehaviorSubject();
  StreamController<File> fileBStreamController = BehaviorSubject();
  StreamController<void> areAllInputsValidStreamController = BehaviorSubject();
  StreamController isComparedDnaSuccessfullyStreamController = BehaviorSubject<bool>();
  StreamController resultCompareDnaStreamController = BehaviorSubject<CompareDna>();

  final CompareDnaUseCase _compareDnaUseCase;
  CompareDnaViewModel(this._compareDnaUseCase);


  var compareDnaObject = CompareDnaObject(
      fileA: File(""),
      fileB: File("")
  );

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    super.dispose();
    fileAStreamController.close();
    fileBStreamController.close();
    areAllInputsValidStreamController.close();
    isComparedDnaSuccessfullyStreamController.close();
    resultCompareDnaStreamController.close();
  }

  @override
  compareDna() async {
    inputState.add(LoadingState(StateRendererType.popupLoadingState));
    (await _compareDnaUseCase.execute(CompareDnaUseCaseInput(
    fileA: compareDnaObject.fileA,
      fileB: compareDnaObject.fileB
    )))
        .fold(
    (failure) => {
    inputState.add(ErrorState(
    StateRendererType.popupErrorState, failure.message))
    }, (data) {
    inputState.add(ContentState());
    compareDnaInput.add(CompareDna(match: data.match, similarity: data.similarity));
    isComparedDnaSuccessfullyStreamController.add(true);
    });
  }

  @override
  setFileA(File file) {
    fileAInput.add(file);
    if (file.path.isNotEmpty) {
      compareDnaObject = compareDnaObject.copyWith(fileA: file);
    } else {
      compareDnaObject = compareDnaObject.copyWith(fileA: File(""));
    }
    validate();
  }

  @override
  setFileB(File file) {
    fileBInput.add(file);
    if (file.path.isNotEmpty) {
      compareDnaObject = compareDnaObject.copyWith(fileB: file);
    } else {
      compareDnaObject = compareDnaObject.copyWith(fileB: File(""));
    }
    validate();
  }


  // inputs
  @override
  Sink get areInputsValidInput => areAllInputsValidStreamController.sink;

  @override
  Sink get fileAInput => fileAStreamController.sink;

  @override
  Sink get fileBInput => fileBStreamController.sink;


  // outputs
  @override
  Stream<bool> get areInputsValidOutput => areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  @override
  Stream<File> get fileAOutput => fileAStreamController.stream.map((fileA) => fileA);

  @override
  Stream<File> get fileBOutput => fileBStreamController.stream.map((fileB) => fileB);


  bool _areAllInputsValid() {
    return compareDnaObject.fileA.path.isNotEmpty && compareDnaObject.fileB.path.isNotEmpty;
  }

  validate() {
    areInputsValidInput.add(null);
  }

  @override
  Sink get compareDnaInput => resultCompareDnaStreamController.sink;

  @override
  Stream<CompareDna> get compareDnaOutput => resultCompareDnaStreamController.stream.map((compareDna) => compareDna);

}

mixin CompareDnaViewModelInputs{

  Sink get fileAInput ;
  Sink get fileBInput ;
  Sink get areInputsValidInput;
  setFileA(File file);
  setFileB(File file);
  compareDna();

 // Sink get compareDnaMatchInput;
  Sink get compareDnaInput;
  //Sink get compareDnaSimilarityInput;

}

mixin CompareDnaViewModelOutputs{

  Stream<File> get fileAOutput;
  Stream<File> get fileBOutput;
  Stream<bool> get areInputsValidOutput;
  //Stream<String> get compareDnaMatchOutPut;
  Stream<CompareDna> get compareDnaOutput;
 // Stream<int> get compareDnaSimilarityOutPut;


}