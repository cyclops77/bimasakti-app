import 'package:bimasakti/helper/get-data.dart';
import 'package:bimasakti/helper/size.dart';
import 'package:bimasakti/route.dart';
import 'package:bimasakti/ui/detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  List tempData = [];
  List uniqidList;
  void fetch() async {
    List<String> uniqid = await GetData.getList('uniqid') ?? [];
    setState(() {
      uniqidList = uniqid;
    });
  }

  @override
  void initState() {
    fetch();
    GetData.index().then((value) {
      print(value.toString());
      setState(() {
        tempData = value;
      });
    });
    super.initState();
  }

  void refresh() async {
    List<String> uniqid = await GetData.getList('uniqid') ?? [];
    setState(() {
      uniqid.clear();
    });
    GetData.saveList(key: 'uniqid', value: uniqid);
    fetch();
  }

  void simpan(idx) async {
    List<String> uniqid = await GetData.getList('uniqid') ?? [];
    uniqid.add(idx);
    if (uniqid.toString().contains(idx.toString())) {
      print("TIDAK");
      GetData.saveList(key: 'uniqid', value: uniqid);
    } else {}
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              refresh();
              print("REFRESH");
            },
            child: Padding(
              padding: EdgeInsets.only(right: displayWidth(context) * 0.06),
              child: Icon(Icons.refresh),
            ),
          )
        ],
        title: Text("Recycle View", style: GoogleFonts.varela()),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        color: Color(0xfff8faf8),
        child: ListView(
          children: [
            SizedBox(height: 20),
            for (var i = 1; i < tempData.length; i++) ...{
              Container(
                padding: EdgeInsets.all(displayWidth(context) * 0.05),
                margin: EdgeInsets.only(
                    bottom: 5,
                    left: displayWidth(context) * 0.05,
                    right: displayWidth(context) * 0.05),
                color: Colors.white,
                child: Column(children: [
                  Text(
                    "Tahun / Bulan : 201" +
                        (i + 1 > 12 ? "8" : "7") +
                        " / " +
                        ((i + 1 > 12 ? (i + 1 - 12) : i + 1) < 10
                            ? "0" +
                                (i + 1 > 12 ? (i + 1 - 12) : i + 1).toString()
                            : (i + 1 > 12 ? (i + 1 - 12) : i + 1).toString()),
                    style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
                  ),
                  if (tempData[i].toString().contains('label')) ...[
                    Text(
                      "Label : " + tempData[i]['ros'][0]['label'].toString(),
                      style:
                          GoogleFonts.varela(fontSize: 12, color: Colors.blue),
                    ),
                    Text(
                      "Number Visits : " +
                          NumberFormat.currency(
                                  locale: 'id', decimalDigits: 0, symbol: '')
                              .format(tempData[i]['ros'][0]['nb_visits'])
                              .toString(),
                      style:
                          GoogleFonts.varela(fontSize: 12, color: Colors.blue),
                    ),
                  ] else ...[
                    Text(
                      "Tidak ada data",
                      style:
                          GoogleFonts.varela(fontSize: 12, color: Colors.blue),
                    ),
                  ],
                  Text(
                    uniqidList.toString().contains("Tahun / Bulan : 201" +
                            (i + 1 > 12 ? "8" : "7") +
                            " / " +
                            ((i + 1 > 12 ? (i + 1 - 12) : i + 1) < 10
                                ? "0" +
                                    (i + 1 > 12 ? (i + 1 - 12) : i + 1)
                                        .toString()
                                : (i + 1 > 12 ? (i + 1 - 12) : i + 1)
                                    .toString()))
                        ? "Status : Tersimpan"
                        : "Status : Belum tersimpan",
                    style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          simpan("Tahun / Bulan : 201" +
                              (i + 1 > 12 ? "8" : "7") +
                              " / " +
                              ((i + 1 > 12 ? (i + 1 - 12) : i + 1) < 10
                                  ? "0" +
                                      (i + 1 > 12 ? (i + 1 - 12) : i + 1)
                                          .toString()
                                  : (i + 1 > 12 ? (i + 1 - 12) : i + 1)
                                      .toString()));
                        },
                        child: Container(
                          child: Text(
                            "Simpan",
                            style: GoogleFonts.varela(
                                fontSize: 12, color: Colors.white),
                          ),
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              vertical: 7.5,
                              horizontal: displayWidth(context) * 0.07),
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Routes.stfA(
                              context,
                              DetailPage(
                                data: tempData[i],
                                thn: "Tahun / Bulan : 201" +
                                    (i + 1 > 12 ? "8" : "7") +
                                    " / " +
                                    ((i + 1 > 12 ? (i + 1 - 12) : i + 1) < 10
                                        ? "0" +
                                            (i + 1 > 12 ? (i + 1 - 12) : i + 1)
                                                .toString()
                                        : (i + 1 > 12 ? (i + 1 - 12) : i + 1)
                                            .toString()),
                              ));
                        },
                        child: Container(
                          child: Text(
                            "Detail",
                            style: GoogleFonts.varela(
                                fontSize: 12, color: Colors.white),
                          ),
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              vertical: 7.5,
                              horizontal: displayWidth(context) * 0.07),
                        ),
                      )
                    ],
                  )
                ]),
              )
            }
          ],
        ),
      ),
    );
  }
}
