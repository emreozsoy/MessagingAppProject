import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
double per =0;
double perStatic= 0;

class LiquidCustomProgressIndicatorPage extends StatefulWidget {
  const LiquidCustomProgressIndicatorPage({Key? key}) : super(key: key);


  @override
  State<LiquidCustomProgressIndicatorPage> createState() => _LiquidCustomProgressIndicatorPageState();
}

class _LiquidCustomProgressIndicatorPageState extends State<LiquidCustomProgressIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liquid Custom Progress Indicators"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _AnimatedLiquidCustomProgressIndicator(),
        ],
      ),
    );
  }

}

class _AnimatedLiquidCustomProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidCustomProgressIndicatorState();


}

class _AnimatedLiquidCustomProgressIndicatorState
    extends State<_AnimatedLiquidCustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  var waitTimer = 9999;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,

      duration: Duration(seconds: 10),
    );

    perStatic = per;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // eğer canımız 50 ise ve kullanıcı 5 can kazandıysa üstüne eklenir ve eklenmiş hali gösterilir
    // eğer canımı 50 şse ve kullanıcı 5 can kaybettiyse en baştan başlayıp 5 eksilmiş hali gösterilir

    final percentage = _animationController.value * 100;

    if(per == _animationController.value * 100){
      _animationController.stop();
    }
    return Row(
      children: [
        LiquidCustomProgressIndicator(
          value: _animationController.value ,
          direction: Axis.vertical,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Colors.red),
          shapePath: _buildHeartPath(),
          center: Text(
            "${percentage.toStringAsFixed(0)}%",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(onPressed: () {
          setState(() {
            _animationController.value+=25;
            checkWork();
          });
        },
            child: Text("mERHaba")),
      ],


    );
  }

  Path _buildHeartPath() {
    return Path()
      ..moveTo(55, 15)
      ..cubicTo(55, 12, 50, 0, 30, 0)
      ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
      ..cubicTo(0, 55, 20, 77, 55, 95)
      ..cubicTo(90, 77, 110, 55, 110, 37.5)
      ..cubicTo(110, 37.5, 110, 0, 80, 0)
      ..cubicTo(65, 0, 55, 12, 55, 15)
      ..close();
  }


  void checkWork() {
    _animationController.repeat();
    _animationController.addListener(() => setState(() {}));
  }
}

