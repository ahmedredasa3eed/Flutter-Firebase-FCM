import 'package:fcmahmed/widgets/loading_alert_widget.dart';
import 'package:fcmahmed/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("zz"),
        actions: [
          IconButton(icon: Icon(Icons.access_alarm), onPressed: () async {
            await context.read(fCMViewModelProvider).sendFCMMessage();
          }),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Text("Hello Here"),
          ),
          LoadingAndAlertWidget(),
        ],
      ),
    );
  }
}
