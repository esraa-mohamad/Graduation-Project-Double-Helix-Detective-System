import 'dart:async';

import 'package:double_helix_detective_system/presentation/screens/base/base_view_model.dart';

import '../../../../domain/models/models.dart';
import '../../../resource/assets_manager.dart';
import '../../../resource/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controller outputs =(stream + sink)
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list ;
  int _currentIndex = 0;
  // onBoarding viewModel Inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list=_getSliderData();
    _postToView();
  }

  @override
  int goNext() {
    int nextIndex=++_currentIndex ;
    if(nextIndex==_list.length){
      nextIndex=0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex=--_currentIndex;
    if(previousIndex==-1){
      previousIndex=_list.length-1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex=index;
    _postToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // onBoarding viewModel Outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((SliderViewObject) => SliderViewObject);

//  onBoarding private functions
  void _postToView(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex],_currentIndex,_list.length));
  }
  List<SliderObject> _getSliderData() =>
      [
        SliderObject(AppStrings.identificationCrime, AppStrings.identificationCrimeSub,
            AssetsManager.identificationCrime2),
        SliderObject(AppStrings.identificationDisaster, AppStrings.identificationDisasterSub,
            AssetsManager.identificationDisaster),
        SliderObject(AppStrings.missing, AppStrings.missingSub,
            AssetsManager.missing),
        SliderObject(AppStrings.paternity, AppStrings.paternitySub,
            AssetsManager.paternity),
      ];
}


mixin OnBoardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);

  // stream controller input
  Sink get inputSliderViewObject;
}
mixin OnBoardingViewModelOutputs {
// stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
