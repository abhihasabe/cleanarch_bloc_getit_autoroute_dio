import 'package:bloc_clean/src/features/home/domain/entity/home_entity.dart';

class HomeModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<HomeDataModel>? data;
  HomeSupportModel? support;

  HomeModel(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});

  HomeModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <HomeDataModel>[];
      json['data'].forEach((v) {
        data!.add(HomeDataModel.fromJson(v));
      });
    }
    support =
        json['support'] != null ? HomeSupportModel.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      data['support'] = support!.toJson();
    }
    return data;
  }
}

class HomeDataModel extends HomeData{
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  HomeDataModel({this.id, this.email, this.firstName, this.lastName, this.avatar});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}

class HomeSupportModel extends HomeSupport {
  String? url;
  String? text;

  HomeSupportModel({this.url, this.text});

  HomeSupportModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['text'] = text;
    return data;
  }
}
