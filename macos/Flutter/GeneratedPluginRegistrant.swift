//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import network_info_plus_macos
import package_info_plus_macos
import path_provider_macos
import sentry_flutter
import sqflite

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  NetworkInfoPlusPlugin.register(with: registry.registrar(forPlugin: "NetworkInfoPlusPlugin"))
  FLTPackageInfoPlusPlugin.register(with: registry.registrar(forPlugin: "FLTPackageInfoPlusPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SentryFlutterPlugin.register(with: registry.registrar(forPlugin: "SentryFlutterPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
}
