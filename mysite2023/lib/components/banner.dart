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
    _isMobile = widget.isMobile;
    _showAll = widget.showAll;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.black),
          alignment: Alignment.bottomCenter,
          child: Text(
            "PJB",
            style: TextStyle(
                color: Colors.white, fontSize: 92, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: [
            Text("PETER JOHN BISHOP"),
            Text(
              "FULL STACK DEVELOPER",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              "flutter/dart mongodb expressjs reactjs nodejs aws[dynamodb, s3, ec2] firebase[auth, firestore, cloudstorage] RESTful_API html/css/javascript sql/mysql graphql axios sequelize OAUTH2 JWT iOS/xcode",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            )
          ],
        ),
        _isMobile
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {}, child: Text("- [ENTER] -")),
              ),
      ],
    );
  }
}
