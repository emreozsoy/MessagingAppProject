class MessagesRepository{
  final List<Messages> messages = [
    Messages(["Selam, okulumuza hoş geldin.","Ben Benedict. Yenileri severiz 😊",]
        ,["Bot","Bot"]),
    /* BOT2 CHAT */
    Messages(["Emre"],["Bot"]),
    /* BOT3 CHAT */

    Messages(["Hey, Hey!! Naber, Dostum nasılsın?"],["Bot"]),
    /* BOT4 CHAT */

    Messages(["Kes kopke"],["Bot"]),
    /* BOT5 CHAT */

    Messages(["Merhaba","Ben"],["Bot","Bot"]),


  ];
}
class Messages {
  List<String> msg;
  List<String> user;
  Messages(this.msg,this.user,);
}
