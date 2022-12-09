class CharactersTextRepository{
  final List<CharactersText> charactersText=[
    CharactersText([
      "Tanıştığımıza sevindim, ben okul başkanıyım. ",
      "Tanıştığımıza sevindim, ben okul başkanıyım. Sana biraz işleyişten bahsetsem iyi olur sanırım. Okul içerisinde gerekmedikçe birbirimizle diyalog kurmamız yasak. Bu yüzden herkes mesajlaşarak iletişim kurar. ",
      "Biraz asabisin sanırım, burada önemli olan iyi bir sosyal ağ kurabilmek. Herkes bu üslubu hoş karşılamayabilir 😊. Her neyse, ben okul başkanıyım. Okul içerisinde gerekmedikçe birbirimizle diyalog kurmamız yasak. Bu yüzden herkes mesajlaşarak iletişim kurar. ",

      ":D. Okul kurucuları hakkında böyle konuşmak fena değilmiş.",
      "Aynen öyle, gayet iyi genç padawan. Öğle yemeklerinde yalnız kalırsan bana katılabilirsin. Okulda başarılar.",
      "----------",

      "images/bot4.png",
      "Merhaba",
      "Konuşma burda bitiyor2.",
      "Konuşma burda bitiyor3.",

      "Konuşma burda bitiyor4.",
      "Konuşma burda bitiyor5.",
      "Konuşma burda bitiyor6.",

      "Bu yüzden herkes mesajlaşarak iletişim kurar.",
      "Sana biraz işleyişten bahsetsem iyi olur sanırım. Okul içerisinde gerekmedikçe birbirimizle diyalog kurmamız yasak.",


      "Öğle yemeklerinde yalnız kalmazsın umarım.",
      "Byee",
      "---",
    ],[0,1,2,3,4,5,6,7,8,9,10,11,0,0,3,3]),//BUNU PREFS ile kaydedip sonra for yerinde dönerken silmek lazım remove ile

    /* BOT2         */
    CharactersText(["Böyle konuşmaya devam edersen canından olursun","HAHAHAHAHA,.",
      "Sen karşılama komitesi misin? ne bu özgüven?","Merhaba Karakter2","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."],[0]),

    /*BOT3*/
    CharactersText(["Ben de yenilikleri severim. Adım cicikız ","Selam, ben Karakter3",
      "Sen karşılama komitesi misin? ne bu özgüven?","Çok naziksiniz","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."],[0]),

    /*      BOT4    */
    CharactersText(["Ben de yenilikleri severim. Adım cicikız ","Selam, ben Karakter4.",
      "Sen karşılama komitesi misin? ne bu özgüven?","Çok naziksiniz","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."],[0]),

    /*    BOT5     */
    CharactersText(["Ben de yenilikleri severim. Adım Karakter5 ","Selam, ben Karakter5.",
      "Sen karşılama komitesi misin? ne bu özgüven?","Çok naziksiniz","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."],[0]),

    /*  PLAYER        */
    CharactersText([""
        "Selamm, ben de yenilikleri severim! Hoş buldum,benim adım ... ","Selamlar, ben ...",
      "Sen karşılama komitesisin sanırım, ben ...",

      "Biraz saçma bir kural.Kim karar vermiş ki buna? ",
      "Sanırım derslere daha iyi odaklanmamız için böyle yapılmış, devam et lütfen. ",
      "------",

      "Biraz sert bir mizacım var, kırıcı olmak istememiştim kusura bakma. Okulda umarım görüşebiliriz. ",
      "Mutlaka uğrayacağım, teşekkür ederimm. Okulda görüşürüz :D ",
      "Yalnız kalıp kalmamamı neden umursayasın ki? Verdiğin bilgiler için teşekkürler, kendi başımın çaresine bakarım",

      "Deneme",
      "Deneme2",
      "Deneme3",

      "ListeBitti1","ListeBitti2", "ListeBitti3",

      " sa","dsa","dsa","sda"],[0]),
  ];

}
class CharactersText{
  //String characterName;
  List<String> text;
  List<int> numberMssg;
  CharactersText(this.text,this.numberMssg);
}