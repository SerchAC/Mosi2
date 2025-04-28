import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_simply_design_system/utils/services/log_service.dart';
import 'package:mosi2/shared/domain/models/app/list_locations.dart';
import 'package:mosi2/shared/domain/models/app/locations.dart';

/// 🔥 Obtiene la lista de ubicaciones a partir de un código postal (CP).
Future<List<Location>> getLocations(String cp) async {
  try {
    final String response =
        await rootBundle.loadString('assets/jsons/locations.json');
    final Map<String, dynamic> responseJson = json.decode(response);
    final List<Location> locationModels =
        ListLocations.fromJson(responseJson).locations;

    /// 🔥 Convertimos `LocationModel` a `Location`
    final List<Location> locations = locationModels
        .map((location) => Location(
              cp: location.cp,
              name: location.name,
              city: location.city,
              state: location.state,
            ))
        .toList();

    return locations.where((element) => element.cp == cp).toList();
  } catch (e) {
    LogService.error("❌ Error al cargar ubicaciones: $e");
    return [];
  }
}
