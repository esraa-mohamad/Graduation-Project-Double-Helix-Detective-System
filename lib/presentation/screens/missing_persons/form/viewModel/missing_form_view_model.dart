import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';

class MissingFormViewModel extends BaseViewModel with
MissingFormViewModelInput ,
MissingFormViewModelOutput
{


  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  // TODO: implement inputDna
  Sink get inputDna => throw UnimplementedError();

  @override
  setMissingDna(String dna) {
    // TODO: implement setMissingDna
    throw UnimplementedError();
  }

  @override
  search() {
    // TODO: implement search
    throw UnimplementedError();
  }


  @override
  // TODO: implement outIsDnaValid
  Stream<bool> get outIsDnaValid => throw UnimplementedError();


}

mixin MissingFormViewModelInput {
  setMissingDna(String dna);
  search();

  Sink get inputDna;

}

mixin MissingFormViewModelOutput {

  Stream<bool> get outIsDnaValid;

}