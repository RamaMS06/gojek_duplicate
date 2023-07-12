import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojek_duplicate/app/core/utils.dart';
import 'package:gojek_duplicate/blocs/login/login_bloc.dart';
import 'package:gojek_duplicate/presentation/widgets/buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()
        ..add(FetchCountries())
        ..add(LoginAnimate()),
      child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            border: Border.all(color: Colors.transparent),
            automaticallyImplyLeading: false,
            middle: Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return InkWell(
                            onTap: () {
                              context.read<LoginBloc>().add(GoBackToLanding());
                            },
                            child: const Icon(Icons.arrow_back_outlined,
                                size: 24));
                      },
                    ),
                    const SizedBox(width: 18),
                    Image.asset('assets/icons/core/ic-gojek-2.png',
                        width: 100, height: 40)
                  ],
                ),
              ),
            ),
            trailing: Container(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.question_mark_rounded,
                      color: Colors.white, size: 18),
                )),
          ),
          child: Material(
              child: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ListView(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 24),
                    children: [
                      Text('Enter your phone number',
                          style: AtomTextStyle.sansBold.copyWith(fontSize: 22)),
                      const SizedBox(height: 8),
                      Text(
                          'You can log in or make an account if you\'re new to Gojek.',
                          style:
                              AtomTextStyle.sansLight.copyWith(fontSize: 16)),
                      const SizedBox(height: 24),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Phone number',
                            style: AtomTextStyle.sansBold
                                .copyWith(color: Colors.black, fontSize: 12)),
                        TextSpan(
                            text: '*',
                            style: AtomTextStyle.sansBold
                                .copyWith(color: AtomColors.red1))
                      ])),
                      const SizedBox(height: 14),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.08)),
                                    color: Colors.black.withOpacity(0.035)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      transform:
                                          Matrix4.translationValues(0, -2, 0),
                                      child: Text(
                                          state is LoginLoaded
                                              ? (state.itemCountries?.flag ??
                                                  '')
                                              : '',
                                          style: AtomTextStyle.sansBold
                                              .copyWith(fontSize: 18)),
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                        state is LoginLoaded
                                            ? (state.itemCountries?.dialCode ??
                                                '')
                                            : '',
                                        style: AtomTextStyle.sansBold
                                            .copyWith(fontSize: 13))
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              BlocConsumer<LoginBloc, LoginState>(
                                listener: ((context, state) {
                                  final controller = context.read<LoginBloc>();
                                  if (state is LoginLoaded) {
                                    if (state.isShowKeyboard ?? false) {
                                      FocusScope.of(context).requestFocus(
                                          controller.fnPhoneNumber);
                                      SystemChannels.textInput
                                          .invokeMethod("TextInput.show");
                                    }
                                  }
                                }),
                                builder: (context, state) {
                                  return Expanded(
                                      child: TextField(
                                    controller:
                                        context.read<LoginBloc>().tcPhoneNumber,
                                    focusNode:
                                        context.read<LoginBloc>().fnPhoneNumber,
                                    cursorHeight: 19,
                                    style: AtomTextStyle.sansBold,
                                    keyboardType: TextInputType.phone,
                                    cursorColor: AtomColors.green1,
                                    maxLength: 13,
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.only(bottom: 8, top: 8),
                                      hoverColor: Colors.black,
                                      counterText: '',
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black87)),
                                    ),
                                  ));
                                },
                              )
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      Text('Issue with number?',
                          style: AtomTextStyle.sansBold.copyWith(
                              color: AtomColors.green2,
                              decoration: TextDecoration.underline))
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 16,
                  right: 16,
                  child: ButtonTemplate(
                      label: 'Continue',
                      type: ButtonTemplateType.primary,
                      onTap: () {}),
                )
              ],
            ),
          ))),
    );
  }
}
