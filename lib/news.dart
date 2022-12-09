class NewsRepository{
  final List<News> news=[
      News(["Yeni Okul Dönemi Başladı!!","Öğrenci Klüp Seçmeleri."],
          ["Gün 1- Yeni öğrencilerle tanışma zamanı geldi.",
            "Gün 1- En çok seçilen klüp satranç kulübü oldu",
            "Gün 2-Yeni klüpler açılmak üzere"])
  ];

}

class News{
  List<String> newsSubtitle;
  List<String> newTitle;
  News(this.newTitle,this.newsSubtitle);
}