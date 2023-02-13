class CharactersTextRepository{
  final List<CharactersText> charactersText=[
  CharactersText([
  "Selam",
  "Selam, - biraz meşgulüm şuanda sen nasılsın?",
  "Tanışalım ben Deniz, seni daha önce gördüğümü sanmıyorum.",

  "Ben adım - da Deniz, bende memnun oldum",
  "Vaktimi belki- ayırabilirim senin için önemli bir konu mu?",
  "Bir - kahveye hayır demem",

  "Görüşmek üzere!!",
  "Bye byee!",
  "images/Musuem.png",

  "Orda görüşmek üzere!"
  ]),//BUNU PREFS ile kaydedip sonra for yerinde dönerken silmek lazım remove ile

    /* BOT2         */
    CharactersText([
      "Selam",
      "Selam, biraz meşgulüm şuanda sen nasılsın?",
      "Tanışalım ben Deniz, seni daha önce gördüğümü sanmıyorum.",

      "Ben adım da Deniz, bende memnun oldum",
      "Vaktimi belki ayırabilirim senin için önemli bir konu mu?",
      "Bir kahveye hayır demem",

      "Görüşmek üzere!!",
      "Bye byee!",
      "images/Musuem.png",

      "Orda görüşmek üzere!"
    ]),

    /*BOT3*/
    CharactersText(["Ben de yenilikleri severim. ","Selam, ben Karakter3",
      "Sen karşılama komitesi misin? ne bu özgüven?","Çok naziksiniz","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."]),

    /*      BOT4    */
    CharactersText(["Ben de yenilikleri severim. Adım  ","Selam, ben Karakter4.",
      "Sen karşılama komitesi misin? ne bu özgüven?","Çok naziksiniz","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."]),

    /*    BOT5     */
    CharactersText(["Ben de yenilikleri severim. Adım Karakter5 ","Selam, ben Karakter5.",
      "Sen karşılama komitesi misin? ne bu özgüven?","Çok naziksiniz","Böyle düşünmene üzüldüm","Malesef sizle şuan konuşamam.."]),

    /*  PLAYER -TextBot1        */
    CharactersText([
      " Merhaba!!",
      "Selamlar nasılsın",
      "Tanışabilir miyiz? Okulda görmüştüm seni",

      "Ben Karakter A, tanıştığıma memnun oldum",
      "Yoğunsan meşgul etmek istemem",
      "İstersen okulda kahve içebiliriz.",

      "Okulda umarım görüşebiliriz. ",
      "Sadece tanışmak istemiştim okulda görüşürüz!!",
      "Tamamdır byee",

      "----",
      "----",
      "----",

      "ListeBitti1","ListeBitti2", "ListeBitti3",

      " sa","dsa","dsa","sda"]),

    /*  PLAYER -TextBot2        */
    CharactersText([
      "Merhaba!!",
      "Selamlar nasılsın",
      "Tanışabilir miyiz? Okulda görmüştüm seni",

      "Ben Karakter A, tanıştığıma memnun oldum",
      "Yoğunsan meşgul etmek istemem",
      "İstersen okulda kahve içebiliriz.",

      "Okulda umarım görüşebiliriz. ",
      "Sadece tanışmak istemiştim okulda görüşürüz!!",
      "Kütüphanede afişinden haberin var mı? Orda kahve içebiliriz?",

      "Text Bitti",
      "Text Bitti",
      "Text Bitti",

      "ListeBitti1","ListeBitti2", "ListeBitti3",

      " sa","dsa","dsa","sda"])
  ];

}
class CharactersText{
  //String characterName;
  List<String> text;

  CharactersText(this.text);
}