import 'package:bloc_injection_dep/src/shared/models/post.dart';
import 'package:bloc_injection_dep/src/shared/repositories/general_api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc implements BlocBase {
  final GeneralApi api;

  HomeBloc(this.api);

  final BehaviorSubject _listController = BehaviorSubject.seeded(true);
  Sink get listIn => _listController.sink;
  Stream<List<Post>> get listOut =>
      _listController.stream.asyncMap((event) => api.getPosts());

  @override
  void dispose() {
    _listController.close();
  }

  @override
  void addListener(listener) {}

  @override
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}
