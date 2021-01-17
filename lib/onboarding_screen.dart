import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002752),
      body: Builder(
        builder: (context) => Column(
          children: [
            Expanded(
              flex: 67,
              child: SvgPicture.asset(
                'assets/images/img_bg.svg',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 33,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      'The Camping App',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 286 / 375,
                    child: Text(
                      'Connect with people and plan your next escape to explore this beautiful World!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: 46),
                  FlatButton(
                    onPressed: () => showSheet(context),
                    minWidth: MediaQuery.of(context).size.width * 250 / 375,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    color: Color(0xFF0172C0),
                    child: Text(
                      "LET'S GO",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 27)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 27),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...activityView(),
            ...recommendPlaceView(),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 30, 24, 21),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create New Place\n',
                        style: TextStyle(fontSize: 14, color: Color(0xFF5A5A5A)),
                      ),
                      Text(
                        'Create camping with your Friends',
                        style: TextStyle(fontSize: 12, color: Color(0xFF5A5A5A)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> activityView() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Text(
          'Activities you Love',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 14),
      SizedBox(
        height: 90,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), border: Border.all(width: 1, color: Color(0xFF0172C0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_kayak.svg',
                    color: Color(0xFF0172C0),
                  ),
                  Spacer(),
                  Text('Kayaking', style: TextStyle(fontSize: 12, color: Color(0xFF0172C0)))
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => VerticalDivider(
            width: 16,
            color: Colors.transparent,
          ),
        ),
      )
    ];
  }

  List<Widget> recommendPlaceView() {
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 27, 24, 14),
        child: Text(
          'Recommended Places',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 160,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  width: 130,
                  clipBehavior: Clip.antiAlias,
                  height: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  child: SvgPicture.asset(
                    'assets/images/img_place.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 8,
                  right: 8,
                  child: Text(
                    'Lichnos camp Greece',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => VerticalDivider(
            width: 16,
            color: Colors.transparent,
          ),
        ),
      )
    ];
  }
}
