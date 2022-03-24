import 'package:flutter/material.dart';
import 'package:tokio_marine/shared/utils/colors/colors.dart';

class CustomContainer extends StatelessWidget {
  Widget child;
  CustomContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorsModel.backgroundColorLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
