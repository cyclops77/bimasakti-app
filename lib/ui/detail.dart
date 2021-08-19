import 'package:bimasakti/helper/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final Map data;
  final String thn;
  DetailPage({this.data, this.thn});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page", style: GoogleFonts.varela()),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        color: Color(0xfff8faf8),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Text(
              widget.thn,
              textAlign: TextAlign.center,
              style: GoogleFonts.varela(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue),
            ),
            SizedBox(height: 10),
            if (widget.data.toString().contains('label')) ...[
              Text(
                "Label : " + widget.data['ros'][0]['label'].toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "Number Visits : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]['nb_visits'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "Number Hits : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]['nb_hits'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "Sum time spent : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]['sum_time_spent'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "nb_hits_with_time_generation : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]
                            ['nb_hits_with_time_generation'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "min_time_generation : " +
                    widget.data['ros'][0]['min_time_generation'].toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "max_time_generation : " +
                    (widget.data['ros'][0]['max_time_generation']).toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "entry_sum_visit_length : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]['entry_sum_visit_length'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "entry_bounce_count : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]['entry_bounce_count'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "exit_nb_visits : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]['exit_nb_visits'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "sum_daily_entry_nb_uniq_visitors : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]
                            ['sum_daily_entry_nb_uniq_visitors'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "sum_daily_exit_nb_uniq_visitors : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]
                            ['sum_daily_exit_nb_uniq_visitors'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "exit_nb_visits : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]['exit_nb_visits'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "avg_time_on_page : " +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: '')
                        .format(widget.data['ros'][0]['avg_time_on_page'])
                        .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
            ] else ...[
              Text(
                "Tidak ada data",
                textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
              ),
            ]
          ],
        ),
      ),
    );
  }

  ftext(l, r) {
    return Text(
      l + r,
      textAlign: TextAlign.center,
      style: GoogleFonts.varela(fontSize: 12, color: Colors.blue),
    );
  }
}
