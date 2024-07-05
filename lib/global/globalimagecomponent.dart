import 'package:flutter/widgets.dart';

class ImageComponent extends StatelessWidget {
  final String path;
  const ImageComponent({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(120)),
        height: 50,
        width: 50,
        child: Image.asset(path));
  }
}