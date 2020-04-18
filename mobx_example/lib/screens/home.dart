import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxexample/store/home_controller.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {

  static const platform = const MethodChannel("test_activity");
  final homeController = HomeController();

  _getNewActivity() async {
    try {
      await platform.invokeMethod('startNewActivity');
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_) {
                return Text('${homeController.count}');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getNewActivity();
//          homeController.changeValue();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}