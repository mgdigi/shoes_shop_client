import 'package:json_annotation/json_annotation.dart';

part 'product_brand.g.dart';


@JsonSerializable()
class ProductBrands {
  @JsonKey(name : "id")
  String? id;

  @JsonKey(name : "name")
  String? name;

  @JsonKey(name : "imageUrl")
  String? imageUrl;


  ProductBrands({
    this.id,
    this.imageUrl,
    this.name
  });

  factory ProductBrands.fromJson(Map<String, dynamic> json) => _$ProductBrandsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBrandsToJson(this);

}