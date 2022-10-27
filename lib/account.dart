import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  static const String routeName = "/AccountPage";

  String name = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context){
    Widget _buildBody(){
      return Container(
          padding: EdgeInsets.only(top: 50, left: 10, right: 10),
          child:
          ListView(
            children: <Widget>[
              Container(
                height: 30,
                child: Text('Name: $name'),
              ),
              Container(
                height: 30,
                child: Text('Email: $email'),
              ),
              Container(
                height: 30,
                child: Text('Password: $password'),
              ),
            ],
          )
      );
    }

    PreferredSizeWidget _buildAppBar() {
      return AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Account'),
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