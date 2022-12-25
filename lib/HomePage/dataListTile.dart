import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DataListTile extends StatefulWidget {
  int queryId;
  String querytext;
  int comments;
  String date;
  String location;
  DataListTile(
      {required this.queryId,
      required this.querytext,
      required this.comments,
      required this.date,
      required this.location});

  @override
  _DataListTileState createState() => _DataListTileState();
}

class _DataListTileState extends State<DataListTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.shade100,
      margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                widget.querytext,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, color: Colors.grey.shade800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.comment,
                    color: Colors.grey.shade300,
                    size: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      widget.comments.toString(),
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    widget.date,
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
