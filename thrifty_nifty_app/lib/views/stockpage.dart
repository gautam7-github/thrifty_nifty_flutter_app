import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrifty_nifty_app/API/network.dart';
import 'package:thrifty_nifty_app/views/settingspage.dart';
import 'package:thrifty_nifty_app/views/stocklist.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class StockPage extends StatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thrifty Nifty".toUpperCase(),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF121212),
        foregroundColor: Color(0xFF05fa9b),
        leading: IconButton(
          onPressed: () async {
            HapticFeedback.selectionClick();
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              HapticFeedback.selectionClick();
              Get.to(
                () => SettingsPage(),
              )!
                  .then(
                (value) => () async {
                  await networkController.fetchData();
                },
              );
              setState(() {});
              dispose();
            },
            icon: Icon(
              Icons.settings_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LiquidPullToRefresh(
          animSpeedFactor: 3.0,
          showChildOpacityTransition: false,
          onRefresh: () async {
            await networkController.fetchData();
            setState(() {});
          },
          backgroundColor: Colors.black,
          color: Color(0xFF05fa9b),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  child: Center(
                    child: Text(
                      "${networkController.currentIndex!.toUpperCase()}",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              StockList(),
            ],
          ),
        ),
      ),
    );
  }
}
