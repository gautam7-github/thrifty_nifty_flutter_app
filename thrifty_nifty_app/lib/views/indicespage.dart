import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrifty_nifty_app/API/network.dart';
import 'package:thrifty_nifty_app/model/index.dart';
import 'package:thrifty_nifty_app/views/loadingpage.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thrifty Nifty".toUpperCase(),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Color(0xFF05fa9b),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LiquidPullToRefresh(
          color: Color(0xFF05fa9b),
          backgroundColor: Color(0xFF2e2e2e),
          showChildOpacityTransition: false,
          animSpeedFactor: 3.0,
          onRefresh: () async {
            HapticFeedback.selectionClick();
            await networkController.fetchIndicesData();
            setState(() {});
          },
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
            ),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, idx) {
              return MaterialButton(
                onPressed: () {
                  HapticFeedback.selectionClick();
                  setState(
                    () {
                      networkController.currentIndex = indices[idx].index;
                      networkController.indexTicker =
                          indicesMap[indices[idx].index];
                    },
                  );
                  Get.to(
                    () => LoadingPage(
                      ToIndex: false,
                    ),
                  );
                },
                minWidth: 0,
                padding: EdgeInsets.all(0),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "${indices[idx].index!.toUpperCase()}",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${indices[idx].cmktPrice}",
                          style: GoogleFonts.inter(
                            color: (indices[idx].change > 0.0)
                                ? Colors.green
                                : Colors.red,
                            fontSize: 28,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${indices[idx].change}",
                              style: GoogleFonts.inter(
                                color: (indices[idx].change > 0.0)
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                            Text(
                              "(${indices[idx].changeinPct}%)",
                              style: GoogleFonts.inter(
                                color: (indices[idx].changeinPct > 0.0)
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 12,
                            right: 12,
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Open",
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${indices[idx].oPrice}",
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "High",
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${indices[idx].dAYHIGH}",
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Low",
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${indices[idx].dAYLOW}",
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, idx) {
              return Divider(
                color: Colors.grey,
                endIndent: 12,
                indent: 12,
              );
            },
            itemCount: indices.length,
          ),
        ),
      ),
    );
  }
}
