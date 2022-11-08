import 'package:DiscGolf/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Disc.dart';
import 'palette.dart';

class FullBag extends StatefulWidget {
  const FullBag({Key? key}) : super(key: key);

  @override
  _FullBagState createState() => _FullBagState();
}

class _FullBagState extends State<FullBag> {
  static const String routeName = "/FullBag";
  List<Disc> myDiscs = [Disc("Temp", "temp", "white", 170, 0, 0, 0, 0, true, true)];
  final List<String> categories = ["all", "putter", "midrange", "fairway", "distance"];
  bool changed = false;


  @override
  Widget build(BuildContext context){
    List<Disc> allDiscs = context.watch<BagViewModel>().myBag;
    List<Disc> putters = context.watch<BagViewModel>().putter;
    List<Disc> midranges = context.watch<BagViewModel>().midrange;
    List<Disc> fairways = context.watch<BagViewModel>().fairway;
    List<Disc> distance = context.watch<BagViewModel>().distance;

    // Set disc selection to a certain category
    void setDiscs(String category) {
      setState(() {
        changed = true;
      });
      if(category == "putter")
        setState(() {myDiscs = putters;});
      else if(category == "midrange")
        setState(() {myDiscs = midranges;});
      else if(category == "fairway")
        setState(() {myDiscs = fairways;});
      else if(category == "distance")
        setState(() {myDiscs = distance;});
      else
        setState(() {myDiscs = allDiscs;});

    }

    Widget _buildBody() {
      if(!changed){
        myDiscs = allDiscs;
      }
      return Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left:50)),

                  PopupMenuButton<String>(
                    child: Text("Show"),
                    initialValue: "all",
                    onSelected: (String choice) {setDiscs(choice);},
                    itemBuilder: (_) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: "all",
                        child: Text('All'),
                      ),
                      const PopupMenuItem<String>(
                        value: "putter",
                        child: Text('Putters'),
                      ),
                      const PopupMenuItem<String>(
                        value: "midrange",
                        child: Text('Midranges'),
                      ),
                      const PopupMenuItem<String>(
                        value: "fairway",
                        child: Text('Fairway Drivers'),
                      ),
                      const PopupMenuItem<String>(
                        value: "distance",
                        child: Text('Distance Drivers'),
                      ),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(left:50)),

                  PopupMenuButton<String>(
                    child: Text("Sort by"),
                    initialValue: "all",
                    onSelected: (String choice) {setDiscs(choice);},
                    itemBuilder: (_) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: "all",
                        child: Text('all'),
                      ),
                      const PopupMenuItem<String>(
                        value: "Speed",
                        child: Text('Speed'),
                      ),
                      const PopupMenuItem<String>(
                        value: "midrange",
                        child: Text('midranges'),
                      ),
                      const PopupMenuItem<String>(
                        value: "fairway",
                        child: Text('fairway drivers'),
                      ),
                      const PopupMenuItem<String>(
                        value: "distance",
                        child: Text('distance drivers'),
                      ),
                    ],
                  )
            ])),

            // Grid of discs
            Expanded(
              flex: 10,
              child: Center(
                child: GridView.builder(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  itemCount: myDiscs.length,
                  gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (_, int index) {
                    final currDisc = myDiscs[index];
                    return Center(child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        Text("${myDiscs[index].model} ${myDiscs[index].weight}"),
                        Text("${myDiscs[index].speed} ${myDiscs[index].glide} ${myDiscs[index].turn} ${myDiscs[index].fade}"),
                        Expanded(child: FittedBox(
                            child: Container(
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(color: Palette.getColor("${myDiscs[index].color}").discColor, shape: BoxShape.circle),
                              child: FittedBox(fit: BoxFit.fill, child: Text("${myDiscs[index].model}", style: TextStyle(color: Palette.getColor("${myDiscs[index].color}").fontColor),))
                          )
                        )),
                        TextButton(onPressed: () {
                            context.read<BagViewModel>().removeFromBag(currDisc);
                          },
                          child: Text("Remove", style: TextStyle(color: Colors.red),))
                    ]));
                  }
                )
              )
            )
          ]
      );
    }
    PreferredSizeWidget _buildAppBar() {
      return AppBar(
        backgroundColor: Colors.transparent,
        title: Text('My Bag'),
        leading: IconButton(
          alignment: Alignment.centerLeft,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
            // Respond to button press
          },
        ),
        actions: const <Widget>[],
      );
    }
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

}