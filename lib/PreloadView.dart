import 'dart:async';

import 'package:flutter/material.dart';
import 'MenuView.dart';
import 'LoadManager.dart';

class PreloadView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new PreloadViewState();
  }
}

class PreloadViewState extends State<PreloadView>{
  static const int MAX_TRY_COUNT = 10;

  void toMenuView(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainView()),

    );
  }

  @override
  void initState() {
    startCountdown(0);
    super.initState();
  }

  Future<Null> startCountdown(int tryCount) async {
    print("tryCount = " + tryCount.toString());
    if(MAX_TRY_COUNT <= tryCount){
      print("TOO MANY TRY FOR LOADING");
      toMenuView();
    }

    const timeOut = const Duration(seconds: 2);
    new Timer(timeOut, () {
      if(LoadManager.instance().isAllLoaded()){
        toMenuView();
      }else{
        tryCount++;
        startCountdown(tryCount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
          child : new Image.asset(
            'assets/res/preload_hse_logo.png',
            fit: BoxFit.contain,
          )
      )
    );
  }
}