import 'package:diana_proyect/presentation/providers/chat_provider.dart';
import 'package:diana_proyect/presentation/providers/menu_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryListTile extends ConsumerStatefulWidget {
  const PrimaryListTile({super.key});

  @override
  ConsumerState<PrimaryListTile> createState() => _PrimaryListTileState();
}

class _PrimaryListTileState extends ConsumerState<PrimaryListTile> {
  bool isHovering = false;
  final int optKey = 0;

  @override
  Widget build(BuildContext context) {
    final setChatMessages = ref.read(chatProvider.notifier).setMessages;
    final changeMenuOpt =
        ref.read(menuSelectedProvider.notifier).changeSelected;
    final menuOpt = ref.watch(menuSelectedProvider);
    final bool isSelected = (menuOpt == optKey);

    return InkWell(
      onTap: () {
        setChatMessages([]);
        changeMenuOpt(optKey);
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
              CircleAvatar(
                  maxRadius: 20,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/diana_resized.png",
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                width: 150,
                child: Text("New chat",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14))),
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.playlist_add_outlined,
                // size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
