import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gojek_duplicate/data/repository/countries/countries_repo.dart';
import 'package:gojek_duplicate/di/locator.dart';

import '../../data/models/countries_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  FocusNode fnPhoneNumber = FocusNode();
  TextEditingController tcPhoneNumber = TextEditingController();

  LoginBloc() : super(LoginInitial()) {
    on<FetchCountries>((event, emit) async {
      final countries = await locator.get<CountriesRepo>().getCountries();
      emit(LoginLoaded(countries,
          itemCountries: countries[0], isShowKeyboard: false));
    });

    on<LoginAnimate>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(LoginLoaded(state.listCountries ?? [],
          itemCountries: state.itemCountries, isShowKeyboard: true));
    });

    on<GoBackToLanding>((event, emit) {
      Get.back();
      SystemChannels.textInput.invokeMethod("TextInput.hide");
    });
  }
}
