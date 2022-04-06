// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiveStorage_medicine_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineHistoryAdapter extends TypeAdapter<MedicineHistory> {
  @override
  final int typeId = 2;

  @override
  MedicineHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineHistory(
      medicineid: fields[0] as int,
      alarmTime: fields[1] as String,
      takeTime: fields[2] as DateTime, 
      medicineKey: fields[3] == null ? -1 : fields[3] as int, imagePath: '', name: '',
    );
  }

  @override
  void write(BinaryWriter writer, MedicineHistory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.medicineid)
      ..writeByte(1)
      ..write(obj.alarmTime)
      ..writeByte(2)
      ..write(obj.takeTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}