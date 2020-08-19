import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoresInsta extends StatelessWidget {
  final String name;
  final String urlImage;

  const StoresInsta({Key key, this.name, this.urlImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: Get.width * 0.18,
                height: Get.width * 0.18,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xfffeda75),
                        Color(0xfffa7e1e),
                        Color(0xffd62976),
                        Color(0xff962fbf),
                        Color(0xff4f5bd5),
                      ]),
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              Container(
                width: Get.width * 0.17,
                height: Get.width * 0.17,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: Image.network(
                    urlImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: GoogleFonts.robotoCondensed(
                color: Theme.of(context).secondaryHeaderColor),
          )
        ],
      ),
    );
  }
}
