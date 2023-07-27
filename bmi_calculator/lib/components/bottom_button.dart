import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String bottomTitle;
  final Function() onPress;

  const BottomButton({
    super.key,
    required this.bottomTitle,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: kBottomContainerHeight,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 10),
        color: kActiveColor,
        child: Center(
          child: Text(
            bottomTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
