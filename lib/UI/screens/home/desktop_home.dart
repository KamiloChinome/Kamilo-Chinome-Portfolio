import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/UI/providers/language_provider.dart';
import 'package:portfolio/UI/providers/theme_provider.dart';
import 'package:portfolio/UI/widgets/animated_text_about_me.dart';
import 'package:portfolio/UI/widgets/shared/shared_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            const _SliverAppBar(),
            SliverList.list(children: const [_AboutMe()])
          ],
        ),
        const _SocialMediaSection(),
        const _ConfigurationSection()
      ],
    ));
  }
}

class _AboutMe extends StatelessWidget {
  const _AboutMe();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 35.screenWidth, left: 35.screenWidth, top: 6.screenHeight),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SharedAnimatedText(),
          Text(
            AppLocalizations.of(context)!.kamiloChinome,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            AppLocalizations.of(context)!.iAmFlutterDeveloper,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(.5)),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(right: 50.screenWidth),
            child: Text(AppLocalizations.of(context)!.aboutMe),
          )
        ].animate().slideY(),
      ),
    );
  }
}

class _ConfigurationSection extends StatelessWidget {
  const _ConfigurationSection();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 15,
        right: 40,
        child: Column(
          children: [
            SharedTextIconButton(
              text: (context.watch<LanguageProvider>().language == 'en') ? 'es' : 'en',
              onTap: () => context.read<LanguageProvider>().changeLanguage(),
            ),
            const SizedBox(height: 7),
            SharedIconButton(
              icon: (context.watch<ThemeProvider>().isDarkMode) ? Icons.light_mode : Icons.dark_mode,
              onTap: () => context.read<ThemeProvider>().changeTheme(),
            ),
          ].animate().slideY(),
        ));
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar();

  @override
  Widget build(BuildContext context) {
    return SharedSliverAppBar(
        leading: IconButton(
            onPressed: () {},
            splashRadius: 25,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Image.asset(
              'assets/kchLogo.png',
              height: 50,
            )).animate().slideY(),
        actions: [
          SharedTextButton(text: AppLocalizations.of(context)!.about),
          const SizedBox(width: 7),
          SharedTextButton(text: AppLocalizations.of(context)!.experience),
          const SizedBox(width: 7),
          SharedTextButton(text: AppLocalizations.of(context)!.work),
          const SizedBox(width: 7),
          SharedTextButton(text: AppLocalizations.of(context)!.contact),
          const SizedBox(width: 7),
          SharedOutlinedButton(text: AppLocalizations.of(context)!.resume),
          const SizedBox(width: 40),
        ].animate().slideY());
  }
}

class _SocialMediaSection extends StatelessWidget {
  const _SocialMediaSection();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 40,
      child: Column(
        children: [
          SharedIconButton(icon: IonIcons.logo_linkedin, onTap: () {}),
          const SizedBox(height: 7),
          SharedIconButton(icon: IonIcons.logo_github, onTap: () {}),
          const SizedBox(height: 7),
          SharedIconButton(icon: IonIcons.logo_instagram, onTap: () {}),
          const SizedBox(height: 7),
          SharedIconButton(icon: IonIcons.mail, onTap: () {}),
        ].animate().slideY(),
      ),
    );
  }
}
