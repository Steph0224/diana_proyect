import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomEmotionIndicator extends StatelessWidget {
  final String emotion;

  const CustomEmotionIndicator({super.key, required this.emotion});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FadeIn(
      duration: const Duration(seconds: 1),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                colors.primary.withOpacity(0.6),
                colors.primaryContainer,
              ],
            ),
            borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(15), right: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Text(
            emotion,
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
          ),
        ),
      ),
    );
  }
}
