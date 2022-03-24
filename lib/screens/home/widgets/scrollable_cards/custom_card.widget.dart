import "package:flutter/material.dart";
import 'package:tokio_marine/screens/home/widgets/webview.widget.dart';
import 'package:tokio_marine/shared/utils/colors/colors.dart';
import 'package:tokio_marine/shared/utils/textstyles.model.dart';
import 'package:tokio_marine/shared/widgets/custom_container.widget.dart';
import 'package:tokio_marine/shared/widgets/gradient_icon.widget.dart';

class CustomCard extends StatefulWidget {
  Icon icon;
  String title;
  CustomCard({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => WebviewWidget()));
          // setState(() {
          //   if (isWebviewOpen) {
          //     entry.remove();
          //     isWebviewOpen = false;
          //   } else {
          //     Overlay.of(context)?.insert(entry);
          //     isWebviewOpen = true;
          //   }
          // });
        },
        child: CustomContainer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GradientIcon(
                widget.icon,
                50,
                LinearGradient(
                  colors: <Color>[
                    ColorsModel.primaryColor,
                    ColorsModel.secundaryColor,
                    ColorsModel.secundaryColor,
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                widget.title,
                style: TextStylesModel.subtitle.copyWith(fontSize: 14),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
