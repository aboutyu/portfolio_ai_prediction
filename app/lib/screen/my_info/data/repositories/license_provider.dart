import 'dart:convert';
import 'package:app/screen/my_info/data/models/oss_license_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ossLicenseProvider = FutureProvider<List<OssLicenseModel>>((ref) async {
  final String jsonString = await rootBundle.loadString('assets/licenses.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => OssLicenseModel.fromJson(json)).toList();
});
