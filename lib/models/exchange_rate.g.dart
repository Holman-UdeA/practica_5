// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExchangeRateAdapter extends TypeAdapter<ExchangeRate> {
  @override
  final int typeId = 0;

  @override
  ExchangeRate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExchangeRate(
      currency: fields[0] as String,
      rate: fields[1] as double,
      base: fields[2] as String,
      date: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExchangeRate obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.currency)
      ..writeByte(1)
      ..write(obj.rate)
      ..writeByte(2)
      ..write(obj.base)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExchangeRateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
