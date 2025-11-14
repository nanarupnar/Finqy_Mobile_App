import '../viewmodels/kyc_viewmodel.dart';

Map<String, dynamic> getKycFieldConfig(PartnerType type) {
  switch (type) {
    case PartnerType.individual:
      return {
        'personal': ['PAN Number', 'Individual Name', 'Mobile', 'Email', 'Education Proof'],
        'bank': ['Profession', 'Aadhaar Card No', 'Account Number', 'IFSC Code', 'Bank Name'],
        'documents': ['PAN Card', 'Aadhaar Card', 'Cancelled Cheque', 'Profile Picture', 'Education Proof Picture']
      };
    case PartnerType.proprietorship:
      return {
        'personal': ['PAN Number', 'Proprietorship Name', 'Mobile', 'Email', 'Education Proof'],
        'bank': ['GST/Udyam Aadhaar', 'Account Number', 'IFSC Code', 'Bank Name'],
        'documents': ['PAN Card', 'GST/Udyam Aadhaar Card', 'Cancelled Cheque', 'Profile Picture', 'Education Proof Picture']
      };
    case PartnerType.privateLimited:
      return {
        'personal': ['PAN Number', 'Company Name', 'Mobile', 'Email', 'Education Proof'],
        'bank': ['GST Number', 'CIN Number', 'Account Number', 'IFSC Code', 'Bank Name'],
        'documents': ['PAN Card', 'GST Certificate', 'Cancelled Cheque', 'Certificate of Incorporation', 'Profile Picture', 'Education Proof Picture']
      };
    case PartnerType.partnershipFirm:
      return {
        'personal': ['PAN Number', 'Partnership Firm Name', 'Mobile', 'Email', 'Education Proof'],
        'bank': ['GST Number', 'Account Number', 'IFSC Code', 'Bank Name'],
        'documents': ['PAN Card', 'GST Certificate', 'Cancelled Cheque', 'Certificate of Incorporation', 'Profile Picture', 'Education Proof Picture']
      };
    case PartnerType.llp:
      return {
        'personal': ['PAN Number', 'LLP Name', 'Mobile', 'Email', 'Education Proof'],
        'bank': ['GST Number', 'Account Number', 'IFSC Code', 'Bank Name'],
        'documents': ['PAN Card', 'GST Certificate', 'Cancelled Cheque', 'Certificate of Incorporation', 'Profile Picture', 'Education Proof Picture']
      };
  }
}
