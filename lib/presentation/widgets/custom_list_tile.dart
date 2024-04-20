import 'package:diana_proyect/domain/entities/messages.dart';
import 'package:diana_proyect/presentation/providers/chat_provider.dart';
import 'package:diana_proyect/presentation/providers/menu_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTile extends ConsumerStatefulWidget {
  final String text;
  final List<dynamic> messages;
  final int optKey;

  const CustomListTile({
    super.key,
    required this.text,
    required this.messages,
    required this.optKey,
  });

  @override
  ConsumerState<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends ConsumerState<CustomListTile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final setChatMessages = ref.read(chatProvider.notifier).setMessages;
    final changeMenuOpt =
        ref.read(menuSelectedProvider.notifier).changeSelected;
    final menuOpt = ref.watch(menuSelectedProvider);
    final bool isSelected = (menuOpt == widget.optKey);

    return InkWell(
      onTap: () {
        setChatMessages(widget.messages);
        changeMenuOpt(widget.optKey);
      },
      onHover: (value) {
        isHovering = value;
        setState(() {});
      },
      child: Container(
        width: 240,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(10), left: Radius.circular(10)),
            color: (isHovering == true || isSelected)
                ? Colors.black.withOpacity(0.05)
                : Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(widget.text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            wordSpacing: -1.8,
                            fontSize: 14))),
              ),
              const Expanded(child: SizedBox()),
              (isHovering == true || isSelected)
                  ? const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
