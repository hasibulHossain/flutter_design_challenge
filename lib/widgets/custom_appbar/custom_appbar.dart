import 'package:flutter/material.dart';
import 'package:nft_marketplace_concept/widgets/applogo/applogo.dart';


class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final bool? isBackEnabled;
  final void Function()? leadingCb; // call back function for leading widget onClick.

  const CustomAppBar({
    Key? key,
    this.leading,
    this.trailing,
    this.isBackEnabled,
    this.leadingCb,
  }) : super(key: key);

  List<Widget> appBar() {
    if(leading == null && isBackEnabled != null && isBackEnabled! && leadingCb != null) {
      return [
        IconButton(onPressed: leadingCb, icon: const Icon(Icons.keyboard_backspace_outlined)),
        if(trailing != null) trailing!,
      ];
    }

    if(isBackEnabled == null || !isBackEnabled! && trailing != null) {
      return [
        const AppLogo(),
        if(trailing != null) trailing!,
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