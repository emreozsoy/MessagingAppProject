class CharactersTextRepository{
  final List<CharactersText> charactersText=[
    CharactersText([
      "Tanıştığımıza sevindim, ben okul başkanıyım. Sana biraz işleyişten bahsetsem iyi olur sanırım. Okul içerisinde gerekmedikçe birbirimizle diyalog kurmamız yasak. Bu yüzden herkes mesajlaşarak iletişim kurar.",
      "Tanıştığımıza sevindim, ben okul başkanıyım. Sana biraz işleyişten bahsetsem iyi olur sanırım. Okul içerisinde gerekmedikçe birbirimizle diyalog kurmamız yasak. Bu yüzden herkes mesajlaşarak iletişim kurar. ",
      "Biraz asabisin sanırım, burada önemli olan iyi bir sosyal ağ kurabilmek. Herkes bu üslubu hoş karşılamayabilir 😊. Her neyse, ben okul başkanıyım. Okul içerisinde gerekmedikçe birbirimizle diyalog kurmamız yasak. Bu yüzden herkes mesajlaşarak iletişim kurar. ",

      ":D. Okul kuruculara salak demek fena değilmiş. Umarım öğle yemeklerinde yalnız kalmazsın. Okulda başarılar. ",
      "Aynen öyle, gayet iyi genç padawan. Öğle yemeklerinde yalnız kalırsan bana katılabilirsin. Okulda başarılar.",
      "----------",

      "HAHA",
      "ok",
      "b",
      "a",
      "c",
      "d"
    ],"Bot"),

    /* BOT2         */
    CharactersText(["Böyle konuşmaya devam edersen canından olursun","HAHAHAHAHA,.",
      "Sen karşılama komitesi misin? ne bu özgüven?","Merhaba Karakter2","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."],"Bot"),

    /*BOT3*/
    CharactersText(["Ben de yenilikleri severim. Adım cicikız ","Selam, ben Karakter3",
      "Sen karşılama komitesi misin? ne bu özgüven?","Çok naziksiniz","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."],"Bot"),

    /*      BOT4    */
    CharactersText(["Ben de yenilikleri severim. Adım cicikız ","Selam, ben Karakter4.",
      "Sen karşılama komitesi misin? ne bu özgüven?","Çok naziksiniz","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."],"Bot"),

    /*    BOT5     */
    CharactersText(["Ben de yenilikleri severim. Adım Karakter5 ","Selam, ben Karakter5.",
      "Sen karşılama komitesi misin? ne bu özgüven?","Çok naziksiniz","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."],"Bot"),

    /*  PLAYER        */
    CharactersText([""
        "Selamm, ben de yenilikleri severim! Hoş buldum,benim adım ... ","Selamlar, ben ...",
      "Sen karşılama komitesisin sanırım, ben ...",

      "Biraz saçma bir kural. Hangi salak karar vermiş ki buna? ",
      "Sanırım derslere daha iyi odaklanmamız için böyle yapılmış, devam et lütfen. ",
      "------",

      "Biraz sert bir mizacım var, kırıcı olmak istememiştim kusura bakma. Okulda umarım görüşebiliriz. ",
      "Mutlaka uğrayacağım, teşekkür ederimm. Okulda görüşürüz :D ",
      "Yalnız kalıp kalmamamı neden umursayasın ki? Verdiğin bilgiler için teşekkürler, kendi başımın çaresine bakarım",

      "bye",
      "hayır",
      "nETDE",

      "DM","das ", " sad",

      " sa","dsa","dsa","sda"],"Player"),
  ];

}
class CharactersText{
  String characterName;
  List<String> text;
  CharactersText(this.text,this.characterName);
}