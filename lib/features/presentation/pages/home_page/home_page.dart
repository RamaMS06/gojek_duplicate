import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gojek_duplicate/app/core/utils.dart';
import 'package:gojek_duplicate/features/presentation/blocs/bloc/home_bloc.dart';
import 'package:gojek_duplicate/features/presentation/widgets/shimmer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => HomeBloc()..add(HomeCardLoadedEvent())),
      child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              border: Border.all(color: Colors.transparent),
              backgroundColor: AtomColors.green1,
              middle: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                      width: Get.width,
                      child: CupertinoTextField(
                          showCursor: false,
                          onTap: () {
                            Get.toNamed(Routes.searchPage);
                            HomeBloc().close();
                          },
                          prefix: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(Icons.search)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          placeholder: 'Find services, food, or places',
                          style: AtomTextStyle.sansLight.copyWith(fontSize: 12),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))))),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/images/img-dummy-profile.png',
                        width: 40, height: 40, fit: BoxFit.cover)),
              )),
          child: Scaffold(
              body: Column(
            children: [
              Container(height: 10, width: Get.width, color: AtomColors.green1),
              Expanded(
                child: ListView(children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeCardLoadingState) {
                        return const ShimmerTemplate(
                            height: 130, padding: EdgeInsets.all(16));
                      } else if (state is HomeCardLoadedState) {
                        return Card(
                          margin: const EdgeInsets.all(16),
                          color: AtomColors.blue1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 30,
                                      width: 2,
                                      child: ListView.separated(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: ((context, index) =>
                                              Container(
                                                  height: 10,
                                                  width: 2,
                                                  color: index ==
                                                          state.activePage
                                                      ? Colors.white
                                                      : Colors.white
                                                          .withOpacity(0.3))),
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(height: 8),
                                          itemCount: 2)),
                                  const SizedBox(width: 8),
                                  SizedBox(
                                    width: 127,
                                    height: 90,
                                    child: PageView.builder(
                                        onPageChanged: (page) {
                                          context.read<HomeBloc>().add(
                                              HomeCardLoadedEvent(
                                                  index: page,
                                                  userModel: state.userModel));
                                        },
                                        controller: PageController(
                                            viewportFraction: 0.78),
                                        itemCount: 2,
                                        scrollDirection: Axis.vertical,
                                        pageSnapping: true,
                                        itemBuilder: ((context, position) {
                                          bool active =
                                              position == state.activePage;
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: AnimatedContainer(
                                              curve: Curves.easeInOut,
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(
                                                          !active ? 0.5 : 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: !active ? 4 : 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(children: [
                                                      Image.asset(
                                                          'assets/icons/ic-gopay.png',
                                                          height: 14,
                                                          width: 55),
                                                      state.userModel?[position]
                                                                  .type ==
                                                              0
                                                          ? const Text('Coins')
                                                          : const SizedBox
                                                              .shrink()
                                                    ]),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                        'Rp ${state.userModel?[position].amount.toString() ?? ''}',
                                                        style: AtomTextStyle
                                                            .sansMedium)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        })),
                                  ),
                                ],
                              )),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ]),
              ),
            ],
          ))),
    );
  }
}
