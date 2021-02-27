import 'dart:math';

import 'package:car_store/models/animation_item.dart';
import 'package:car_store/utils/constants.dart';
import 'package:car_store/widgets/car_modal.dart';
import 'package:car_store/widgets/fade_slide.dart';
import 'package:car_store/widgets/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List<String> carLogos = [
  "assets/bmw.png",
  "assets/mercedes.png",
  "assets/porsche.png",
  "assets/vw.png",
  // I'll just duplicate for more
  "assets/bmw.png",
  "assets/mercedes.png",
  "assets/porsche.png",
  "assets/vw.png",
];

const Y_OFFSET = 60.0;

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // Page controller
  PageController pageController;
  // Keep track of active page 4 as default (almost middle)
  double pageScrollValue = 4.0;
  // active Page index
  int activePage = 4;

  //  Animation controller and animation

  AnimationController animationController;
  Animation animation;

  // Define all items we want to animate

  List<AnimationItem> animationItems = [
    // First text
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
      entry: 200,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-6",
      entry: 190,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-7",
      entry: 210,
      entryDuration: 400,
      visible: false,
    ),
  ];
  @override
  void initState() {
    pageController = PageController(
      initialPage: 4,
      // wont take up whole page
      viewportFraction: .55,
    )..addListener(() {
        // Forgot to update state
        setState(() {
          activePage = pageController.page.round();
          pageScrollValue = pageController.page;
        });
      });

    //  initialize animation controller
    animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    // initialize animation
    animation = Tween<double>(begin: 0, end: 210).animate(animationController)
      ..addListener(() {
        // We cant see anything because we are not updating UI
        // and animation state
        setState(() {
          animationItems = updateVisibleState(animationItems, animation.value);
        });
      });

    // Play animation
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    // clear animations
    animationController.dispose();
    // clear page controller
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Lets restart the app so icons can load
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
              // Lets slide animated this
              FadeSlide(
                direction: getItemVisibility("slide-1", animationItems),
                offsetX: 0.0,
                offsetY: Y_OFFSET,
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
                offsetY: Y_OFFSET,
                duration: getSlideDuration("slide-2", animationItems),
                child: Text(
                  "CHOOSE\nFAVORITE\nBRANDS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FadeSlide(
                direction: getItemVisibility("slide-3", animationItems),
                offsetX: 0.0,
                offsetY: Y_OFFSET,
                duration: getSlideDuration("slide-3", animationItems),
                child: Text(
                  "Get your best deals",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ),
              Flexible(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.center,
                      child: Stack(
                        // We need to animate sizes on scroll here
                        // #1 Entry animation
                        alignment: Alignment.topRight,
                        children: [
                          ScaleAnimation(
                            direction:
                                getItemVisibility("slide-4", animationItems),
                            duration:
                                getSlideDuration("slide-4", animationItems),
                            // Lets now animate scrolling
                            child: AnimatedContainer(
                              padding: EdgeInsets.all(20.0),
                              duration: Duration(milliseconds: 300),
                              height: activePage == index ? 180.0 : 120.0,
                              width: activePage == index ? 180.0 : 120.0,
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
                                  carLogos[index],
                                ),
                              ),
                            ),
                          ),
                          // Lets delay this
                          Positioned(
                            top: 10.0,
                            right: 10.0,
                            child: ScaleAnimation(
                              duration:
                                  getSlideDuration("slide-6", animationItems),
                              direction:
                                  getItemVisibility("slide-6", animationItems),
                              child: AnimatedSwitcher(
                                duration: Duration(
                                  milliseconds: 150,
                                ),
                                child: index.toDouble() == pageScrollValue
                                    ? Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          FlutterIcons.check_mdi,
                                          color: Colors.white,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: carLogos.length,
                ),
              ),
              FadeSlide(
                direction: getItemVisibility("slide-5", animationItems),
                offsetX: 0.0,
                offsetY: Y_OFFSET,
                duration: getSlideDuration("slide-5", animationItems),
                child: Text(
                  "Swipe left or right to see more",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FadeSlide(
                offsetX: 0.0,
                offsetY: Y_OFFSET,
                duration: getSlideDuration("slide-7", animationItems),
                direction: getItemVisibility("slide-7", animationItems),
                child: Container(
                  width: MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      // Show bottom sheet on click
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                        barrierColor: Colors.black.withOpacity(.8),
                        context: context,
                        builder: (_) {
                          return CarModal();
                        },
                      );
                    },
                    padding: EdgeInsets.symmetric(vertical: 22.0),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
