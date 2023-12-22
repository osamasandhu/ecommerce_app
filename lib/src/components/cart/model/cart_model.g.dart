// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<_$CartModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$CartModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CartModelImpl(
      id: fields[0] as int?,
      userId: fields[1] as int,
      date: fields[2] as DateTime,
      productId: fields[3] as int,
      quantity: fields[4] as int,
      title: fields[5] as String,
      image: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$CartModelImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.productId)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      id: json['id'] as int?,
      userId: json['userId'] as int,
      date: DateTime.parse(json['date'] as String),
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'productId': instance.productId,
      'quantity': instance.quantity,
      'title': instance.title,
      'image': instance.image,
    };
