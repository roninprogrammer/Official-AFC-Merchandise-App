import 'package:afc_assignment/utils/helper/dialog.dart';
import 'package:afc_assignment/utils/helper/exception.dart';

mixin BaseController {
  void handleError(error) {
    // hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.instance.showErrorDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.instance.showErrorDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.instance.showErrorDialog(description: 'Not Responding');
    }
  }

  showLoading([String? message]) {
    DialogHelper.instance.showLoading(message: message);
  }

  hideLoading() {
    DialogHelper.instance.hideLoading();
  }
}
