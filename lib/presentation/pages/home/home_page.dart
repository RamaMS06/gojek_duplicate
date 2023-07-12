import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gojek_duplicate/app/core/extension.dart';
import 'package:gojek_duplicate/app/core/utils.dart';
import '../../../../app/router/routes.dart';
import '../../../blocs/card_home/card_home_bloc.dart';
import '../../../blocs/submenu/submenu_home_bloc.dart';
import '../../../blocs/treasure/treasure_home_bloc.dart';
import '../../widgets/shimmer.dart';
import '../../widgets/sub_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: appBarHomePage(),
        child: Scaffold(
            body: Column(children: [
          Container(
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: AtomColors.green1),
          Expanded(
              child: ListView(children: const [
            _HomeCardSection(),
            _HomeSubMenuSection(),
            _HomeTreasureSection()
          ]))
        ])));
  }
}

appBarHomePage() {
  return CupertinoNavigationBar(
      border: Border.all(color: Colors.transparent),
      backgroundColor: AtomColors.green1,
      middle: Material(
          type: MaterialType.transparency,
          child: InkWell(
              onTap: () {
                Get.toNamed(Routes.searchPage);
              },
              child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                      width: Get.width,
                      child: CupertinoTextField(
                          showCursor: false,
                          enabled: false,
                          prefix: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(CupertinoIcons.search,
                                  color: CupertinoColors.black)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          placeholder: 'Find services, food, or places',
                          placeholderStyle: AtomTextStyle.sansLight.copyWith(
                              color: CupertinoColors.placeholderText,
                              height: 1.5,
                              fontSize: 12),
                          decoration: const BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))))))),
      trailing: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/images/img-dummy-profile.png',
                  width: 40, height: 40, fit: BoxFit.cover))));
}

class _HomeCardSection extends StatelessWidget {
  const _HomeCardSection();

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(16),
        color: AtomColors.blue1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    SizedBox(
                        height: 30,
                        width: 2,
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) =>
                                BlocBuilder<CardHomeBloc, CardHomeState>(
                                    builder: (context, state) {
                                  var activePage = state.activePage;
                                  return Container(
                                      height: 10,
                                      width: 2,
                                      color: index == activePage
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.3));
                                })),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: 2)),
                    const SizedBox(width: 8),
                    SizedBox(
                        width: 127,
                        height: 92,
                        child: PageView.builder(
                            onPageChanged: (page) {
                              if (context.read<CardHomeBloc>().state
                                  is HomeCardLoadedState) {
                                context
                                    .read<CardHomeBloc>()
                                    .add(CardChangeIndexEvent(page));
                              }
                            },
                            controller: PageController(viewportFraction: 0.78),
                            itemCount: 2,
                            scrollDirection: Axis.vertical,
                            pageSnapping: true,
                            itemBuilder: ((context, position) {
                              return Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child:
                                      BlocBuilder<CardHomeBloc, CardHomeState>(
                                    builder: (context, state) {
                                      return AnimatedContainer(
                                          curve: Curves.easeInOut,
                                          decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(
                                                  position != state.activePage
                                                      ? 0.5
                                                      : 1),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          duration:
                                              const Duration(milliseconds: 500),
                                          margin: EdgeInsets.symmetric(
                                              horizontal:
                                                  position != state.activePage
                                                      ? 4
                                                      : 0),
                                          child: Material(
                                              type: MaterialType.transparency,
                                              child: InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<CardHomeBloc>()
                                                        .add(
                                                            CardNextPageEvent());
                                                  },
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  splashColor: Colors.black12,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child:
                                                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                        Row(children: [
                                                          Image.asset(
                                                              'assets/icons/cardmenus/ic-gopay.png',
                                                              height: 14,
                                                              width: 55),
                                                          const SizedBox(
                                                              width: 4),
                                                          state.activePage != 1
                                                              ? const Text(
                                                                  'coins',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12),
                                                                )
                                                              : const SizedBox
                                                                  .shrink()
                                                        ]),
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 4,
                                                                    bottom: 2),
                                                            child: state
                                                                    is HomeCardLoadedState
                                                                ? Text(
                                                                    formatCurrency(
                                                                        state.userModel?[position].amount.toString() ??
                                                                            '',
                                                                        symbol:
                                                                            'Rp '),
                                                                    style: AtomTextStyle
                                                                        .sansBold)
                                                                : const ShimmerTemplate(
                                                                    height: 13,
                                                                    width: 100,
                                                                    radius: 7)),
                                                        Text('Tap for history',
                                                            style: AtomTextStyle
                                                                .sansMedium
                                                                .copyWith(
                                                                    color: AtomColors
                                                                        .green2,
                                                                    fontSize:
                                                                        12))
                                                      ])))));
                                    },
                                  ));
                            })))
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SubMenuCardHome(icons: 'ic-bayar', label: 'Pay'),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            child: SubMenuCardHome(
                                icons: 'ic-topup', label: 'Top Up')),
                        SubMenuCardHome(icons: 'ic-eksplor', label: 'Eksplore'),
                        SizedBox(width: 8)
                      ])
                ])));
  }
}

class _HomeSubMenuSection extends StatelessWidget {
  const _HomeSubMenuSection();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 10),
        itemCount: 8,
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 18, crossAxisSpacing: 5, crossAxisCount: 4),
        itemBuilder: ((context, index) =>
            BlocBuilder<SubmenuHomeBloc, SubmenuHomeState>(
              builder: (context, state) {
                return InkWell(
                  onTap: state is SubMenuHomeLoaded
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AtomColors.red1,
                            content: Text(
                                'Sorry menu ${state.subMenuModel?[index].label} in maintenaince!',
                                style: AtomTextStyle.sansBold),
                          ));
                        }
                      : () {},
                  child: Column(
                    children: [
                      state is SubMenuHomeLoaded
                          ? Image.asset(
                              'assets/icons/submenus/${state.subMenuModel?[index].icons}.png',
                              fit: BoxFit.cover,
                              width: 44,
                              height: 44)
                          : const ShimmerTemplate(
                              height: 44, width: 44, radius: 30),
                      const SizedBox(height: 9),
                      state is SubMenuHomeLoaded
                          ? Text(state.subMenuModel?[index].label ?? '')
                          : const ShimmerTemplate(
                              height: 14, width: 50, radius: 5)
                    ],
                  ),
                );
              },
            )));
  }
}

class _HomeTreasureSection extends StatelessWidget {
  const _HomeTreasureSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TreasureHomeBloc, TreasureHomeState>(
      builder: (context, state) {
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [Colors.white, Color(0xFFEAF3F6)],
                )),
            child: Stack(children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Image.asset('assets/images/bg-treasure.png',
                      width: 120, height: 57, fit: BoxFit.cover)),
              Positioned.fill(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/treasure/ic-treasure.png',
                                width: 40, height: 40),
                            const SizedBox(width: 14),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      '${state.totalPercentTreasure?.toInt()} XP lagi ada Harta Karun',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 8),
                                  Stack(children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        color: const Color(0xffBBBBBB),
                                        height: 4),
                                    AnimatedContainer(
                                        width: state is TreasureHomeLoadedState
                                            ? state.percentTreasure
                                            : 0,
                                        height: 4,
                                        color: AtomColors.green1,
                                        curve: Curves.easeInOut,
                                        duration:
                                            const Duration(milliseconds: 350))
                                  ])
                                ])
                          ])))
            ]));
      },
    );
  }
}
