class DayMechanicRepository{
  List<DayMechanic> dayMechanic = [
    DayMechanic([ //1.Karakterin Gün Sonu
      1,
      2,
      3,

      5,
      15,
    ],0), //0. Karakter için liste şeklindeki sayılardaki textPos'una geldiğinde günü 1 arttır.
    DayMechanic([ //2.Karakterin Gün Sonu
      15,

    ],1),
    DayMechanic([ //3.Karakterin Gün Sonu
      0,
      1,
      3,
      4,
      5,
    ],2),
    DayMechanic([ //4.Karakterin Gün Sonu
      0,
      1,
      3,
      4,
      5,
    ],3),
    DayMechanic([ //5.Karakterin Gün Sonu
      0,
      1,
      3,
      4,
      5,
    ],4),
  ];
}

class DayMechanic {
  late List<int> dayPoint;
  late int whichCharacter;

  DayMechanic(this.dayPoint,this.whichCharacter);
}