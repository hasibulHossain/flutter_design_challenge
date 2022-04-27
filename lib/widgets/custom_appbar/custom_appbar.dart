import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:nft_marketplace_concept/widgets/applogo/applogo.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final bool? isBackEnabled;
  final String? title;
  final void Function()?
      leadingCb; // call back function for leading widget onClick.

  const CustomAppBar(
      {Key? key,
      this.leading,
      this.trailing,
      this.isBackEnabled,
      this.leadingCb,
      this.title})
      : super(key: key);

  List<Widget> appBar() {
    if (leading == null &&
        isBackEnabled != null &&
        isBackEnabled! &&
        leadingCb != null) {
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 8, right: 8, bottom: 8, left: 0),
              onPressed: leadingCb,
              icon: const Icon(Icons.keyboard_backspace_outlined),
            ),
            if(title != null) Text(title!, style: TextStyle(fontSize: 20.sp),)
          ],
        ),
        if (trailing != null) trailing!,
      ];
    }

    if (isBackEnabled == null || !isBackEnabled! && trailing != null) {
      return [
        const AppLogo(),
        if (trailing != null) trailing!,
      ];
    }

    return [
      const AppLogo(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: appBar(),
    );
  }
}
