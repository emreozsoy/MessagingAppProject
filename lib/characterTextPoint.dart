class CharactersPointRepository{
  final List<CharactersPoint> characterPoint = [
    CharactersPoint([
      2,0,-1
      ,-2,1,0
      ,1,2,-2

    ], 10),
    CharactersPoint([0,1,2,3], 0),
    CharactersPoint([0,1,2,3], 0),
    CharactersPoint([0,1,2,3], 0),
    CharactersPoint([0,1,2,3], 0),
  ];
}


class CharactersPoint{
  List<int> point;
  int sumPoint;
  CharactersPoint(this.point,this.sumPoint);
}