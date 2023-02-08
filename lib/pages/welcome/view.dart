import 'package:firebase_chat/pages/welcome/index.dart';
import 'package:flutter/material.dart';
import'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';


class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Obx(() => SizedBox(
        width: 360.w,
        height: 780.w,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              scrollDirection: Axis.horizontal,
              reverse: false,
              onPageChanged: (index){
                controller.changePage(index);

              },
              controller: PageController(
                  initialPage: 0, keepPage: false, viewportFraction: 1
              ),
              pageSnapping: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image:
                    DecorationImage(
                      fit: BoxFit.fill,
                      image:
                      AssetImage
                        ("assets/images/banner1.png"),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image:
                    DecorationImage(
                      fit: BoxFit.fill,
                      image:
                      AssetImage
                        ("assets/images/banner2.png"),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image:
                    DecorationImage(
                      fit: BoxFit.fill,
                      image:
                      AssetImage
                        ("assets/images/banner4.png"),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                          bottom: 90,
                          child: ElevatedButton(onPressed: (){
                            controller.handleSignIn();
                          },
                            child: Text("Get Started"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                              foregroundColor: MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                              side: MaterialStateProperty.all(const BorderSide(color: Colors.grey)),
                            ),

                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 45,
              child: DotsIndicator(
                position: controller.state.index.value.toDouble(),
                dotsCount: 3,
                reversed: false,
                mainAxisAlignment: MainAxisAlignment.center,
                decorator: DotsDecorator(
                  size: Size.square(9),
                  activeSize: const Size(18.0,9.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                ),


              ),
            ),
          ],
        ),
      ),)
    );
  }
}
