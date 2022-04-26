import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nft_marketplace_concept/animations/animations.dart';
import 'package:nft_marketplace_concept/constants/constants.dart';
import 'package:nft_marketplace_concept/screens/home_screen.dart';
import 'package:nft_marketplace_concept/widgets/custom_appbar/custom_appbar.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final _textBoldStyle = TextStyle(
    fontSize: 45.sp,
    fontFamily: 'Dsignes',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    // height: 1.3,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().statusBarHeight + 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenBasePadding.r),
              child: CustomAppBar(
                  trailing: Container(
                width: 45.r,
                height: 45.r,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Iconsax.wallet_1,
                    color: Colors.white,
                  ),
                ),
              )),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenBasePadding),
              child: SizedBox(
                height: 15.w,
                child: FadeAnimation(
                  intervalEnd: 0.5,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/flash.svg'),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Start',
                        style: TextStyle(fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenBasePadding),
              child: SlideAnimation(
                intervalEnd: 0.6,
                child: FadeAnimation(
                  intervalEnd: 0.6,
                  child: RichText(
                    text: TextSpan(style: _textBoldStyle, children: const [
                      TextSpan(
                          text: 'Discover',
                          style: TextStyle(fontWeight: FontWeight.w200)),
                      TextSpan(
                        text: ' Rare \nCollections ',
                      ),
                      TextSpan(
                          text: 'Of',
                          style: TextStyle(fontWeight: FontWeight.w200)),
                    ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenBasePadding),
              child: SlideAnimation(
                intervalEnd: 0.5,
                begin: const Offset(0, -50),
                child: FadeAnimation(
                  intervalEnd: 0.5,
                  child: Row(
                    children: [
                      Text(
                        'Art & ',
                        style: _textBoldStyle,
                      ),
                      const ColoredText('NFTs')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenBasePadding),
              child: FadeAnimation(
                intervalEnd: 0.5,
                child: Text(
                  'Digital marketplace for crypto \nand non-fungible tokens.',
                  style: TextStyle(
                      fontSize: 16.sp, letterSpacing: 1.2, height: 1.2),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            const Padding(
              padding: EdgeInsets.only(left: screenBasePadding),
              child: DiscoverNetwork(),
            ),
            SizedBox(
              height: 30.h,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: screenBasePadding),
              child: SupportedBy(),
            )
          ],
        ),
      ),
    );
  }
}

class ColoredText extends StatelessWidget {
  final String text;

  const ColoredText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 10.w,
            child: Container(
              width: 85.w,
              height: 30.w,
              color: const Color(0xffaafaff),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 45.sp,
              fontFamily: 'Dsignes',
              fontWeight: FontWeight.w600,
              color: Colors.black,
              // height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class DiscoverNetwork extends StatelessWidget {
  const DiscoverNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '12.1K+',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                      fontFamily: 'Dsignes'),
                ),
                Text(
                  'Art Work',
                  style: TextStyle(fontSize: 15.sp, height: 1.4),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1.7M+',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                      fontFamily: 'Dsignes'),
                ),
                Text(
                  'Artist',
                  style: TextStyle(fontSize: 15.sp, height: 1.4),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '45K+',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                      fontFamily: 'Dsignes'),
                ),
                Text(
                  'Auction',
                  style: TextStyle(fontSize: 15.sp, height: 1.4),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 50.w,
        ),
        Expanded(
            child: Container(
          height: 220.h,
          color: Color(0xffe6d9fe),
          child: Padding(
            padding: EdgeInsets.all(30.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: HomeScreen(), type: PageTransitionType.fadeIn),
                    );
                  },
                  child: Container(
                    height: 50.w,
                    width: 50.w,
                    color: Color(0xffcab2ff),
                    child: Center(
                      child: Icon(CupertinoIcons.arrow_right),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Discover\nArtwork',
                  style: TextStyle(
                    fontSize: 35.sp,
                    letterSpacing: 5,
                  ),
                ),
                SizedBox(
                  width: 80.w,
                  child: Divider(
                    height: 30,
                    thickness: 2,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}

class SupportedBy extends StatelessWidget {
  const SupportedBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Supported by',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          width: 150.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/images/binance.svg',
                width: 30.w,
                height: 30.w,
              ),
              SvgPicture.asset(
                'assets/images/huobi.svg',
                width: 30.w,
                height: 30.w,
              ),
              SvgPicture.asset(
                'assets/images/xrp.svg',
                width: 30.w,
                height: 30.w,
              ),
            ],
          ),
        )
      ],
    );
  }
}
