import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/layout/news_app_layout_cubit.dart';

import '../../shared/components/components.dart';

class Sciences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppLayoutCubit, NewsAppLayoutState>(
        builder: (context, state){
          var List=NewsAppLayoutCubit.get(context).sciences;
          return Scaffold(
              body: articleBuilder(List));},
        listener: (context, state) {});
  }
}
