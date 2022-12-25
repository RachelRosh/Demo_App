import 'package:demo_app/Model/detailsModel.dart';
import 'package:demo_app/Provider/apiProvider.dart';
import 'package:flutter/cupertino.dart';

class DetailsProvider with ChangeNotifier {
  ApiProvider _provider = ApiProvider();

  Future<List<Details>> getDetails() async {
    print("----------------inside--------getDetails------url-----------");
    try {
      final response = await _provider.get();
      final extractedData = response as dynamic;
      print(extractedData);

      final List<Details> detailsList = [];

      extractedData.forEach((eactData) {
        detailsList.add(Details(
            queryId: eactData['query_id'],
            querytext: eactData['query_text'],
            comments: eactData['comments'],
            date: eactData['date'],
            location: eactData['location']));
      });
      print(
          "----------extractedData--------------$detailsList---------------------");
      return detailsList;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
