// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_object_gen_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      UserName.fromJson(json['name'] as String),
      json['age'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name.toJson(),
      'age': instance.age,
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

// **************************************************************************
// ValueObject2Generator
// **************************************************************************

class UserAge extends _UserAgeDef {
  final int _value;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is UserAge && o._value == _value;
  }

  UserAge(int this._value);

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() => _value.toString();

  int toJson() => _value;

  factory UserAge.fromJson(int json) => UserAge(json);
}
