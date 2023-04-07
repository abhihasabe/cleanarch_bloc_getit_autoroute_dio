import 'package:equatable/equatable.dart';

class OTPValidationEntity extends Equatable {
  List<DataEntity>? data;
  List<DetailsEntity>? details;

  OTPValidationEntity({this.data, this.details});

  @override
  // TODO: implement props
  List<Object?> get props => [data, details];
}

class DataEntity extends Equatable {
  String? message;
  int? status;

  DataEntity({this.message, this.status});

  @override
  // TODO: implement props
  List<Object?> get props => [message, status];
}

class DetailsEntity extends Equatable {
  int? userCode;
  String? userName;
  String? fullName;
  int? empCode;
  int? sessionCode;
  String? token;

  DetailsEntity(
      {this.userCode,
      this.userName,
      this.fullName,
      this.empCode,
      this.sessionCode,
      this.token});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [userCode, userName, fullName, empCode, sessionCode, token];
}
