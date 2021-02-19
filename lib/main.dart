import 'package:bloc_injection_dep/src/home/home_bloc.dart';
import 'package:bloc_injection_dep/src/home/home_page.dart';
import 'package:bloc_injection_dep/src/shared/repositories/client_http.dart';
import 'package:bloc_injection_dep/src/shared/repositories/general_api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      dependencies: [
        Dependency((i) => ClientHttp(), singleton: true),
        Dependency((i) => GeneralApi(i.get<ClientHttp>().getClient())),
      ],
      blocs: [
        Bloc(
          (i) => HomeBloc(
            i.get<GeneralApi>(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Inject',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
