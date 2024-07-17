import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customMessageHandler(BuildContext context){
  return  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Oops! No internet connection. Please check your network settings and try again.'),
      backgroundColor: Colors.redAccent,
    ),
  );
}