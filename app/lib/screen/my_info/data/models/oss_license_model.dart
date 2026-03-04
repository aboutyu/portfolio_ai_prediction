class OssLicenseModel {
  final String name;
  final String description;
  final String version;
  final String license;
  final String? homepage;
  final String? repository;

  OssLicenseModel({
    required this.name,
    required this.description,
    required this.version,
    required this.license,
    this.homepage,
    this.repository,
  });

  factory OssLicenseModel.fromJson(Map<String, dynamic> json) {
    return OssLicenseModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      version: json['version'] ?? '',
      license: json['license'] ?? '',
      homepage: json['homepage'],
      repository: json['repository'],
    );
  }
}
