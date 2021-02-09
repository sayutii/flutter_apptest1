import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LihatDetail extends StatefulWidget {

  _LihatDetailState createState() => _LihatDetailState();
}
class _LihatDetailState extends State<LihatDetail> {
  //DEFINE VARIABLE url UNTUK MENAMPUNG END POINT
  final String url = 'https://api.banghasan.com/quran/format/json/surat';
  List data; //DEFINE VARIABLE data DENGAN TYPE List AGAR DAPAT MENAMPUNG COLLECTION / ARRAY

  Future<String> getData() async {
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON
    var res = await http.get(Uri.encodeFull(url), headers: { 'accept':'application/json' });

    setState(() {
      //RESPONSE YANG DIDAPATKAN DARI API TERSEBUT DI DECODE
      var content = json.decode(res.body);
      //KEMUDIAN DATANYA DISIMPAN KE DALAM VARIABLE data,
      //DIMANA SECARA SPESIFIK YANG INGIN KITA AMBIL ADALAH ISI DARI KEY hasil
      data = content['hasil'];
    });
    return 'success!';
  }
  @override
  void initState() {
    super.initState();
    this.getData(); //PANGGIL FUNGSI YANG TELAH DIBUAT SEBELUMNYA
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text('Digital Quran',
                style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold, fontFamily: 'Roboto',color: Colors.white)
            ),
            centerTitle: true
        ),
        body: Container(
          margin: EdgeInsets.all(10.0), //SET MARGIN DARI CONTAINER
          child: ListView.builder( //MEMBUAT LISTVIEW
            itemCount: data == null ? 0:data.length, //KETIKA DATANYA KOSONG KITA ISI DENGAN 0 DAN APABILA ADA MAKA KITA COUNT JUMLAH DATA YANG ADA
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min, children: <Widget>[
                      //ListTile MENGELOMPOKKAN WIDGET MENJADI BEBERAPA BAGIAN
                      ListTile(
                        //leading TAMPIL PADA SEBELAH KIRI
                        // DIMANA VALUE DARI leading ADALAH WIDGET TEXT
                        // YANG BERISI NOMOR SURAH
                        //title TAMPIL DITENGAH SETELAH leading
                        // VALUENYA ADALAH WIDGET TEXT
                        // YANG BERISI NAMA SURAH
                        title: Text(data[index]['nama'], style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                        //trailing TAMPIL PADA SEBELAH KANAN SETELAH title
                        //VALUE NYA ADALAH IMAGE, KETIKA VALUENYA DARI type ADALAH
                        // MEKAH MAKA AKAN MENAMPILKAN mekah.jpg
                        // SELAIN DARI ITU MENAMPILKAN IMAGE madinah.png
                        //subtitle TAMPIL TEPAT DIBAWAH title
                        subtitle: Column(children: <Widget>[ //MENGGUNAKAN COLUMN
                          //DIMANA MASING-MASING COLUMN TERDAPAT ROW
                          Row(
                            children: <Widget>[
                              //MENAMPILKAN TEXT arti
                              Text('Arti : ', style: TextStyle(fontWeight: FontWeight.bold),),
                              //MENAMPILKAN TEXT DARI VALUE arti
                              Text(data[index]['arti'], style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                            ],
                          ),
                          //ROW SELANJUTNYA MENAMPILKAN JUMLAH AYAT
                          Row(
                            children: <Widget>[
                              Text('Jumlah Ayat : ', style: TextStyle(fontWeight: FontWeight.bold),),
                              //DARI INDEX ayat
                              Text(data[index]['ayat'])
                            ],
                          ),
                          //MENAMPILKAN DIMANA SURAH TERSEBUT DITURUNKAN
                          Row(
                            children: <Widget>[
                              Text('Diturunkan : ', style: TextStyle(fontWeight: FontWeight.bold),),
                              //DENGAN INDEX type
                              Text(data[index]['type'])
                            ],
                          ),
                        ],),
                      ),
                      //TERAKHIR , MEMBUAT BUTTON
                    ],),
                  )
              );
            },
          ),
        )
    );
  }
}