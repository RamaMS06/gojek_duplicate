import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../app/router/routes.dart';
import '../../data/models/login_model.dart';
part 'landing_bloc_event.dart';
part 'landing_bloc_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingInitial()) {
    on<GetDataSliderLandingEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      List<Map<String, dynamic>> listSlider = [
        {
          'img_slider': 'img-slider3.jpeg',
          'title': 'Welcome to Gojek!',
          'desc':
              'Your go-to app for a hassle-free life, We are here to help with all your need anythime, anywhere.'
        },
        {
          'img_slider': 'img-slider2.png',
          'title': 'Transport & logistics',
          'desc': 'Daily commute and goods delivery made easy.'
        },
        {
          'img_slider': 'img-slider1.png',
          'title': 'Order food & groceries',
          'desc': 'Either need on cravins, we got you covered'
        }
      ];

      emit(LandingLoaded(
          listSlider.map((e) => LoginModel.fromJson(e)).toList(), 0));
    });

    on<LandingChangeSliderIndexEvent>((event, emit) {
      emit(LandingLoaded(state.listLogin ?? [], event.index));
    });

    on<GoToLoginEvent>((event, emit) {
      Get.toNamed(Routes.loginPage);
    });
  }

  @override
  void onEvent(LandingEvent event) {
    super.onEvent(event);
  }
}
