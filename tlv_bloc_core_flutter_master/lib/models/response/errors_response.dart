
import 'package:json_annotation/json_annotation.dart';
import 'package:tlv_bloc_core_flutter_master/models/response/error_response.dart';
part "errors_response.g.dart";
@JsonSerializable()
class ErrorsResponse extends Object with _$ErrorsResponseSerializerMixin{
  @JsonKey(name: "errors")
  final List<ErrorResponse> errors;
  ErrorsResponse({this.errors});


  factory ErrorsResponse.fromJson(Map<String,dynamic> json)=> _$ErrorsResponseFromJson(json);
}