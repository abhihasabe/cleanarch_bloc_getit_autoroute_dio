import 'package:flutter/material.dart';

class FloatingButton {
  static FloatingActionButton buildSpeedDial(
      var userType, Brightness brightness, BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: 'uniqueTag',
      label: Row(
        children: const [Icon(Icons.save), Text('Save')],
      ),
      onPressed: () {},
    );
  }
}
