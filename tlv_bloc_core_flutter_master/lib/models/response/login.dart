import 'package:tlv_bloc_core_flutter_master/models/response/user.dart';
import 'package:json_annotation/json_annotation.dart';
part "login.g.dart";
@JsonSerializable()
class Login extends Object with _$LoginSerializerMixin{
  Login({this.user});
  @JsonKey(name: "data")
  final User user;
  factory Login.fromJson(Map<String,dynamic> json)=> _$LoginFromJson(json);
}