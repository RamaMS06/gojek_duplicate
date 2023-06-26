import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gojek_duplicate/app/core/utils.dart';
part 'splash_page_event.dart';
part 'splash_page_state.dart';

class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  SplashPageBloc() : super(SplashPageInitial()) {
    on<LoadSplashPageEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashPageLoaded());
    });

    on<GoToLoginPageEvent>((event, emit) {
      Get.offNamed(Routes.loginPage);
    });
  }
}
