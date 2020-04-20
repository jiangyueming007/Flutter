import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_hero/image_detail_page.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.5,
            ),
            itemBuilder: (cxt,index){
              String imageURL = "https://picsum.photos/id/$index/400/200";
              return GestureDetector(
                  child: Hero(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(imageURL,fit: BoxFit.cover,)),
                       tag: imageURL,
                  ),
                  onTap: (){
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (ctx,animation,animation2){
                          return FadeTransition(
                              opacity: animation,
                              child: ImageDetailPage(imageURL),
                          );
                        }
                    ));
                  },
              );
        }
        ),
      ),
    );
  }
}