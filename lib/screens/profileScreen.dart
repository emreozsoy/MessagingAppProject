import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../characters.dart';

class ProfileScreen extends StatefulWidget {
  final index;
  const ProfileScreen(this.index,{Key? key}) : super(key: key);

  @override

  State<ProfileScreen> createState() => _ProfileScreen();



}



class _ProfileScreen extends State<ProfileScreen> {

  ScrollController _scrollController = ScrollController();
  CharactersRepository charactersRepository = CharactersRepository();

  @override
  initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emre Özsoy"),
        actions: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: InkWell(
              onTap: (){
                //Settings Button
              },
              child: Icon(Icons.settings_suggest_outlined),
            ),
          )
        ],

      ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [

         InkWell(
           onTap: (){
             setState(() {
               // fullScreenImage();
             });
           },
           child: Padding(
             padding: EdgeInsets.only(top: 20),
             child: CircleAvatar(
               maxRadius: 75,
               backgroundImage:AssetImage(charactersRepository
                   .characters[widget.index].circleAvatarImage) ,
               backgroundColor: Colors.white,
             ),
           ),
         ),


       ],
     ),

    );
  }
}

