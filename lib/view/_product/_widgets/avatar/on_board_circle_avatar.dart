import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_design/core/extensions/context_extension.dart';

class OnBoardCircleAvatar extends StatelessWidget {
  final bool isSelected;
  const OnBoardCircleAvatar({Key? key, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        radius: isSelected ? context.width * .015 : context.width * .01,
        backgroundColor: context.colors.onSurface.withOpacity(
          isSelected ? 1 : 0.2,
        ),
      ),
    );
  }
}
