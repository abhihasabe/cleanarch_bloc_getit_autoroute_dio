import 'package:bloc_clean/core/theme/app_colors.dart';
import 'package:bloc_clean/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatefulWidget {
  final String? label;
  final Function? onPress;
  final bool? arrow;
  final bool? canCheck;
  final bool? initialStatus;

  const TagWidget(
      {Key? key,
      this.initialStatus,
      this.canCheck,
      this.label,
      this.onPress,
      this.arrow})
      : super(key: key);

  @override
  TagWidgetState createState() => TagWidgetState();
}

class TagWidgetState extends State<TagWidget> {
  bool _isActive = false;

  @override
  void initState() {
    if (widget.initialStatus != null) {
      _isActive = widget.initialStatus!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double rightPadding = widget.arrow == true ? 12.0 : 22.0;

    return GestureDetector(
      onTap: () {
        final bool newIsActive = !_isActive;

        if (widget.onPress != null) widget.onPress!(newIsActive);

        if (widget.canCheck == true) {
          setState(() {
            _isActive = newIsActive;
          });
        }
      },
      child: Container(
        padding:
            EdgeInsets.only(top: 6, bottom: 6, left: 22, right: rightPadding),
        margin: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          color: _isActive == true ? accentColor : backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: accentColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextWidget(
                text: widget.label!,
                small: true,
                textColor: _isActive == true ? backgroundColor : accentColor),
            if (widget.arrow == true) const SizedBox(width: 8),
            if (widget.arrow == true)
              const Icon(Icons.arrow_drop_down, color: accentColor)
          ],
        ),
      ),
    );
  }
}
