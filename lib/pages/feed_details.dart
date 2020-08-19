import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_redesign/pages/widgets/card_feed.dart';
import 'package:instagram_redesign/pages/widgets/comments_feed.dart';
import 'package:instagram_redesign/utils/consts.dart';

class FeedDatails extends StatefulWidget {
  final String name;
  final String avatar;
  final List<String> images;
  final String numberLikes;
  final String comments;
  final int tag;

  const FeedDatails(
      {Key key,
      this.name,
      this.avatar,
      this.images,
      this.numberLikes,
      this.comments,
      this.tag})
      : super(key: key);
  @override
  _FeedDatailsState createState() => _FeedDatailsState();
}

class _FeedDatailsState extends State<FeedDatails> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Theme.of(context).primaryColorBrightness,
        statusBarBrightness: Theme.of(context).brightness,
        systemNavigationBarDividerColor: Theme.of(context).primaryColor,
        statusBarColor: Theme.of(context).primaryColor,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).textSelectionColor,
              ),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).textSelectionColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: CardStories(
                          tag: widget.tag,
                          images: widget.images,
                          avatar: widget.avatar,
                          name: widget.name,
                          numberLikes: widget.numberLikes,
                          comments: widget.comments,
                          visibilityMore: true,
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.arrow_drop_up,
                                color: Theme.of(context).textSelectionColor),
                            onPressed: () {
                              setState(() {
                                isOpen = true;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        width: double.infinity,
                        height: Get.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(0.2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: CircleAvatar(
                                radius: 16,
                                backgroundImage:
                                    NetworkImage(ImagesUrls.avatar1),
                                backgroundColor: Colors.yellow.withOpacity(0.2),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.send,
                                      color:
                                          Theme.of(context).textSelectionColor),
                                  hintText: 'Adicionar comentário',
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.robotoCondensed(
                                    color: Theme.of(context).textSelectionColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                IgnorePointer(
                  ignoring: !isOpen,
                  child: SingleChildScrollView(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 100),
                      opacity: isOpen ? 1 : 0.3,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(
                          top: isOpen ? Get.height * 0.13 : Get.height * 0.65,
                        ),
                        width: double.infinity,
                        height: isOpen ? Get.height * 0.54 : 0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: IconButton(
                                icon: Icon(Icons.arrow_drop_down,
                                    color:
                                        Theme.of(context).textSelectionColor),
                                onPressed: () {
                                  setState(() {
                                    isOpen = false;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: ListView(
                                children: [
                                  CommentsFeed(
                                    name: 'Jonathan',
                                    comments: 'Lindoo!',
                                    avatar: ImagesUrls.avatar2,
                                  ),
                                  SizedBox(height: 10),
                                  CommentsFeed(
                                    name: 'Maria',
                                    comments: 'Ta tão perfeito!',
                                    avatar: ImagesUrls.avatar3,
                                  ),
                                  SizedBox(height: 10),
                                  CommentsFeed(
                                    name: 'Fabio',
                                    comments: 'Tá show!!!',
                                    avatar: ImagesUrls.avatar4,
                                  ),
                                  SizedBox(height: 10),
                                  CommentsFeed(
                                    name: 'Fabio',
                                    comments: 'Voa garoto!!!',
                                    avatar: ImagesUrls.avatar4,
                                  ),
                                  SizedBox(height: 10),
                                  CommentsFeed(
                                    name: 'Silas M.',
                                    comments: 'O bicho é bom mermo!',
                                    avatar: ImagesUrls.avatar7,
                                  ),
                                  SizedBox(height: 10),
                                  CommentsFeed(
                                    name: 'Aline',
                                    comments: 'Faz um assim pra mim amigo',
                                    avatar: ImagesUrls.avatar6,
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
