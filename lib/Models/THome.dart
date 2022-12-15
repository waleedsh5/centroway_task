class THome {
  int? status;
  List<Data>? data;

  THome({this.status, this.data});

  THome.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  int? parentId;
  int? position;
  int? status;
  int? priority;
  int? moduleId;
  List<Items>? items;

  Data(
      {this.id,
      this.name,
      this.image,
      this.parentId,
      this.position,
      this.status,
      this.priority,
      this.moduleId,
      this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    parentId = json['parent_id'];
    position = json['position'];
    status = json['status'];
    priority = json['priority'];
    moduleId = json['module_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['parent_id'] = parentId;
    data['position'] = position;
    data['status'] = status;
    data['priority'] = priority;
    data['module_id'] = moduleId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  List<CategoryIds>? categoryIds;

  List<AddOns>? addOns;

  double? price;
  int? tax;
  String? taxType;
  int? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? veg;
  int? status;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  int? orderCount;
  int? avgRating;
  int? ratingCount;

  int? moduleId;
  int? stock;

  List<String>? images;

  String? dynamicLink;
 // List<Media>? media;

  Items(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.categoryId,
      this.categoryIds,
      this.addOns,
      this.price,
      this.tax,
      this.taxType,
      this.discount,
      this.discountType,
      this.availableTimeStarts,
      this.availableTimeEnds,
      this.veg,
      this.status,
      this.storeId,
      this.createdAt,
      this.updatedAt,
      this.orderCount,
      this.avgRating,
      this.ratingCount,
      this.moduleId,
      this.stock,
      this.images,
      this.dynamicLink,
     // this.media
      });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    categoryId = json['category_id'];
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds!.add(CategoryIds.fromJson(v));
      });
    }

    if (json['add_ons'] != null) {
      addOns = <AddOns>[];
      json['add_ons'].forEach((v) {
        addOns!.add(AddOns.fromJson(v));
      });
    }

   // price = json['price'];
    tax = json['tax'];
    taxType = json['tax_type'];
    discount = json['discount'];
    discountType = json['discount_type'];
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
    veg = json['veg'];
    status = json['status'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderCount = json['order_count'];
    avgRating = json['avg_rating'];
    ratingCount = json['rating_count'];

    moduleId = json['module_id'];
    stock = json['stock'];

    images = json['images'].cast<String>();

    dynamicLink = json['dynamic_link'];
    // if (json['media'] != null) {
    //   media = <Media>[];
    //   json['media'].forEach((v) {
    //     media!.add(Media.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['category_id'] = categoryId;
    if (categoryIds != null) {
      data['category_ids'] = categoryIds!.map((v) => v.toJson()).toList();
    }

    if (addOns != null) {
      data['add_ons'] = addOns!.map((v) => v.toJson()).toList();
    }

    data['price'] = price;
    data['tax'] = tax;
    data['tax_type'] = taxType;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['available_time_starts'] = availableTimeStarts;
    data['available_time_ends'] = availableTimeEnds;
    data['veg'] = veg;
    data['status'] = status;
    data['store_id'] = storeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['order_count'] = orderCount;
    data['avg_rating'] = avgRating;
    data['rating_count'] = ratingCount;

    data['module_id'] = moduleId;
    data['stock'] = stock;

    data['images'] = images;

    data['dynamic_link'] = dynamicLink;
    // if (media != null) {
    //   data['media'] = media!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class CategoryIds {
  String? id;
  int? position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['position'] = position;
    return data;
  }
}

class AddOns {
  int? id;
  String? name;
  double? price;
  String? createdAt;
  String? updatedAt;
  int? storeId;
  int? status;

  AddOns(
      {this.id,
      this.name,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.storeId,
      this.status});

  AddOns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    storeId = json['store_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['store_id'] = storeId;
    data['status'] = status;
    return data;
  }
}

// class Media {
//   int? id;
//   String? type;
//   String? imageableType;
//   int? imageableId;
//   String? thumbnail;
//   String? mainImage;

//   Media(
//       {this.id,
//       this.type,
//       this.imageableType,
//       this.imageableId,
//       this.thumbnail,
//       this.mainImage});

//   Media.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     type = json['type'];
//     imageableType = json['imageable_type'];
//     imageableId = json['imageable_id'];
//     thumbnail = json['thumbnail'];
//     mainImage = json['main_image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['type'] = type;
//     data['imageable_type'] = imageableType;
//     data['imageable_id'] = imageableId;
//     data['thumbnail'] = thumbnail;
//     data['main_image'] = mainImage;
//     return data;
//   }
// }
