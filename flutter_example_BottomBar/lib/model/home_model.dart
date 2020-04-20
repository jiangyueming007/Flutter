
int counter = 1;

class MovieItem {
  int rank;
  String imageURL;
  String title;
  String playDate;
  double rating;
  List<String> genres;
  List<Actor> casts;
  Director director;
  String originTitle;
  MovieItem.fromMap(Map<String,dynamic>json){
    this.rank = counter ++;
    this.imageURL = json["images"]["medium"];
    this.title = json["title"];
    this.rating = json["rating"]["average"];
    this.playDate = json["year"];
    this.originTitle = json["original_title"];
    this.genres = json["genres"].cast<String>();
    this.director = Director.fromMap(json["directors"][0]);
    this.casts = (json["casts"] as List).map((item){
      return Actor.fromMap(item);
    }).toList();
  }
}


class Person {
  String name;
  String avatarURL;
  Person.fromMap(Map<String,dynamic> json){
    this.name = json["name"];
    this.avatarURL = json["avatars"]["medium"];
  }
}

class Actor extends Person {
  Actor.fromMap(Map<String,dynamic > json) : super.fromMap(json);
}

class Director extends Person {
  Director.fromMap(Map<String, dynamic> json) : super.fromMap(json);

}


