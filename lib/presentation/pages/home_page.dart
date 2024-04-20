import 'package:animate_do/animate_do.dart';
import 'package:diana_proyect/domain/entities/messages.dart';
import 'package:diana_proyect/domain/entities/summary.dart';
import 'package:diana_proyect/infrastructure/datasources/diana_predictions_datasource.dart';
import 'package:diana_proyect/presentation/providers/chat_provider.dart';
import 'package:diana_proyect/presentation/providers/chat_summary_provider.dart';
import 'package:diana_proyect/presentation/providers/theme_provider.dart';
import 'package:diana_proyect/presentation/widgets/custom_message.dart';
import 'package:diana_proyect/presentation/widgets/custom_drawer.dart';
import 'package:diana_proyect/presentation/widgets/custom_input_field.dart';
import 'package:diana_proyect/presentation/widgets/custom_other_message.dart';
import 'package:diana_proyect/presentation/widgets/custom_summary_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final List<Message> staticMessages = [
    //   Message(
    //       message:
    //           "Good morning. I'm having an issue with my computer. It just won't turn on, and I'm not sure what to do.",
    //       person: "Other"),
    //   Message(
    //       message:
    //           "I see. Have you tried checking if it's properly plugged into the power outlet?",
    //       person: "Me"),
    //   Message(
    //       message: "Yes, I did. I'm sure it's plugged in.", person: "Other"),
    //   Message(
    //       message:
    //           "Could you check if the cable is securely connected to the back of the computer? Sometimes it may seem plugged in but not fully inserted.",
    //       person: "Me"),
    //   Message(
    //     message:
    //         "Alright, let me check... Oh, wait a moment. It looks like the cable was loose. I'm sorry, it seems it wasn't connected properly!",
    //     person: "Other",
    //   ),
    //   Message(
    //       message:
    //           "Don't worry at all. Sometimes the simplest solutions can slip our minds. Try turning it on now and let me know what happens.",
    //       person: "Me"),
    //   Message(
    //       message:
    //           "It's working! The computer is booting up properly now! Thank you so much for your help!",
    //       person: "Other"),
    //   Message(
    //       message:
    //           "I'm glad to hear that. If you need assistance with anything else, don't hesitate to reach out. Have a great day!",
    //       person: "Me"),
    // ];

    final messages = ref.watch(chatProvider);

    return Scaffold(
      body: Row(children: [
        const CustomDrawer(),
        Expanded(
          child: Column(
            children: [
              const MainHeader(),
              MainChat(messages: messages),
              const MainFooter(),
            ],
          ),
        )
      ]),
    );
  }
}

class MainChat extends ConsumerWidget {
  const MainChat({
    super.key,
    required this.messages,
  });

  final List<dynamic> messages;

  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: (messages.isEmpty)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.library_books_outlined,
                  size: 120,
                ),
                const SizedBox(height: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Text(
                    "Diana is ready and waiting to analyse your dialogs! You can write or select a dialog from the menu.",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(fontSize: 18)),
                  ),
                )
              ],
            )
          : Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 240),
              child: ListView.builder(
                  controller: chatScrollController,
                  itemCount: messages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final dynamic message = messages[index];

                    if (message is Message) {
                      return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.only(bottom: 50),
                          child: (message.person == "Me")
                              ? FadeInRight(
                                  curve: Curves.easeOutQuart,
                                  child: CustomMessage(
                                    message: message,
                                  ),
                                )
                              : FadeInLeft(
                                  curve: Curves.easeOutQuart,
                                  child: CustomOtherMessage(
                                    message: message,
                                  ),
                                ));
                    }

                    return SizedBox(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(child: Divider()),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: const Text("Dialog end")),
                              const Expanded(child: Divider()),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin: const EdgeInsets.only(bottom: 50),
                              child: FadeInLeft(
                                curve: Curves.easeOutQuart,
                                child: CustomSummaryMessage(
                                  summary: message,
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
            ),
    );
  }
}

class MainFooter extends ConsumerWidget {
  const MainFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    // final colors = Theme.of(context).colorScheme;

    final isMeNotifier = ref.read(personProvider.notifier);
    final person = ref.watch(personProvider);
    final getSummary = ref.read(summaryProvider.notifier).getSummary;
    final summary = ref.watch(summaryProvider);
    final chat = ref.watch(chatProvider);
    final addMessage = ref.watch(chatProvider.notifier).addMessage;
    final setChat = ref.watch(chatProvider.notifier).setMessages;
    final setLoading = ref.watch(loadingProvider.notifier);

