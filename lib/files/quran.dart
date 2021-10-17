library quran;

import "quran_json.dart" as quran;

///Takes [surahNumber] & [verseNumber] and returns Juz number
int getJuzNumber(int surahNumber, int verseNumber) {
  for (var juz in quran.juz) {
    if (juz["verses"].keys.contains(surahNumber)) {
      if (verseNumber >= juz["verses"][surahNumber][0] &&
          verseNumber <= juz["verses"][surahNumber][1]) {
        return int.parse(juz["id"].toString());
      }
    }
  }
  return -1;
}

Map<int, List<int>> getSurahAndVersesFromJuz(int juzNumber) {
  return quran.juz[juzNumber - 1]["verses"];
}

///Takes [surahNumber] and returns the Surah name
String getSurahName(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }
  return quran.surah[surahNumber - 1]['name'].toString();
}

///Takes [surahNumber] returns the Surah name in English
String getSurahNameEnglish(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }
  return quran.surah[surahNumber - 1]['english'].toString();
}

///Takes [surahNumber] and returns the place of revelation (Makkah / Madinah) of the surah
String getPlaceOfRevelation(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }
  return quran.surah[surahNumber - 1]['place'].toString();
}

///Takes [surahNumber] and returns the count of total Verses in the Surah
int getVerseCount(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No verse found with given surahNumber";
  }
  return int.parse(quran.surah[surahNumber - 1]['aya'].toString());
}

///Reurns total juz count
int getTotalJuzCount() {
  return 30;
}

///Returns total surah count
int getTotalSurahCount() {
  return 114;
}

///Returns total verse count
int getTotalVerseCount() {
  return 6236;
}

///Returns 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ'
String getBasmala() {
  return "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";
}

///Takes [juzNumber] and returns Juz URL (from Quran.com)
String getJuzURL(int juzNumber) {
  return "https://quran.com/juz/$juzNumber";
}

///Takes [surahNumber] and returns Surah URL (from Quran.com)
String getSurahURL(int surahNumber) {
  return "https://quran.com/$surahNumber";
}

///Takes [surahNumber] & [verseNumber] and returns Verse URL (from Quran.com)
String getVerseURL(int surahNumber, int verseNumber) {
  return "https://quran.com/$surahNumber/$verseNumber";
}

String getVerse(int surahNumber, int verseNumber,
    {bool verseEndSymbol = false}) {
  String verse = "";
  for (var i in quran.quranText) {
    if (i['surah_no'] == surahNumber && i['ayah_no'] == verseNumber) {
      verse = i['content'].toString();
      break;
    }
  }

  if (verse == "") {
    throw "No verse found with given surahNumber and verseNumber.\n\n";
  }

  return verse + (verseEndSymbol ? " " + getVerseEndSymbol(verseNumber) : "");
}

///Takes [verseNumber] and returns '۝' symbol with verse number
String getVerseEndSymbol(int verseNumber) {
  String arabicNumeric = "";

  for (int i = verseNumber.toString().length - 1; i >= 0; i--) {
    String digit = verseNumber.toString().split("")[i];
    if (digit == "0") {
      arabicNumeric += "٠";
    } else if (digit == "1") {
      arabicNumeric += "١";
    } else if (digit == "2") {
      arabicNumeric += "٢";
    } else if (digit == "3") {
      arabicNumeric += "٣";
    } else if (digit == "4") {
      arabicNumeric += "٤";
    } else if (digit == "5") {
      arabicNumeric += "٥";
    } else if (digit == "6") {
      arabicNumeric += "٦";
    } else if (digit == "7") {
      arabicNumeric += "٧";
    } else if (digit == "8") {
      arabicNumeric += "٨";
    } else if (digit == "9") {
      arabicNumeric += "٩";
    }
  }

  // arabicNumeric += "\u06dd";
  return arabicNumeric;
}
