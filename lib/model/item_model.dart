class ItemModel {
  List<Data>? data;

  ItemModel({this.data});

  ItemModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  int? id;
  String? description;
  String? price;
  String? image;

  Data({this.name, this.id, this.description, this.price, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
