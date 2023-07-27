import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mysite2023/components/gallery_data.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key, required this.isMobile});
  final bool isMobile;

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  late bool _isMobile;
  late ScrollController _scrollViewController;

  void _onScroll() {
    print(_scrollViewController.offset);
  }

  @override
  void initState() {
    super.initState();
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
                  child: (index & 1) == 0
                      ? SizedBox(
                          height: _isMobile ? height * 0.6 : height * 0.5,
                          width: _isMobile ? width * 0.9 : height * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              aboutContent[index]["headline"].toString(),
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 48,
                              ),
                            ),
                          ))
                      : Image(
                          image: AssetImage(
                              aboutContent[index]["image"].toString()),
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
