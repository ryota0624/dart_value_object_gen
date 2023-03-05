import 'package:json_annotation/json_annotation.dart';
import 'package:value_object_gen/builder.dart';
part 'value_object_gen_example.g.dart';

@ValueObject()
abstract class UserName {
  final String _value;
  UserName._(this._value);

  factory UserName(String string) => _UserNameImpl(string);
  String toJson() => _value;
  factory UserName.fromJson(String str) => UserName(str);
}

@valueObject
abstract class UserAge {
  final int _value;
  UserAge._(this._value);

  factory UserAge(int value) => _UserAgeImpl(value);
  int toJson() => _value;
  factory UserAge.fromJson(int value) => UserAge(value);
}

@JsonSerializable(explicitToJson: true)
class User {
  final UserName name;

  User(this.name);
}