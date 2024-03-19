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

class Technical {
  String userName ;
  String phone ;

  Technical(this.userName , this.phone);
}

class Authentication {
  String  token;
  Technical ? technical ;

  Authentication(this.technical , this.token);
}

class Population {
  String name ;
  String nationalId ;
  String address ;
  String status ;

  Population({
    required this.name ,
    required this.address ,
    required this.nationalId ,
    required this.status,
  });
}

class AddPopulation {
  Population ? population ;

  AddPopulation(this.population);
}