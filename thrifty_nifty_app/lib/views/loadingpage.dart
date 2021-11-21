import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:thrifty_nifty_app/API/network.dart';
import 'package:thrifty_nifty_app/views/indicespage.dart';
import 'package:thrifty_nifty_app/views/stockpage.dart';

class LoadingPage extends StatefulWidget {
  bool? whereTo;
  LoadingPage({Key? key, required this.whereTo}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  var quirks = [
    "Meanwhile, have some lassi ;D",
    "Meanwhile, listen to Eminem :D",
    "Meanwhile, take care of yourself!"
  ];

  String? chosen;
  @override
  void initState() {
    final _random = Random();
    chosen = quirks[_random.nextInt(quirks.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _random = Random();
    chosen = quirks[_random.nextInt(quirks.length)];
    return FutureBuilder(
      future: widget.whereTo!
          ? networkController.fetchIndicesData()
          : networkController.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 7,
                          child: LoadingIndicator(
                            indicatorType: Indicator.lineScaleParty,
                            colors: [Colors.green, Colors.red],
                            pathBackgroundColor: Colors.green,
                          ),
                        ),
                        Container(
                          child: Text(
                            "Loading...",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "$chosen",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Thrifty Nifty",
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return widget.whereTo! ? IndexPage() : StockPage();
        }
      },
    );
  }
}
