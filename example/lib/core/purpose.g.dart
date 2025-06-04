// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose.dart';

// **************************************************************************
// EnumPatternMatchingGenerator
// **************************************************************************

extension ExtensionPurpose on Purpose {
  /// Whether this is equal to  Purpose.loadTransaction.
  bool get isLoadtransaction => this == Purpose.loadTransaction;

  /// Whether this is equal to  Purpose.successfulTransaction.
  bool get isSuccessfultransaction => this == Purpose.successfulTransaction;

  /// Whether this is equal to  Purpose.declinedTransaction.
  bool get isDeclinedtransaction => this == Purpose.declinedTransaction;

  /// Whether this is equal to  Purpose.marketingCommunication.
  bool get isMarketingcommunication => this == Purpose.marketingCommunication;

  /// Whether this is equal to  Purpose.customerSupport.
  bool get isCustomersupport => this == Purpose.customerSupport;

  /// Whether this is equal to  Purpose.fraudDetection.
  bool get isFrauddetection => this == Purpose.fraudDetection;

  /// Whether this is equal to  Purpose.accountManagement.
  bool get isAccountmanagement => this == Purpose.accountManagement;

  /// Whether this is equal to  Purpose.dataAnalysis.
  bool get isDataanalysis => this == Purpose.dataAnalysis;

  /// Whether this is equal to  Purpose.userFeedback.
  bool get isUserfeedback => this == Purpose.userFeedback;

  /// Whether this is equal to  Purpose.securityMonitoring.
  bool get isSecuritymonitoring => this == Purpose.securityMonitoring;

  /// Whether this is equal to  Purpose.compliance.
  bool get isCompliance => this == Purpose.compliance;

  /// Whether this is equal to  Purpose.systemMaintenance.
  bool get isSystemmaintenance => this == Purpose.systemMaintenance;

  /// Whether this is equal to  Purpose.performanceOptimization.
  bool get isPerformanceoptimization => this == Purpose.performanceOptimization;

