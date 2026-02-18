class ServiceInfoModel {
  final String companyName;
  final String serviceName;
  final String ceoName;
  final String privateManagerName;
  final String companyNumber;
  final String telecomSellerNumber;
  final String companyAddress;
  final String companyZipcode;
  final String phone;
  final String language;
  final String memo;
  final int copyright;
  final String companyUrl;
  final String serviceUrl;
  final String email;

  ServiceInfoModel({
    required this.companyName,
    required this.serviceName,
    required this.ceoName,
    required this.privateManagerName,
    required this.companyNumber,
    required this.telecomSellerNumber,
    required this.companyAddress,
    required this.companyZipcode,
    required this.phone,
    required this.language,
    required this.memo,
    required this.copyright,
    required this.companyUrl,
    required this.serviceUrl,
    required this.email,
  });

  factory ServiceInfoModel.fromJson(Map<String, dynamic> json) {
    return ServiceInfoModel(
      companyName: json['companyName'] ?? '',
      serviceName: json['serviceName'] ?? '',
      ceoName: json['ceoName'] ?? '',
      privateManagerName: json['privateManagerName'] ?? '',
      companyNumber: json['companyNumber'] ?? '',
      telecomSellerNumber: json['telecomSellerNumber'] ?? '',
      companyAddress: json['companyAddress'] ?? '',
      companyZipcode: json['companyZipcode'] ?? '',
      phone: json['phone'] ?? '',
      language: json['language'] ?? 'ko',
      memo: json['memo'] ?? '',
      copyright: json['copyright'] ?? 2026,
      companyUrl: json['companyUrl'] ?? '',
      serviceUrl: json['serviceUrl'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
