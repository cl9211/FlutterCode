import 'dart:async';
import 'dart:convert';

import 'package:xiecheng_flutter_app/model/travel_model.dart';
import 'package:http/http.dart' as http;

var Params = {
  "districtId": -1,
  "groupChannelCode": "RX-OMF",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 0,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {},
  "contentType": "json"
};

class TravelDao {
  static Future<TravelItemModel> fetch(
      String url, String groupChannelCode, int pageIndex, int pageSize) async {
    Map paramsMap = Params['pagePara'];
    paramsMap['pageIndex'] = pageIndex;
    paramsMap['pageSize'] = pageSize;
    Params['groupChannelCode'] = groupChannelCode;
    final response = await http.post(url, body: jsonEncode(Params));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelItemModel.fromJson(result);
    } else {
      throw Exception('Failed to load travel');
    }
  }
}
