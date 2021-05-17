


import 'package:fcmahmed/entities/snack_bar_entity.dart';
import 'package:fcmahmed/network/api/fcm/fcm_service.dart';
import 'package:fcmahmed/view_models/fcm/fcm_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Snack bar provider
final snackBarStateProvider = StateProvider<SnackBarEntity>(
        (_) => SnackBarEntity.initial(),
);

/// Loading provider
final loadingStateProvider = StateProvider<bool>((_) => false);

/// Banners data Providers
final fcmServiceProvider = Provider<FCMServices>((ref) => FCMServices());
final fCMViewModelProvider = ChangeNotifierProvider<FCMViewModel>((ref) => FCMViewModel(ref.read));