import 'package:cloud_firestore/cloud_firestore.dart';

class ChatCall {
  final String? docId;
  final String? fromToken;
  final String? toToken;
  final String? fromName;
  final String? toName;
  final String? fromAvatar;
  final String? toAvatar;
  final String? callTime;
  final String? type;
  final Timestamp? lastTime;

  ChatCall({
    this.docId,
    this.fromToken,
    this.toToken,
    this.fromName,
    this.toName,
    this.fromAvatar,
    this.toAvatar,
    this.callTime,
    this.type,
    this.lastTime,
  });

  factory ChatCall.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return ChatCall(
      fromToken: data?['fromToken'],
      toToken: data?['toToken'],
      fromName: data?['fromName'],
      toName: data?['toName'],
      fromAvatar: data?['fromAvatar'],
      toAvatar: data?['toAvatar'],
      lastTime: data?['lastTime'],
      type: data?['type'],
      callTime: data?['callTime'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (fromToken != null) "fromToken": fromToken,
      if (toToken != null) "toToken": toToken,
      if (fromName != null) "fromName": fromName,
      if (toName != null) "toName": toName,
      if (fromAvatar != null) "fromAvatar": fromAvatar,
      if (toAvatar != null) "toAvatar": toAvatar,
      if (callTime != null) "callTime": callTime,
      if (type != null) "type": type,
      if (lastTime != null) "lastTime": lastTime,
    };
  }
}
