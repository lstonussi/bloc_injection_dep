import 'package:bloc_injection_dep/src/shared/models/post.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_injection_dep/src/shared/repositories/general_api.dart';

main() {
  var api = GeneralApi();

  test('get posts', () async {
    List<Post> data = await api.getPosts();
    expect(data[0].userId, 1);
  });
}
