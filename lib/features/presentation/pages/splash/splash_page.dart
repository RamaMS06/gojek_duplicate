import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojek_duplicate/app/core/utils.dart';
import 'package:gojek_duplicate/features/presentation/blocs/splash_page/splash_page_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashPageBloc()..add(LoadSplashPageEvent()),
      child: BlocListener<SplashPageBloc, SplashPageState>(
        listener: (context, state) {
          context.read<SplashPageBloc>().add(GoToLoginPageEvent());
        },
        child: Scaffold(
            body: Stack(children: [
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('assets/icons/core/ic-gojek.png',
                  width: 120, height: 120, fit: BoxFit.cover)
            ]),
          ),
          Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Column(children: [
                Text('from', style: AtomTextStyle.sansMedium),
                Image.asset('assets/icons/core/ic-goto.png',
                    width: 60, height: 30)
              ]))
        ])),
      ),
    );
  }
}