  /// Whether this is equal to  Purpose.featureDevelopment.
  bool get isFeaturedevelopment => this == Purpose.featureDevelopment;
  static Purpose fromName(String value) {
    return Purpose.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => throw ArgumentError("Invalid Purpose value"),
    );
  }

  static Purpose fromOrdinal(int value) {
    if (value < 0 || value >= Purpose.values.length) {
      throw ArgumentError("Invalid Purpose value");
    }
    return Purpose.values[value];
  }

  /// Use when method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// Purpose value = Purpose.loadTransaction;
  /// final result = value.when(
  ///   loadTransaction: () => 'loadTransaction',
  ///   successfulTransaction: () => 'successfulTransaction',
  ///   declinedTransaction: () => 'declinedTransaction',
  ///   marketingCommunication: () => 'marketingCommunication',
  ///   customerSupport: () => 'customerSupport',
  ///   fraudDetection: () => 'fraudDetection',
  ///   accountManagement: () => 'accountManagement',
  ///   dataAnalysis: () => 'dataAnalysis',
  ///   userFeedback: () => 'userFeedback',
  ///   securityMonitoring: () => 'securityMonitoring',
  ///   compliance: () => 'compliance',
  ///   systemMaintenance: () => 'systemMaintenance',
  ///   performanceOptimization: () => 'performanceOptimization',
  ///   featureDevelopment: () => 'featureDevelopment',
  /// );
  /// ```
  T when<T>({
    required T Function() loadTransaction,
    required T Function() successfulTransaction,
    required T Function() declinedTransaction,
    required T Function() marketingCommunication,
    required T Function() customerSupport,
    required T Function() fraudDetection,
    required T Function() accountManagement,
    required T Function() dataAnalysis,
    required T Function() userFeedback,
    required T Function() securityMonitoring,
    required T Function() compliance,
    required T Function() systemMaintenance,
    required T Function() performanceOptimization,
    required T Function() featureDevelopment,
  }) {
    return switch (this) {
      Purpose.loadTransaction => loadTransaction(),
      Purpose.successfulTransaction => successfulTransaction(),
      Purpose.declinedTransaction => declinedTransaction(),
      Purpose.marketingCommunication => marketingCommunication(),
      Purpose.customerSupport => customerSupport(),
      Purpose.fraudDetection => fraudDetection(),
      Purpose.accountManagement => accountManagement(),
      Purpose.dataAnalysis => dataAnalysis(),
      Purpose.userFeedback => userFeedback(),
      Purpose.securityMonitoring => securityMonitoring(),
      Purpose.compliance => compliance(),
      Purpose.systemMaintenance => systemMaintenance(),
      Purpose.performanceOptimization => performanceOptimization(),
      Purpose.featureDevelopment => featureDevelopment(),
    };
  }

  /// Use map method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// Purpose value = Purpose.loadTransaction;
  /// final result = value.map(
  ///   loadTransaction: (e) => e.toString(),
  ///   successfulTransaction: (e) => e.toString(),
  ///   declinedTransaction: (e) => e.toString(),
  ///   marketingCommunication: (e) => e.toString(),
  ///   customerSupport: (e) => e.toString(),
  ///   fraudDetection: (e) => e.toString(),
  ///   accountManagement: (e) => e.toString(),
  ///   dataAnalysis: (e) => e.toString(),
  ///   userFeedback: (e) => e.toString(),
  ///   securityMonitoring: (e) => e.toString(),
  ///   compliance: (e) => e.toString(),
  ///   systemMaintenance: (e) => e.toString(),
  ///   performanceOptimization: (e) => e.toString(),
  ///   featureDevelopment: (e) => e.toString(),
  /// );
  /// ```
  T map<T>({
    required T Function(Purpose) loadTransaction,
    required T Function(Purpose) successfulTransaction,
    required T Function(Purpose) declinedTransaction,
    required T Function(Purpose) marketingCommunication,
    required T Function(Purpose) customerSupport,
    required T Function(Purpose) fraudDetection,
    required T Function(Purpose) accountManagement,
    required T Function(Purpose) dataAnalysis,
    required T Function(Purpose) userFeedback,
    required T Function(Purpose) securityMonitoring,
    required T Function(Purpose) compliance,
    required T Function(Purpose) systemMaintenance,
    required T Function(Purpose) performanceOptimization,
    required T Function(Purpose) featureDevelopment,
  }) {
    return switch (this) {
      Purpose.loadTransaction => loadTransaction(this),
      Purpose.successfulTransaction => successfulTransaction(this),
      Purpose.declinedTransaction => declinedTransaction(this),
      Purpose.marketingCommunication => marketingCommunication(this),
      Purpose.customerSupport => customerSupport(this),
      Purpose.fraudDetection => fraudDetection(this),
      Purpose.accountManagement => accountManagement(this),
      Purpose.dataAnalysis => dataAnalysis(this),
      Purpose.userFeedback => userFeedback(this),
      Purpose.securityMonitoring => securityMonitoring(this),
      Purpose.compliance => compliance(this),
      Purpose.systemMaintenance => systemMaintenance(this),
      Purpose.performanceOptimization => performanceOptimization(this),
      Purpose.featureDevelopment => featureDevelopment(this),
    };
  }

  /// Use mayBeWhen method when you want to perform some action based on the enum
  ///
  /// Throws an [ArgumentError] if all parameters are null
  /// ```dart
  /// Purpose value = Purpose.loadTransaction;
  /// final result = value.mayBeWhen(
  ///   loadTransaction: () => 'loadTransaction',
  ///   orElse: () => 'default'
  /// );
  /// ```
  T mayBeWhen<T>({
    T Function()? loadTransaction,
    T Function()? successfulTransaction,
    T Function()? declinedTransaction,
    T Function()? marketingCommunication,
    T Function()? customerSupport,
    T Function()? fraudDetection,
    T Function()? accountManagement,
    T Function()? dataAnalysis,
    T Function()? userFeedback,
    T Function()? securityMonitoring,
    T Function()? compliance,
    T Function()? systemMaintenance,
    T Function()? performanceOptimization,
    T Function()? featureDevelopment,
    required T Function() orElse,
  }) {
    final items = {
      Purpose.loadTransaction: loadTransaction,
      Purpose.successfulTransaction: successfulTransaction,
      Purpose.declinedTransaction: declinedTransaction,
      Purpose.marketingCommunication: marketingCommunication,
      Purpose.customerSupport: customerSupport,
      Purpose.fraudDetection: fraudDetection,
      Purpose.accountManagement: accountManagement,
      Purpose.dataAnalysis: dataAnalysis,
      Purpose.userFeedback: userFeedback,
      Purpose.securityMonitoring: securityMonitoring,
      Purpose.compliance: compliance,
      Purpose.systemMaintenance: systemMaintenance,
      Purpose.performanceOptimization: performanceOptimization,
      Purpose.featureDevelopment: featureDevelopment,
    };
    return items[this]?.call() ?? orElse();
  }

  /// Use mayBeMap method when you want to perform some action based on the enum
  ///
  /// Throws an [ArgumentError] if all parameters are null
  /// ```dart
  /// Purpose value = Purpose.loadTransaction;
  /// final result = value.mayBeMap(
  ///   loadTransaction: (e) => e.toString(),
  ///   orElse: () => 'default'
  /// );
  /// ```
  T mayBeMap<T>({
    T Function(Purpose)? loadTransaction,
    T Function(Purpose)? successfulTransaction,
    T Function(Purpose)? declinedTransaction,
    T Function(Purpose)? marketingCommunication,
    T Function(Purpose)? customerSupport,
    T Function(Purpose)? fraudDetection,
    T Function(Purpose)? accountManagement,
    T Function(Purpose)? dataAnalysis,
    T Function(Purpose)? userFeedback,
    T Function(Purpose)? securityMonitoring,
    T Function(Purpose)? compliance,
    T Function(Purpose)? systemMaintenance,
    T Function(Purpose)? performanceOptimization,
    T Function(Purpose)? featureDevelopment,
    required T Function() orElse,
  }) {
    final items = {
      Purpose.loadTransaction: loadTransaction,
      Purpose.successfulTransaction: successfulTransaction,
      Purpose.declinedTransaction: declinedTransaction,
      Purpose.marketingCommunication: marketingCommunication,
      Purpose.customerSupport: customerSupport,
      Purpose.fraudDetection: fraudDetection,
      Purpose.accountManagement: accountManagement,
      Purpose.dataAnalysis: dataAnalysis,
      Purpose.userFeedback: userFeedback,
      Purpose.securityMonitoring: securityMonitoring,
      Purpose.compliance: compliance,
      Purpose.systemMaintenance: systemMaintenance,
      Purpose.performanceOptimization: performanceOptimization,
      Purpose.featureDevelopment: featureDevelopment,
    };
    return items[this]?.call(this) ?? orElse();
  }
}
