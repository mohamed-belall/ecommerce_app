class HomeModels {  bool? status;  HomeDataModel? data;  HomeModels.fromJson(Map<String, dynamic> json) {    status = json['status'];    data = HomeDataModel.formJson(json['data']);  }}class HomeDataModel {  List<BannerModel> banner = [];  List<ProductModel> product = [];  HomeDataModel.formJson(Map<String, dynamic> json) {    json['banners'].forEach((element) {      banner.add(BannerModel.formJson(element));    });    json['products'].forEach((element) {      product.add(ProductModel.fromJson(element));    });  }}class BannerModel {  int? id;  String? image;  BannerModel.formJson(Map<String, dynamic> json) {    id = json['id'];    image = json['image'];  }}class ProductModel {  int? id;  dynamic price;  dynamic oldPrice;  dynamic discount;  String? image;  String? name;  bool? inFavorites;  bool? inCart;  ProductModel.fromJson(Map<String, dynamic> json) {    id = json['id'];    price = json['price'];    oldPrice = json['old_price'];    discount = json['discount'];    image = json['image'];    name = json['name'];    inFavorites = json['in_favorites'];    inCart = json['in_cart'];  }}