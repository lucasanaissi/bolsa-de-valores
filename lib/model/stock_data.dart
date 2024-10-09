class StockData {
  String currency;
  String shortName;
  String longName;
  double regularMarketChange;
  double regularMarketChangePercent;
  double regularMarketPrice;
  double regularMarketDayHigh;
  double regularMarketDayLow;
  String regularMarketRange;
  int regularMarketVolume;
  double regularMarketPreviousClose;
  double regularMarketOpen;
  String fiftyTwoWeekRange;
  double fiftyTwoWeekHigh;
  double fiftyTwoWeekLow;
  String symbol;
  double? priceEarnings;
  double earningsPerShare;
  String logoUrl;

  StockData({
    required this.currency,
    required this.shortName,
    required this.longName,
    required this.regularMarketChange,
    required this.regularMarketChangePercent,
    required this.regularMarketPrice,
    required this.regularMarketDayHigh,
    required this.regularMarketDayLow,
    required this.regularMarketRange,
    required this.regularMarketVolume,
    required this.regularMarketPreviousClose,
    required this.regularMarketOpen,
    required this.fiftyTwoWeekRange,
    required this.fiftyTwoWeekHigh,
    required this.fiftyTwoWeekLow,
    required this.symbol,
    required this.priceEarnings,
    required this.earningsPerShare,
    required this.logoUrl,
  });

  factory StockData.fromJson(Map<String, dynamic> json) {
    return StockData(
      currency: json['currency'],
      shortName: json['shortName'],
      longName: json['longName'],
      regularMarketChange: json['regularMarketChange'] is int
          ? json['regularMarketChange'].toDouble()
          : json['regularMarketChange'],
      regularMarketChangePercent: json['regularMarketChangePercent'] is int
          ? json['regularMarketChangePercent'].toDouble()
          : json['regularMarketChangePercent'],
      regularMarketPrice: json['regularMarketPrice'],
      regularMarketDayHigh: json['regularMarketDayHigh'],
      regularMarketDayLow: json['regularMarketDayLow'],
      regularMarketRange: json['regularMarketDayRange'],
      regularMarketVolume: json['regularMarketVolume'],
      regularMarketPreviousClose: json['regularMarketPreviousClose'] is int
          ? json['regularMarketPreviousClose'].toDouble()
          : json['regularMarketPreviousClose'],
      regularMarketOpen: json['regularMarketOpen'],
      fiftyTwoWeekRange: json['fiftyTwoWeekRange'],
      fiftyTwoWeekHigh: json['fiftyTwoWeekHigh'],
      fiftyTwoWeekLow: json['fiftyTwoWeekLow'],
      symbol: json['symbol'],
      priceEarnings: json['priceEarnings'],
      earningsPerShare: json['earningsPerShare'],
      logoUrl: json['logourl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'shortName': shortName,
      'longName': longName,
      'regularMarketChange': regularMarketChange,
      'regularMarketChangePercent': regularMarketChangePercent,
      'regularMarketPrice': regularMarketPrice,
      'regularMarketDayHigh': regularMarketDayHigh,
      'regularMarketDayLow': regularMarketDayLow,
      'regularMarketRange': regularMarketRange,
      'regularMarketVolume': regularMarketVolume,
      'regularMarketPreviousClose': regularMarketPreviousClose,
      'regularMarketOpen': regularMarketOpen,
      'fiftyTwoWeekRange': fiftyTwoWeekRange,
      'fiftyTwoWeekHigh': fiftyTwoWeekHigh,
      'fiftyTwoWeekLow': fiftyTwoWeekLow,
      'symbol': symbol,
      'priceEarnings': priceEarnings,
      'earningsPerShare': earningsPerShare,
      'logourl': logoUrl,
    };
  }
}
