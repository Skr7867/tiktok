// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartnerHiveAdapter extends TypeAdapter<PartnerHive> {
  @override
  final int typeId = 2;

  @override
  PartnerHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartnerHive(
      id: fields[0] as String?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      phone: fields[3] as String?,
      location: fields[4] as String?,
      registrationType: fields[5] as String?,
      gstNumber: fields[6] as String?,
      businessDocumentUrl: fields[7] as String?,
      role: fields[8] as String?,
      blocked: fields[9] as bool?,
      isApproved: fields[10] as String?,
      createdAt: fields[11] as String?,
      registeredUsersCount: fields[13] as int?,
      updatedAt: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PartnerHive obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.registrationType)
      ..writeByte(6)
      ..write(obj.gstNumber)
      ..writeByte(7)
      ..write(obj.businessDocumentUrl)
      ..writeByte(8)
      ..write(obj.role)
      ..writeByte(9)
      ..write(obj.blocked)
      ..writeByte(10)
      ..write(obj.isApproved)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.registeredUsersCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartnerHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
