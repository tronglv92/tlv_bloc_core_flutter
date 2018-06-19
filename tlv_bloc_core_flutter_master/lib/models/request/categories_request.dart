import 'package:json_annotation/json_annotation.dart';
part "categories_request.g.dart";
@JsonSerializable()
class CategoriesRequest extends Object with _$CategoriesRequestSerializerMixin{
  CategoriesRequest({this.page,this.pageSize});
  @JsonKey(name: "page")
  final int page;
  @JsonKey(name: "pageSize")
  final int pageSize;
  factory CategoriesRequest.fromJson(Map<String,dynamic> json)=> _$CategoriesRequestFromJson(json);
}