import 'package:car_store/models/animation_item.dart';
import 'package:car_store/models/car.dart';
import 'package:car_store/pages/cars_list.dart';
import 'package:car_store/utils/constants.dart';
import 'package:car_store/utils/router.dart';
import 'package:car_store/widgets/fade_slide.dart';
import 'package:flutter/material.dart';

final List<Car> cars = [
  Car(
    image: Image.asset(
      "assets/car3.png",
      width: 150.0,
    ),
    name: "BMW 3 Series",
    stock: 6,
  ),
  Car(
    image: Image.asset(
      "assets/carbig.png",
      width: 150.0,
    ),
    name: "BMW 3 Series",
    stock: 6,
  ),
  Car(
    image: Image.asset(
      "assets/car4.png",
      width: 150.0,
    ),
    name: "BMW 3 Series",
    stock: 6,
  ),
  Car(
    image: Image.asset(
      "assets/car1.png",
      width: 150.0,
    ),
    name: "BMW 3 Series",
    stock: 6,
  ),
  Car(
    image: Image.asset(
      "assets/car3.png",
      width: 150.0,
    ),
    name: "BMW 3 Series",
    stock: 6,
  ),
  Car(
    image: Image.asset(
      "assets/carbig.png",
      width: 150.0,
    ),
    name: "BMW 3 Series",
    stock: 6,
  ),
  Car(
    image: Image.asset(
      "assets/car4.png",
      width: 150.0,
    ),
    name: "BMW 3 Series",
    stock: 6,
  ),
  Car(
    image: Image.asset(
      "assets/car1.png",
      width: 150.0,
    ),
    name: "BMW 3 Series",
    stock: 6,
  ),
];

class CarsModal extends StatefulWidget {
  @override
  _CarsModalState createState() => _CarsModalState();
}

class _CarsModalState extends State<CarsModal>
    with SingleTickerProviderStateMixin {
  List<AnimationItem> animationItems = [
    AnimationItem(
      id: "slide-1",
      entry: 30,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-2",
      entry: 30,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-3",
      entry: 35,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-4",
      entry: 40,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-5",
      entry: 43,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-6",
      entry: 46,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-7",
      entry: 49,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-8",
      entry: 52,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-9",
      entry: 55,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-10",
      entry: 58,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-11",
      entry: 61,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-12",
      entry: 64,
      entryDuration: 300,
      visible: false,
    ),
  ];
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 65).animate(animationController)
      ..addListener(() {
        setState(() {
          animationItems = updateVisibleState(animationItems, animation.value);
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.0,
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.0,
          ),
          FadeSlide(
            direction: !getItemVisibility("slide-1", animationItems),
            offsetX: 0.0,
            offsetY: 150,
            duration: getSlideDuration("slide-1", animationItems),
            child: Image.asset(
              "assets/bmw.png",
              width: 50.0,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          FadeSlide(
            direction: !getItemVisibility("slide-2", animationItems),
            offsetX: 0.0,
            offsetY: 150,
            duration: getSlideDuration("slide-2", animationItems),
            child: Text(
              "BMW",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 27.0,
                // color: kPrimaryColor,
              ),
            ),
          ),
          FadeSlide(
            direction: !getItemVisibility("slide-3", animationItems),
            offsetX: 0.0,
            offsetY: 150,
            duration: getSlideDuration("slide-3", animationItems),
            child: Text(
              "8 Series",
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
          Container(
            height: 200.0,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return FadeSlide(
                  direction:
                      !getItemVisibility("slide-${index + 4}", animationItems),
                  offsetX: 0.0,
                  offsetY: 150,
                  duration:
                      getSlideDuration("slide-${index + 4}", animationItems),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 130.0,
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFE4E4EE),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: cars[index].image,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        cars[index].name + " ${index + 4}",
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
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 20.0,
                );
              },
              itemCount: 8,
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          FadeSlide(
            direction: !getItemVisibility("slide-12", animationItems),
            offsetX: 0.0,
            offsetY: 150,
            duration: getSlideDuration("slide-12", animationItems),
            child: Container(
              width: MediaQuery.of(context).size.width * .7,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 22.0),
                onPressed: () {
                  animationController.forward()
                    ..then(
                      (value) {
                        animateTransition(context, CarsList());
                      },
                    );
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.white,
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
