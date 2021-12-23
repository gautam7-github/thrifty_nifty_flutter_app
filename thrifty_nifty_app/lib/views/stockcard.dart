import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrifty_nifty_app/model/stock.dart';

class StockCard extends StatefulWidget {
  final int index;
  StockCard({required this.index});

  @override
  _StockCardState createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Get.to(
          StockDetailPage(
            index: widget.index,
          ),
        );
      },
      padding: EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        height: MediaQuery.of(context).size.height / 8,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "${widget.index}",
                  child: Text(
                    "${stocks[widget.index].ticker}",
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Text(
                  "${(stocks[widget.index].company!.length < 24) ? stocks[widget.index].company : (stocks[widget.index].company!.substring(0, 20) + "...")}",
                  style: GoogleFonts.raleway(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "pr${widget.index}",
                  child: Text(
                    "${stocks[widget.index].cmktPrice}",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: (stocks[widget.index].change >= 0.0)
                          ? Colors.green
                          : Colors.red,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Text(
                  "${stocks[widget.index].change} (${stocks[widget.index].changeinPct}%)",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: (stocks[widget.index].change >= 0.0)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StockDetailPage extends StatelessWidget {
  int? index;
  StockDetailPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Hero(
                  tag: "$index",
                  child: Text(
                    "${stocks[index!].ticker}",
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Text(
                "${stocks[index!].company}",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              Column(
                children: [
                  Hero(
                    tag: "pr$index",
                    child: Text(
                      "${stocks[index!].cmktPrice}",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: (stocks[index!].change >= 0.0)
                            ? Colors.green
                            : Colors.red,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Text(
                    "${stocks[index!].change} (${stocks[index!].changeinPct}%)",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: (stocks[index!].change >= 0.0)
                          ? Colors.green
                          : Colors.red,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "24h Range",
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${stocks[index!].dAYHIGH}",
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        " / ",
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "${stocks[index!].dAYLOW}",
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "52w Range",
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${stocks[index!].yearHigh}",
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        " / ",
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "${stocks[index!].yearLow}",
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Market Cap.",
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    "${stocks[index!].mCap}",
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
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
