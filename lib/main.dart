import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _title = "flutter-test";
  bool _select = false;
  double _sliderValue = 0.0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _showAlert() {
    var simpleDialog = new SimpleDialog(title: const Text('你是不是傻'),
      children: <Widget>[
        new SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('是的'),
        ),
        new SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('不是'),
        ),
      ],
    ).build(context);
    showDialog(context: context, child: simpleDialog);
  }

  void _showBottomSheet() {
    var bottomSheet = new BottomSheet(
        onClosing: () {
          _showAlert();
        }, builder: (BuildContext context) {
      return new Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                  _title
              ),
              new Text(
                'terrible',
              )
            ],
          ),
        )
      );
    }).builder;
    showBottomSheet(context: context, builder: bottomSheet);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(
              child: new Text('清零按钮'),
              color: new Color.fromRGBO(66, 165, 245, 1.0),
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
            ),
            new Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Center(
                        child: new Text('name-')
                    ),
                    new Text('age', style: new TextStyle(
                        fontSize: 22.0, color: new Color(0xFFFF9000)))
                  ],
                )
            ),
            new Image.network(
              'http://imgs.nmplus.hk/wp-content/uploads/2016/04/5Pikachu.png',
              width: 100.0,
              height: 100.0,
            ),
            new FlatButton(
              child: new Text('弹出对话框'),
              color: new Color.fromRGBO(66, 165, 12, 1.0),
              onPressed: _showAlert,
            ),
            new FlatButton(
                child: new Text('弹出bottomSheet'),
                color: new Color.fromRGBO(11, 33, 136, 1.0),
                onPressed: _showBottomSheet
            ),
            new Switch(
              value: _select,
              onChanged: (bool value) {
                setState(() {
                  _select = !_select;
                });
              },
            ),
            new Slider(
              value: _sliderValue,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              min: 0.0,
              max: 10.0,
            ),
            new Text(
                _title
            ),
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
