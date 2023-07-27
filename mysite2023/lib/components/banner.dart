import 'package:flutter/material.dart';
import 'package:mysite2023/components/about.dart';
import 'package:mysite2023/components/gallery.dart';
import 'package:mysite2023/components/splash.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget(
      {super.key, required this.isMobile, required this.showAll});
  final bool isMobile;
  final bool showAll;

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late bool _isMobile;
  late bool _showAll;
  late bool _about;

  @override
  void initState() {
    _about = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    _isMobile = widget.isMobile;
    _showAll = widget.showAll;
    return Scaffold(
      backgroundColor: _showAll ? Colors.white : Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: _showAll
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  SizedBox(
                      width: width,
                      child: InkWell(
                        splashColor: Colors.black,
                        onTap: () {
                          setState(() {
                            _about = !_about;
                          });
                        },
                        child: Text(
                          _about ? "About" : "PJB",
                          textAlign:
                              _about ? TextAlign.start : TextAlign.center,
                          style: TextStyle(
                              color: _showAll
                                  ? _about
                                      ? Colors.red
                                      : Colors.black
                                  : Colors.white,
                              fontSize: 92,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Text(
                    "FULL STACK DEVELOPER",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: _showAll ? Colors.black : Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: _showAll ? Colors.black : Colors.white),
                          child: Text(
                            "PETER JOHN BISHOP",
                            style: TextStyle(
                                color: _showAll ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _showAll == false
                ? Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: SplashWidget(
                      isMobile: _isMobile,
                    ),
                  )
                : AnimatedOpacity(
                    opacity: _showAll ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 2000),
                    child: Container(
                        decoration: const BoxDecoration(color: Colors.black),
                        child: _about
                            ? AboutWidget(isMobile: _isMobile)
                            : GalleryWidget(isMobile: _isMobile))),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: _showAll
                        ? _isMobile
                            ? AnimatedOpacity(
                                opacity: _showAll ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 2000),
                                child: const Text(
                                  "...and dad!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              )
                            : AnimatedOpacity(
                                opacity: _showAll ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 2000),
                                child: const Text(
                                  "flutter/dart mongodb expressjs reactjs nodejs aws[dynamodb, s3, ec2] firebase[auth, firestore, cloudstorage] RESTful_API html/css/javascript sql/mysql graphql axios sequelize OAUTH2 JWT iOS/xcode",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              )
                        : _isMobile
                            ? const Text(
                                "Welcome to my mobile site.",
                                style: TextStyle(color: Colors.white),
                              )
                            : const Text("Welcome to my desktop site.",
                                style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
