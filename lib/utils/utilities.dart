import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  Color? color;

  //Getting movie ratings
  static double avgRating(List<int> rating) {
    var avgRating = 0;
    for (int i = 0; i < rating.length; i++) {
      avgRating += rating[i];
    }
    return double.parse((avgRating / rating.length).toStringAsFixed(1));
  }

  //focus change in form field
  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentNode,
    FocusNode nextNode,
  ) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  //fluttertoast
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  //flushbar

  static void flushBarErrorMessage(
      String message, BuildContext context, Color? color) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        message: message,
        duration: const Duration(seconds: 2),
        backgroundColor: color ?? Colors.red.shade600,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.TOP,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  // our usual snackbar
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
