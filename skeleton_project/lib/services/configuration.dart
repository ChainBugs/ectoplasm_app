import "dart:convert";
import "package:flutter/services.dart" show MethodChannel, rootBundle;

class Configuration {
  final String swBaseURL;
  final String apiKey;
  final String flavor;

  Configuration({
    this.swBaseURL,
    this.apiKey,
    this.flavor,
  });

  static Future<Configuration> fromBundle() async {
    // Hard coded until we configure the method channel flavor ID
    final flavor = "development";
    try {
      final json =
          await rootBundle.loadString("assets/config/config_$flavor.json");
      final data = (jsonDecode(json) as Map).cast<String, String>();
      return Configuration.fromJson(flavor, data);
    } on Exception catch (_) {
      throw Exception("Failed to load config for flavor $flavor");
    }
  }

  factory Configuration.fromJson(String flavor, Map<String, String> json) {
    /*
     * Verify the content of the config-file
     * Missing dependencies should result in a exception
     */

    if (json["swBaseURL"] == null || json["apiKey"] == null) {
      throw Exception("Missing dependencies in config file.");
    }
    return Configuration(
      flavor: flavor,
      swBaseURL: json["swBaseUrl"],
      apiKey: json["apiKey"],
    );
  }
}

// In this section we first need to set up our method channels properly and connect our flavor channel ID to the project

// const _flavorChannelID = "CONFIGURE THE FLAVOR HERE";

// Future<String> _getConfigurationFlavor() async {
//   final _viewChannel = const MethodChannel(_flavorChannelID);
//   final flavor = await _viewChannel.invokeMethod<String>("getFlavor");
//   return flavor;
// }

// To this class we will add a flavor loader that collects config data from our respective config json files in /assets
