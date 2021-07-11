import 'package:flutter/material.dart';

class BoxOffset extends StatefulWidget {
  final Widget child;
  final Function(Offset offset) getOffset;

  const BoxOffset({Key? key, required this.child, required this.getOffset})
      : super(key: key);

  @override
  _BoxOffsetState createState() => _BoxOffsetState();
}

class _BoxOffsetState extends State<BoxOffset> {
  GlobalKey widgetKey = GlobalKey();

  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final box = widgetKey.currentContext!.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);
      print(box.size.height);
      widget.getOffset(offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}
