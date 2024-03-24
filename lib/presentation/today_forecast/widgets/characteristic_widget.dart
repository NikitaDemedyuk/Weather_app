import 'package:flutter/cupertino.dart';

class CharacteristicWidget extends StatelessWidget {
  
  final String text;
  final IconData iconData;
  
  const CharacteristicWidget({
    required this.text,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: CupertinoColors.activeOrange,
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 60,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}