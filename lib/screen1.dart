import 'package:ecommerce/registerAccount.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Welcomeback.dart';

class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  int currentIndex = 0;
  final items = [
    'assets/images/splash_1.png',
    'assets/images/splash_2.png',
    'assets/images/splash_3.png',
  ];

  // var controller = PageController(
  //   viewportFraction: 0.8,
  //);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                children: [
                  Text(
                    "TOKOTO",
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepOrange),
                  ),
                  Text(
                    "Welcome to Tokoto,Lets shop!",
                    style: TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  CarouselSlider.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = items[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                        height: 300, onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex=index;
                          });
                    }

                    ),
                  ),
                  SizedBox(height: 15,),
                  buildIndecator(),

                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.deepOrange,
                    ),
                    height: 60.0,
                    width: 300,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Welcome()),
                        );
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage,int index) =>
      Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Image.asset(urlImage, fit: BoxFit.cover),width: 230,
      );

  Widget buildIndecator() =>
      AnimatedSmoothIndicator(

        count: 3,
        effect: ExpandingDotsEffect(dotWidth: 15),
        activeIndex: currentIndex,

      );
}
