class FavoritesModels {
  bool? status;
  Data? data;
  FavoritesModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<FavoritesData> data = [];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? path;
  int? perPage;
  int? to;
  int? total;
  Data.fromJson(Map<String, dynamic> json) {
    firstPageUrl = json['first_page_url'];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(FavoritesData.fromJson(element));
      });
    }
    from = json['from'];
    to = json['to'];
    path = json['path'];
    lastPageUrl = json['last_page_url'];
    lastPage = json['last_page'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    total = json['total'];
  }
}

class FavoritesData {
  int? id;
  Product? product;
  FavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
