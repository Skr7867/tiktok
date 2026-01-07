import 'dart:math';
import 'package:get/get.dart';

class EmiController extends GetxController {
  final loanAmount = 100000.0.obs;
  final interestRate = 5.0.obs;
  final tenure = 1.0.obs;
  final isYear = true.obs;

  // Get tenure in months
  double get tenureInMonths => isYear.value ? tenure.value * 12 : tenure.value;

  // Get monthly interest rate
  double get monthlyRate => interestRate.value / 12 / 100;

  // Calculate EMI using formula: EMI = [P x R x (1+R)^N]/[(1+R)^N-1]
  double get emi {
    final r = monthlyRate;
    final n = tenureInMonths;

    if (r == 0) {
      return loanAmount.value / n;
    }

    return (loanAmount.value * r * pow(1 + r, n)) / (pow(1 + r, n) - 1);
  }

  // Calculate total payment over the loan period
  double get totalPayment => emi * tenureInMonths;

  // Calculate total interest paid
  double get totalInterest => totalPayment - loanAmount.value;

  // Calculate principal percentage
  double get principalPercent => (loanAmount.value / totalPayment) * 100;

  // Calculate interest percentage
  double get interestPercent => (totalInterest / totalPayment) * 100;

  // Toggle between years and months
  void toggleTenureType(bool yearMode) {
    if (yearMode != isYear.value) {
      if (yearMode) {
        // Converting from months to years
        tenure.value = (tenure.value / 12).clamp(1.0, 30.0);
        isYear.value = true;
      } else {
        // Converting from years to months
        tenure.value = (tenure.value * 12).clamp(1.0, 360.0);
        isYear.value = false;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Listen to changes and trigger UI updates
    ever(loanAmount, (_) => update());
    ever(interestRate, (_) => update());
    ever(tenure, (_) => update());
    ever(isYear, (_) => update());
  }
}
