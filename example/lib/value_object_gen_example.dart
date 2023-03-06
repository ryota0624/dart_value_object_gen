import 'dart:convert';

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

@ValueObject2(className: 'UserAge')
abstract class _UserAgeDef {
  int get _value;
  UserAge increment() {
    return UserAge(_value + 1);
  }
}

@JsonSerializable(explicitToJson: true)
class User {
  final UserName name;
  final UserAge age;

  User(this.name, this.age);
}

void main() {
  final user = User(UserName('string'), UserAge(100));
  print(_$UserToJson(user));
  final jsonString = jsonEncode(_$UserToJson(user));
  final u = (_$UserFromJson(jsonDecode(jsonString)));
  final age = u.age.increment();
  print(age);
}