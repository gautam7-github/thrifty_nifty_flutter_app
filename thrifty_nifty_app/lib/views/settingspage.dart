import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrifty_nifty_app/API/network.dart';
import 'package:thrifty_nifty_app/model/credits.dart';
import 'package:thrifty_nifty_app/views/loadingpage.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map<String, String> methods = {
    "Alphabetical": "alph",
    "Price": "price",
    "Market Cap.": "mcap",
    "Change": "chng",
  };
  var key = {
    "Alphabetical": "alph",
    "Price": "price",
    "Market Cap.": "mcap",
    "Change": "chng",
  }.map(
    (k, v) => MapEntry(v, k),
  );
  Map<String, String> indices = {
    "Nifty 50": "50",
    "Nifty Bank": "bank",
    "Nifty IT": "it",
    "Nifty Pharma": "pharma",
    "Nifty Auto": "auto",
    "Nifty FMCG": "fmcg",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.off(
              () => LoadingPage(
                ToIndex: false,
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Settings",
          style: GoogleFonts.inter(),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 12,
                          ),
                          color: Colors.black,
                          child: Text(
                            "Current Index",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Color(0xFF2e2e2e),
                          ),
                          child: DropdownButton<String>(
                            alignment: Alignment.center,
                            enableFeedback: true,
                            hint: Text(
                              networkController.currentIndex.toString(),
                              style: GoogleFonts.inter(
                                color: Colors.white,
                              ),
                            ),
                            items: <String>[
                              'Nifty Bank',
                              'Nifty 50',
                              'Nifty IT',
                              'Nifty Pharma',
                              'Nifty Auto',
                              'Nifty FMCG',
                            ].map(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Container(
                                    child: Text(
                                      value,
                                      style: GoogleFonts.inter(
                                        color: Color(0xFF05fa9b),
                                      ),
                                    ),
                                    color: Color(0xFF2e2e2e),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (String? selectedIndex) {
                              print(selectedIndex);
                              print(indices[selectedIndex]);
                              setState(
                                () {
                                  networkController.currentIndex =
                                      selectedIndex;
                                  networkController.indexTicker =
                                      indices[selectedIndex];
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 12,
                          ),
                          color: Colors.black,
                          child: Text(
                            "Sort By",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Color(0xff2e2e2e),
                          ),
                          child: DropdownButton<String>(
                            alignment: Alignment.center,
                            enableFeedback: true,
                            hint: Text(
                              key[networkController.sortBy].toString(),
                              style: GoogleFonts.inter(
                                color: Colors.white,
                              ),
                            ),
                            items: <String>[
                              'Market Cap.',
                              'Price',
                              'Alphabetical',
                              'Change'
                            ].map(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Container(
                                    child: Text(
                                      value,
                                      style: GoogleFonts.inter(
                                        color: Color(0xFF05fa9b),
                                      ),
                                    ),
                                    color: Color(0xff2e2e2e),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (String? selectedmethod) {
                              print(methods[selectedmethod]);
                              setState(
                                () {
                                  networkController.sortBy =
                                      methods[selectedmethod];
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 4,
                // ),
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Get.to(CreditPage());
                  },
                  child: Hero(
                    tag: "pgx",
                    child: ProdiGinix(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreditPage extends StatelessWidget {
  const CreditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff202020),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "CREDITS",
          style: GoogleFonts.openSans(color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xff121212),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: "pgx",
                child: ProdiGinix(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Rajveer Singh (Tester)",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Hemant Walia (Tester)",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
