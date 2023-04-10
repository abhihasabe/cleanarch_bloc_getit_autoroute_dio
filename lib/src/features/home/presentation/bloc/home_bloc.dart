import 'package:bloc_clean/src/features/home/data/model/home_model.dart';
import 'package:bloc_clean/src/features/home/presentation/bloc/home_event.dart';
import 'package:bloc_clean/src/features/home/presentation/bloc/home_state.dart';
import 'package:bloc_clean/src/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_clean/di/injection.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final users = await locator.get<HomeUseCase>().invoke();
        users.fold(
            (left) => {
              emit(HomeErrorState(left.props.first.toString()))
            },
            (right) => {
              emit(HomeLoadedState(HomeModel.fromJson(right)))
            });
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }
}
