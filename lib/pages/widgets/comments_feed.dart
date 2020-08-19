import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsFeed extends StatelessWidget {
  final name;
  final avatar;
  final comments;

  const CommentsFeed({Key key, this.name, this.avatar, this.comments})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(avatar),
                backgroundColor: Colors.yellow.withOpacity(0.2),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.robotoCondensed(
                    color: Theme.of(context).textSelectionColor,
                  ),
                ),
                SizedBox(height: 3),
                Container(
                  width: Get.width * 0.26,
                  child: Text(
                    comments,
                    style: GoogleFonts.robotoCondensed(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 40,
              alignment: Alignment.centerRight,
              child: RaisedButton(
                color: Colors.white.withOpacity(0.8),
                child: Text(
                  'Res',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 70,
              height: 40,
              alignment: Alignment.centerRight,
              child: RaisedButton(
                color: Colors.white.withOpacity(0.8),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                  size: 15,
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
