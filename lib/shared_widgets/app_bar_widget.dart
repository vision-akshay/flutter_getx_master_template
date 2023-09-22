import 'package:cricket_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {this.showBackButton = true,
      this.titleText,
      this.actions,
      this.elevation = 0,
      this.backgroundColor,
      this.onTapLeading,
      super.key});
  final bool showBackButton;
  final String? titleText;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;

  final void Function()? onTapLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: !showBackButton
          ? null
          : InkWell(
              onTap: () {
                Get.back(canPop: true);
              },
              child: const Icon(Icons.arrow_back_ios)),
      titleSpacing: !showBackButton ? null : 0,
      title: titleText == null
          ? null
          : Text(
              titleText!,
              style: AppStyle.blackExtraBold24.copyWith(
                fontSize: 22,
              ),
            ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
