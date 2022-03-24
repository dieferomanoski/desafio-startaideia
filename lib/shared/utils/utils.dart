import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Utils {
  static OverlayEntry getEntryOverlay(Widget child) {
    return OverlayEntry(
      opaque: false,
      maintainState: true,
      builder: (_) => Container(
        // left: 100,
        // bottom: 100,
        // width: 200,
        // height: 400,
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 1,
            sigmaY: 1,
          ),
          child: Material(type: MaterialType.transparency, child: child),
        ),
      ),
    );
  }
}
