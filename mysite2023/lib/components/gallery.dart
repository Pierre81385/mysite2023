import 'package:flutter/material.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({super.key, required this.isMobile});
  final bool isMobile;

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late bool _isMobile;

  @override
  void initState() {
    _isMobile = widget.isMobile;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Gallery Component"),
    );
  }
}
