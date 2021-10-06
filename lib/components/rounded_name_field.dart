import 'package:flutter/material.dart';
import 'package:flutter_doctune_final/components/text_field_container.dart';

import '../constants.dart';

class RoundedNameField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function vaildator;
  final TextEditingController textEditingController;
  const RoundedNameField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.vaildator,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.name,
        controller: textEditingController,
        validator: vaildator,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
