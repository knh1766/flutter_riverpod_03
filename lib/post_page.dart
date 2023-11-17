import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_04/post_view_model.dart';

class PostPage extends ConsumerWidget {
  PostPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("나 빌드됨");

    PostModel? model = ref.watch(postProvider);

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network("https://picsum.photos/id/50/200/200",
                  fit: BoxFit.cover),
            ),
            Text(
                "id : ${model.id}, userId: ${model.userId}, title : ${model.title}"),
            ElevatedButton(
                onPressed: () {
                  ref.read(postProvider.notifier).change();
                },
                child: Text("값변경")),
          ],
        ),
      );
    }
  }
}
