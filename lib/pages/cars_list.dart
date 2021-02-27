import 'package:car_store/models/animation_item.dart';
import 'package:car_store/pages/car_detail.dart';
import 'package:car_store/pages/home.dart';
import 'package:car_store/utils/animation_transition.dart';
import 'package:car_store/widgets/car_modal.dart';
import 'package:car_store/widgets/fade_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CarsList extends StatefulWidget {
  @override
  _CarsListState createState() => _CarsListState();
}

class _CarsListState extends State<CarsList>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  List<AnimationItem> animationItems = [];
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    // Loop through and create animations

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EEF6),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: SizedBox.shrink(),
              ),
              // Lets make setups for animations
              FadeSlide(
                offsetX: 0.0,
                offsetY: 60.0,
                duration: getSlideDuration("slide-1", animationItems),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Home(),
                          ),
                        );
                      },
                      child: Container(
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
                    ),
                    Spacer(),
                    Text(
                      "Panda",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/panda.jpg",
                      ),
                    )
                  ],
                ),
                direction: getItemVisibility(
                  "slide-1",
                  animationItems,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              FadeSlide(
                offsetX: 0.0,
                offsetY: 60.0,
                duration: getSlideDuration("slide-2", animationItems),
                child: Text(
                  "Choose your\nawesome car!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32.0,
                    color: Color(0xFF333333),
                    height: 1.3,
                  ),
                ),
                direction: getItemVisibility(
                  "slide-2",
                  animationItems,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return FadeSlide(
                    offsetX: 0.0,
                    offsetY: 60.0,
                    duration:
                        getSlideDuration("slide-${index + 3}", animationItems),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
                      ),
                      height: 190.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Create CarDetail()
                          animateTransition(context, CarDetail());
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: cars[index].image,
                              ),
                            ),
                            Text(
                              cars[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              "${cars[index].stock} Cars",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    direction:
                        getItemVisibility("slide-${index + 3}", animationItems),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.0,
                  );
                },
                // referencing the cars from car_modal.dart
                itemCount: cars.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
