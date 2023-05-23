import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PortofolioPage extends StatefulWidget {
  const PortofolioPage({super.key});

  @override
  State<PortofolioPage> createState() => _PortofolioPageState();
}

class _PortofolioPageState extends State<PortofolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          padding: const EdgeInsets.all(32),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(border: Border.all()),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      'Portofolio Bidang Konstruksi',
                      style: GoogleFonts.marcellus(
                          textStyle: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SelectableText(
                      'Daftar Proyek',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 25)),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 111,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: SelectableText(
                              'Proyek Masjid Daarut Tauhiid',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                fontSize: 17.5,
                              )),
                              textAlign: TextAlign.right,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
