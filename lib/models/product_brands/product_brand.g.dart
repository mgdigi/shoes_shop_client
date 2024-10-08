// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBrands _$ProductBrandsFromJson(Map<String, dynamic> json) =>
    ProductBrands(
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductBrandsToJson(ProductBrands instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
