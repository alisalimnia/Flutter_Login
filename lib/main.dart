import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'فرم لاگین (سلیم نیا)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.transparent),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: avoid_init_to_null, non_constant_identifier_names
  final Controller_Username = TextEditingController();
  // ignore: non_constant_identifier_names
  final Controller_Password = TextEditingController();
  // ignore: avoid_init_to_null
  SnackBar? snackBar = null;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    Controller_Username.dispose();
    Controller_Password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade100, Colors.white],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.center,
          ),
        ),
        child: Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Center(
                child: Text(widget.title),
              ),
              foregroundColor: Colors.white,
            ),
            body: ListView(
                padding: EdgeInsets.only(right: 16, left: 16, top: 16),
                scrollDirection: Axis.vertical,
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 25, left: 16, right: 16, bottom: 20),
                    child: Container(
                      constraints: BoxConstraints.expand(height: 200.0),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.lightBlue.shade200,
                              Colors.orange.shade200
                            ],
                            begin: FractionalOffset.topRight,
                            end: FractionalOffset.bottomLeft,
                          ),
                          shape: BoxShape.circle),
                      child: Image.asset('images/256-256.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      controller: Controller_Username,
                      style: TextStyle(fontFamily: 'estedad'),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: 'نام کاربری',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.person_rounded,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: TextFormField(
                      controller: Controller_Password,
                      style: TextStyle(fontFamily: 'estedad'),
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'رمز عبور',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.password_rounded,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: ElevatedButton(
                      onPressed: () => {
                        login(
                            Controller_Username.text, Controller_Password.text)
                      },
                      child: Text(
                        "ورود",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'estedad',
                            fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        onSurface: Colors.lightBlue.shade100,
                      ),
                    ),
                  ),
                ])));
  }

  void login(String username, String password) {
    String user = "ali";
    String pass = "123";
    if (username == user && password == pass) {
      snackBar = SnackBar(
          content: Text(
        "سلام به نرم افزار خوش آمدید",
        style: TextStyle(
          fontFamily: 'estedad',
          color: Colors.lightBlue,
        ),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar!);
    } else if (username != user) {
      snackBar = SnackBar(
          content: Text(
        "نام کاربری یافت نشد",
        style: TextStyle(
          fontFamily: 'estedad',
          color: Colors.red,
        ),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar!);
    } else if (username == user && password != pass) {
      snackBar = SnackBar(
          content: Text(
        " رمز عبور صحیح نیست!!",
        style: TextStyle(
          fontFamily: 'estedad',
          color: Colors.red,
        ),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar!);
    }
  }
}
