import 'package:annotations/annotations.dart';

part 'purpose.g.dart';

@enumExtension
enum Purpose {
  loadTransaction,
  successfulTransaction,
  declinedTransaction,
  marketingCommunication,

  customerSupport,
  fraudDetection,
  accountManagement,
  dataAnalysis,
  userFeedback,
  securityMonitoring,
  compliance,
  systemMaintenance,
  performanceOptimization,
  featureDevelopment,
}
