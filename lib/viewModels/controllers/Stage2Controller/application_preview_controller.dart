import 'package:get/get.dart';

import '../../../models/PreviewResponseModel/preview_response_model.dart';

class ApplicationPreviewController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<PreViewResponseModel?> previewResponse = Rx<PreViewResponseModel?>(null);

  void setPreviewData(PreViewResponseModel data) {
    previewResponse.value = data;
  }

  Data? get previewData => previewResponse.value?.data;
}
