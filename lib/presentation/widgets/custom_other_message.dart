import 'package:diana_proyect/domain/entities/messages.dart';
import 'package:diana_proyect/presentation/providers/chat_provider.dart';
import 'package:diana_proyect/presentation/widgets/custom_emotion_indicator.dart';
import 'package:diana_proyect/presentation/widgets/custom_positivity_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOtherMessage extends ConsumerWidget {
  final Message message;

  const CustomOtherMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context, ref) {
    final isLoading = ref.watch(loadingProvider);

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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomProfileCircle(isMe: message.person),
                          const SizedBox(width: 8),
                          const CustomProfileName(),
                        ],
                      ),
                      Container(
                        // color: Colors.green,
                        margin: const EdgeInsets.only(left: 40, right: 5),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 600),
                          child: Text(
                            message.message,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.3)),
                            maxLines: 10,
                            textAlign: TextAlign.start,
                          ),
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
            child: (message.emotion != null && message.isPositive != null ||
                    isLoading)
                ? Container(
                    margin: const EdgeInsets.only(left: 15),
                    height: 50,
                    width: 225,
                    child: (!isLoading)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomEmotionIndicator(
                                emotion: message.emotion!,
                              ),
                              const SizedBox(width: 10),
                              CustomPositivityIndicator(
                                isPositive: message.isPositive!,
                              ),
                              // SizedBox(width: 100),
                            ],
                          )
                        : const Center(
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                            ),
                          ),
                  )
                : const SizedBox()),
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
      "Jane Carlson",
      style: GoogleFonts.lato(
          textStyle: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class CustomProfileCircle extends StatelessWidget {
  const CustomProfileCircle({
    super.key,
    required this.isMe,
  });

  final String isMe;

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
      child: const Icon(Icons.person),
    );
  }
}
