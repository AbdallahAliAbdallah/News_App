import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/layout/news_app_layout_cubit.dart';
import 'package:news_app/shared/components/components.dart';


class SearchScreen extends StatelessWidget {
  var SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppLayoutCubit, NewsAppLayoutState>(
      builder: (BuildContext context, state) {
        var list = NewsAppLayoutCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  context,
                  onChange: (value) {
                    NewsAppLayoutCubit.get(context).getsearch(value!);
                  },
                  controller: SearchController,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter what you want to search for!";
                    }
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(child: articleBuilder(list,  isSearch: true))
            ],
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/layout/news_app_layout_cubit.dart';

import '../shared/components/components.dart';

class Search extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var list =NewsAppLayoutCubit.get(context).search;
    return BlocConsumer<NewsAppLayoutCubit,NewsAppLayoutState>(builder: (context, state) {
      return Scaffold(appBar: AppBar(),
      body:
      Column(children: [
      Padding(
      padding: const EdgeInsets.all(20.0),
      child: defaultFormField(context,
      onChange: (value){
        NewsAppLayoutCubit.get(context).Search(value);
      },
      type: TextInputType.text, validate: (String? value) {
      if(value!.isEmpty){
      return 'search must not be empty';
      }else{
      return null;
      }
      }, label: 'Search', prefix:Icons.search, controller: searchController),
      ),
      Expanded(child: articleBuilder(list,isSearch: true)),
      ],
      ));
    }, listener: (context, state) {


    });
  }


 */