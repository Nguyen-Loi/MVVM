import 'dart:async';

import 'package:advance_flutter/domain/model.dart';
import 'package:advance_flutter/presentation/base/base_view_model.dart';
import 'package:advance_flutter/presentation/resources/assets_manager.dart';
import 'package:advance_flutter/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //Stream controller
  final StreamController _streamController =
      StreamController<SlideViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    //Send this slider data to our view
    _postDataToView();
  }

  @override
  void OnPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++; // when over the limit
    if (nextIndex == _list.length) {
      _currentIndex = 0; //Loop to start
    }
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--; //-1 when over the limit
    if (previousIndex == -1) {
      _currentIndex = _list.length - 1; //Loop to start
    }
    return _currentIndex;
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  //Outputs
  @override
  // TODO: implement outputSliderViewObject
  Stream<SlideViewObject> get outputSliderViewObject =>
      _streamController.stream.map((SlideViewObject) => SlideViewObject);

  //privates functions
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
      ];

  _postDataToView() {
    inputSliderViewObject.add(SlideViewObject(
        sliderObject: _list[_currentIndex],
        numOfSlides: _list.length,
        currentIndex: _currentIndex));
  }
}

//Input mean the orders that our view model will recieve from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); //When user clicks on right arrow or swipe left;
  void goPrevious(); //When user clicks on ledt arrow or swipe right;
  void OnPageChanged(int index);

  Sink
      get inputSliderViewObject; // this is the way to add data to the stream ... stream input
}

//Output mean data or results that will be sent from outr view model to our view
abstract class OnBoardingViewModelOutputs {
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SlideViewObject({
    required this.sliderObject,
    required this.numOfSlides,
    required this.currentIndex,
  });
}
