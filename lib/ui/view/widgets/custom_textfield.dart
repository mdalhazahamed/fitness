import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../../style/style.dart';

Widget customTextField(controller, validator, onSaved,autofocus) {
  return TextFormField(
    autofocus: autofocus,
    controller: controller,
    obscureText: true,
    validator: validator,
    onSaved: onSaved,
    textInputAction: TextInputAction.done,
    decoration: myDecoration("Password", Icon(Icons.lock_outline)),
  );
}



