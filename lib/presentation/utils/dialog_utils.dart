import 'package:flutter/cupertino.dart';

abstract class DialogUtils {
  static Future<bool> showInfoDialog({
    required BuildContext context,
    required String title,
    String? description,
    required String applyText,
    bool barrierDismissible = true,
    TextAlign? descriptionTextAlign,
  }) async {
    final dismissed = await showCupertinoDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: description == null
            ? null
            : Text(
                description,
                style: const TextStyle(fontSize: 13),
                textAlign: descriptionTextAlign ?? TextAlign.center,
              ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            isDestructiveAction: true,
            textStyle: TextStyle(
              color: CupertinoTheme.of(context).primaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: Text(applyText),
          ),
        ],
      ),
    );

    return dismissed != null && dismissed == true;
  }
}