    final diana = DianaPredictions();

    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10, left: 20, right: 20),
      child: SizedBox(
        width: 868,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Chip(
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    (person),
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ),
                visualDensity: VisualDensity.compact,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: CustomInputField(
                  prefixIcon: IconButton(
                    onPressed: () {
                      isMeNotifier.update((state) =>
                          (state == "Me") ? state = "Other" : state = "Me");
                    },
                    icon: (person == "Me")
                        ? const Icon(Icons.person_4)
                        : const Icon(Icons.person),
                  ),
                  // suffixIcon:
                  hint: "Write the message you want to send...",
                  isDense: true,
                  helper:
                      "Diana AI, could be mistaken in some cases, by any doubt further human analysis is recommended",
                ),
              ),
            ),
            const SizedBox(width: 14),
            Padding(
              padding: const EdgeInsets.only(bottom: 23),
              child: (summary == "")
                  ? IconButton.filled(
                      onPressed: (chat.isNotEmpty)
                          ? () async {
                              setLoading.update((state) => state = true);

                              final List<dynamic> predictedChat = [];

                              for (Message message in chat) {
                                final emotion = await diana
                                    .getEmotionPrediction(message.message);

                                final positivity = await diana
                                    .getPositivityPrediction(message.message);

                                final isPositive =
                                    (positivity == "positive") ? true : false;

                                predictedChat.add(Message(
                                    message: message.message,
                                    person: message.person,
                                    emotion: emotion,
                                    isPositive: isPositive));
                              }

                              setChat(predictedChat);

                              setLoading.update((state) => state = false);

                              getSummary(chat.toString());
                            }
                          : () {},
                      icon: const Icon(Icons.auto_fix_high_outlined))
                  : FadeIn(
                      child: FilledButton(
                          onPressed: () {
                            addMessage(
                                AiSummary(message: summary, isPositive: true));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Summary"),
                          ))),
            )
          ],
        ),
      ),
    );
  }
}

class MainHeader extends ConsumerWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final themeColor = ref.read(themeColorProvider.notifier);
    final themeBrightness = ref.read(themeBrightnessProvider.notifier);

    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
              color: colors.secondaryContainer,
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10), right: Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              child: Text(
                "Diana  AI  2.0",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  wordSpacing: -2,
                  fontSize: 17,
                )),
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: Container(
              margin: const EdgeInsets.only(right: 73),
              child: Text(
                "Conversation",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  wordSpacing: -2,
                  fontSize: 17,
                )),
              ),
            ),
          )),
          IconButton(
            onPressed: () {
              themeBrightness.update((state) => (state == Brightness.light)
                  ? state = Brightness.dark
                  : state = Brightness.light);
            },
            icon: const Icon(Icons.light),
          ),
          const SizedBox(width: 8),
          PopupMenuButton(
            child: const Icon(Icons.settings_sharp),
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: ListTile(
                title: const Text("Blue"),
                trailing: const Icon(
                  Icons.format_paint_outlined,
                  color: Colors.blue,
                ),
                onTap: () {
                  themeColor.update((state) => state = Colors.blue);
                },
              )),
              PopupMenuItem(
                  child: ListTile(
                title: const Text("Cyan"),
                trailing: const Icon(
                  Icons.format_paint_outlined,
                  color: Colors.cyan,
                ),
                onTap: () {
                  themeColor.update((state) => state = Colors.cyan);
                },
              )),
              PopupMenuItem(
                  child: ListTile(
                title: const Text("Green"),
                trailing: const Icon(
                  Icons.format_paint_outlined,
                  color: Colors.green,
                ),
                onTap: () {
                  themeColor.update((state) => state = Colors.green);
                },
              )),
              PopupMenuItem(
                  child: ListTile(
                title: const Text("Teal"),
                trailing: const Icon(
                  Icons.format_paint_outlined,
                  color: Colors.teal,
                ),
                onTap: () {
                  themeColor.update((state) => state = Colors.teal);
                },
              )),
              PopupMenuItem(
                  child: ListTile(
                title: const Text("Indigo"),
                trailing: const Icon(
                  Icons.format_paint_outlined,
                  color: Colors.indigo,
                ),
                onTap: () {
                  themeColor.update((state) => state = Colors.indigo);
                },
              )),
            ],
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
