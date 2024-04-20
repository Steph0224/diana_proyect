import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:diana_proyect/domain/entities/summary.dart';
import 'package:diana_proyect/presentation/widgets/custom_positivity_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSummaryMessage extends ConsumerWidget {
  final AiSummary summary;

  const CustomSummaryMessage({super.key, required this.summary});

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Card.filled(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 30,
                    minHeight: 30,
                    maxWidth: 650,
                    maxHeight: 500,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomProfileCircle(),
                          SizedBox(width: 8),
                          CustomProfileName(),
                        ],
                      ),
                      Container(
                        // color: Colors.green,
                        margin: const EdgeInsets.only(left: 40, right: 5),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 600),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TyperAnimatedText(
                                summary.message,
                                textStyle: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.3,
                                )),
                              )
                            ],
                          ),
                          // child: Text(
                          //   summary.message,
                          //   style: GoogleFonts.lato(
                          //       textStyle: const TextStyle(
                          //           fontWeight: FontWeight.w500,
                          //           fontSize: 14.3)),
                          //   maxLines: 10,
                          //   textAlign: TextAlign.start,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 6,
            child: Container(
                margin: const EdgeInsets.only(left: 15),
                height: 50,
                width: 225,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomPositivityIndicator(
                      isPositive: summary.isPositive,
                    ),
                  ],
                )))
      ],
    );
  }
}

class CustomProfileName extends StatelessWidget {
  const CustomProfileName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Gemini AI",
      style: GoogleFonts.lato(
          textStyle: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class CustomProfileCircle extends StatelessWidget {
  const CustomProfileCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: colors.secondaryContainer,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.auto_awesome_outlined),
    );
  }
}
