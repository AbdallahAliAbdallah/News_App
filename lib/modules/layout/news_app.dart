import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../search/search.dart';
import '../../shared/components/components.dart';
import 'news_app_layout_cubit.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppLayoutCubit, NewsAppLayoutState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                   NewsAppLayoutCubit.get(context).changeTheme();
                  },
                  icon: Icon(Icons.brightness_6_outlined)),
            ],
            title: Text(
              'News App',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          body: NewsAppLayoutCubit.get(context)
              .screens[NewsAppLayoutCubit.get(context).currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: NewsAppLayoutCubit.get(context).currentindex,
            onTap: (int index) {
              NewsAppLayoutCubit.get(context).changeBottom(index);
            },
            items: NewsAppLayoutCubit.get(context).bottoms,
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
