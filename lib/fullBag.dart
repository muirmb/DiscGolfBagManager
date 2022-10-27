import 'package:flutter/material.dart';
import 'Disc.dart';
import 'palette.dart';

class FullBag extends StatelessWidget {
  FullBag({required this.myDiscs});

  List<Disc> myDiscs;
  static const String routeName = "/FullBag";

  @override
  Widget build(BuildContext context){
    Widget _buildBody() {
      return Center(
        child: GridView.builder(
          padding: EdgeInsets.only(left: 20, right: 20),
          itemCount: myDiscs!.length,
          gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, int index) {
            return Center(child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top:10)),
                Text("${myDiscs[index].make} ${myDiscs[index].model} ${myDiscs[index].weight}"),
                Text("${myDiscs[index].speed} ${myDiscs[index].glide} ${myDiscs[index].turn} ${myDiscs[index].fade}"),
                Expanded(child: 
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(color: Palette.getColor("${myDiscs[index].color}"), shape: BoxShape.circle),
                      child: FittedBox(fit: BoxFit.fill, child: Text("${myDiscs[index].model}"))
                    )
                  )
                )
            ]));
          })
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