import 'package:flutter/material.dart';
import 'package:tokio_marine/screens/home/widgets/drawer.widget.dart';
import 'package:tokio_marine/screens/home/widgets/scrollable_cards/scrollable_cards.widget.dart';
import 'package:tokio_marine/shared/utils/colors/colors.dart';
import 'package:tokio_marine/shared/utils/textstyles.model.dart';
import 'package:tokio_marine/shared/widgets/custom_container.widget.dart';

class HomeScreen extends StatefulWidget {
  String userName;
  HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ColorsModel.backgroundColor,
        drawer: CustomDrawer(userName: widget.userName),
        appBar: AppBar(
          backgroundColor: ColorsModel.backgroundColor,
          elevation: 0,
          title: Text(
            "Tokio\nMarine",
            style: TextStylesModel.title
                .copyWith(fontWeight: FontWeight.w300, fontSize: 18),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
            color: Colors.white,
          ),
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: [ScrollableCards()],
          ),
        ),
      ),
    );
  }
}

// Container(
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(30),
//       color: Colors.green),
//   height: MediaQuery.of(context).size.height,
// ),
