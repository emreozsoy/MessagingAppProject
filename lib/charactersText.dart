// ignore: file_names
class CharactersTextRepository{
  final List<CharactersText> charactersText=[
    /*
    -Önemli Bilgilendirmeler
    *Stringlerle çalışmak çok mantıklı değil, yine de daha kolay olduğunu kabul etmek lazım.
    *Olası "," "-" gibi  değişkenler
    i koymayı veya kaçırmamaya çalışmak en mantıklısı yoksa debug yapan bir sistemimiz yok.
    *Textleri 3 erli olması gerektiği şekilde ve en düzgün biçimde kullanıp, bırakmayı unutma.

     */

    //ilişki durumuna göre farklı yanıtlar verme?
    //mesaj durma yerini yaz
    //Karşı tarafın mesaj atmasını başlatan kod
    //Yeni mesaj geldiğini gösteren kod/açıklama/bildirim
    //2 günlük geçiş kodu
    //karakterimizi oluşturma ekranı ve bunu konuşmalara yansıtan kodlar

  CharactersText([
  "Aaa evet - daha önce tanışmamıştık sanırım - Ben Hinata ",
  "Ben sınıf başkanı Hinata Talichie, aynı zamanda okul temsilcisiyim de..",
  "Bir şeye ihtiyacın olursa söylemekten çekinme lütfen 🙋",

  "Benim adım - da -Deniz ,-bende, -memnun, -oldum",
  "Vaktimi belki- ayırabilirim senin için önemli bir konu mu?",
  "Bir kahveye - hayır demem",

  "Görüşmek üzere!!",
  "Bye byee!",
  "images/Musuem.png",

  "Orda görüşmek üzere!",
  "Orda görüşmek üzere!",
  "Orda görüşmek üzere!",

  "Orda görüşmek üzere!",
  "Orda görüşmek üzere!",
  "Orda görüşmek üzere!"

  ]),

    /* BOT2         */
    CharactersText([
      "Merhaba",
      "heyyy",
      "Tanışalım ben Deniz, seni daha önce gördüğümü sanmıyorum.",

      "Ben adım da Deniz, bende memnun oldum",
      "Vaktimi belki ayırabilirim senin için önemli bir konu mu?",
      "Bir kahveye hayır demem",

      "images/hand.png",
      "images/NoHandShake.png",
      "images/Musuem.png",

      "Orda görüşmek üzere!",
      "Orda görüşmek üzere!",
      "Orda görüşmek üzere!"

    ]),

    /*BOT3 Asano Akio */
    CharactersText([

      "Merhaba Dostuuum evet aynı sınıftayız",
      "Selam Bro! Hey seni sınıf listesinde görmüştüm",
      "Hey Ezik olan sensin dostum",

      "Merhaba Dostuuum evet aynı sınıftayız",
      "Selam Bro! Hey seni sınıf listesinde görmüştüm",
      "Hey Ezik olan sensin dostum",

      "Ben Asano Dostum, ben de memnun oldum 🤣",
      "Evet Dostum ben Asano ama bana *kızların gönlünü alan Asano* diyebilirsin 😀",
      "Adını bilmiyorum ancak ben Asano sınıfta herkes tanır 😆"

      "Konuşabileceğimiz bir sürü konu var. En son neler yaptın?",
      "Sence kim?",
      "Eh, senin gibi biri için ne bekleyebilirim ki? LOSER",

      "Vay be, çok meşgulsün hahaha Ben de okulda oldukça yoğunum Ayrıca hafta sonları basketbol oynuyorum, sen de basketbol oynar mısın?",
      "Hinata iyi bir öğrenci ama fazla sosyal, benim tercihim Akemi❣️olurdu. Senin favorin kim?",
      "Seni isteyen olduğunu da düşünmüyorum 👏"

      "Benim hobiler müzik, kitap ve yürüyüş… Senin en sevdiğin spor nedir?",
      "Asano, Hinata ve Akemi hepsi iyiler ama benim favorim sen olabilirsin. 😉 Şaka yapıyorum, aslında hala favorim Akemi",
      "Senin gibi eziklerle  zaman geçirmeyi sevmiyorum, hadi hoşçakal"

      " ",
      " ",
      " "

    ]),

    /*      BOT4    */
    CharactersText(["Ben de yenilikleri severim. Adım  ",
      "Selam, ben Karakter4.",
      "Sen karşılama komitesi misin? ne bu özgüven?",

      "Çok naziksiniz",
      "Böyle düşünmene üzüldüm",
      "Malesef sizle şuan konuşamam.."]),

    /*    BOT5     */
    CharactersText([
      "Ben de yenilikleri severim. Adım Karakter5 ",
      "Selam, ben Karakter5.",
      "Sen karşılama komitesi misin? ne bu özgüven?",

      "Çok naziksiniz",
      "Böyle düşünmene üzüldüm",
      "Malesef sizle şuan konuşamam.."]),



  ];

}
class CharactersText{
  //String characterName;
  List<String> text;

  CharactersText(this.text);
}