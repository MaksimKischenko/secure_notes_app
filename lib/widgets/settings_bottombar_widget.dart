import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes_app/bloc/bloc.dart';
import 'package:secure_notes_app/data/data.dart';
import 'package:secure_notes_app/generated/translations.g.dart';
import 'package:secure_notes_app/navigation.dart';
import 'package:secure_notes_app/styles.dart';
import 'package:secure_notes_app/utils/utils.dart';

// ignore: must_be_immutable
class SettingsBottomBarWidget extends StatelessWidget {

  final BuildContext context;
  final String userName;
  AppLocale curentLocal;

  SettingsBottomBarWidget({
    required this.context,
    required this.userName,
    required this.curentLocal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 0.92,
        widthFactor: 0.98,      
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      icon: const Icon(Icons.chevron_left_outlined)
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 3.5),
                    Text(userName, style: AppStyles.headerTextStyleLess),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if(curentLocal == AppLocale.en) {
                          curentLocal = AppLocale.ru;
                        } else {
                          curentLocal = AppLocale.en;
                        }                                    
                        _onLanguageChanged(curentLocal);
                      }, 
                      icon: const Icon(Icons.language)
                    ),
                    Expanded(child: Text(TranslationProvider.of(context).locale.translations.screens.catalog.settingsModalBottom.language, style: AppStyles.headerTextStyleLess)),
                    Text(TranslationProvider.of(context).locale.languageTag.toUpperCase(), style: AppStyles.headerTextStyleLess),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        logOut();
                      }, 
                      icon: const Icon(Icons.logout)
                    ),
                    Text(TranslationProvider.of(context).locale.translations.screens.catalog.settingsModalBottom.logOut, style: AppStyles.headerTextStyleLess),
                  ],
                )                                                              
              ],
            ),
          )
      );
  }
  void logOut() {
    Multiplatform.showDecisionMessage(
      context: context,
      message: TranslationProvider.of(context).locale.translations.screens.multiplatform.exitMenu.dialogDescriptionTitle,
      action: () {
        context.read<AuthBloc>().add(AuthLogOut());
        Navigation.toAuth();
      },
      dialogTitle: TranslationProvider.of(context).locale.translations.screens.multiplatform.exitMenu.dialogTitle,
      buttonTitle: TranslationProvider.of(context).locale.translations.screens.multiplatform.exitMenu.buttonTitle,
      cancelButtonTitle: TranslationProvider.of(context).locale.translations.screens.multiplatform.exitMenu.cancelButtonTitle
    );
  }

  void _onLanguageChanged(AppLocale newLang) async {
    LocaleSettings.setLocale(newLang);
    await PreferencesHelper.write(PrefsKeys.language, newLang.languageTag);
  }
}
