import 'dart:math';

import 'package:car_store/models/animation_item.dart';
import 'package:car_store/utils/constants.dart';
import 'package:car_store/widgets/cars_modal.dart';
import 'package:car_store/widgets/fade_slide.dart';
import 'package:car_store/widgets/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List<String> carlogos = [
  "assets/bmw.png",
  "assets/mercedes.png",
  "assets/bmw.png",
  "assets/mercedes.png",
  "assets/bmw.png",
  "assets/mercedes.png",
  "assets/bmw.png",
  "assets/mercedes.png",
];

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  PageController pageController;
  double pageScrollValue = 4.0;
  int activePage = 4;
  AnimationController animationController;
  Animation animation;

  List<AnimationItem> animationItems = [
    AnimationItem(
      id: "slide-1",
      entry: 100,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-2",
      entry: 150,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-3",
      entry: 160,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-4",
      entry: 180,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-5",
      entry: 190,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-6",
      entry: 200,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-7",
      entry: 220,
      entryDuration: 400,
      visible: false,
    ),
  ];
  @override
  void initState() {
    pageController = PageController(
      initialPage: 4,
      viewportFraction: .55,
    )..addListener(() {
        setState(() {
          activePage = pageController.page.round();
          pageScrollValue = pageController.page;
        });
      });

    animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 252).animate(animationController)
      ..addListener(() {
        setState(() {
          animationItems = updateVisibleState(animationItems, animation.value);
        });
      });

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 24.0,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeSlide(
                direction: getItemVisibility("slide-1", animationItems),
                offsetX: 0.0,
                offsetY: 60,
                duration: getSlideDuration("slide-1", animationItems),
                child: Text(
                  "Carsio",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              FadeSlide(
                direction: getItemVisibility("slide-2", animationItems),
                offsetX: 0.0,
                offsetY: 60,
                duration: getSlideDuration("slide-2", animationItems),
                child: Text(
                  "CHOOSE\nFAVORITE\nBRANDS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    // color: kPrimaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FadeSlide(
                direction: getItemVisibility("slide-3", animationItems),
                offsetX: 0.0,
                offsetY: 60,
                duration: getSlideDuration("slide-3", animationItems),
                child: Text(
                  "Got your best deal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    // color: kPrimaryColor,
                  ),
                ),
              ),
              Flexible(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ScaleAnimation(
                            direction:
                                getItemVisibility("slide-4", animationItems),
                            duration:
                                getSlideDuration("slide-4", animationItems),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: activePage == index
                                  ? 180.0
                                  : 120.0 - pageScrollValue,
                              width: activePage == index
                                  ? 180.0
                                  : 120.0 - pageScrollValue,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFE4E4EE),
                              ),
                              child: Transform.scale(
                                scale: max(
                                  .5,
                                  1.0 - (pageScrollValue - index).abs(),
                                ),
                                child: Image.asset(
                                  carlogos[index],
                                ),
                              ),
                            ),
                          ),
                          index.toDouble() == pageScrollValue
                              ? Positioned(
                                  top: 10.0,
                                  right: 10.0,
                                  child: ScaleAnimation(
                                    direction: getItemVisibility(
                                        "slide-7", animationItems),
                                    duration: getSlideDuration(
                                        "slide-7", animationItems),
                                    child: Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kPrimaryColor,
                                      ),
                                      child: Icon(
                                        FlutterIcons.check_mdi,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    );
                  },
                  itemCount: carlogos.length,
                ),
              ),
              FadeSlide(
                direction: getItemVisibility("slide-5", animationItems),
                offsetX: 0.0,
                offsetY: 60,
                duration: getSlideDuration("slide-5", animationItems),
                child: Text(
                  "Swipe left or right to see more",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    // color: kPrimaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FadeSlide(
                direction: getItemVisibility("slide-6", animationItems),
                offsetX: 0.0,
                offsetY: 60,
                duration: getSlideDuration("slide-6", animationItems),
                child: Container(
                  width: MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 22.0),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                        barrierColor: Colors.black.withOpacity(.8),
                        builder: (BuildContext context) {
                          return CarsModal();
                        },
                      );
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
