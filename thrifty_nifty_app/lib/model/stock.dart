class Stock {
  String? ticker;
  String? company;
  dynamic cmktPrice;
  dynamic yearHigh;
  dynamic yearLow;
  dynamic oPrice;
  dynamic yestClosePrice;
  dynamic change;
  dynamic changeinPct;
  dynamic dAYHIGH;
  dynamic dAYLOW;
  dynamic ePS;
  Stock({
    required this.ticker,
    required this.company,
    required this.cmktPrice,
    required this.yearHigh,
    required this.yearLow,
    required this.oPrice,
    required this.yestClosePrice,
    required this.change,
    required this.changeinPct,
    required this.dAYHIGH,
    required this.dAYLOW,
    required this.ePS,
  });
  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      ticker: json['TICKER'],
      company: json['COMPANY'],
      cmktPrice: json['CMP'],
      yearHigh: json['52WH'],
      yearLow: json['52WL'],
      oPrice: json['OPEN'],
      yestClosePrice: json['YESTCLOSE'],
      change: json['CHANGE'],
      changeinPct: json['CHANGEPCT'],
      dAYHIGH: json['DAYHIGH'],
      dAYLOW: json['DAYLOW'],
      ePS: json['EPS'],
    );
  }
  @override
  String toString() {
    return "Ticker: ${this.ticker}";
  }
}

List<Stock> stocks = [];
