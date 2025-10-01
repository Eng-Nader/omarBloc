import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../bussniss_logic/character_state.dart';
import '../../core/app_color.dart';

class AnimatedQoutes extends StatelessWidget {
  const AnimatedQoutes({super.key, required this.state});
  final CharacterLoadedQuotesState state;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.yellow,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 7,
              color: AppColor.yellow,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          pause: Duration(seconds: 1),
          animatedTexts: state.characterQuotes
              .map(
                (characterQoutes) => FlickerAnimatedText(
                  characterQoutes.quotes,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
