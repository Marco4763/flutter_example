import 'dart:ui';

import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({
    super.key,
    required this.formKey,
    required this.controller,
    required this.hint,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final String hint;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SizedBox(
        width: 250,
        height: 80,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTapOutside: (a){
            FocusScope.of(context).unfocus();
          },
          controller: widget.controller,
          validator: (s) {
            if (s!.isEmpty) return 'Campo em Branco';

            return null;
          },
          decoration: InputDecoration(
              hintText: widget.hint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 12.0,
              ),
              border: const OutlineInputBorder()),
        ),
      ),
    );
  }
}
