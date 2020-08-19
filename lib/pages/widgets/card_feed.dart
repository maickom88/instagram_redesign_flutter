import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_redesign/utils/consts.dart';

import '../feed_details.dart';

class CardStories extends StatefulWidget {
  final String name;
  final String avatar;
  final List<String> images;
  final String numberLikes;
  final String comments;
  final int tag;
  final bool visibilityMore;

  const CardStories({
    Key key,
    this.name,
    this.avatar,
    this.images,
    this.numberLikes,
    this.comments,
    this.tag,
    this.visibilityMore,
  }) : super(key: key);
  @override
  _CardStoriesState createState() => _CardStoriesState();
}

class _CardStoriesState extends State<CardStories>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Color color;
  int isPage = 0;

  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this, value: 0.0);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Align(
      heightFactor: 0.9,
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onDoubleTap: () async {
          await _controller.forward();
          setState(() {
            color = Colors.red[400];
          });
          await Future.delayed(
            Duration(milliseconds: 700),
            () => _controller.reverse(),
          );
        },
        onTap: () => Get.to(FeedDatails(
          name: widget.name,
          avatar: widget.avatar,
          tag: widget.tag,
          comments: widget.comments,
          images: widget.images,
          numberLikes: widget.numberLikes,
        )),
        child: Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: PageView(
                    onPageChanged: (page) {
                      setState(() {
                        isPage = page;
                        print(isPage);
                      });
                    },
                    children: [
                      Hero(
                        tag: widget.tag,
                        child: Image.network(
                          widget.images[0],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Image.network(
                        ImagesUrls.feed3,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Image.network(
                        ImagesUrls.feed5,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ],
                  )),
              IgnorePointer(
                ignoring: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black
                      ],
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: ScaleTransition(
                      alignment: Alignment.center,
                      scale: _animation,
                      child: Image.asset(ImagesUrls.instalike),
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: Colors.black.withOpacity(0.7),
                              offset: Offset(0, 0),
                            )
                          ]),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(widget.avatar),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          widget.name,
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 20,
                                color: Colors.black,
                                offset: Offset(0, -1),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.images.length > 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width:
                              isPage == 0 ? Get.width * 0.07 : Get.width * 0.04,
                          height: Get.height * 0.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isPage == 0
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width:
                              isPage == 1 ? Get.width * 0.07 : Get.width * 0.04,
                          height: Get.height * 0.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isPage == 1
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width:
                              isPage == 2 ? Get.width * 0.07 : Get.width * 0.04,
                          height: Get.height * 0.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isPage == 2
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: new Container(
                              padding: EdgeInsets.all(12),
                              width: Get.width * 0.25,
                              height: Get.height * 0.08,
                              decoration: BoxDecoration(
                                color: color == null
                                    ? Colors.grey.shade200.withOpacity(0.2)
                                    : color,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    AntDesign.heart,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    widget.numberLikes,
                                    style: GoogleFonts.robotoCondensed(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          width: Get.width * 0.25,
                          height: Get.height * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                AntDesign.message1,
                                color: Colors.white,
                              ),
                              Text(
                                widget.comments,
                                style: GoogleFonts.robotoCondensed(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Transform.rotate(
                                angle: -26,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(left: 15),
                          width: Get.width * 0.25,
                          height: Get.height * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.bookmark,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.visibilityMore,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 15, bottom: 15),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Stack(
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
                                    NetworkImage(ImagesUrls.avatar3),
                                backgroundColor: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              margin: EdgeInsets.only(left: 30),
                              child: CircleAvatar(
                                radius: 16,
                                backgroundImage:
                                    NetworkImage(ImagesUrls.avatar5),
                                backgroundColor: Colors.red.withOpacity(0.2),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              margin: EdgeInsets.only(left: 60),
                              child: CircleAvatar(
                                radius: 16,
                                backgroundImage:
                                    NetworkImage(ImagesUrls.avatar1),
                                backgroundColor: Colors.yellow.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Olá amigo como vai você?...',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.white,
                            child: Text(
                              'Mais',
                              style: GoogleFonts.robotoCondensed(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
