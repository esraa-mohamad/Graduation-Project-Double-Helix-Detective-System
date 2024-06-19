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
  String  expiresIn;
  Technical ? technical ;

  Authentication(this.technical , this.token , this.expiresIn);
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

class CompareDna{
  String match;
  int similarity;
  CompareDna({
    required this.match,
    required this.similarity
});
}

class PersonInfo  {
  String name ;
  String address ;
  String phone ;
  String nationalId ;
  String gender ;
  String bloodType ;
  DateTime birthDate ;
  String status ;
  String description;

  PersonInfo({
    required this.name ,
    required this.address ,
    required this.phone ,
    required this.nationalId ,
    required this.gender ,
    required this.bloodType ,
    required this.birthDate ,
    required this.status ,
    required this.description
});
}

class SearchMatchingInfo {
  PersonInfo ? personInfo ;
  String match;
  int similarity;

  SearchMatchingInfo({
    required this.personInfo ,
    required this.match ,
    required this.similarity
});
}

class MissingPersonInfo{
  String name ;
  String address ;
  String phone ;
  String nationalId ;
  String gender ;
  String bloodType ;
  DateTime birthDate ;
  String status ;
  String description;
  String matchStatus;
  int similarity;

  MissingPersonInfo({
    required this.name ,
    required this.address ,
    required this.phone ,
    required this.nationalId ,
    required this.gender ,
    required this.bloodType ,
    required this.birthDate ,
    required this.status ,
    required this.description,
    required this.matchStatus,
    required this.similarity
  });
}

class MissingRelativeInfo{
  PersonInfo ? personInfo;
  MissingRelativeInfo({
    required this.personInfo
});
}

class AllMissingSearchResult{
  MissingPersonInfo ? missingPersonInfo;
  List<MissingRelativeInfo> ? missingRelativeInfo;
  AllMissingSearchResult({required this.missingPersonInfo,required this.missingRelativeInfo});
}

class PaternityTest{
  String prediction;
  PaternityTest({
    required this.prediction,
  });
}