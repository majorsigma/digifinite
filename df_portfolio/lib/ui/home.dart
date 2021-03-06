// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

import 'package:flutter/material.dart';

import 'package:df_portfolio/constants/assets.dart';
import 'package:df_portfolio/constants/fonts.dart';
import 'package:df_portfolio/constants/strings.dart';
import 'package:df_portfolio/constants/text_styles.dart';
import 'package:df_portfolio/models/education.dart';
import 'package:df_portfolio/utils/screen/screen_utils.dart';
import 'package:df_portfolio/widgets/responsive_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final Uri _githubUrl = Uri.parse("https://github.com/DigiFinite");
  final Uri _linkedInUrl = Uri.parse("https://linkedin.com/");
  final Uri _facebookUrl = Uri.parse("https://facebook.com/");
  final Uri _twitterUrl = Uri.parse("https://twitter.com/");
  final Uri _instagramUrl = Uri.parse("https://instagram.com/");

  // Targeted Platforms Methods:------------------------------------------------------------
  final skills = [
    'Android',
    'iOS',
    'Linux',
    'Mac',
    'Windows',
    "Web",
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF7F8FA),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().setWidth(108),
        ), //144
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: _buildAppBar(context),
          ),
          drawer: _buildDrawer(context),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return _buildBody(context, constraints);
            },
          ),
        ),
      ),
    );
  }

  //AppBar Methods:-------------------------------------------------------------
  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      title: _buildTitle(),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions:
          !ResponsiveWidget.isSmallScreen(context) ? _buildActions() : null,
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: Strings.digi,
            style: TextStyles.logo,
          ),
          TextSpan(
            text: Strings.finite,
            style: TextStyles.logo.copyWith(
              color: const Color(0xFF50AFC0),
            ),
          ),
          const TextSpan(
            text:
                "  scaling businesses with digital intelligence one byte at a time",
            style: TextStyle(
                fontFamily: "ProductSans",
                fontSize: 11,
                fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }

  List<Widget> _buildActions() {
    return <Widget>[
      MaterialButton(
        child: Text(
          Strings.menuHome,
          style: TextStyles.menuItem.copyWith(
            color: const Color(0xFF50AFC0),
          ),
        ),
        onPressed: () {},
      ),
      MaterialButton(
        child: Text(
          Strings.menuAbout,
          style: TextStyles.menuItem,
        ),
        onPressed: () {},
      ),
      MaterialButton(
        child: Text(
          Strings.menuContact,
          style: TextStyles.menuItem,
        ),
        onPressed: () {},
      ),
    ];
  }

  Widget _buildDrawer(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Drawer(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: _buildActions(),
            ),
          )
        : const SizedBox.shrink();
  }

  //Screen Methods:-------------------------------------------------------------
  Widget _buildBody(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: constraints.maxWidth,
          minHeight: constraints.maxHeight,
        ),
        child: ResponsiveWidget(
          largeScreen: _buildLargeScreen(context),
          mediumScreen: _buildMediumScreen(context),
          smallScreen: _buildSmallScreen(context),
        ),
      ),
    );
  }

  Widget _buildLargeScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: _buildContent(context),
                ),
                _buildIllustration(),
              ],
            ),
          ),
          _buildFooter(context)
        ],
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: _buildContent(context),
                ),
              ],
            ),
          ),
          _buildFooter(context)
        ],
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _buildContent(context),
          ),
          const Divider(),
          _buildCopyRightText(context),
          SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),
          _buildSocialIcons(),
          SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),
        ],
      ),
    );
  }

  // Body Methods:--------------------------------------------------------------
  Widget _buildIllustration() {
    return Image.network(
      Assets.programmer3,
      height: ScreenUtil.getInstance().setWidth(345), //480.0
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 0.0),
        _buildAboutMe(context),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 24.0),
        _buildSummary(),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 48.0),
        ResponsiveWidget.isSmallScreen(context)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildServices(context),
                  const SizedBox(height: 24.0),
                  _buildPlatforms(context),
                ],
              )
            : _buildServicesAndPlatforms(context)
      ],
    );
  }

  Widget _buildAboutMe(BuildContext context) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: Strings.our,
            style: TextStyles.heading.copyWith(
              fontFamily: Fonts.nexaLight,
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 36 : 45.0,
            ),
          ),
          TextSpan(
            text: Strings.mission,
            style: TextStyles.heading.copyWith(
              color: const Color(0xFF50AFC0),
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 36 : 45.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: const EdgeInsets.only(right: 80.0),
      child: Text(
        Strings.summary,
        style: TextStyles.body,
      ),
    );
  }

  Widget _buildServicesAndPlatforms(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: _buildServices(context),
        ),
        const SizedBox(width: 40.0),
        Expanded(
          flex: 1,
          child: _buildPlatforms(context),
        ),
      ],
    );
  }

  Widget _buildPlatforms(BuildContext context) {
    final List<Widget> widgets = skills
        .map(
          (skill) => Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
              top: 5,
            ),
            child: _buildSkillChip(context, skill),
          ),
        )
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildPlatformsContainerHeading(),
        Wrap(children: widgets),
      ],
    );
  }

  Widget _buildPlatformsContainerHeading() {
    return Text(
      Strings.skillsIhave,
      style: TextStyles.subHeading,
    );
  }

  Widget _buildSkillChip(
    BuildContext context,
    String label,
  ) {
    return Chip(
      label: Text(
        label,
        style: TextStyles.chip.copyWith(
          fontSize: ResponsiveWidget.isSmallScreen(context) ? 10.0 : 11.0,
        ),
      ),
    );
  }

  Widget _buildServices(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildOurServiceContainerHeading(context),
        _buildServicesSummary(),
        const SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.network(
              "assets/icons/coding.svg",
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              "Software Development",
              style: TextStyles.body,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.network(
              "assets/icons/security.svg",
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              "Penetration Testing",
              style: TextStyles.body,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            SvgPicture.network(
              "assets/icons/maintenance.svg",
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              "Systems Repair & Maintenance",
              style: TextStyles.body,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            SvgPicture.network(
              "assets/icons/networking.svg",
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              "Computer Networking",
              style: TextStyles.body,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.network(
              "assets/icons/database.svg",
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              "Database Administration",
              style: TextStyles.body,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.network(
              "assets/icons/analysis.svg",
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              "Big Data Analysis",
              style: TextStyles.body,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            SvgPicture.network(
              "assets/icons/tutoring.svg",
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              "IT Consulting & Tutoring",
              style: TextStyles.body,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOurServiceContainerHeading(BuildContext context) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "Our",
            style: TextStyles.heading.copyWith(
              fontFamily: Fonts.nexaLight,
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 32.0,
            ),
          ),
          TextSpan(
            text: " Services",
            style: TextStyles.heading.copyWith(
              color: const Color(0xFF50AFC0),
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 32.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSummary() {
    return Text(
      'The list of services we provide include:',
      style: TextStyles.body,
    );
  }

  // Footer Methods:------------------------------------------------------------
  Widget _buildFooter(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                child: _buildCopyRightText(context),
                alignment: Alignment.centerLeft,
              ),
              Align(
                child: _buildSocialIcons(),
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCopyRightText(BuildContext context) {
    return Text(
      Strings.rightsReserved,
      style: TextStyles.body1.copyWith(
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 8 : 10.0,
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () => launchUrl(_linkedInUrl),
          child: SvgPicture.network(
            "assets/icons/linkedin.svg",
            height: 20.0,
            width: 20.0,
          ),
        ),
        const SizedBox(width: 16.0),
        GestureDetector(
          onTap: () => launchUrl(_githubUrl),
          child: SvgPicture.network(
            "assets/icons/github.svg",
            height: 20.0,
            width: 20.0,
          ),
        ),
        const SizedBox(width: 16.0),
        GestureDetector(
          onTap: () => launchUrl(_twitterUrl),
          child: SvgPicture.network(
            "assets/icons/twitter.svg",
            height: 20.0,
            width: 20.0,
          ),
        ),
        const SizedBox(width: 16.0),
        GestureDetector(
          onTap: () => launchUrl(_facebookUrl),
          child: SvgPicture.network(
            "assets/icons/facebook.svg",
            height: 20.0,
            width: 20.0,
          ),
        ),
        const SizedBox(width: 16.0),
        GestureDetector(
          onTap: () => launchUrl(_instagramUrl),
          child: SvgPicture.network(
            "assets/icons/instagram.svg",
            height: 20.0,
            width: 20.0,
          ),
        ),
      ],
    );
  }
}
