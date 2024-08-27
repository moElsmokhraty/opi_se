import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

class TeamMembersSlider extends StatefulWidget {
  const TeamMembersSlider({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<TeamMembersSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> imgList = [
    'assets/images/zezo.jpg',
    'assets/images/mo5.jpg',
    'assets/images/nada.jpg',
    'assets/images/se7s.jpg',
    'assets/images/khadija.jpg',
    'assets/images/3atef.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          SizedBox(
            height: 340.h,
            child: CarouselSlider(
              items: [
                ImageSlider(
                  img: imgList[0],
                  name: 'Ahmed Abdelaziz',
                  position: 'Backend Developer',
                ),
                ImageSlider(
                  img: imgList[1],
                  name: 'Mohamed Elsmokhraty',
                  position: 'Flutter Developer',
                ),
                ImageSlider(
                  img: imgList[2],
                  name: 'Nada Abdelnaser',
                  position: 'UI/UX Designer',
                ),
                ImageSlider(
                  img: imgList[3],
                  name: 'Hussein Abdelraziq',
                  position: 'Frontend Developer',
                ),
                ImageSlider(
                  img: imgList[4],
                  name: 'Khadija Ahmed',
                  position: 'Data Analyst',
                ),
                ImageSlider(
                  img: imgList[5],
                  name: 'Mohamed Atef',
                  position: 'ML Engineer',
                ),
              ],
              controller: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  height: 326.h,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? const Color(0XFF036666)
                        : const Color(0XFFD9D9D9),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.img,
    required this.name,
    required this.position,
  });

  final String img;
  final String name;
  final String position;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 326.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 10.r,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            child: Image.asset(
              img,
              alignment: Alignment.center,
              height: 226.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: name == 'Mohamed Elsmokhraty' ? 128.h : 105.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    position,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
