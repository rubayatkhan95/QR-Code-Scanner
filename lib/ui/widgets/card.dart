// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable, prefer_if_null_operators
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/config/app_theme.dart';
import 'package:qr_code_scanner_app/ui/widgets/avatar.dart';

class CardSquare extends StatelessWidget {
  final String? title;
  final icon;
  final VoidCallback onTap;
  CardSquare({Key? key, this.title, this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: colorShadow,
        onTap: onTap,
        child: Ink(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: colorWhite,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: colorShadow,
                  blurRadius: 4,
                  offset: Offset(1, 4), // Shadow position
                ),
              ],
            ),
            height: 150,
            width: 150,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Avatar(
                    icon: icon,
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 12.0, left: 5, bottom: 0, right: 5),
                      child: Text(
                        title!,
                        style: appThemePrimary.textTheme.subtitle1,
                      ))
                ])));
  }
}

class CardListTile extends StatelessWidget {
  final String? title, subtitle, trailingText;
  final VoidCallback onTapListTile;
  final VoidCallback onTapRightIcon;
  final leading, description;
  final tileColor,
      selected,
      textColor,
      customTitleStyle,
      customSubtitleStyle,
      customDescriptionStyle,
      rectangleCard,
      trailing,
      hideMargin;

  CardListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.trailingText,
    this.description,
    this.leading,
    required this.onTapListTile,
    this.tileColor,
    this.selected,
    required this.onTapRightIcon,
    this.textColor,
    this.customTitleStyle,
    this.customSubtitleStyle,
    this.customDescriptionStyle,
    this.rectangleCard,
    this.trailing,
    this.hideMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      margin: hideMargin != null ? EdgeInsets.all(0) : EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
          borderRadius: rectangleCard != null
              ? BorderRadius.all(Radius.circular(0))
              : BorderRadius.all(Radius.circular(2))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              onTap: onTapListTile,
              leading: leading != null ? leading : null,
              trailing: trailing ?? SizedBox(),
              isThreeLine: true,
              selected: selected ?? true,
              tileColor: tileColor ?? colorPrimary,
              title: _title(),
              subtitle: description != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0, bottom: 0, right: 0, top: 6),
                          child: Text(subtitle!,
                              style: customSubtitleStyle ??
                                  appThemePrimary.textTheme.subtitle1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0, bottom: 5, right: 0, top: 10),
                          child: Text(description,
                              style: customDescriptionStyle ??
                                  appThemePrimary.textTheme.subtitle2),
                        )
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          left: 0, bottom: 14.5, right: 0, top: 6),
                      child: Text(subtitle!,
                          style: customSubtitleStyle ??
                              appThemePrimary.textTheme.subtitle1),
                    )),
        ],
      ),
    ));
  }

  Widget _title() {
    return Padding(
        padding: EdgeInsets.only(left: 0, bottom: 0, right: 0, top: 14),
        child: Text(title!,
            style: customTitleStyle ??
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: textColor ?? colorBlack)));
  }
}
