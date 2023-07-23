import 'package:flutter/material.dart';
import 'package:mysite2023/components/about.dart';
import 'package:mysite2023/components/gallery.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    child: Text(
                      "PJB",
                      style: TextStyle(
                          color: _showAll ? Colors.black : Colors.white,
                          fontSize: 92,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
            AnimatedOpacity(
                opacity: _showAll ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 2000),
                child: Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: GalleryWidget(isMobile: _isMobile))),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: _showAll ? Colors.black : Colors.white),
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
                                      fontSize: 14, color: Colors.grey),
                                ),
                              )
                        : _isMobile
                            ? Text("[ mobile environment ]")
                            : Text("[ desktop environment ]"),
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
