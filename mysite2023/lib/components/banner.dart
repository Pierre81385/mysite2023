import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment:
          _showAll ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Container(
                child: const Text(
                  "PJB",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 92,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.black),
                      child: const Text(
                        "PETER JOHN BISHOP",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                "FULL STACK DEVELOPER",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        AnimatedOpacity(
            opacity: _showAll ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 2000),
            child: const Text("{gallery widget}")),
        _showAll
            ? AnimatedOpacity(
                opacity: _showAll ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 2000),
                child: Text("{nav bar}"))
            : const Text(
                "flutter/dart mongodb expressjs reactjs nodejs aws[dynamodb, s3, ec2] firebase[auth, firestore, cloudstorage] RESTful_API html/css/javascript sql/mysql graphql axios sequelize OAUTH2 JWT iOS/xcode",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
      ],
    );
  }
}
