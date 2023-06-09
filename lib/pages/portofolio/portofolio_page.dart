import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web/constants/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                double screenWidth = sizingInformation.screenSize.width;
                if (screenWidth < (const RefinedBreakpoints().tabletLarge)) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SelectableText(
                        'Portofolio Bidang Konstruksi',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.marcellus(
                            textStyle: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: Data.allConstProjects.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SelectableText(
                                    Data.allConstProjects[index].title,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                      fontSize: 30.5,
                                    )),
                                    textAlign: TextAlign.right,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SelectableText(
                                        'Client: ${Data.allConstProjects[index].client}',
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                          fontSize: 12.5,
                                        )),
                                        textAlign: TextAlign.right,
                                      ),
                                      SizedBox(
                                        width: 16.0,
                                      ),
                                      SelectableText(
                                        'Tahun: ${Data.allConstProjects[index].year}',
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                          fontSize: 12.5,
                                        )),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  SelectableText(
                                    'Nilai Proyek: ${Data.allConstProjects[index].value}',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                      fontSize: 12.5,
                                    )),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              'Portofolio Bidang Konstruksi',
                              style: GoogleFonts.marcellus(
                                  textStyle: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold)),
                            ),
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
                                itemCount: Data.allConstProjects.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SelectableText(
                                          Data.allConstProjects[index].title,
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                            fontSize: 30.5,
                                          )),
                                          textAlign: TextAlign.right,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SelectableText(
                                              'Client: ${Data.allConstProjects[index].client}',
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                fontSize: 12.5,
                                              )),
                                              textAlign: TextAlign.right,
                                            ),
                                            SizedBox(
                                              width: 16.0,
                                            ),
                                            SelectableText(
                                              'Tahun: ${Data.allConstProjects[index].year}',
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                fontSize: 12.5,
                                              )),
                                              textAlign: TextAlign.right,
                                            ),
                                          ],
                                        ),
                                        SelectableText(
                                          'Nilai Proyek: ${Data.allConstProjects[index].value}',
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                            fontSize: 12.5,
                                          )),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }
              },
            )),
      ),
    );
  }
}
