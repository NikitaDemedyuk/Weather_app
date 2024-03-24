import 'package:flutter/cupertino.dart';

const double _kDefaultIndicatorRadius = 10.0;

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({
    super.key,
    this.radius = _kDefaultIndicatorRadius,
    this.color,
  });

  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) => Center(
        child: CupertinoActivityIndicator(
          radius: radius,
          color: color ?? CupertinoTheme.of(context).primaryColor,
        ),
      );
}
