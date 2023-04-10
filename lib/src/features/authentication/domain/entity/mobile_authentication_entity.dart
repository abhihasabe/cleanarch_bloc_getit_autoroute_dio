import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  int? status;
  String? message;
  DataEntity? data;

  LoginEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];
}

class DataEntity extends Equatable {
  int? id;
  String? firstname;
  String? lastname;
  String? mobile;
  String? password;
  String? aadhar;
  String? license;
  String? address;
  String? city;
  String? state;
  String? pin;
  int? status;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;

  DataEntity(
      {this.id,
      this.firstname,
      this.lastname,
      this.mobile,
      this.password,
      this.aadhar,
      this.license,
      this.address,
      this.city,
      this.state,
      this.pin,
      this.status,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        firstname,
        lastname,
        mobile,
        password,
        aadhar,
        license,
        address,
        city,
        state,
        pin,
        status,
        rememberToken,
        createdAt,
        updatedAt
      ];
}
