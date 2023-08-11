import 'package:flutter/material.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key, required this.isMobile});
  final bool isMobile;

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  late bool _isMobile;

  @override
  Widget build(BuildContext context) {
    _isMobile = widget.isMobile;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: _isMobile ? height * 0.7 : height * 0.7,
      width: _isMobile ? width : width,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _isMobile
                ? const AssetImage("lib/assets/me.png")
                : const AssetImage("lib/assets/me_splash.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
