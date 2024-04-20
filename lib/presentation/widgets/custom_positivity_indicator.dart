import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomPositivityIndicator extends StatelessWidget {
  final bool isPositive;

  const CustomPositivityIndicator({super.key, required this.isPositive});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FadeInRight(
      // duration: Duration(seconds: 1),
      delay: const Duration(milliseconds: 500),
      from: 15,
      child: Container(
        decoration: BoxDecoration(
            color: colors.secondaryContainer,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Icon((isPositive)
              ? Icons.thumb_up_alt_outlined
              : Icons.thumb_down_alt_outlined),
        ),
      ),
    );
  }
}
