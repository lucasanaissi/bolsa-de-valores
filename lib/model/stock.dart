class Stock {
  final String stock;
  final String name;
  final double close;
  final double change;
  final int volume;
  final int? marketCap;
  final String logo;
  final String? sector;
  final String type;

  Stock({
    required this.stock,
    required this.name,
    required this.close,
    required this.change,
    required this.volume,
    required this.marketCap,
    required this.logo,
    required this.sector,
    required this.type,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      stock: json['stock'],
      name: json['name'],
      close: json['close'] is int ? json['close'].toDouble() : json['close'],
      change:
          json['change'] is int ? json['change'].toDouble() : json['change'],
      volume: json['volume'],
      marketCap: json['marketCap'],
      logo: json['logo'],
      sector: json['sector'],
      type: json['type'],
    );
  }
}
