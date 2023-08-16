import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mysite2023/components/gallery_data.dart';
import 'package:flip_card/flip_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({super.key, required this.isMobile});
  final bool isMobile;

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
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
            itemCount: timeLineData.length,
            itemBuilder: (BuildContext context, index) {
              return TimelineTile(
                axis:
                    _isMobile ? TimelineAxis.vertical : TimelineAxis.horizontal,
                isFirst: index == 0 ? true : false,
                isLast: index == timeLineData.length - 1 ? true : false,
                alignment:
                    _isMobile ? TimelineAlign.manual : TimelineAlign.center,
                lineXY: 0,
                endChild: SizedBox(
                  width: _isMobile ? width * 0.9 : width,
                  height: _isMobile ? height * 0.7 : height * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(timeLineData[index]["date"].toString()),
                            Text(timeLineData[index]["company"].toString()),
                            Text(timeLineData[index]["position"].toString()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(timeLineData[index]["description"]
                                  .toString()),
                            )
                          ],
                        ),
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
