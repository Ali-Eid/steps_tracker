import '../../domain/entity/user_entity.dart';

class Usermodel extends UserEntity {
  const Usermodel({required super.name, required super.uid});

  factory Usermodel.fromjson(Map<String, dynamic> json) {
    return Usermodel(name: json['name'], uid: json['uid']);
  }
}
