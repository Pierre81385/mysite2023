import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mysite2023/components/gallery_data.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({super.key, required this.isMobile});
  final bool isMobile;

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late bool _isMobile;
  late int _showDetails;
  late ScrollController _scrollViewController;

  void _onScroll() {
    print(_scrollViewController.offset);
  }

  @override
  void initState() {
    super.initState();
    _showDetails = -1;
    _isMobile = widget.isMobile;
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _scrollViewController.addListener(_onScroll);
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
            controller: _scrollViewController,
            scrollDirection: _isMobile ? Axis.vertical : Axis.horizontal,
            itemCount: galleryContent.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      if (_showDetails == index) {
                        setState(() {
                          _showDetails = -1;
                        });
                      } else {
                        setState(() {
                          _showDetails = index;
                        });
                      }
                    },
                    child: Image(
                      alignment: _showDetails == index
                          ? Alignment.centerLeft
                          : Alignment.center,
                      image:
                          AssetImage(galleryContent[index]["image"].toString()),
                      height: _isMobile ? height * 0.6 : height * 0.5,
                      width: _isMobile
                          ? width * 0.9
                          : _showDetails == index
                              ? width * 0.9
                              : height * 0.5,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
