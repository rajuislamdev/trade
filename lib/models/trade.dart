// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Trade {
  final double currentPrice;
  final String? comment;
  final int digit;
  final int login;
  final double openPrice;
  final String openTime;
  final double profit;
  final double sl;
  final double swaps;
  final String symbol;
  final double tp;
  final int ticket;
  final int type;
  final double volume;
  Trade({
    required this.currentPrice,
    this.comment,
    required this.digit,
    required this.login,
    required this.openPrice,
    required this.openTime,
    required this.profit,
    required this.sl,
    required this.swaps,
    required this.symbol,
    required this.tp,
    required this.ticket,
    required this.type,
    required this.volume,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentPrice': currentPrice,
      'comment': comment,
      'digit': digit,
      'login': login,
      'oldPrice': openPrice,
      'openTime': openTime,
      'profit': profit,
      'sl': sl,
      'swaps': swaps,
      'symbol': symbol,
      'tp': tp,
      'ticket': ticket,
      'type': type,
      'volume': volume,
    };
  }

  factory Trade.fromMap(Map<String, dynamic> map) {
    return Trade(
      currentPrice: map['currentPrice'] as double,
      comment: map['comment'] != null ? map['comment'] as String : null,
      digit: map['digits'] as int,
      login: map['login'] as int,
      openPrice: map['openPrice'] as double,
      openTime: map['openTime'] as String,
      profit: map['profit'] as double,
      sl: map['sl'] as double,
      swaps: map['swaps'] as double,
      symbol: map['symbol'] as String,
      tp: map['tp'] as double,
      ticket: map['ticket'] as int,
      type: map['type'] as int,
      volume: map['volume'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Trade.fromJson(String source) =>
      Trade.fromMap(json.decode(source) as Map<String, dynamic>);
}
