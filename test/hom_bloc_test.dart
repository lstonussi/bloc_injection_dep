import 'package:bloc_injection_dep/src/home/home_bloc.dart';
import 'package:bloc_injection_dep/src/shared/models/post.dart';
import 'package:bloc_injection_dep/src/shared/repositories/general_api.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  var bloc = HomeBloc(GeneralApi());

  test("Test if completed list", () {
    bloc.listIn.add(true);
    expect(bloc.listOut, emits(<Post>[]));
  }, skip: true);
}
