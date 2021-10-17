import 'package:flutter/material.dart';
// import 'package:quran/quran.dart' as quran;
import 'package:quran_app/files/quran.dart' as quran;

class ViewScreen extends StatefulWidget {
  final int? surahNumber;
  const ViewScreen({Key? key, required this.surahNumber}) : super(key: key);

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  double _fontSize = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onLongPress: () {
              setState(() {
                _fontSize -= 2;
              });
            },
            onDoubleTap: () {
              setState(() {
                _fontSize += 2;
              });
            },
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  widget.surahNumber! == 1 || widget.surahNumber == 9
                      ? SizedBox(
                          height: 10,
                        )
                      : Text(
                          quran.getBasmala(),
                          style: TextStyle(
                            fontFamily: "Uthmanic",
                            fontSize: _fontSize,
                          ),
                        ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: quran.getVerseCount(widget.surahNumber!),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(children: [
                        ListTile(
                          title: Text(
                            quran.getVerse(widget.surahNumber!, index + 1,
                                verseEndSymbol: true),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: "Uthmanic",
                              fontSize: _fontSize,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        )
                      ]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
