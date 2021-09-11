import 'package:flutter/material.dart';
import 'package:login_design/core/base/view/base_view.dart';
import 'package:login_design/core/components/text/auto_local_text.dart';
import 'package:login_design/core/constants/svg/svg_constants.dart';
import 'package:login_design/core/extensions/context_extension.dart';
import 'package:login_design/view/_product/_widgets/avatar/on_board_circle_avatar.dart';
import 'package:login_design/view/authenticate/onboard/model/onboard_model.dart';
import 'package:login_design/view/authenticate/onboard/view_model/onboard_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          SafeArea(
        child: Scaffold(
          body: Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: buildPageView(viewModel),
                ),
                Expanded(
                  flex: 2,
                  child: buildRowFooter(viewModel, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
      itemCount: viewModel.onBoardItems.length,
      itemBuilder: (context, index) => buildColumnBody(
        context,
        viewModel.onBoardItems[index],
      ),
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: buildListViewCircles(viewModel),
        ),
        buildFloatingSkipButton(context, viewModel)
      ],
    );
  }

  FloatingActionButton buildFloatingSkipButton(
      BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
      backgroundColor: context.colors.onBackground,
      onPressed: () {
        viewModel.completeOnBoard();
      },
      child: Icon(
        Icons.chevron_right,
        color: context.colors.primaryVariant,
      ),
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Observer(builder: (_) {
            return OnBoardCircleAvatar(
                isSelected: viewModel.currentIndex == index);
          });
        });
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 7, child: buildSvgPicture(model.imagePath)),
        Expanded(
          flex: 3,
          child: buildColumnDescription(context, model),
        ),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Padding(
          padding: context.paddingNormal,
          child: AutoLocaleText(
            value: model.title,
            style: context.textTheme.headline3!.copyWith(
                fontWeight: FontWeight.bold, color: context.colors.onSurface),
          ),
        ),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: AutoLocaleText(
            value: model.description,
            textAlign: TextAlign.center,
            style: context.textTheme.subtitle2!.copyWith(
              color: context.colors.onBackground,
            ),
          ),
        ),
      ],
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
