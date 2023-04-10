import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<HomeData>? data;
  HomeSupport? support;

  HomeEntity(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});

  @override
  List<Object?> get props => [page, perPage, total, totalPages, data, support];
}

class HomeData extends Equatable {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  HomeData({this.id, this.email, this.firstName, this.lastName, this.avatar});

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];
}

class HomeSupport extends Equatable {
  String? url;
  String? text;

  HomeSupport({this.url, this.text});

  @override
  List<Object?> get props => [url, text];
}
