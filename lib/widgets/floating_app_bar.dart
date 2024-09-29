import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:estudent/constants.dart';

class FloatingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final bool automaticallyImplyLeading = true;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary = true;
  final bool? centerTitle;
  final bool excludeHeaderSemantics = false;
  final double? titleSpacing;
  final double toolbarOpacity = 1.0;
  final double bottomOpacity = 1.0;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const FloatingAppBar(
      {Key? key,
      this.leading,
      this.title,
      this.actions,
      this.flexibleSpace,
      this.bottom,
      this.elevation,
      this.shadowColor,
      this.shape,
      this.backgroundColor,
      this.foregroundColor,
      this.iconTheme,
      this.actionsIconTheme,
      this.centerTitle,
      this.titleSpacing,
      this.toolbarHeight,
      this.leadingWidth,
      this.toolbarTextStyle,
      this.titleTextStyle,
      this.systemOverlayStyle})
      : preferredSize =
            const Size.fromHeight(kToolbarHeight + kFloatingAppBarMargin * 2),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      margin: const EdgeInsets.all(kFloatingAppBarMargin),
      child: AppBar(
        leading: leading,
        title: title,
        actions: actions,
        flexibleSpace: flexibleSpace,
        bottom: bottom,
        elevation: elevation,
        shadowColor: shadowColor,
        shape: shape,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        iconTheme: iconTheme,
        actionsIconTheme: actionsIconTheme,
        centerTitle: centerTitle,
        titleSpacing: titleSpacing,
        toolbarHeight: toolbarHeight,
        leadingWidth: leadingWidth,
        toolbarTextStyle: toolbarTextStyle,
        titleTextStyle: titleTextStyle,
        systemOverlayStyle: systemOverlayStyle,
      ),
    );
  }
}
