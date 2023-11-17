// 1. 창고 데이터 (model)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_04/post_repository.dart';

class PostModel {
  int id;
  int userId;
  String title;

  PostModel(this.id, this.userId, this.title);

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        title = json["title"];
}

// 2. 창고 (view model)
class PostViewModel extends StateNotifier<PostModel?> {
  // 생성자를 통해 상태를 부모에게 전달
  PostViewModel(super.state);

  // 상태 초기화 (필수)
  void init() async {
    PostModel postModel = await PostRepository().fetchPost(40);
    state = postModel;
  }

  // 상태 변경
  void change() async {
    PostModel postModel = await PostRepository().fetchPost(50);
    state = postModel;
  }
}

// 3. 창고 관리자 (provider)
final postProvider = StateNotifierProvider<PostViewModel, PostModel?>((ref) {
  return PostViewModel(null)..init();
});
