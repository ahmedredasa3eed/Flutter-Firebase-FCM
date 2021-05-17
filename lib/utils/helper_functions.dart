import 'package:fcmahmed/entities/snack_bar_entity.dart';
import 'package:fcmahmed/providers/providers.dart';
import 'package:flutter/material.dart';
import 'enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelperFunctions {

  const HelperFunctions._();


  static showSnackBar({
     required BuildContext context,
    @required SnackBarEntity? snackBarEntity,
  }) {
    WidgetsBinding.instance!.addPostFrameCallback(
          (_) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: snackBarEntity!.status == SnackBarStatus.error
                ? Colors.red
                : Colors.green,
            content: Text(
              snackBarEntity.message,
              style: TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 1),
          ),
        );
        context.read(snackBarStateProvider).state = SnackBarEntity.reset();
      },
    );
  }
}
