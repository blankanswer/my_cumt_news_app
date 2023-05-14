
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_cumt_news_app/constants.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../model/news_model/newsContentModel.dart';
import '../../../model/news_model/newsListModel.dart';
import '../../../model/news_model/newsTypeModel.dart';
import '../../../provider/newsmark_provider.dart';

class BookmarkPage extends StatefulWidget {
   const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final String myText = '我的标记';

  final NewsListModel _listModel = NewsListModel();
  final NewsTypeModel _typeModel  = NewsTypeModel() ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      /// 其实这些地方如果用了状态管理就好做了， 但是provider我觉得真心不如vue3的pinia好用，懒得做了
      future: _typeModel.getData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

        return Scaffold(
          appBar: AppBar(
            title:  Text(myText),
            centerTitle: true,
          ),
          body: Consumer(builder: ((context, value, child) {
            return box.hasData(myText)
                ? ListView.builder(
                itemCount: box.read(myText).length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CachedNetworkImage(imageUrl: schoolIcon,),
                      // leading: CachedNetworkImage(imageUrl: context.watch<BookmarkProvider>().bookMark[index].urlToImage.toString()),
                      title: Text(
                        box.read(myText)[index],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (context) => ContentPage(data: context.watch<BookmarkProvider>().bookMark[index], link: _listModel.data!.data![index].link,)));
                      },
                    ),
                  );
                })
                : const Center(
              child: Text(
                '空空如也，快去给喜欢的新闻标记吧~',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            );
          })),
        );
      },

    );
  }
}
