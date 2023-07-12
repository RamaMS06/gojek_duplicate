import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojek_duplicate/app/core/utils.dart';
import 'package:gojek_duplicate/presentation/widgets/buttons.dart';

import '../../../blocs/landing/landing_bloc.dart';
import '../../widgets/shimmer.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandingBloc()..add(GetDataSliderLandingEvent()),
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: Material(
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/icons/core/ic-gojek-2.png',
                            width: 100, height: 40),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.125))),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.translate, size: 16),
                                  const SizedBox(width: 4),
                                  Text('English',
                                      style: AtomTextStyle.sansLight
                                          .copyWith(fontSize: 12))
                                ]))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.38),
                        child: BlocBuilder<LandingBloc, LandingState>(
                          builder: (context, state) {
                            return PageView.builder(
                                onPageChanged: (index) {
                                  if (context.read<LandingBloc>().state
                                      is LandingLoaded) {
                                    context.read<LandingBloc>().add(
                                        LandingChangeSliderIndexEvent(index));
                                  }
                                },
                                pageSnapping: true,
                                physics: const PageScrollPhysics(),
                                itemBuilder: ((context, index) =>
                                    BlocBuilder<LandingBloc, LandingState>(
                                      builder: (context, state) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: ClipRRect(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: state is LandingLoaded
                                                    ? Image.asset(
                                                        'assets/images/slider/${state.listLogin?[index].imgSlider}',
                                                        height: 200,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : ShimmerTemplate(
                                                        height: 190,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                      ),
                                              ),
                                            ),
                                            const SizedBox(height: 40),
                                            state is LandingLoaded
                                                ? Text(
                                                    state.listLogin?[index]
                                                            .title ??
                                                        '',
                                                    style: AtomTextStyle
                                                        .sansBold
                                                        .copyWith(fontSize: 24))
                                                : const ShimmerTemplate(
                                                    height: 25,
                                                    width: 100,
                                                    radius: 5,
                                                  ),
                                            const SizedBox(height: 8),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: state is LandingLoaded
                                                  ? Text(
                                                      state.listLogin?[index]
                                                              .desc ??
                                                          '',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: AtomTextStyle
                                                          .sansLight)
                                                  : ShimmerTemplate(
                                                      height: 15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      radius: 5),
                                            )
                                          ],
                                        );
                                      },
                                    )),
                                itemCount: 3);
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                          height: 8,
                          child: BlocBuilder<LandingBloc, LandingState>(
                            builder: (context, state) {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: state.listLogin?.length ?? 0,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: ((context, index) =>
                                      AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 250),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: index == state.index
                                                  ? 0
                                                  : 3.5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: state.index == index
                                                  ? AtomColors.green1
                                                  : Colors.grey),
                                          width: 8)));
                            },
                          )),
                      const SizedBox(height: 28),
                      BlocBuilder<LandingBloc, LandingState>(
                        builder: (context, state) {
                          return ButtonTemplate(
                              label: 'Log in',
                              type: ButtonTemplateType.primary,
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              onTap: () {
                                context
                                    .read<LandingBloc>()
                                    .add(GoToLoginEvent());
                              });
                        },
                      ),
                      const SizedBox(height: 4),
                      ButtonTemplate(
                        label: 'I\'m new, sign me up',
                        type: ButtonTemplateType.secondary,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        onTap: () {},
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                            'By loggin in or registering, you agree to our Terms of service and Privacy policy.',
                            style: AtomTextStyle.sansLight
                                .copyWith(fontSize: 12, height: 1.5)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
