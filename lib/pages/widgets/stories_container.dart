import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_redesign/pages/widgets/stores_inst.dart';
import 'package:instagram_redesign/utils/consts.dart';

class StoriesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20),
        height: Get.height * 0.300,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Container(
                        width: Get.width * 0.18,
                        height: Get.width * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'My Story',
                        style: GoogleFonts.robotoCondensed(
                            color: Theme.of(context).secondaryHeaderColor),
                      )
                    ],
                  ),
                ),
                StoresInsta(name: 'Pedro', urlImage: ImagesUrls.avatar1),
                StoresInsta(name: 'Paulo B.', urlImage: ImagesUrls.avatar2),
                StoresInsta(name: 'Larissa', urlImage: ImagesUrls.avatar3),
                StoresInsta(name: 'Fernando', urlImage: ImagesUrls.avatar4),
                StoresInsta(name: 'Isabela', urlImage: ImagesUrls.avatar5),
                StoresInsta(name: 'Catrina', urlImage: ImagesUrls.avatar6),
                StoresInsta(name: 'Steven', urlImage: ImagesUrls.avatar7),
                StoresInsta(name: 'Mauricio', urlImage: ImagesUrls.avatar8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
