import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customMessageHandler(BuildContext context){
  return  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('No Data Found'),
      backgroundColor: Colors.redAccent,
    ),
  );
}