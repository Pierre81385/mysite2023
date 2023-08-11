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
      const Duration(seconds: 3),
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
              top: false,
              bottom: false,
              child: Container(
                //mobile layout (vertical)
                child: Column(
                  children: [
                    //hero banner
                    Expanded(
                      child: Stack(
                        children: [
                          AnimatedOpacity(
                            opacity: _showAll ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 500),
                            child: BannerWidget(
                              isMobile: isMobile,
                              showAll: false,
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: _showAll ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 1500),
                            child: BannerWidget(
                              isMobile: isMobile,
                              showAll: true,
                            ),
                          ),
                        ],
                      ),
                    ),

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
              child: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: _showAll ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: BannerWidget(
                      isMobile: isMobile,
                      showAll: false,
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _showAll ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1500),
                    child: BannerWidget(
                      isMobile: isMobile,
                      showAll: true,
                    ),
                  ),
                ],
              ),
            ),

      //about
      //skills
      //horizonal paralax gallery?
      //contact
    );
  }
}
