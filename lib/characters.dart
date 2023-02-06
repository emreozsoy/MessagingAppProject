class CharactersRepository{
  final List<Characters> characters= [
    // K => Kadın - E => Erkek
    Characters("Karakter ", "A", 19, "K","images/bot1.png"),
    Characters("Deniz ", "Şahin", 16,"K","images/bot2.png"),
    Characters("Erdem ", "Demirci", 19, "E","images/bot3.png"),
    Characters("Berat Can ", "Katanalp", 25, "E","images/bot4.png"),
    Characters("Player ", "PlayerSurname", 25, "E","images/bot1.png"),
  ];
}

class Characters {
  String name;
  String surname;
  int age;
  String gender;
  String circleAvatarImage;

  String nameWithSurname(){
    name=name;
    surname=surname;
    return name+surname;
  }

  Characters(this.name,this.surname,this.age,this.gender,this.circleAvatarImage);
}