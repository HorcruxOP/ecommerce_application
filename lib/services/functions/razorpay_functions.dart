import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayFunctions {
  final Razorpay _razorpay = Razorpay();
  RazorpayFunctions({
    required Function(PaymentSuccessResponse) onSuccess,
    required Function(PaymentFailureResponse) onFailure,
  }) {
    void handleExternalWallet(ExternalWalletResponse response) {
      // Do something when an external wallet was selected
    }
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  void openPayment({
    required String name,
    required double amount,
  }) {
    var options = {
      'key': 'rzp_test_kDG9AYhpnLpwMf',
      'amount': amount * 100,
      'name': name,
      'description': '',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };

    _razorpay.open(options);
  }
}
