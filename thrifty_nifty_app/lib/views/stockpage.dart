import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrifty_nifty_app/API/network.dart';
import 'package:thrifty_nifty_app/model/index.dart';
import 'package:thrifty_nifty_app/views/settingspage.dart';
import 'package:thrifty_nifty_app/views/stocklist.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class StockPage extends StatefulWidget {
  const StockPage({
    Key? key,
  });
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
          animSpeedFactor: 4.0,
          color: Colors.transparent,
          backgroundColor: Color(0xFF05fa9b),
          showChildOpacityTransition: false,
          onRefresh: () async {
            await networkController.fetchData();
            setState(() {});
          },
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${networkController.currentIndex!.toUpperCase()}",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "$indiceVal",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
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
