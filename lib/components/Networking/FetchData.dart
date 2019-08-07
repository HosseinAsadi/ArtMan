import 'dart:convert';

import 'package:art_man/components/Location.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class GetLocation {


  fetchData() async {
    Country country;
    final response =
    await http.get("http://192.168.20.231:3000/country/getCountry");
    if (response.statusCode == 200) {
      print ("connection is ok");
     final list = (json.decode(response.body) );
     print("data fetched");
     return country =new Country.fromJson(list);

      print("data parsee");

    } else {
      throw Exception('Failed to load photos');
    }
  }
  /*@override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data JSON"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: new Text("Fetch Data"),
            onPressed: _fetchData,
          ),
        ),
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            :    ListView.builder(
            itemCount: country.result.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: new Text(country.result[index].name),

              );
            }));
  }*/
}