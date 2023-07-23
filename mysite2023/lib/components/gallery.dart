import 'package:flutter/material.dart';
import 'package:mysite2023/components/gallery_data.dart';

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
    super.initState();
    _isMobile = widget.isMobile;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        height: _isMobile ? height * 0.7 : height * 0.7,
        width: _isMobile ? width * 0.9 : width,
        child: ListView.builder(
            scrollDirection: _isMobile ? Axis.vertical : Axis.horizontal,
            itemCount: galleryContent.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image:
                        AssetImage(galleryContent[index]["image"].toString()),
                    height: _isMobile ? height * 0.6 : height * 0.5,
                    width: _isMobile ? width * 0.9 : height * 0.5,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
