import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/Webview/webview.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );

Widget defaultFormField(
    context, {
      required TextEditingController controller,
      required TextInputType type,
      String? Function(String?)? onSubmit,
      String? Function(String?)? onChange,
      Function()? onTap,
      bool isPassword = false,
      required String? Function(String?)? validate,
      required String label,
      required IconData prefix,
      IconData? suffix,
      Function()? suffixPressed,
      bool isClickable = true,
    }) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: Colors.deepOrange,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
            color: Colors.grey,
          ),
        )
            : null,
      ),
      style: Theme.of(context).textTheme.bodyText1,
    );
enum ThemeApp { Ligth, Dark, Intial }

Widget myDivider() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 1.0,
        width: double.infinity,
        color: Colors.deepOrange,
      ),
    );

Widget buildArticleItem(article, context) => Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child:InkWell(
          onTap: (){navigateTo(context,Webview(url: '${article["url"]}',));},
          child: Row(
            children: [
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    image: DecorationImage(
                      image: article['urlToImage'] != null
                          ? NetworkImage("${article['urlToImage']}")
                          : NetworkImage(
                              "https://content.almalnews.com/wp-content/uploads/2021/07/%D8%A7%D8%B3%D8%B9%D8%A7%D8%B1-%D8%A7%D9%84%D8%B0%D9%87%D8%A8-1024x1024.jpg"),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Container(
                  height: 120.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${article['title']}',
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${article['publishedAt']}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget articleBuilder(list,{isSearch = false}) {
  return ConditionalBuilder(
    condition: list.length > 0,
    builder: (BuildContext context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            buildArticleItem(list[index], context),
        separatorBuilder: (context, i) => myDivider(),
        itemCount: list.length),
    fallback: (BuildContext context) =>isSearch? Container():Center(
      child: CircularProgressIndicator(),
    ),
  );
}
