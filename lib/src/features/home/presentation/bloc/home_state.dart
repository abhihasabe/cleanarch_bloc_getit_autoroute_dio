import 'package:bloc_clean/src/features/home/data/model/home_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  final HomeModel users;

  HomeLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
