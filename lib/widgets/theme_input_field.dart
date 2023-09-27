import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configuration/dimenconfig.dart';
import '../modules/app/screen/app.dart';

class InputField extends StatelessWidget {
  final TextEditingController textInputController;
  final void Function(String text)? onChanged;
  final String hint = 'write_message_here'.tr;

  final TextFieldStyle? textFieldStyle;

  InputField({
    super.key,
    required this.textInputController,
    this.textFieldStyle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    TextFieldStyle defaultStyle = Theme.of(context).extension<TextFieldStyle>()!;
    Color? backgroundColor = textFieldStyle?.backgroundColor ?? defaultStyle.backgroundColor;

    debugPrint(hint);
    return Container(
      padding: const EdgeInsets.all(DimenConfig.standardSize),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: backgroundColor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 100,
        ),
        child: TextField(
          autocorrect: true,
          scribbleEnabled: true,
          maxLines: null,
          textCapitalization: TextCapitalization.sentences,
          controller: textInputController,
          onChanged: onChanged,
          cursorOpacityAnimates: true,
          cursorRadius: const Radius.circular(20),
          cursorWidth: 5,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration.collapsed(
            hintText: hint,
          ),
          cursorColor: Colors.black,
        ),
      ),
    );
  }
}
