import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/card_data_user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeCardChangeEvent>((event, emit) async {
      emit(HomeCardLoadedState(activePage: event.index));
    });

    on<HomeCardLoadedEvent>((event, emit) async {
      emit(HomeCardLoadingState());
      if (event.index == null) {
        await Future.delayed(const Duration(seconds: 3));
        emit(HomeCardLoadedState(userModel: [
          CardDataUserModel(type: 0, amount: 150000, img: ''),
          CardDataUserModel(type: 1, amount: 5500000, img: '')
        ]));
      } else {
        emit(HomeCardLoadedState(
            activePage: event.index, userModel: event.userModel));
      }
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
