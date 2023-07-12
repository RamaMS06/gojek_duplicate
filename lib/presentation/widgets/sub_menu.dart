import 'package:flutter/material.dart';
import 'package:gojek_duplicate/app/core/utils.dart';

class SubMenuCardHome extends StatelessWidget {
  final String icons;
  final String label;
  const SubMenuCardHome({required this.icons, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/cardmenus/$icons.png',
              width: 24, height: 24),
          const SizedBox(height: 8),
          Text(label,
              style: AtomTextStyle.sansBold
                  .copyWith(fontSize: 12, color: Colors.white))
        ],
      ),
    );
  }
}
