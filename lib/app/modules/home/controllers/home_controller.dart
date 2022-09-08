import 'package:chronohouse/app/data/constants/controllers.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;

  CurrencyFormatter currencyFormatter = CurrencyFormatter();
  CurrencyFormatterSettings unitSettings = CurrencyFormatterSettings(
    symbol: '\$',
    symbolSide: SymbolSide.right,
    thousandSeparator: '.',
    decimalSeparator: ',',
  );
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    ctlDashboard.listerDashboard();

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
