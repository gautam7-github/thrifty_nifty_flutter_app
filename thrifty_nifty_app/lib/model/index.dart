class Index {
  String? index;
  dynamic cmktPrice;
  dynamic yearHigh;
  dynamic yearLow;
  dynamic oPrice;
  dynamic yestClosePrice;
  dynamic change;
  dynamic changeinPct;
  dynamic dAYHIGH;
  dynamic dAYLOW;
  Index({
    required this.index,
    required this.cmktPrice,
    required this.yearHigh,
    required this.yearLow,
    required this.oPrice,
    required this.yestClosePrice,
    required this.change,
    required this.changeinPct,
    required this.dAYHIGH,
    required this.dAYLOW,
  });
  factory Index.fromJson(Map<String, dynamic> json) {
    return Index(
      index: json['INDEX'],
      cmktPrice: json['CMP'],
      yearHigh: json['52WH'],
      yearLow: json['52WL'],
      oPrice: json['OPEN'],
      yestClosePrice: json['YESTCLOSE'],
      change: json['CHANGE'],
      changeinPct: json['CHANGEPCT'],
      dAYHIGH: json['DAYHIGH'],
      dAYLOW: json['DAYLOW'],
    );
  }
}

List<Index> indices = [];
Map<String, String> indicesMap = {
  "Nifty 50": "50",
  "Nifty Bank": "bank",
  "Nifty IT": "it",
  "Nifty Pharma": "pharma",
  "Nifty Auto": "auto",
  "Nifty FMCG": "fmcg",
};
