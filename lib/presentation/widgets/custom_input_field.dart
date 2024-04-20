import 'package:diana_proyect/domain/entities/messages.dart';
import 'package:diana_proyect/presentation/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomInputField extends ConsumerStatefulWidget {
  final String? hint;
  final String? label;
  final String? helper;
  final IconData? icon;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? constraints;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPassword;
  final bool isDense;

  const CustomInputField({
    Key? key,
    this.hint,
    this.label,
    this.helper,
    this.icon,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.constraints,
    this.keyboardType,
    this.inputFormatters,
    this.isDense = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  ConsumerState<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends ConsumerState<CustomInputField> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final chat = ref.read(chatProvider.notifier);
    final person = ref.watch(personProvider);

    return TextFormField(
      controller: textController,
      maxLines: widget.maxLines,
      textAlign: TextAlign.start,
      style: const TextStyle(fontSize: 15),
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword,
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        constraints: widget.constraints,
        isDense: widget.isDense,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.secondary),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: widget.hint,
        labelText: widget.label,
        helperText: widget.helper,
        prefixIcon: (widget.prefixIcon != null) ? widget.prefixIcon : null,
        suffixIcon: IconButton(
            onPressed: () {
              (textController.text.isNotEmpty)
                  ? {
                      chat.addMessage(Message(
                          message: textController.text, person: person)),
                      textController.text = ""
                    }
                  : null;
            },
            icon: const Icon(Icons.send_rounded)),
        icon: (widget.icon != null) ? Icon(widget.icon) : null,
      ),
    );
  }
}
