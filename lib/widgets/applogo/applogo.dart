import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Text(
        'A.',
        style: TextStyle(fontSize: 40.sp, height: 1.2, fontWeight: FontWeight.bold),
      ),
    );
  }
}