import 'package:fcmahmed/utils/enums.dart';

class SnackBarEntity {
  final String message;
  final bool showSnackBar;
  final SnackBarStatus status;

  const SnackBarEntity._({required this.message, required this.showSnackBar, required this.status});

  factory SnackBarEntity.initial() => SnackBarEntity._(
      message: '', showSnackBar: false, status: SnackBarStatus.error);

  factory SnackBarEntity.error({required String message}) => SnackBarEntity._(
      showSnackBar: true, message: message, status: SnackBarStatus.error);

  factory SnackBarEntity.success({required String message}) =>
      SnackBarEntity._(
          showSnackBar: true, message: message, status: SnackBarStatus.success);

  factory SnackBarEntity.reset() => SnackBarEntity.initial();
}
