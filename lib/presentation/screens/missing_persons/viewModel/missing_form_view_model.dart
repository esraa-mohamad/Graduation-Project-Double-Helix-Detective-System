import 'dart:async';
import 'dart:io';

import 'package:double_helix_detective_system/domain/usecase/missing_usecase.dart';
import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:double_helix_detective_system/presentation/common/freezed_data_class.dart';
import 'package:double_helix_detective_system/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../domain/models/models.dart';
import '../../../common/state_renderer/state_renderer.dart';

class MissingSearchViewModel extends BaseViewModel with
MissingSearchViewModelInput ,
    MissingSearchViewModelOutput
{

  StreamController<File> fileStreamController = BehaviorSubject();
  StreamController<void> areAllInputsValidStreamController = BehaviorSubject();
  StreamController isSearchMissingSuccessfullyStreamController = BehaviorSubject<bool>();
  StreamController<AllMissingSearchResult> resultAllMissingPersonStreamController = BehaviorSubject();
  StreamController<List<MissingRelativeInfo>> resultMissingRelativeStreamController = BehaviorSubject();
  final MissingSearchUseCase _missingSearchUseCase;
  MissingSearchViewModel(this._missingSearchUseCase);

  var missingObject = MissingSearchObject(file: File(""));

  @override
  void dispose() {
    super.dispose();
    fileStreamController.close();
    areAllInputsValidStreamController.close();
    isSearchMissingSuccessfullyStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  missingSearch() async{
    inputState.add(LoadingState(StateRendererType.popupLoadingState));
    (await _missingSearchUseCase.execute(MissingSearchUseCaseInput(
    file: missingObject.file,
    ))).fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      inputState.add(ContentState());
      allMissingSearchResultInput.add(data);
      allMissingRelativeInput.add(data.missingRelativeInfo);
      isSearchMissingSuccessfullyStreamController.add(true);
    });
  }

  void clearData() {
    missingObject = MissingSearchObject(file: File(""));

    // Clear the streams
    fileInput.add(File(""));
    areAllInputsValidStreamController.add(null);
    isSearchMissingSuccessfullyStreamController.add(false);
    resultAllMissingPersonStreamController.add(AllMissingSearchResult(
        missingPersonInfo: MissingPersonInfo(
            name: '',
            address: '',
            phone: '',
            nationalId: '',
            gender: '',
            bloodType: '',
            birthDate: '',
            status: '',
            description: '',
            matchStatus: '',
            similarity: 0),
        missingRelativeInfo: []));
    resultMissingRelativeStreamController.add(<MissingRelativeInfo>[]);

    // Reset the state to ContentState
    inputState.add(ContentState());
  }

  @override
  setFile(File file) {
    fileInput.add(file);
    if (file.path.isNotEmpty) {
      missingObject = missingObject.copyWith(file: file);
    } else {
      missingObject = missingObject.copyWith(file: File(""));
    }
    validate();
  }

  @override

  Sink get areAllInputValid => areAllInputsValidStreamController.sink;

  @override
  Sink get fileInput => fileStreamController.sink;


  @override
  Stream<bool> get allOutputValid => areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  @override
  Stream<File> get fileOutput => fileStreamController.stream.map((file) => file);

  bool _areAllInputsValid() {
    return missingObject.file.path.isNotEmpty;
  }

  validate() {
    areAllInputValid.add(null);
  }

  // results
  @override
  Sink get allMissingSearchResultInput => resultAllMissingPersonStreamController.sink;

  @override
  Stream<AllMissingSearchResult> get allMissingSearchResultOutput => resultAllMissingPersonStreamController.stream.
  map((missingPerson) => missingPerson);

  @override
  Sink get allMissingRelativeInput => resultMissingRelativeStreamController.sink;

  @override
  Stream<List<MissingRelativeInfo>> get missingRelativeOutput => resultMissingRelativeStreamController.stream.map((missingRelative) => missingRelative);


}

mixin MissingSearchViewModelInput {

  Sink get fileInput ;
  Sink get areAllInputValid ;
  missingSearch();
  setFile(File file);

  Sink get allMissingSearchResultInput ;
  Sink get allMissingRelativeInput ;

}

mixin MissingSearchViewModelOutput {

  Stream<File> get  fileOutput ;
  Stream<bool> get allOutputValid ;

  Stream<AllMissingSearchResult>  get allMissingSearchResultOutput ;
  Stream<List<MissingRelativeInfo>> get missingRelativeOutput ;
}