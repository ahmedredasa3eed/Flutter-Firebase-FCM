class FCM {
  late int multicastId;
  late int success;
  late int failure;
  late int canonicalIds;
  late List<Results> results;

  FCM(
      {required this.multicastId,
        required this.success,
        required this.failure,
        required this.canonicalIds,
        required this.results});

  FCM.fromJson(Map<String, dynamic> json) {
    multicastId = json['multicast_id'];
    success = json['success'];
    failure = json['failure'];
    canonicalIds = json['canonical_ids'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['multicast_id'] = this.multicastId;
    data['success'] = this.success;
    data['failure'] = this.failure;
    data['canonical_ids'] = this.canonicalIds;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  late String messageId;

  Results({required this.messageId});

  Results.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_id'] = this.messageId;
    return data;
  }
}
