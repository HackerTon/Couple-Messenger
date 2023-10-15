import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configuration/dimenconfig.dart';
import '../configuration/style.dart';

class InputField extends StatelessWidget {
  final TextEditingController? textInputController;
  final void Function(String text)? onChanged;
  final String hint = 'write_message_here'.tr;

  final TextFieldStyle? textFieldStyle;

  InputField({
    super.key,
    this.textInputController,
    this.textFieldStyle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(DimenConfig.standardSize),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: textFieldStyle?.backgroundColor ?? themeData.primaryColor,
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
          decoration: InputDecoration.collapsed(
            hintText: hint,
          ),
          cursorColor: themeData.primaryColor,
        ),
      ),
    );
  }
}
