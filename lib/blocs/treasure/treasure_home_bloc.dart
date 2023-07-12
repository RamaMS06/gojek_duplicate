import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'treasure_home_event.dart';
part 'treasure_home_state.dart';

class TreasureHomeBloc extends Bloc<TreasureHomeEvent, TreasureHomeState> {
  TreasureHomeBloc() : super(TreasureHomeInitial()) {
    on<TreasureGetDataEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));

      Random ran = Random();
      int maxPercent = 200;
      for (var i = 0; i < maxPercent; i++) {
        double finalRandom = ran.nextInt(maxPercent).toDouble();
        emit(TreasureHomeLoadedState(
            finalRandom, maxPercent.toDouble() - finalRandom));
      }
    });
  }
}
