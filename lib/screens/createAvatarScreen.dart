import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAvatarScreen extends StatefulWidget {
  @override
  _CreateAvatarScreen createState() => _CreateAvatarScreen();
}

class _CreateAvatarScreen extends State<CreateAvatarScreen> {
  @override
  String _text = '';

  void _saveText() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('text', _text);
  }

  double fem = 0;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;


    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
    );
  }
}

