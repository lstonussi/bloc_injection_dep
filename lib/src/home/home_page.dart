import 'package:bloc_injection_dep/src/home/home_bloc.dart';
import 'package:bloc_injection_dep/src/shared/models/post.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<HomeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Inject"),
      ),
      body: StreamBuilder<List<Post>>(
        stream: bloc.listOut,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          List<Post> post = snapshot.data;

          return ListView.separated(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(post[index].title),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider();
              },
              itemCount: post.length);
        },
      ),
    );
  }
}
