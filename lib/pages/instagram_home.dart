import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:instagram_redesign/pages/widgets/card_feed.dart';
import 'package:instagram_redesign/pages/widgets/stories_container.dart';
import 'package:instagram_redesign/utils/consts.dart';
import 'widgets/dialog_config.dart';
import 'widgets/icons_bottom.dart';

class InstagramHome extends StatefulWidget {
  @override
  _InstagramHomeState createState() => _InstagramHomeState();
}

class _InstagramHomeState extends State<InstagramHome> {
  ScrollController controller = ScrollController();
  bool closeStories = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        closeStories = controller.offset > 50;
      });
    });
  }

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
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                AntDesign.setting,
                color: Theme.of(context).textSelectionColor,
              ),
              onPressed: () {
                showGeneralDialog(
                  barrierLabel: "Label",
                  barrierDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.1),
                  transitionDuration: Duration(milliseconds: 700),
                  context: context,
                  pageBuilder: (context, anim1, anim2) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: Get.height * 0.65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                                left: 15,
                                right: 0,
                                bottom: 5,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  DialogConfig(),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Icon(
                                        Icons.arrow_drop_up,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        margin:
                            EdgeInsets.only(bottom: 450, left: 12, right: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.grey[600].withOpacity(0.2),
                              Colors.grey.shade200.withOpacity(0.4),
                              Colors.grey[600].withOpacity(0.2)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    );
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, -1), end: Offset(0, 0))
                          .animate(anim1),
                      child: child,
                    );
                  },
                );
              },
            ),
            flexibleSpace: Image.network(
              ImagesUrls.logoInsta,
              fit: BoxFit.scaleDown,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            actions: [
              Badge(
                position: BadgePosition.topRight(top: 30, right: 10),
                badgeContent: null,
                child: IconButton(
                  icon: Icon(
                    Icons.email,
                    color: Theme.of(context).textSelectionColor,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
          body: Column(
            children: [
              AnimatedOpacity(
                opacity: closeStories ? 0 : 1,
                duration: const Duration(milliseconds: 200),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: Get.width,
                  alignment: Alignment.topCenter,
                  height: closeStories ? 0 : Get.height * 0.180,
                  child: StoriesContainer(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    controller: controller,
                    dragStartBehavior: DragStartBehavior.down,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      CardStories(
                        tag: 1,
                        images: [
                          ImagesUrls.feed1,
                          ImagesUrls.feed4,
                          ImagesUrls.feed5
                        ],
                        avatar: ImagesUrls.avatar9,
                        numberLikes: '7.8k',
                        name: 'Orlando_28',
                        comments: '200',
                        visibilityMore: false,
                      ),
                      CardStories(
                        tag: 2,
                        images: [ImagesUrls.feed5],
                        avatar: ImagesUrls.avatar2,
                        name: 'Fabio',
                        numberLikes: '1.1k',
                        comments: '20',
                        visibilityMore: false,
                      ),
                      CardStories(
                        tag: 3,
                        images: [ImagesUrls.feed3],
                        avatar: ImagesUrls.avatar5,
                        name: 'Ana_mac',
                        numberLikes: '120',
                        comments: '1.8k',
                        visibilityMore: false,
                      ),
                      CardStories(
                        tag: 4,
                        images: [ImagesUrls.feed4],
                        avatar: ImagesUrls.avatar10,
                        name: 'ro.bert',
                        numberLikes: '992',
                        comments: '120',
                        visibilityMore: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            width: double.infinity,
            height: Get.height * 0.10,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0, 2),
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconsBottom(icon: Icons.home, opacity: 1),
                IconsBottom(
                  icon: Icons.search,
                  opacity: 0.4,
                ),
                IconsBottom(
                  icon: Icons.add_box,
                  opacity: 0.4,
                ),
                Badge(
                  position: BadgePosition.topRight(top: 10, right: 0),
                  badgeContent: null,
                  child: IconsBottom(
                    icon: Icons.favorite,
                    opacity: 0.4,
                  ),
                ),
                IconsBottom(
                  icon: Icons.person,
                  opacity: 0.4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
