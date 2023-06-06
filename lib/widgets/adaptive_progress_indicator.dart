import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveProgressIndicator extends StatelessWidget {
  const AdaptiveProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const CupertinoActivityIndicator(
              radius: 15,
            ),
    );
  }
}
