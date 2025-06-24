import 'package:hive/hive.dart';

part 'exchange_rate.g.dart';

@HiveType(typeId: 0)
class ExchangeRate extends HiveObject {
  @HiveField(0)
  final String currency;

  @HiveField(1)
  final double rate;

  @HiveField(2)
  final String base;

  @HiveField(3)
  final String date;

  ExchangeRate({
    required this.currency,
    required this.rate,
    required this.base,
    required this.date,
  });
}