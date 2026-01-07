// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginResponseHiveAdapter extends TypeAdapter<LoginResponseHive> {
  @override
  final int typeId = 1;

  @override
  LoginResponseHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginResponseHive(
      success: fields[0] as bool?,
      message: fields[1] as String?,
      token: fields[2] as String?,
      partner: fields[3] as PartnerHive?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginResponseHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.token)
      ..writeByte(3)
      ..write(obj.partner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
