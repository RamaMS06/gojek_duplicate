import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/card_data_user_model.dart';
part 'card_home_event.dart';
part 'card_home_state.dart';

class CardHomeBloc extends Bloc<CardHomeEvent, CardHomeState> {
  CardHomeBloc() : super(HomeInitialState()) {
    on<CardGetDataEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));

      List<Map<String, dynamic>> datas = [
        {'amount': 150000.0, 'type': 0, 'img': ''},
        {'amount': 99999999.0, 'type': 1, 'img': ''}
      ];

      emit(HomeCardLoadedState(
          0, datas.map((e) => CardDataUserModel.fromJson(e)).toList()));
    });

    on<CardChangeIndexEvent>((event, emit) {
      emit(HomeCardLoadedState(event.activePage, state.userModel ?? []));
    });

    on<CardNextPageEvent>((event, emit) {
      print('test');
    });
  }

  testing() {
    print('woy');
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
