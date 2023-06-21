import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProyekPropertyPage extends StatefulWidget {
  const ProyekPropertyPage({super.key});

  @override
  State<ProyekPropertyPage> createState() => _ProyekPropertyPageState();
}

class _ProyekPropertyPageState extends State<ProyekPropertyPage> {
  double navLeftPad = 8.0;
  double navRightPad = 8.0;
  double navTopPad = 8.0;
  double navBottomPad = 8.0;
  double dashLeftPad = 32.0;
  double dashRightPad = 32.0;
  double dashTopPad = 16.0;
  double dashBottomPad = 16.0;

  @override
  Widget build(BuildContext context) {
    double _dashboardWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: dashLeftPad,
            right: dashRightPad,
            top: dashTopPad,
            bottom: dashBottomPad),
        child: Container(
          width: MediaQuery.of(context).size.width * .25,
          height: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white),
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 5,
                                height: 15,
                                color: Colors.blue,
                              ),
                              Container(
                                width: 5,
                                height: 15,
                                color: Colors.purple,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Proyek Konstruksi',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 250.0,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Cari di sini',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text('Sort By'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
                child: InteractiveViewer(
                  scaleEnabled: false,
                  child: DataTable(
                      border: TableBorder.all(
                          color: Color.fromARGB(255, 207, 207, 207)),
                      columns: [
                        DataColumn(
                            label: SizedBox(
                          width: _firstColumnWidth(_dashboardWidth),
                          child: Text(
                            'Nama Proyek',
                            overflow: TextOverflow.fade,
                          ),
                        )),
                        DataColumn(
                            label: SizedBox(
                                width: _otherColumnWidth(_dashboardWidth),
                                child: Text(
                                  'Jumlah SPK',
                                  overflow: TextOverflow.fade,
                                ))),
                        DataColumn(
                            label: SizedBox(
                                width: _otherColumnWidth(_dashboardWidth),
                                child: Text(
                                  'Nilai Proyek',
                                  overflow: TextOverflow.fade,
                                ))),
                        DataColumn(
                            label: SizedBox(
                                width: _otherColumnWidth(_dashboardWidth),
                                child: Text(
                                  'Gambar Proyek',
                                  overflow: TextOverflow.fade,
                                ))),
                        DataColumn(
                            label: SizedBox(
                                width: _otherColumnWidth(_dashboardWidth),
                                child: Text(
                                  'Foto Proyek',
                                  overflow: TextOverflow.fade,
                                ))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(SizedBox(
                              width: _firstColumnWidth(_dashboardWidth),
                              child: Text('Masjid'))),
                          DataCell(SizedBox(
                              width: _otherColumnWidth(_dashboardWidth),
                              child: Text('12 SPK'))),
                          DataCell(SizedBox(
                              width: _otherColumnWidth(_dashboardWidth),
                              child: Text('Rp. 11 Miliar'))),
                          DataCell(SizedBox(
                              width: _otherColumnWidth(_dashboardWidth),
                              child: Text('3 Site Plan'))),
                          DataCell(SizedBox(
                              width: _otherColumnWidth(_dashboardWidth),
                              child: Text('224 Foto'))),
                        ])
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double _firstColumnWidth(double mediaWidth) {
    double calculatedWidth = mediaWidth * .2;
    return calculatedWidth;
  }

  double _otherColumnWidth(double mediaWidth) {
    double calculatedWidth = mediaWidth * .075;
    return calculatedWidth;
  }

  double _calculatedDashboardWidth(double mediaWidth, int flexCount) {
    double navWidth = (mediaWidth / flexCount);
    double calculatedWidth =
        (mediaWidth - navWidth) - (dashLeftPad + dashRightPad);
    return calculatedWidth;
  }
}
