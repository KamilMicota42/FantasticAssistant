import 'package:fantastic_assistant/utils/colors.dart';
import 'package:flutter/material.dart';

class TextureBackgroundContainer extends StatefulWidget {
  final Widget child;
  const TextureBackgroundContainer({super.key, required this.child});

  @override
  State<TextureBackgroundContainer> createState() => _TextureBackgroundContainerState();
}

class _TextureBackgroundContainerState extends State<TextureBackgroundContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'lib/assets/images/background_texture.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                MyColors.roseRed.withOpacity(0.9),
                MyColors.black.withOpacity(0.9),
              ],
              stops: const [0.2192, 0.6798],
            ),
          ),
          child: widget.child,
        ),
      ],
    );
  }
}
