//1.창고데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionUser {
  String? jwt;
  bool isLogin;

  SessionUser({this.isLogin = false});
}

//2.창고관리자
final sessionProvder = Provider<SessionUser>((ref) {
  return SessionUser();
});
