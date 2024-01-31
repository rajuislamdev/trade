import 'dart:convert';

class AccountInfo {
  final String address;
  final double balance;
  final String city;
  final String country;
  final int currency;
  final int currentTradesCount;
  final double currentTradesVolume;
  final double equity;
  final double freeMargin;
  final bool isAny0penTrades;
  final bool isSwapFree;
  final int leverage;
  final String name;
  final String phone;
  final int totalTradesCount;
  final double totalTradesVolume;
  final int type;
  final int verificationLevel;
  final String zipCode;
  AccountInfo({
    required this.address,
    required this.balance,
    required this.city,
    required this.country,
    required this.currency,
    required this.currentTradesCount,
    required this.currentTradesVolume,
    required this.equity,
    required this.freeMargin,
    required this.isAny0penTrades,
    required this.isSwapFree,
    required this.leverage,
    required this.name,
    required this.phone,
    required this.totalTradesCount,
    required this.totalTradesVolume,
    required this.type,
    required this.verificationLevel,
    required this.zipCode,
  });

  AccountInfo copyWith({
    String? address,
    double? balance,
    String? city,
    String? country,
    int? currency,
    int? currentTradesCount,
    double? currentTradesVolume,
    double? equity,
    double? freeMargin,
    bool? isAny0penTrades,
    bool? isSwapFree,
    int? leverage,
    String? name,
    String? phone,
    int? totalTradesCount,
    double? totalTradesVolume,
    int? type,
    int? verificationLevel,
    String? zipCode,
  }) {
    return AccountInfo(
      address: address ?? this.address,
      balance: balance ?? this.balance,
      city: city ?? this.city,
      country: country ?? this.country,
      currency: currency ?? this.currency,
      currentTradesCount: currentTradesCount ?? this.currentTradesCount,
      currentTradesVolume: currentTradesVolume ?? this.currentTradesVolume,
      equity: equity ?? this.equity,
      freeMargin: freeMargin ?? this.freeMargin,
      isAny0penTrades: isAny0penTrades ?? this.isAny0penTrades,
      isSwapFree: isSwapFree ?? this.isSwapFree,
      leverage: leverage ?? this.leverage,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      totalTradesCount: totalTradesCount ?? this.totalTradesCount,
      totalTradesVolume: totalTradesVolume ?? this.totalTradesVolume,
      type: type ?? this.type,
      verificationLevel: verificationLevel ?? this.verificationLevel,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'balance': balance,
      'city': city,
      'country': country,
      'currency': currency,
      'currentTradesCount': currentTradesCount,
      'currentTradesVolume': currentTradesVolume,
      'equity': equity,
      'freeMargin': freeMargin,
      'isAny0penTrades': isAny0penTrades,
      'isSwapFree': isSwapFree,
      'leverage': leverage,
      'name': name,
      'phone': phone,
      'totalTradesCount': totalTradesCount,
      'totalTradesVolume': totalTradesVolume,
      'type': type,
      'verificationLevel': verificationLevel,
      'zipCode': zipCode,
    };
  }

  factory AccountInfo.fromMap(Map<String, dynamic> map) {
    return AccountInfo(
      address: map['address'] as String,
      balance: map['balance'].toDouble() as double,
      city: map['city'] as String,
      country: map['country'] as String,
      currency: map['currency'].toInt() as int,
      currentTradesCount: map['currentTradesCount'].toInt() as int,
      currentTradesVolume: map['currentTradesVolume'].toDouble() as double,
      equity: map['equity'].toDouble() as double,
      freeMargin: map['freeMargin'].toDouble() as double,
      isAny0penTrades: map['isAnyOpenTrades'] as bool,
      isSwapFree: map['isSwapFree'] as bool,
      leverage: map['leverage'].toInt() as int,
      name: map['name'] as String,
      phone: map['phone'] as String,
      totalTradesCount: map['totalTradesCount'].toInt() as int,
      totalTradesVolume: map['totalTradesVolume'].toDouble() as double,
      type: map['type'].toInt() as int,
      verificationLevel: map['verificationLevel'].toInt() as int,
      zipCode: map['zipCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountInfo.fromJson(String source) =>
      AccountInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountInfo(address: $address, balance: $balance, city: $city, country: $country, currency: $currency, currentTradesCount: $currentTradesCount, currentTradesVolume: $currentTradesVolume, equity: $equity, freeMargin: $freeMargin, isAny0penTrades: $isAny0penTrades, isSwapFree: $isSwapFree, leverage: $leverage, name: $name, phone: $phone, totalTradesCount: $totalTradesCount, totalTradesVolume: $totalTradesVolume, type: $type, verificationLevel: $verificationLevel, zipCode: $zipCode)';
  }

  @override
  bool operator ==(covariant AccountInfo other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.balance == balance &&
        other.city == city &&
        other.country == country &&
        other.currency == currency &&
        other.currentTradesCount == currentTradesCount &&
        other.currentTradesVolume == currentTradesVolume &&
        other.equity == equity &&
        other.freeMargin == freeMargin &&
        other.isAny0penTrades == isAny0penTrades &&
        other.isSwapFree == isSwapFree &&
        other.leverage == leverage &&
        other.name == name &&
        other.phone == phone &&
        other.totalTradesCount == totalTradesCount &&
        other.totalTradesVolume == totalTradesVolume &&
        other.type == type &&
        other.verificationLevel == verificationLevel &&
        other.zipCode == zipCode;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        balance.hashCode ^
        city.hashCode ^
        country.hashCode ^
        currency.hashCode ^
        currentTradesCount.hashCode ^
        currentTradesVolume.hashCode ^
        equity.hashCode ^
        freeMargin.hashCode ^
        isAny0penTrades.hashCode ^
        isSwapFree.hashCode ^
        leverage.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        totalTradesCount.hashCode ^
        totalTradesVolume.hashCode ^
        type.hashCode ^
        verificationLevel.hashCode ^
        zipCode.hashCode;
  }
}
