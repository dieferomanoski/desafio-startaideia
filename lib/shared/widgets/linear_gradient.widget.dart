import "package:flutter/material.dart";
import 'package:tokio_marine/shared/utils/colors/colors.dart';

class CustomGradient extends StatelessWidget {
  Widget child;
  CustomGradient({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ColorsModel.primaryColor,
                ColorsModel.secundaryColor,
              ]),
          borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}
