import 'package:fcmahmed/entities/snack_bar_entity.dart';
import 'package:fcmahmed/model/fcm/fcm_model.dart';
import 'package:fcmahmed/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FCMViewModel extends ChangeNotifier{
  late final Reader reader;

  FCMViewModel(this.reader);

  Future<FCM?> sendFCMMessage() async {

    final fcmServiceProviders = reader(fcmServiceProvider);
    final snackBarProvider = reader(snackBarStateProvider);
    final loadingProvider = reader(loadingStateProvider);

    loadingProvider.state = true;

    final result = await fcmServiceProviders.sendFCM();

    //print(result!.success);
    loadingProvider.state = false;

    if (result!.success == 1) {
      snackBarProvider.state = SnackBarEntity.success(message: "${result.multicastId} - FCM Sent Successfully");
      return  result;
    } else {
      snackBarProvider.state = SnackBarEntity.error(message: "Fails");
      return null;

    }

  }

}