import 'package:diana_proyect/domain/entities/messages.dart';
import 'package:diana_proyect/presentation/providers/chat_provider.dart';
import 'package:diana_proyect/presentation/widgets/custom_emotion_indicator.dart';
import 'package:diana_proyect/presentation/widgets/custom_positivity_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMessage extends ConsumerWidget {
  final Message message;

  const CustomMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context, ref) {
    final isLoading = ref.watch(loadingProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            flex: 6,
            child: (message.emotion != null && message.isPositive != null ||
                    isLoading)
                ? Container(
                    margin: const EdgeInsets.only(right: 15),
                    height: 50,
                    width: 225,
                    child: (!isLoading)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 150),
                              CustomEmotionIndicator(emotion: message.emotion!),
                              const SizedBox(width: 10),
                              CustomPositivityIndicator(
                                isPositive: message.isPositive!,
                              ),
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
        Expanded(
          flex: 8,
          child: Card.filled(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 30,
                  minHeight: 30,
                  maxWidth: 600,
                  maxHeight: 500,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CustomProfileName(),
                        const SizedBox(width: 8),
                        CustomProfileCircle(isMe: message.person),
                      ],
                    ),
                    Container(
                      // color: Colors.green,
                      margin: const EdgeInsets.only(right: 40, left: 5),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700),
                        child: Text(
                          message.message,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14.3)),
                          maxLines: 10,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
      "John Doe",
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
      child: const Icon(Icons.person_4),
    );
  }
}
