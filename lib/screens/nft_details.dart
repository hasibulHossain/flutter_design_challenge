import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nft_marketplace_concept/constants/constants.dart';
import 'package:nft_marketplace_concept/widgets/custom_appbar/custom_appbar.dart';

class NftDetailsScreen extends StatelessWidget {
  final int index;
  final String image;
  const NftDetailsScreen({Key? key, required this.index, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenUtil().statusBarHeight + 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenBasePadding),
            child: CustomAppBar(
              isBackEnabled: true,
              title: 'Auction',
              leadingCb: () {
                Navigator.pop(context);
              },
              trailing: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.heart),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.menu),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenBasePadding),
            child: Container(
              width: double.infinity,
              height: 260.h,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: Hero(
                tag: '$index',
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenBasePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'DAY 74',
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/user.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('@Mark Rise'),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    'Who we were and what we will become are there, they are around us, they are battling, they are resting and they are being watched...',
                    style: TextStyle(fontSize: 15.sp, height: 1.3),
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/profile.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text('Highest Bid Placed By'),
                                ),
                                Text(
                                  'Merry Rose',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '15.97 ETH',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: CustomButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black,
      ),
      padding: EdgeInsets.all(20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Place Bid', style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600,),),
          Text('20h : 35m : 00s', style: TextStyle(color: Colors.white, fontSize: 16.sp, ),),
        ],
      ),
    );
  }
}
