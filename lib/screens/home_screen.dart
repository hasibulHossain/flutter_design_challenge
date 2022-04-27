import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nft_marketplace_concept/animations/page_transition.dart';
import 'package:nft_marketplace_concept/animations/slide_animation.dart';
import 'package:nft_marketplace_concept/constants/constants.dart';
import 'package:nft_marketplace_concept/screens/nft_details.dart';
import 'package:nft_marketplace_concept/widgets/custom_appbar/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController? _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> nft = [
      {
        "day": "day 74",
        "userName": "@WMark Rise",
        "image": "assets/images/image-0.jpg",
        "remainingTime": "20h : 35m : 08s",
        "price": "15.97 ETH"
      },
      {
        "day": "day 45",
        "userName": "@Merry Rose",
        "image": "assets/images/image-1.jpeg",
        "remainingTime": "00h : 55m : 05s",
        "price": "10.44 ETH"
      },
    ];
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: Column(
        children: [
          SizedBox(height: ScreenUtil().statusBarHeight + 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: screenBasePadding),
            child: CustomAppBar(
              isBackEnabled: false,
              trailing: Container(
                width: 50.w,
                height: 50.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/profile.jpg')),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: screenBasePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Live',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Auction.',
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Enjoy! the latest hot auctions.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Iconsax.setting_4))
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenBasePadding),
            child: _Categories(category),
          ),
          SizedBox(
            height: 20.h,
          ),
          SlideAnimation(
            begin: Offset(400.w, 0),
            child: SizedBox(
              height: 330.h,
              child: PageView.builder(
                controller: _pageController,
                itemCount: nft.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: NftDetailsScreen(
                          index: index,
                          image: nft[index]["image"] as String,
                          
                        ),
                        type: PageTransitionType.fadeIn,
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    margin: EdgeInsets.only(right: 20.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.r),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                nft[index]["day"]!.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                ),
                              ),
                              Text(
                                nft[index]["userName"]!,
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: Hero(
                                tag: '$index',
                                child: Image.asset(
                                  nft[index]["image"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nft[index]["remainingTime"]!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      'Remaining Time',
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      nft[index]["price"]!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      'Highest bid',
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> category = [
  'Trending',
  'Digital Arts',
  '3D Videos',
  'Game',
  'Portrait'
];

class _Categories extends StatelessWidget {
  const _Categories(this._categories, {Key? key}) : super(key: key);
  final List<String> _categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (_, index) => _CategoryItem(
          _categories[index],
          index: index,
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem(this.category, {Key? key, required this.index})
      : super(key: key);

  final String category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
      // margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: index == 0 ? Colors.black : Colors.transparent,
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
            color: index == 0 ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 22.r,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: BottomIcon(
            icon: Iconsax.home,
          ),
          label: 'home',
          activeIcon: BottomIcon(
            icon: Iconsax.home_15,
            isActive: true,
          ),
        ),
        BottomNavigationBarItem(
          icon: BottomIcon(
            icon: Iconsax.discover_1,
            isActive: false,
          ),
          label: 'discover',
        ),
        BottomNavigationBarItem(
          icon: BottomIcon(
            icon: Iconsax.add_square,
          ),
          label: 'add',
        ),
        BottomNavigationBarItem(
          icon: BottomIcon(
            icon: Iconsax.shop,
          ),
          label: 'shop',
        ),
        BottomNavigationBarItem(
          icon: BottomIcon(
            icon: Iconsax.wallet_3,
          ),
          label: 'wallet',
        ),
      ],
    );
  }
}

class BottomIcon extends StatelessWidget {
  const BottomIcon({required this.icon, this.isActive = false, Key? key})
      : super(key: key);

  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Divider(
          thickness: 2,
          indent: 25.w,
          endIndent: 25.w,
          color: isActive ? Colors.black : Colors.transparent,
        )
      ],
    );
  }
}
