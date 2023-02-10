class MessagesRepository{
  final List<Messages> messages = [
    Messages(["Selam, okulumuza hoş geldin.","Ben Benedict. Yenileri severiz 😊",]
        ,["Bot","Bot"]),
    /* BOT2 CHAT */
    Messages([""],[""]),
    /* BOT3 CHAT */

    Messages(["Hayır","Ben","Cidden mi???"],["Bot"]),
    /* BOT4 CHAT */

    Messages(["Kes kopke","Okula hoşgeldin yeni kız ","Tamamdır."],["Bot"]),
    /* BOT5 CHAT */

    Messages(["Merhaba","Ben","Okulda görüşürüz"],["Bot","Bot"]),


  ];
}
class Messages {
  List<String> msg;
  List<String> user;
  Messages(this.msg,this.user,);
}
