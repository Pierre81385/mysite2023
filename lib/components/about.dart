import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mysite2023/components/gallery_data.dart';
import 'package:flip_card/flip_card.dart';

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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlipCard(
                  fill: Fill
                      .fillBack, // Fill the back side of the card to make in the same size as the front.
                  direction: FlipDirection.HORIZONTAL, // default
                  side: CardSide.FRONT, // The side to initially display.
                  front: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        alignment: Alignment.center,
                        image:
                            AssetImage(aboutContent[index]["image"].toString()),
                        height: _isMobile ? height * 0.6 : height * 0.5,
                        width: _isMobile ? width * 0.9 : height * 0.5,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  back: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              aboutContent[index]["headline"].toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 32),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              aboutContent[index]["imgDesc"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Text(
                            aboutContent[index]["p1"].toString(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(aboutContent[index]["p2"].toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
