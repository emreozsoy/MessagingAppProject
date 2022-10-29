import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled/characters.dart';
import 'package:untitled/messages.dart';
import 'package:untitled/news.dart';
import 'package:untitled/screens/coversation_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/screens/profileScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //Icons.push_pin                       MaterialPageRoute(builder: (context) => ConversationPage()),
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Love Messenger'),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NewsRepository newsRepository = NewsRepository();
  CharactersRepository charactersRepository = CharactersRepository();
  MessagesRepository messagesRepository = MessagesRepository();
  SharedPreferences? prefs;
  static final AdRequest request = AdRequest(
    // keywords: <String>['foo', 'bar'],
    // contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );
  int maxFailedLoadAttempts = 3;
  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;
  int newDay = 1, newLenght = 0;
  int energy = 10;
  int? getEnergy;
  @override
  initState() {
    super.initState();
    _createRewardedAd();
    dayCounter();
    newLenght = newsLenght();
    equalData();
  }

  @override
  void dispose() {
    super.dispose();
    _rewardedAd?.dispose();
    saveData();
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() async {
      await prefs.setInt('energy', energy);
    });
  }

  void equalData() async {
    final prefs = await SharedPreferences.getInstance();

      energy = getEnergy ?? prefs.getInt('energy')!; // NULL VERİYO
      print("${prefs.getInt('energy')}, okey ${getEnergy}");
      print("okey");

  }

  void dayCounter() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('day') == 0 || prefs.getInt('day') == null) {
      await prefs.setInt("day", 1);
    }
    setState(() {
      newDay = 2;
    });
  }

  Future<String> subTitleTxt(int index) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('messages$index')!.last.length > 15) {
      return "${prefs.getStringList('messages$index')!.last.substring(0, 15)}...";
    } else {
      return prefs.getStringList('messages$index')?.last ?? "- - -";
    }
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
      setState(() {
        _createRewardedAd();
      });
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
      energy += 10;
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
    });
    _rewardedAd = null;
  }

  int newsLenght() {
    int count = 0;
    for (int i = 0; i < newsRepository.news[0].newsSubtitle.length; i++) {
      // ignore: unrelated_type_equality_checks
      if (int.parse(newsRepository.news[0].newsSubtitle[i].substring(4, 5)) <=
              newDay + 1 &&
          newDay < 10) {
        count++;
      }
      print("merhaba ${newsRepository.news[0].newsSubtitle[i].substring(4, 5)} ,$count");
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {



    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [


            SafeArea(
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  
                  ElevatedButton.icon(
                    onPressed: () {
                      _showRewardedAd();
                    },
                    label:Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Yenileme",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.bolt_sharp,
                      size: 40,
                      color: Colors.yellowAccent,
                    ),
                    
                  ),
                  Positioned(
                      height: 3.0,
                      right: 3.0,
                      child: Icon(
                        Icons.ads_click,
                        size: 20,
                      )),
                ],
              ),
            ),
          ],
          title: const Text('Love Messenger 💕'),
          bottom: const TabBar(
            indicatorColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: charactersRepository.characters.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 15,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () async {
                    final data = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ConversationPage(index);
                        },
                      ),
                    );
                    setState(
                      () {
                        getEnergy = data;
                        print(data);
                      },
                    );
                  },
                  leading: InkWell(
                    onTap: (){
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) {
                                return ProfileScreen(index);}),);
                      });
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(charactersRepository
                          .characters[index].circleAvatarImage),
                    ),
                  ),
                  trailing: Icon(Icons.push_pin),
                  title: Text(
                    charactersRepository.characters[index].nameWithSurname(),
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  subtitle: FutureBuilder(
                      future: subTitleTxt(index),
                      builder:
                          (BuildContext context, AsyncSnapshot<String> text) {
                        return Text(text.data ?? "- - -");
                      }),
                );
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PhysicalModel(
                  color: Colors.white30,
                  elevation: 8.0,
                  shadowColor: Colors.purpleAccent,
                  shape: BoxShape.circle,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white30,
                          radius: 50,
                          child: Text(
                            "Gün $newDay",
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.breeSerif(
                                color: Colors.black87, fontSize: 25),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        widthFactor: 0,
                        heightFactor: 0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 200,
                            height: 100,
                            child: Column(
                              children: [
                                Text("OKUL GAZETESİ",
                                    style: GoogleFonts.pacifico(fontSize: 20)),
                                Text(
                                    newsRepository.news[0].newTitle[newDay - 1],
                                    style: GoogleFonts.courgette(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: new DecorationImage(
                                image: new AssetImage("images/bg2.png"),
                                fit: BoxFit.cover,
                                opacity: 200)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: newLenght,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: Align(
                                          alignment: Alignment.center,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                color: Colors
                                                    .deepPurpleAccent.shade100,
                                              ),
                                              child: Text(
                                                newsRepository.news[0]
                                                    .newsSubtitle[index],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
