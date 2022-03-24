import 'package:flutter/material.dart';
import 'package:tokio_marine/screens/home/widgets/scrollable_cards/custom_card.widget.dart';
import 'package:tokio_marine/shared/widgets/custom_container.widget.dart';

class ScrollableCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double customHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            CustomCard(
                icon: Icon(
                  Icons.drive_eta,
                  color: Colors.white,
                  size: 25,
                ),
                title: "Automóvel"),
            CustomCard(
                icon: Icon(
                  Icons.house,
                  color: Colors.white,
                  size: 25,
                ),
                title: "Residência"),
            CustomCard(
                icon: Icon(
                  Icons.monitor_heart,
                  color: Colors.white,
                  size: 25,
                ),
                title: "Vida"),
            CustomCard(
                icon: Icon(
                  Icons.health_and_safety,
                  color: Colors.white,
                  size: 25,
                ),
                title: "Acidentes Pessoais"),
          ],
        ),
      ),
    );
  }
}
