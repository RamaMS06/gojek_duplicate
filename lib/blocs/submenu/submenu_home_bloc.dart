import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/submenu_home_model.dart';
part 'submenu_home_event.dart';
part 'submenu_home_state.dart';

class SubmenuHomeBloc extends Bloc<SubmenuHomeEvent, SubmenuHomeState> {
  SubmenuHomeBloc() : super(SubmenuHomeInitial()) {
    
    on<SubMenuGetDataEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 4));

      List<Map<String, dynamic>> listData = [
        {'label': 'GoRide', 'icons': 'ic-goride'},
        {'label': 'GoCar', 'icons': 'ic-gocar'},
        {'label': 'GoFood', 'icons': 'ic-gofood'},
        {'label': 'GoSend', 'icons': 'ic-gosend'},
        {'label': 'GoMart', 'icons': 'ic-gomart'},
        {'label': 'GoPulsa', 'icons': 'ic-gopulsa'},
        {'label': 'GoClub', 'icons': 'ic-goclub'},
        {'label': 'Lainnya', 'icons': 'ic-lainnya'}
      ];

      emit(SubMenuHomeLoaded(
          listData.map((e) => SubMenuHomeModel.fromJson(e)).toList()));
    });
  }
}
