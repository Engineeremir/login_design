import 'package:flutter/cupertino.dart';
import 'package:login_design/core/base/view_model/base_view_model.dart';
import 'package:login_design/core/constants/enums/locale_keys.dart';
import 'package:login_design/core/constants/navigation/navigation_constants.dart';
import 'package:login_design/core/constants/svg/svg_constants.dart';
import 'package:login_design/core/init/language/locale_keys.g.dart';
import 'package:login_design/view/authenticate/onboard/model/onboard_model.dart';
import 'package:mobx/mobx.dart';
part 'onboard_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;

  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  void init() {
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_desc, SvgConstants.instance.art));

    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page2_title,
        LocaleKeys.onBoard_page2_desc, SvgConstants.instance.businesswoman));

    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page3_title,
        LocaleKeys.onBoard_page3_desc, SvgConstants.instance.influencer));

    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page4_title,
        LocaleKeys.onBoard_page4_desc, SvgConstants.instance.sunnyday));
  }

  Future<void> completeOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
  }
}
