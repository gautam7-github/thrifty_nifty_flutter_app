import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrifty_nifty_app/views/loadingpage.dart';

void main(List<String> args) {
  runApp(
    BaseApp(),
  );
}

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      title: "Thrifty Nifty",
      debugShowCheckedModeBanner: false,
      home: LoadingPage(
        ToIndex: true,
      ),
    );
  }
}
