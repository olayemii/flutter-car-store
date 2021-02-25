import 'package:car_store/models/animation_item.dart';
import 'package:car_store/utils/constants.dart';
import 'package:car_store/widgets/cars_modal.dart';
import 'package:car_store/widgets/fade_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CarDetail extends StatefulWidget {
  @override
  _CarDetailState createState() => _CarDetailState();
}

List<Map> colors = [
  {
    "name": "black",
    "color": Colors.black,
    "asset": Image.asset("assets/carbig-black.png"),
  },
  {
    "name": "green",
    "color": Colors.green,
    "asset": Image.asset("assets/carbig-green.png"),
  },
  {
    "name": "grey",
    "color": Colors.grey,
    "asset": Image.asset("assets/carbig-grey.png"),
  },
  {
    "name": "purple",
    "color": Colors.purple,
    "asset": Image.asset("assets/carbig-purple.png"),
  },
  {
    "name": "red",
    "color": Colors.red,
    "asset": Image.asset("assets/carbig.png"),
  }
];

class _CarDetailState extends State<CarDetail>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  List<AnimationItem> animationItems = [];
  int selectedIndex = 0;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    for (int i = 0; i < 10; i++) {
      animationItems.add(
        AnimationItem(
          id: "slide-${i + 1}",
          entry: 30 * (i + 1),
          entryDuration: 250,
          visible: false,
        ),
      );
    }
    animation = Tween<double>(begin: 0, end: 300).animate(animationController)
      ..addListener(
        () {
          setState(() {
            animationItems =
                updateVisibleState(animationItems, animation.value);
          });
        },
      );

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4FF),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: kToolbarHeight,
                      ),
                      FadeSlide(
                        direction: getItemVisibility("slide-1", animationItems),
                        offsetX: 0.0,
                        offsetY: 60,
                        duration: getSlideDuration("slide-1", animationItems),
                        child: Row(
                          children: [
                            Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                              ),
                              child: Icon(
                                FlutterIcons.chevron_left_fea,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                              ),
                              child: Icon(
                                FlutterIcons.menu_sli,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      FadeSlide(
                        direction: getItemVisibility("slide-2", animationItems),
                        offsetX: 0.0,
                        offsetY: 60,
                        duration: getSlideDuration("slide-2", animationItems),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "BMW 8 Series Coupe\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.0,
                                    color: Color(0xFF333333)
                                    // color: kPrimaryColor,
                                    ),
                              ),
                              TextSpan(
                                text: "Start from \$201,967",
                                style: TextStyle(
                                  height: 1.7,
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  // color: kPrimaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Expanded(
                        child: FadeSlide(
                          direction:
                              getItemVisibility("slide-3", animationItems),
                          offsetX: 0.0,
                          offsetY: 60,
                          duration: getSlideDuration("slide-3", animationItems),
                          child: Align(
                            alignment: Alignment.center,
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 80000),
                              child: colors[selectedIndex]["asset"],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FadeSlide(
                  direction: getItemVisibility("slide-4", animationItems),
                  offsetX: 0.0,
                  offsetY: 60,
                  duration: getSlideDuration("slide-4", animationItems),
                  child: Container(
                    height: 360.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 32.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            getActiveTab(
                              Text(
                                "Inspire",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              true,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            getActiveTab(
                              Text(
                                "Inform",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(.5),
                                ),
                              ),
                              false,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            getActiveTab(
                              Text(
                                "Technical Data",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(.5),
                                ),
                              ),
                              false,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          "A modal bottom sheet is an alternative to a menu or a dialog and ... do it using the default showModalBottomSheet",
                          style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                            fontSize: 16.0,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Divider(),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: colors.map((color) {
                            int index = colors.indexOf(color);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                width: 35.0,
                                height: 35.0,
                                margin: EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  color: color["color"],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: index == selectedIndex
                                        ? kPrimaryColor
                                        : Colors.transparent,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[400],
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Icon(
                                FlutterIcons.heart_fea,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width * .7,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: FlatButton(
                                  padding: EdgeInsets.symmetric(vertical: 22.0),
                                  onPressed: () {},
                                  child: Text(
                                    "Checkout",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
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

Widget getActiveTab(Widget child, bool isActive) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      child,
      SizedBox(height: 5.0),
      Container(
        height: 4.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ],
  );
}
