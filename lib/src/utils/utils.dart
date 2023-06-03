import 'package:yaml/yaml.dart';

String capitalize(String? string) {
  if (string == null || string.isEmpty) {
    return '';
  }
  return string.substring(0, 1).toUpperCase() + string.substring(1, string.length);
}

void log(String message, {String? name}) {
  // ignore:avoid_print
  print('${name?.isEmpty ?? true ? '' : '[${name!.toUpperCase()}]'} $message');
}

Map<String, dynamic> yamlToMap(YamlMap yamlMap) {
  final Map<String, dynamic> result = {};
  for (final MapEntry(:key, :value) in yamlMap.entries) {
    if (value is YamlMap) {
      result[key] = yamlToMap(value);
    } else if (value is YamlList) {
      final List<Map<String, dynamic>> tempList = [];
      for (final dynamic listValue in value) {
        if (listValue is YamlMap) {
          tempList.add(yamlToMap(listValue));
        } else {
          log('Skipping unsupported data type: $listValue');
        }
      }
      result[key] = tempList;
    } else {
      result[key] = value;
    }
  }
  return result;
}
