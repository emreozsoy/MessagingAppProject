import 'dart:async';
import 'dart:io' show Platform;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:untitled/characterTextPoint.dart';
import 'package:untitled/characters.dart';
import 'package:untitled/charactersText.dart';
import 'package:untitled/messages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled/screens/profileScreen.dart';
const int maxFailedLoadAttempts = 3;

class ConversationPage extends StatefulWidget {

  final index;
  const ConversationPage(this.index, {Key? key}) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();

}

class _ConversationPageState extends State<ConversationPage>
    with SingleTickerProviderStateMixin {

  static final AdRequest request = AdRequest(
    // keywords: <String>['foo', 'bar'],
    // contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;


  int? percentage = 0; //kullanıcıdan kullanıcıya değişicek kısım
  AnimationController? _animationController;
  late SharedPreferences prefs;
  int firstEntry = 0;
  int? relationPoint;
  int energy=10;


  CharactersRepository charactersRepository = CharactersRepository();
  CharactersTextRepository charactersTextRepository =
  CharactersTextRepository();
  MessagesRepository messagesRepository = MessagesRepository();
  ScrollController _scrollController = ScrollController();
  CharactersPointRepository charactersPointRepository =
  CharactersPointRepository();

  final typing = ["Yazıyor.", "Yazıyor..", "Yazıyor...", "Yazıyor...."];
  int type = 0;
  bool _isButtonDisabled = false;
  int textPos = 0;
  double per = 0;
  double perStatic = 0;

  @override
  initState() {
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    dataHandle();
    goodAnswr();
    _createRewardedAd();
    scrollMssg();
  }

  Future<void> dataHandle() async { // her sayfaya bir kere girildiği için dğeiştirilmeli first time
    prefs =  await SharedPreferences.getInstance();
    if (checkFirstOpen()){
      saveData();
    }
    else
    {
      equalData();
    }
  }
  Future<void> scrollMssg() async {

    await Future.delayed(Duration(milliseconds:100));
    print("BAKBAKİM");
    _scrollController.jumpTo(_scrollController
        .position.maxScrollExtent);
  }


  @override
  void dispose() {
    _animationController?.dispose();
    _scrollController.dispose();
    saveData();
    super.dispose();
    _rewardedAd?.dispose();

  }

  void goodAnswr() {
    _animationController?.repeat();
    _animationController?.addListener(() => setState(() {}));
    setState(() {
      //_animationController!.value = 0.0;
    });
  }

  void badAnswr() async {
    setState(() {
      _animationController!.value = 0.0;
    });
    await Future.delayed(Duration(seconds: 1));
    _animationController?.repeat();
    _animationController?.addListener(() => setState(() {}));
  }

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5224354917'
            : 'ca-app-pub-3940256099942544/1712485313',
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      _createRewardedAd();
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
        });
    _rewardedAd = null;
  }
  @override
  Widget build(BuildContext context) {

    relationPoint =
        charactersPointRepository.characterPoint[widget.index].sumPoint;

    if (relationPoint! <= _animationController!.value * 100) {
      _animationController?.stop();
    }

    percentage = (_animationController!.value * 100).toInt();
    if (percentage! < 0) {
      percentage = 0;
    }
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: ()async{
              final prefs = await SharedPreferences.getInstance();
              setState((){
                Navigator.pop(context,prefs.getInt('energy'));
              },);
            },
          ),

          backgroundColor: Colors.lightGreen,
          titleSpacing: -5,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [

              InkWell(
                onTap: (){
                    Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) {
                    return ProfileScreen(widget.index);}),);

                },
                child: CircleAvatar(
                    backgroundImage: AssetImage(charactersRepository
                        .characters[widget.index]
                        .circleAvatarImage) //ImageProvider("images/bot1"),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) {
                            return ConversationPage(widget.index);}),);                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    _isButtonDisabled
                        ? typing[type]
                        : charactersRepository.characters[widget.index]
                        .nameWithSurname(),
                    style: TextStyle(fontSize: 20),
                  ), //font ayarla
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: LiquidCustomProgressIndicator(
                    value: _animationController!.value,
                    direction: Axis.vertical,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                    shapePath: _buildHeartPath(),
                    center: Text(
                      "${percentage!.toStringAsFixed(0)}%",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),

              ),
            ],
          ),
          actions: [
            Align(
              alignment: Alignment.center,
                child: Text("$energy", style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),)),
            IconButton(onPressed: () {
              setState(() {
                _showRewardedAd();
              });
            }, icon: const Icon(Icons.bolt_sharp,size: 40,color: Colors.yellowAccent,))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/bg.png"),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount:
                  messagesRepository.messages[widget.index].msg.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    /* _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      curve: Curves.ease,
                      duration: const Duration(seconds: 100),
                    );    */
                    return ListTile(
                      title: Align(
                          alignment: messagesRepository
                              .messages[widget.index].user[index] !=
                              "Bot"  //messagesRepository.messages[widget.index].msg.last.endsWith(" ")
                              ? Alignment.centerRight
                              : Alignment.centerLeft,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: messagesRepository
                                    .messages[widget.index]
                                    .user[index] !=
                                    "Bot"
                                    ? Colors.lightGreen
                                    : Colors.deepPurpleAccent.shade100,

                              ),

                              child: Text(
                                messagesRepository
                                    .messages[widget.index].msg[index],
                                style: TextStyle(color: Colors.white),

                              ),

                            ),
                          )
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 200,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(203, 189, 184, 184),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(25),
                              right: Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_isButtonDisabled) {
                                    return null;
                                  } else {
                                    _isButtonDisabled = true;
                                    setState(() {
                                      playerResponse();
                                      botResponse();
                                    });
                                    _scrollController.jumpTo(_scrollController
                                        .position.maxScrollExtent);
                                  }
                                  charactersPointRepository
                                      .characterPoint[widget.index]
                                      .sumPoint +=
                                  charactersPointRepository
                                      .characterPoint[widget.index]
                                      .point[textPos];
                                  if (charactersPointRepository
                                      .characterPoint[widget.index]
                                      .point[textPos] >=
                                      0) {
                                    goodAnswr();
                                  } else {
                                    badAnswr();
                                  }
                                  energy-=1;

                                },
                                child: _isButtonDisabled
                                    ? Text("......")
                                    : Text(
                                  charactersTextRepository
                                      .charactersText[5].text
                                      .elementAt(textPos),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_isButtonDisabled) {
                                    return null;
                                  } else {
                                    _isButtonDisabled = true;
                                    setState(() {
                                      playerResponse();
                                      botResponse();
                                    });
                                    _scrollController.jumpTo(_scrollController
                                        .position.maxScrollExtent);
                                  }
                                  charactersPointRepository
                                      .characterPoint[widget.index]
                                      .sumPoint +=
                                  charactersPointRepository
                                      .characterPoint[widget.index]
                                      .point[textPos + 1];
                                  if (charactersPointRepository
                                      .characterPoint[widget.index]
                                      .point[textPos + 1] >=
                                      0) {
                                    goodAnswr();
                                  } else {
                                    badAnswr();
                                  }
                                  energy-=1;

                                },
                                child: _isButtonDisabled
                                    ? Text("......")
                                    : Text(
                                  charactersTextRepository
                                      .charactersText[5].text
                                      .elementAt(textPos + 1),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_isButtonDisabled) {
                                    return null;
                                  } else {
                                    _isButtonDisabled = true;
                                    setState(() {
                                      playerResponse();
                                      botResponse();
                                    });
                                    _scrollController.jumpTo(_scrollController
                                        .position.maxScrollExtent);
                                  }
                                  charactersPointRepository
                                      .characterPoint[widget.index]
                                      .sumPoint +=
                                  charactersPointRepository
                                      .characterPoint[widget.index]
                                      .point[textPos + 2];
                                  if (charactersPointRepository
                                      .characterPoint[widget.index]
                                      .point[textPos + 2] >=
                                      0) {
                                    goodAnswr();
                                  } else {
                                    badAnswr();
                                  }
                                  energy-=1;

                                },
                                child: _isButtonDisabled
                                    ? Text("......")
                                    : Text(
                                  charactersTextRepository
                                      .charactersText[5].text
                                      .elementAt(textPos + 2),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));

  }

  String Typing() {
    final type = ["Yazıyor.", "Yazıyor..", "Yazıyor...", "Yazıyor...."];
    for (int i = 0; i < 4; i++) {
      return type[i];
    }
    return type[3];
  }

  void playerResponse() {
    setState(() {
      type = 3;
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      messagesRepository.messages[widget.index].msg.add(
          charactersTextRepository.charactersText[5].text.elementAt(textPos));
      messagesRepository.messages[widget.index].user.add("Player");
    });
  }

  int random(min, max) {
    return min + Random().nextInt(max - min);
  }

  Future<void> botResponse() async {
    int answerCounter=0,firstMsg=0;
    final whichPoint = <int>[];
    print(textPos);

    for (int i =0; i< charactersTextRepository.charactersText[widget.index].numberMssg.length;i++) {
      if (charactersTextRepository.charactersText[widget.index].numberMssg[i] == textPos) {
        answerCounter++;
        whichPoint.add(i);
        print(" Item === ${charactersTextRepository.charactersText[widget.index].numberMssg[i]}");
      }

      /*if(answerCounter>1){
        whichPoint.add()[0]=item;
        whichPoint[answerCounter]=item;
        print("Bende ${item}");
      }*/
    }
    print(" GrowableList= ${whichPoint}");
   // print("AnsweCounter= ${answerCounter}");
    while(answerCounter>0) {
      setState(() {
        type = 1;
        messagesRepository.messages[widget.index].user.add("Bot");
        print(textPos);
      });
      await Future.delayed(Duration(seconds: random(1,2)));
      setState(() {
        type = 2;
        print("AnsweCounter= ${answerCounter}");


        if(firstMsg==0){
          firstMsg++;
          messagesRepository.messages[widget.index].msg.add(
              charactersTextRepository
                  .charactersText[widget.index].text
                  .elementAt(textPos));
        }
        else{
          messagesRepository.messages[widget.index].msg.add(
              charactersTextRepository
                  .charactersText[widget.index].text
                  .elementAt(whichPoint[answerCounter]));

        }
        answerCounter--;
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 300),
        );
      });
      await Future.delayed(Duration(seconds: random(1,2)));
      setState(() {
        type = 3;
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 300),
        );
      });
    }
    setState(() {
      whichPoint.removeRange(0, whichPoint.length);
      _isButtonDisabled = false;
      textPos = textPos + 3;
    });
  }

  void equalData() async {
    final prefs = await SharedPreferences.getInstance();
    //await Future.delayed(Duration(seconds: random(4, 7)));
    setState(() {
         textPos = prefs.getInt('textPos${widget.index}') ?? 0;
        messagesRepository.messages[widget.index].msg= prefs.getStringList('messages${widget.index}')!;//Giving null
        messagesRepository.messages[widget.index].user= prefs.getStringList("mssgSend${widget.index}")!;
        charactersPointRepository.characterPoint[widget.index].sumPoint = prefs.getInt('prefSum${widget.index}')!;
        energy = prefs.getInt('energy') ?? 10;
        print(prefs.getInt('energy'));
    });
  }
  void saveData() async {
    final prefs = await SharedPreferences.getInstance();

          await prefs.setInt('textPos${widget.index}', textPos);
          await prefs.setStringList('messages${widget.index}',messagesRepository.messages[widget.index].msg);
          await prefs.setStringList("mssgSend${widget.index}", messagesRepository.messages[widget.index].user);
          await prefs.setInt('prefSum${widget.index}',charactersPointRepository.characterPoint[widget.index].sumPoint );
          await prefs.setInt('energy',energy);

  }
  Path _buildHeartPath() {
    double x=2.4;
    return Path()
      ..moveTo(55 / x, 15 / x)
      ..cubicTo(55 / x, 12 / x, 50 / x, 0, 30 / x, 0)..cubicTo(
          0, 0, 0, 37.5 / x, 0, 37.5 / x)..cubicTo(
          0, 55 / x, 20 / x, 77 / x, 55 / x, 95 / x)..cubicTo(
          90 / x, 77 / x, 110 / x, 55 / x, 110 / x, 37.5 / x)..cubicTo(
          110 / x, 37.5 / x, 110 / x, 0, 80 / x, 0)..cubicTo(
          65 / x, 0, 55 / x, 12 / x, 55 / x, 15 / x)
      ..close();
  }
  bool checkFirstOpen(){
        if(prefs.getInt('FirstTime${widget.index}') ==0){
          prefs.setInt("FirstTime${widget.index}')", 1);
          setState(() {
            prefs.setInt('energy', 10);
          });
          return true;
        }
        else{return false;}
  }

}



