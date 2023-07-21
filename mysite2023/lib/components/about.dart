import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key, required this.isMobile});
  final bool isMobile;

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  late bool _isMobile;

  @override
  void initState() {
    _isMobile = widget.isMobile;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("About Component"),
    );
  }
}
