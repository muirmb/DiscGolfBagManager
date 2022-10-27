import 'package:flutter/material.dart';
import 'palette.dart';
import 'account.dart';
import 'fullBag.dart';
import 'Disc.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var routes = <String, WidgetBuilder>{
    AccountPage.routeName: (BuildContext context) => new AccountPage(),
    //FullBag.routeName: (BuildContext context) => new FullBag(myDiscs: myDiscs)
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disc Golf',
      theme: ThemeData(primarySwatch: Colors.red),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(),
      routes: routes
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key){}

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    List<Disc> myDiscs = <Disc>[Disc('Discraft', 'Zone', 'Pink', 174, 4, 3, 0, 3)];
    // App bar for our application, should be the same on each screen
    PreferredSizeWidget _buildAppBar() {
      return AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Home'),
        leading: IconButton(
          alignment: Alignment.centerLeft,
          icon: const Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AccountPage.routeName);
            // Respond to button press
          },
        ),
        actions: const <Widget>[],
      );
    }

    // Our body, should be different for each page
    Widget _buildBody() {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(child: Container(
              child: Column(
                children: [
                  Text("My Bag", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Image(image: AssetImage('images/gripBag.jpg'),
                        height: MediaQuery.of(context).size.height/3),
                      Container(height: 100, width: 150, padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            Container(
                              height: 90,
                              width: 9,
                              color: Palette.getColor("${myDiscs[0].color}"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FullBag(myDiscs: myDiscs,)));
                    },
                    child: const Text('View full bag'),
                  ),
                ]
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45)
              )
            )),
            Expanded(child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45)
              )
            ))
          ],
        ),
      );
    }

    // Main Application
    return Scaffold(
      extendBody: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}