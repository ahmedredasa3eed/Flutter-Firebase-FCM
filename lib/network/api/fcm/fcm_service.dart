
import 'package:fcmahmed/model/fcm/fcm_model.dart';
import '../api_client.dart';
import '../api_constants.dart';

class FCMServices {
  final _apiClient = ApiClient();

  Future<FCM?> sendFCM() async {
    try {
      final response = await _apiClient.post(
        ApiConstants.FCM_URL,
        headers: {
          'Content-Type' : 'application/json',
          'Authorization' : 'key=AAAAcYnlQeg:APA91bGvTMVv4e_0ajAbGcmualiKMA3MzN90paD6CsjnZI2G3j1uglmX9uYQtXg4rOPo-Z3ZzSOaySlRt8Ubg2Zw9QOmMMj4Ldd1Bse4d9h35L0beQSZazIFGXLFTZDM4EYkIsoz6-hx',
        },
        body:
          {
            "to":"e3I7WXj5QGS5uFh_Bk4b9l:APA91bEUNnQltXamUGusdwl1DNgUU_lDJcDUoylMCM2osyrAJ12cvZxJznAHUCiYeo4WT5_N-jZNDUKFYqc6zwlVo2pM1AjfkyW8Jj8zkJeSCL6ioP8At7LDiq1z0nFkNw7-EPCj7Rgg",
            "notification" : {
              "body" : "الله اكبر",
              "title" : "بحبك يا مصر",
              "content_available" : true,
              "priority" : "high"
            },
            "data" : {
              "body" : "!ملك ملوك  مصر ",
              "title" : "العب يا تعلب احمد رضا",
              "content_available" : true,
              "priority" : "high",
              "click_action": "FLUTTER_NOTIFICATION_CLICK",
              "screen": "screenA"
            }
          }, parameters: {}
      );
      final result = FCM.fromJson(response);
      return result;
    } catch (error) {
      print(error);
    }
    return null;
  }
}
