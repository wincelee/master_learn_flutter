import 'package:flutter/material.dart';
import 'package:master_learn/widgets/reusable_row.dart';

Widget myCustomCardWidget(
    String id, String title, String subTitle, String imageUrl) {
  return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
          shape: RoundedRectangleBorder(
              // card corner radius
              borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          elevation: 10,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      margin:
                          const EdgeInsets.only(left: 10, top: 1, bottom: 1),
                      width: 50,
                      height: 50,
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "images/converging_dots.gif",
                          image: imageUrl,
                          width: 50,
                          height: 50),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, bottom: 3, top: 3),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontFamily: "andada_pro",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, bottom: 3, top: 3),
                        child: Text(subTitle),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            /*Padding(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: ,
            itemBuilder: (BuildContext context, int index){


              return  Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: reusableRow("icons/ic_os.png",
                      "Operating System", "Android 9.0 (Pie)"));
            },
          ),)*/
          ])));
}
