import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navicateAndFinished(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (Route<dynamic> route) => false,
    );
