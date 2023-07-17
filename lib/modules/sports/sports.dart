import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../layout/news_app_layout_cubit.dart';

class Sports extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsAppLayoutCubit, NewsAppLayoutState>(
       builder: (context, state) {
         var List=NewsAppLayoutCubit.get(context).sports;
         return Scaffold(
             body: articleBuilder(List));},
       listener: (context, state) {});
  }
}