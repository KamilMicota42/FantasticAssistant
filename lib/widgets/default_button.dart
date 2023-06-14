import 'package:fantastic_assistant/utils/colors.dart';
import 'package:fantastic_assistant/utils/styles.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final String text;
  final VoidCallback function;
  final double width;
  final double height;
  const DefaultButton({super.key, required this.text, required this.function, required this.width, required this.height});

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.function(),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: MyColors.black,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: MyColors.iris.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: MyTextStyles.spaceGrotesk16regular500,
          ),
        ),
      ),
    );
  }
}
