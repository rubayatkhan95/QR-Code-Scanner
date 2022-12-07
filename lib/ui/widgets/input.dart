// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/config/app_theme.dart';
import 'package:dropdown_plus/dropdown_plus.dart';

class InputCheckbox extends StatefulWidget {
  const InputCheckbox({Key? key}) : super(key: key);

  @override
  State<InputCheckbox> createState() => _InputCheckboxState();
}

class _InputCheckboxState extends State<InputCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return colorPrimary;
      }
      return colorPrimary;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class InputRadio extends StatelessWidget {
  const InputRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class InputTextFieldOutline extends StatefulWidget {
  final String? lableText;
  final String? value;
  final keyboardType,
      obscureText,
      maxLength,
      suffixIcon,
      onChange,
      onSubmit,
      autoFocus,
      filled,
      roundedButton,
      fillColor,
      hintStyle,
      hintText,
      height,
      textAlignVertical,
      icon,
      prefixIcon,
      enabledBorderColor,
      onTap,
      textInputAction,
      validator,
      errorText,
      onSaved,
      autovalidateMode,
      focusNode;
  const InputTextFieldOutline({
    Key? key,
    this.lableText,
    this.keyboardType,
    this.obscureText,
    this.maxLength,
    this.suffixIcon,
    required this.onChange,
    this.onSubmit,
    this.filled,
    this.autoFocus,
    this.roundedButton,
    this.fillColor,
    this.hintText,
    this.hintStyle,
    this.height,
    this.icon,
    this.prefixIcon,
    this.textAlignVertical,
    this.enabledBorderColor,
    this.onTap,
    this.value,
    this.textInputAction,
    this.validator,
    this.errorText,
    this.onSaved,
    this.autovalidateMode,
    this.focusNode,
  }) : super(key: key);

  @override
  _InputTextFieldOutlineState createState() => _InputTextFieldOutlineState();
}

class _InputTextFieldOutlineState extends State<InputTextFieldOutline> {
  final textController = TextEditingController();

  @override
  void initState() {
    if (widget.value != null && widget.value != '') {
      textController.text = widget.value!;
      widget.onChange;
    } else {
      textController.text = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        child: TextFormField(
          controller: textController,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          textAlignVertical:
              widget.textAlignVertical ?? TextAlignVertical.center,
          maxLength: widget.maxLength,
          validator: widget.validator,
          decoration: InputDecoration(
            icon: widget.icon,
            filled: widget.filled ?? widget.filled,
            fillColor: widget.fillColor ?? colorWhite,
            labelText: widget.lableText,
            hintStyle: widget.hintStyle,
            hintText: widget.hintText,
            errorText: widget.errorText,
            focusedErrorBorder: widget.roundedButton != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                        color: widget.enabledBorderColor ?? colorError))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: colorError),
                  ),
            errorBorder: widget.roundedButton != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                        color: widget.enabledBorderColor ?? colorError))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: colorError),
                  ),
            enabledBorder: widget.roundedButton != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                        color: widget.enabledBorderColor ?? colorWhite))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: colorShadow),
                  ),
            focusedBorder: widget.roundedButton != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: colorPrimary),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(color: colorPrimary),
                  ),
            border: OutlineInputBorder(
              borderRadius: widget.roundedButton ?? BorderRadius.circular(0.0),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
          onChanged: widget.onChange ?? widget.onChange,
          obscureText: widget.obscureText ?? false,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          // onSubmitted: widget.onSubmit,
          onFieldSubmitted: widget.onSubmit,
          onSaved: widget.onSaved,
          autofocus: widget.autoFocus ?? false,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          autovalidateMode: widget.autovalidateMode,
        ));
  }
}
