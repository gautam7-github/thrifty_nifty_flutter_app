import 'package:flutter/material.dart';
import 'package:thrifty_nifty_app/model/stock.dart';
import 'package:thrifty_nifty_app/views/stockcard.dart';

class StockList extends StatelessWidget {
  const StockList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int idx) {
        return Divider(
          indent: 12,
          endIndent: 12,
          color: Colors.grey.shade400,
          thickness: 0.5,
        );
      },
      itemBuilder: (BuildContext context, int idx) {
        return Container(
          color: Colors.green,
          child: StockCard(
            index: idx,
          ),
        );
      },
      itemCount: stocks.length,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
    );
  }
}
