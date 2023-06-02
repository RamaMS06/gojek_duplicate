import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gojek_duplicate/app/core/utils.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            backgroundColor: AtomColors.primaryColor,
            middle: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                    width: Get.width,
                    child: CupertinoTextField(
                        // prefix: Icon(Icons),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
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
        child: Column(
          children: const [],
        ));
  }
}
