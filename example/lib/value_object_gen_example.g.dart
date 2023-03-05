// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_object_gen_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      UserName.fromJson(json['name'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name.toJson(),
    };

// **************************************************************************
// ValueObjectGenerator
// **************************************************************************

class _UserNameImpl extends UserName {
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is _UserNameImpl && o._value == _value;
  }

  _UserNameImpl(String value) : super._(value);

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() {
    return _value.toString();
  }
}

class _UserAgeImpl extends UserAge {
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is _UserAgeImpl && o._value == _value;
  }

  _UserAgeImpl(int value) : super._(value);

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() {
    return _value.toString();
  }
}
