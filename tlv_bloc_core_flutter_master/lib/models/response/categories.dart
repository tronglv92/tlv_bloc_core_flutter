
import 'package:json_annotation/json_annotation.dart';

import 'package:tlv_bloc_core_flutter_master/models/response/category.dart';
part "categories.g.dart";
@JsonSerializable()
class Categories extends Object with _$CategoriesSerializerMixin{
  Categories({this.data});
  @JsonKey(name: "data")
  final List<Category> data;

  factory Categories.fromJson(Map<String,dynamic> json)=> _$CategoriesFromJson(json);
}