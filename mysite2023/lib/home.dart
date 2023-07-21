import 'package:flutter/material.dart';
import 'package:mysite2023/components/banner.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _shouldStop;
  late bool _showAll;

  void periodicTimer() {
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        setState(() {
          _shouldStop = true;
          _showAll = true;
        });
        if (_shouldStop) {
          timer.cancel();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _shouldStop = false;
    _showAll = false;
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    periodicTimer();

    return Scaffold(
      body: isMobile
          ? SafeArea(
              child: Container(
              //mobile layout (vertical)
              child: Column(
                children: [
                  //hero banner
                  Expanded(
                    child: BannerWidget(
                      isMobile: isMobile,
                      showAll: _showAll,
                    ),
                  ),
                  AnimatedOpacity(
                    // If the widget is visible, animate to 0.0 (invisible).
                    // If the widget is hidden, animate to 1.0 (fully visible).
                    opacity: _showAll ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    // The green box must be a child of the AnimatedOpacity widget.
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.green,
                    ),
                  )
                  //about
                  //grid list gallery
                  //skills
                  //contact
                ],
              ),
              //nav with floating action button https://docs.flutter.dev/cookbook/effects/expandable-fab
            ))
          : Container(
              height: height,
              width: width,
              child: BannerWidget(
                isMobile: isMobile,
                showAll: _showAll,
              ),
            ),

      //about
      //skills
      //horizonal paralax gallery?
      //contact
    );
  }
}
