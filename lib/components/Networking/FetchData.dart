import 'dart:convert';
import 'package:art_man/components/Location.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:http/http.dart' as http;

class GetLocation {

 static Future<Country> fetchData() async {
    Country country;
    final response = await http.get("${Strings.baseurl}/country/getCountry");
    if (response.statusCode == 200) {
      print("connection is ok");
      var list = (json.decode(response.body));
      country = Country.fromJson(list);
      return country;
    } else {
      throw Exception('Failed to load countreis');
    }
  }
 /* @override
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