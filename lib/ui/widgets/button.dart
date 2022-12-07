// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/config/app_constants.dart';
import 'package:qr_code_scanner_app/config/app_theme.dart';

class ButtonOutlined extends StatelessWidget {
  final String? buttonTitle;
  final VoidCallback onPressed;
  final customTextStyle, customButtonStyle;

  const ButtonOutlined(
      {Key? key,
      this.buttonTitle,
      required this.onPressed,
      this.customTextStyle,
      this.customButtonStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: customButtonStyle ??
          OutlinedButton.styleFrom(padding: EdgeInsets.only(left: 8, right: 8)),
      onPressed: onPressed,
      child: Text(
        buttonTitle!,
        style: customTextStyle ??
            appThemePrimary.textTheme.headline6?.copyWith(color: colorPrimary),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String? buttonTitle;
  final VoidCallback onPressed;
  final icon;
  final customTextStyle, customButtonStyle, isDisable;
  final iconRight;
  const ButtonText(
      {Key? key,
      this.buttonTitle,
      required this.onPressed,
      this.icon,
      this.customTextStyle,
      this.customButtonStyle,
      this.isDisable,
      this.iconRight})
      : super(key: key);

  Widget buttonTextWithIcon(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon ?? Container(),
        Padding(
          child: Text(buttonTitle!,
              style: customTextStyle ??
                  appThemePrimary.textTheme.headline6?.copyWith(
                      color: colorError, fontWeight: FontWeight.normal)),
          padding: EdgeInsets.only(left: 10, right: 10),
        ),
        iconRight ?? Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        //style: customButtonStyle,
        onPressed: isDisable == true ? null : onPressed,
        child: icon != null || iconRight != null
            ? buttonTextWithIcon(context)
            : Text(
                buttonTitle!,
                style: customTextStyle ??
                    appThemePrimary.textTheme.bodyText1?.copyWith(
                        color: colorError, fontWeight: FontWeight.normal),
              ));
  }
}

class ButtonFloating extends StatelessWidget {
  final VoidCallback onPressed;
  final icon;
  final tooltip;
  final isDisabled;
  const ButtonFloating(
      {Key? key,
      required this.onPressed,
      this.icon,
      this.tooltip,
      this.isDisabled})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor:
          isDisabled == false ? appThemePrimary.primaryColor : colorDisable,
      onPressed: isDisabled == true ? null : onPressed,
      tooltip: tooltip,
      child: icon,
      elevation: 6,
      disabledElevation: 0.0,
    );
  }
}

class ButtonDropDown extends StatefulWidget {
  final String? labelText;
  final List<String>? items;
  final String? hintText;
  final onSelectValue;
  const ButtonDropDown({
    Key? key,
    this.labelText,
    this.items,
    this.hintText,
    this.onSelectValue,
  }) : super(key: key);

  @override
  _ButtonDropDownState createState() => _ButtonDropDownState();
}

class _ButtonDropDownState extends State<ButtonDropDown> {
  final items = userList;
  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    return DropdownButtonFormField(
      validator: (value) => value == null ? "Select User" : null,
      dropdownColor: Colors.white,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          filled: false,
          labelText: widget.labelText,
          hintText: widget.hintText),
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
          widget.onSelectValue(selectedValue);
        });
      },
      items: widget.items!.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
    );
  }
}

class ButtonPrimary extends StatelessWidget {
  final VoidCallback onPressed;
  final buttonTitle, isDisabled, customPadding;

  const ButtonPrimary({
    Key? key,
    this.buttonTitle,
    required this.onPressed,
    this.isDisabled,
    this.customPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: customPadding ?? EdgeInsets.only(left: 0, right: 0),
      child: ElevatedButton(
        onPressed: isDisabled == true ? null : onPressed,
        child: Text(buttonTitle),
        style: ElevatedButton.styleFrom(
            primary: colorPrimary, minimumSize: const Size.fromHeight(45)),
      ),
    );
    ;
  }
}

class ButtonProgress extends StatefulWidget {
  const ButtonProgress({Key? key}) : super(key: key);

  @override
  State<ButtonProgress> createState() => _ButtonProgressState();
}

class _ButtonProgressState extends State<ButtonProgress>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  );

  void forwardButtonAnimation() {
    _controller.forward();
  }

  void reverseButtonAnimation() {
    _controller.reverse();
  }

  void checkIfProgressCompleted() {
    if (_controller.isCompleted == true) {
    } else {
      reverseButtonAnimation();
    }
  }

  late final Animation<double> _animation = CurvedAnimation(
    reverseCurve: Curves.fastOutSlowIn,
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        checkIfProgressCompleted();

        forwardButtonAnimation();
      },
      onLongPressUp: () {
        checkIfProgressCompleted();
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: colorPrimary,
          ),
          SizeTransition(
              sizeFactor: _animation,
              axis: Axis.horizontal,
              axisAlignment: 1,
              child: Container(
                width: double.infinity,
                height: 50,
                color: colorSuccess,
              )),
          Container(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text("Tap",
                    style: TextStyle(color: colorWhite, fontSize: 16)),
              ))
        ],
      ),
    );
  }
}

class ButtonPillShaped extends StatelessWidget {
  final VoidCallback onPressed;
  final buttonTitle, isDisabled, customPadding;

  const ButtonPillShaped({
    Key? key,
    this.buttonTitle,
    required this.onPressed,
    this.isDisabled,
    this.customPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: customPadding ?? EdgeInsets.only(left: 0, right: 0),
        child: ElevatedButton(
          onPressed: isDisabled == true ? null : onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            primary: colorPrimary,
            shape: StadiumBorder(),
          ),
          child: Text(buttonTitle),
        ));
    ;
  }
}
