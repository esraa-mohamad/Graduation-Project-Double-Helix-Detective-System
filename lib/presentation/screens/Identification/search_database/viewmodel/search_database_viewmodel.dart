import 'dart:async';
import 'dart:io';
import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../domain/models/models.dart';
import '../../../../../domain/usecase/search_identification_usecase.dart';
import '../../../../common/freezed_data_class.dart';
import '../../../../common/state_renderer/state_renderer.dart';
import '../../../../common/state_renderer/state_renderer_imp.dart';
import '../../../../resource/strings_manager.dart';

class SearchDatabaseFormViewModel extends BaseViewModel
    with SearchDatabaseFormViewModelInputs, SearchDatabaseFormViewModelOutputs {
  StreamController<File> fileStreamController = BehaviorSubject();
  StreamController<String> statusStreamController = BehaviorSubject();
  StreamController<void> areAllInputsValidStreamController = BehaviorSubject();
  StreamController isIdentificationSearchSuccessfullyStreamController =
      BehaviorSubject<bool>();
  final StreamController<SearchMatchingInfo> _searchMatchingResultStreamController = BehaviorSubject();

  final SearchIdentificationUseCase _searchIdentificationUseCase;

  SearchDatabaseFormViewModel(this._searchIdentificationUseCase);

  var identificationSearchObject = SearchIdentificationObject(
    file: File(""),
    status: '',
  );

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    fileStreamController.close();
    statusStreamController.close();
    areAllInputsValidStreamController.close();
    isIdentificationSearchSuccessfullyStreamController.close();
    _searchMatchingResultStreamController.close();
  }

  @override
  setFile(File file) {
    fileInput.add(file);
    if (file.path.isNotEmpty) {
      identificationSearchObject =
          identificationSearchObject.copyWith(file: file);
    } else {
      identificationSearchObject =
          identificationSearchObject.copyWith(file: File(""));
    }
    validate();
  }

  @override
  setStatus(String status) {
    statusInput.add(status);
    if (status.isNotEmpty) {
      identificationSearchObject =
          identificationSearchObject.copyWith(status: status);
    } else {
      identificationSearchObject =
          identificationSearchObject.copyWith(status: "");
    }
    validate();
  }

  @override
  identificationSearch() async {
    inputState.add(LoadingState(StateRendererType.popupLoadingState));
    (await _searchIdentificationUseCase
            .execute(SearchIdentificationUseCaseInput(
      file: identificationSearchObject.file,
      status: identificationSearchObject.status,
    )))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      inputState.add(ContentState());
      searchMatchData.add(data);
      isIdentificationSearchSuccessfullyStreamController.add(true);
    });
  }

  // inputs
  @override
  Sink get areInputsValidInput => areAllInputsValidStreamController.sink;

  @override
  Sink get fileInput => fileStreamController.sink;

  @override
  Sink get statusInput => statusStreamController.sink;

  // outputs
  @override
  Stream<bool> get areInputsValidOutput =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  @override
  Stream<File> get fileOutput =>
      fileStreamController.stream.map((file) => file);

  @override
  Stream<bool> get statusOutput =>
      statusStreamController.stream.map((status) => _isValidStatus(status));

  @override
  Stream<String?> get statusErrorOutput => statusOutput
      .map((isValidStatus) => isValidStatus ? null : AppStrings.errorStatus);

  // search matching result
  @override
  Sink get searchMatchData => _searchMatchingResultStreamController.sink;

  @override
  Stream<SearchMatchingInfo> get searchMatchInfoOutput => _searchMatchingResultStreamController.stream.map((searchResult) => searchResult);

  validate() {
    areInputsValidInput.add(null);
  }

  _isValidStatus(String status) {
    return status.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return identificationSearchObject.file.path.isNotEmpty &&
        identificationSearchObject.status.isNotEmpty;
  }


}

mixin SearchDatabaseFormViewModelInputs {
  Sink get fileInput;

  Sink get statusInput;

  Sink get areInputsValidInput;

  setFile(File file);

  setStatus(String status);

  identificationSearch();

  Sink get searchMatchData ;
}

mixin SearchDatabaseFormViewModelOutputs {
  Stream<File> get fileOutput;

  Stream<bool> get statusOutput;

  Stream<String?> get statusErrorOutput;

  Stream<bool> get areInputsValidOutput;

  Stream<SearchMatchingInfo> get searchMatchInfoOutput ;
}
