class SliderObject{
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject{
  int numOfSlides;
  int currentIndex;
  SliderObject sliderObject;
  SliderViewObject(this.sliderObject,this.currentIndex,this.numOfSlides);
}