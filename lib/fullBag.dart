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

  @override
  Widget build(BuildContext context){
    final myDiscs = context.watch<BagViewModel>().myBag;
    Widget _buildBody() {
      return Center(
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
                Text("${myDiscs[index].make} ${myDiscs[index].model} ${myDiscs[index].weight}"),
                Text("${myDiscs[index].speed} ${myDiscs[index].glide} ${myDiscs[index].turn} ${myDiscs[index].fade}"),
                Expanded(child: FittedBox(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(color: Palette.getColor("${myDiscs[index].color}"), shape: BoxShape.circle),
                      child: FittedBox(fit: BoxFit.fill, child: Text("${myDiscs[index].model}"))
                  )
                )),
                TextButton(onPressed: () {
                    context.read<BagViewModel>().removeFromBag(currDisc);
                  },
                  child: Text("Remove", style: TextStyle(color: Colors.red),))
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