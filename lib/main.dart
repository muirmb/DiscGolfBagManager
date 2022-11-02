import 'package:DiscGolf/viewModel.dart';
import 'package:flutter/material.dart';
import 'palette.dart';
import 'account.dart';
import 'fullBag.dart';
import 'Disc.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider<BagViewModel>(
    child: MyApp(),
    create: (_) => BagViewModel(), // Create a new ChangeNotifier object
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var routes = <String, WidgetBuilder>{
    AccountPage.routeName: (BuildContext context) => new AccountPage(),
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myDiscs = context.watch<BagViewModel>().myBag;
    final owned = context.watch<BagViewModel>().owned;

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

    // Display a preview of the bag if it contains discs
    Widget buildBagDisplay() {
      if(myDiscs.length == 0){
        return Center(child: Text("Bag is empty"));
      }
      else {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: myDiscs.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(color: Palette.getColor("${myDiscs[index].color}"), borderRadius: BorderRadius.circular(10)),
                height: 90,
                width: 9,
              );}
        );
      }
    }

    // Our body, should be different for each page
    Widget _buildBody() {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
                flex: 2,
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
                          child: buildBagDisplay()
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FullBag()));
                      },
                      child: const Text('View full bag'),
                    ),
                  ]
                ),
            ),

            // This area will show the rest of owned discs
            Expanded(child: Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: owned.length,
                itemBuilder: (BuildContext context, int index) {
                  final currDisc = owned[index];
                  return Center(child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        Text("${owned[index].make} ${owned[index].model} ${owned[index].weight}", style: TextStyle(color: Colors.black),),
                        Text("${owned[index].speed} ${owned[index].glide} ${owned[index].turn} ${owned[index].fade}", style: TextStyle(color: Colors.black)),
                        Expanded(
                            child: FittedBox(child: Container(
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(color: Palette.getColor("${owned[index].color}"), shape: BoxShape.circle),
                                child: FittedBox(fit: BoxFit.fitWidth, child: Text("${owned[index].model}", style: TextStyle(color: Colors.black)))
                            ))
                        ),
                        TextButton(onPressed: () {
                          context.read<BagViewModel>().addToBag(currDisc);
                        },
                            child: Text("Put in bag", style: TextStyle(color: Colors.green),))
                      ]));
                }
              )
            )),

            // This area will recommend discs to collect
            Expanded(child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45)
                )
            )),
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