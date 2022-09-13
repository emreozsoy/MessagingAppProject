class CharactersRepository{
  final List<Characters> characters= [
    Characters("Karakter ", "B", 19, "Kız","images/bot1.png"),
    Characters("Ebru ", "Özsoy", 16,"Kız","images/bot2.png"),
    Characters("Erdem ", "Özsoy", 19, "Erkek","images/bot3.png"),
    Characters("Berat Can ", "Katanalp", 25, "Erkek","images/bot4.png"),
    Characters("Player ", "1", 25, "Erkek","images/bot1.png"),

  ];
}

class Characters {
  String name;
  String surname;
  int age;
  String gender; //false boy - true girl
  String circleAvatarImage;

  String nameWithSurname(){
    name=name;
    surname=surname;
    return name+surname;
  }

  Characters(this.name,this.surname,this.age,this.gender,this.circleAvatarImage);

}