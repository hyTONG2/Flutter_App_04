import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //去除右上角的debug标志
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //const MyHomePage({Key? key, required this.title}) : super(key: key);
  //final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖动滑动手势测试 (HYT)'),
      ),
      //body: ThemeTestRoute(),  //7.4.2 主题,
    );
  }
}

class MyHomeContent extends StatefulWidget {
  @override
  _MyHomeContentState createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  Widget build(BuildContext context) {
    //return  SingleChildScrollView(
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _GestureRecognizer(), //点击文本变色测试
      ],
      //),
    );
  }
}

class _GestureRecognizer extends StatefulWidget {
  const _GestureRecognizer({Key? key}) : super(key: key);

  @override
  _GestureRecognizerState createState() => _GestureRecognizerState();
}

class _GestureRecognizerState extends State<_GestureRecognizer> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "你好世界"),
            TextSpan(
              text: "点我变色",
              style: TextStyle(
                fontSize: 30.0,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                },
            ),
            TextSpan(text: "你好世界"),
          ],
        ),
      ),
    );
  }
}
