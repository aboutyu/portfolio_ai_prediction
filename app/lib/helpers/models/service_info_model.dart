import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';

class ServiceInfoModel {
  final String companyName;
  final String companyServiceName;
  final String companyAddress;
  final String companyContact;
  final String companyCeo;
  final String companyYouthProtectionManager;
  final String companyRegistration;

  const ServiceInfoModel({
    required this.companyName,
    required this.companyServiceName,
    required this.companyAddress,
    required this.companyContact,
    required this.companyCeo,
    required this.companyYouthProtectionManager,
    required this.companyRegistration,
  });

  // ✅ Context를 받아 생성하는 Factory 생성자 추가
  factory ServiceInfoModel.fromContext(BuildContext context) {
    // context.tr 사용 (AppLocalizations)
    return ServiceInfoModel(
      companyName: context.tr.companyName,
      companyServiceName: context.tr.companyServiceName,
      companyAddress: context.tr.companyAddress,
      companyContact: context.tr.companyContact,
      companyCeo: context.tr.companyCeo,
      companyYouthProtectionManager: context.tr.companyYouthProtectionManager,
      companyRegistration: context.tr.companyRegistration,
    );
  }
}
