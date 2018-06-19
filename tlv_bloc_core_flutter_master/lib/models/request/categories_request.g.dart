// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesRequest _$CategoriesRequestFromJson(Map<String, dynamic> json) {
  return new CategoriesRequest(
      page: json['page'] as int, pageSize: json['pageSize'] as int);
}

abstract class _$CategoriesRequestSerializerMixin {
  int get page;
  int get pageSize;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'page': page, 'pageSize': pageSize};
}
