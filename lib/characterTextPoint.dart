class CharactersPointRepository{
  final List<CharactersPoint> characterPoint = [
    // 1.Karakterin Cevaba Bağlı İlişki Puanı
    CharactersPoint([
      2,0,3
      ,-2,1,0
      ,1,2,-2

    ], 10),
    // 2.Karakterin Cevaba Bağlı İlişki Puanı
    CharactersPoint([0,1,2,3], 0),
    // 3.Karakterin Cevaba Bağlı İlişki Puanı
    CharactersPoint([0,1,2,3], 0),
    // 4.Karakterin Cevaba Bağlı İlişki Puanı
    CharactersPoint([0,1,2,3], 0),
    // 5.Karakterin Cevaba Bağlı İlişki Puanı
    CharactersPoint([0,1,2,3], 0),
  ];
}


class CharactersPoint{
  List<int> point;
  int sumPoint;
  CharactersPoint(this.point,this.sumPoint);
}