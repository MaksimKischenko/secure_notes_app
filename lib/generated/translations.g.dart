
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 50 (25.0 per locale)
 *
 * Built on 2022-06-14 at 09:56 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.ru;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ru) // set locale
/// - Locale locale = AppLocale.ru.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ru) // locale check
enum AppLocale {
	ru, // 'ru' (base locale, fallback)
	en, // 'en'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
_TranslationsRu _t = _currLocale.translations;
_TranslationsRu get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
class Translations {
	Translations._(); // no constructor

	static _TranslationsRu of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

enum GenderContext {
	male,
	female,
}

// interfaces generated as mixins

mixin PageData2 {
	String get title;
	String? get content => null;
}

// translation instances

late _TranslationsRu _translationsRu = _TranslationsRu.build();
late _TranslationsEn _translationsEn = _TranslationsEn.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_TranslationsRu get translations {
		switch (this) {
			case AppLocale.ru: return _translationsRu;
			case AppLocale.en: return _translationsEn;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.ru.build(); // build
	/// String a = t.my.path; // access
	_TranslationsRu build() {
		switch (this) {
			case AppLocale.ru: return _TranslationsRu.build();
			case AppLocale.en: return _TranslationsEn.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.ru: return 'ru';
			case AppLocale.en: return 'en';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.ru: return const Locale.fromSubtags(languageCode: 'ru');
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'ru': return AppLocale.ru;
			case 'en': return AppLocale.en;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _TranslationsRu translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _TranslationsRu {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsRu.build();

	late final _TranslationsRu _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsScreensRu screens = _TranslationsScreensRu._(_root);
}

// Path: screens
class _TranslationsScreensRu {
	_TranslationsScreensRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	late final _TranslationsScreensAuthRu auth = _TranslationsScreensAuthRu._(_root);
	late final _TranslationsScreensCatalogRu catalog = _TranslationsScreensCatalogRu._(_root);
	late final _TranslationsScreensMultiplatformRu multiplatform = _TranslationsScreensMultiplatformRu._(_root);
}

// Path: screens.auth
class _TranslationsScreensAuthRu {
	_TranslationsScreensAuthRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	late final _TranslationsScreensAuthLoginFieldRu loginField = _TranslationsScreensAuthLoginFieldRu._(_root);
	late final _TranslationsScreensAuthPasswordFieldRu passwordField = _TranslationsScreensAuthPasswordFieldRu._(_root);
	String get authButton => 'Войти';
	late final _TranslationsScreensAuthValidationRu validation = _TranslationsScreensAuthValidationRu._(_root);
}

// Path: screens.catalog
class _TranslationsScreensCatalogRu {
	_TranslationsScreensCatalogRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	late final _TranslationsScreensCatalogHeaderRu header = _TranslationsScreensCatalogHeaderRu._(_root);
	late final _TranslationsScreensCatalogCatalogActionRu catalogAction = _TranslationsScreensCatalogCatalogActionRu._(_root);
	late final _TranslationsScreensCatalogSettingsModalBottomRu settingsModalBottom = _TranslationsScreensCatalogSettingsModalBottomRu._(_root);
	late final _TranslationsScreensCatalogAddCatalogModalBottomRu addCatalogModalBottom = _TranslationsScreensCatalogAddCatalogModalBottomRu._(_root);
	late final _TranslationsScreensCatalogCreateCatalogModalBottomRu createCatalogModalBottom = _TranslationsScreensCatalogCreateCatalogModalBottomRu._(_root);
	late final _TranslationsScreensCatalogEnterKeyModalBottomRu enterKeyModalBottom = _TranslationsScreensCatalogEnterKeyModalBottomRu._(_root);
}

// Path: screens.multiplatform
class _TranslationsScreensMultiplatformRu {
	_TranslationsScreensMultiplatformRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	late final _TranslationsScreensMultiplatformExitMenuRu exitMenu = _TranslationsScreensMultiplatformExitMenuRu._(_root);
	late final _TranslationsScreensMultiplatformErorMenuRu erorMenu = _TranslationsScreensMultiplatformErorMenuRu._(_root);
}

// Path: screens.auth.loginField
class _TranslationsScreensAuthLoginFieldRu {
	_TranslationsScreensAuthLoginFieldRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Логин';
}

// Path: screens.auth.passwordField
class _TranslationsScreensAuthPasswordFieldRu {
	_TranslationsScreensAuthPasswordFieldRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Пароль';
}

// Path: screens.auth.validation
class _TranslationsScreensAuthValidationRu {
	_TranslationsScreensAuthValidationRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get message => 'Поле обязательное для заполнения';
}

// Path: screens.catalog.header
class _TranslationsScreensCatalogHeaderRu {
	_TranslationsScreensCatalogHeaderRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Каталог';
}

// Path: screens.catalog.catalogAction
class _TranslationsScreensCatalogCatalogActionRu {
	_TranslationsScreensCatalogCatalogActionRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get action => 'Поделиться';
	String get delete => 'Удалить';
}

// Path: screens.catalog.settingsModalBottom
class _TranslationsScreensCatalogSettingsModalBottomRu {
	_TranslationsScreensCatalogSettingsModalBottomRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get language => 'Язык';
	String get logOut => 'Выйти';
}

// Path: screens.catalog.addCatalogModalBottom
class _TranslationsScreensCatalogAddCatalogModalBottomRu {
	_TranslationsScreensCatalogAddCatalogModalBottomRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Добавить элемент';
	String get create => 'Создать';
	String get secretKey => 'Ввести секретный ключ';
	String get cansel => 'Отмена';
}

// Path: screens.catalog.createCatalogModalBottom
class _TranslationsScreensCatalogCreateCatalogModalBottomRu {
	_TranslationsScreensCatalogCreateCatalogModalBottomRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get name => 'Введите название';
	String get add => 'Добавить';
}

// Path: screens.catalog.enterKeyModalBottom
class _TranslationsScreensCatalogEnterKeyModalBottomRu {
	_TranslationsScreensCatalogEnterKeyModalBottomRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get name => 'Введите секретный ключ';
	String get add => 'Ввод';
}

// Path: screens.multiplatform.exitMenu
class _TranslationsScreensMultiplatformExitMenuRu {
	_TranslationsScreensMultiplatformExitMenuRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get dialogTitle => 'Уверены, что хотите выйти?';
	String get dialogDescriptionTitle => 'Ваши авторизованные данные будут удалены с устройства';
	String get buttonTitle => 'Выйти';
	String get cancelButtonTitle => 'Остаться';
}

// Path: screens.multiplatform.erorMenu
class _TranslationsScreensMultiplatformErorMenuRu {
	_TranslationsScreensMultiplatformErorMenuRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get dialogTitle => 'Ошибка';
	late final _TranslationsScreensMultiplatformErorMenuDialogDescriptionTitleRu dialogDescriptionTitle = _TranslationsScreensMultiplatformErorMenuDialogDescriptionTitleRu._(_root);
}

// Path: screens.multiplatform.erorMenu.dialogDescriptionTitle
class _TranslationsScreensMultiplatformErorMenuDialogDescriptionTitleRu {
	_TranslationsScreensMultiplatformErorMenuDialogDescriptionTitleRu._(this._root);

	final _TranslationsRu _root; // ignore: unused_field

	// Translations
	String get edit => 'У вас нет прав для редактирования данного каталога';
	String get delete => 'У вас нет прав для удаления данного каталога';
	String get generateKey => 'У вас нет прав для генерации ключа у данного каталога';
}

// Path: <root>
class _TranslationsEn extends _TranslationsRu {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEn.build()
		: super.build();

	@override late final _TranslationsEn _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsScreensEn screens = _TranslationsScreensEn._(_root);
}

// Path: screens
class _TranslationsScreensEn extends _TranslationsScreensRu {
	_TranslationsScreensEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsScreensAuthEn auth = _TranslationsScreensAuthEn._(_root);
	@override late final _TranslationsScreensCatalogEn catalog = _TranslationsScreensCatalogEn._(_root);
	@override late final _TranslationsScreensMultiplatformEn multiplatform = _TranslationsScreensMultiplatformEn._(_root);
}

// Path: screens.auth
class _TranslationsScreensAuthEn extends _TranslationsScreensAuthRu {
	_TranslationsScreensAuthEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsScreensAuthLoginFieldEn loginField = _TranslationsScreensAuthLoginFieldEn._(_root);
	@override late final _TranslationsScreensAuthPasswordFieldEn passwordField = _TranslationsScreensAuthPasswordFieldEn._(_root);
	@override String get authButton => 'Login';
	@override late final _TranslationsScreensAuthValidationEn validation = _TranslationsScreensAuthValidationEn._(_root);
}

// Path: screens.catalog
class _TranslationsScreensCatalogEn extends _TranslationsScreensCatalogRu {
	_TranslationsScreensCatalogEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsScreensCatalogHeaderEn header = _TranslationsScreensCatalogHeaderEn._(_root);
	@override late final _TranslationsScreensCatalogCatalogActionEn catalogAction = _TranslationsScreensCatalogCatalogActionEn._(_root);
	@override late final _TranslationsScreensCatalogSettingsModalBottomEn settingsModalBottom = _TranslationsScreensCatalogSettingsModalBottomEn._(_root);
	@override late final _TranslationsScreensCatalogAddCatalogModalBottomEn addCatalogModalBottom = _TranslationsScreensCatalogAddCatalogModalBottomEn._(_root);
	@override late final _TranslationsScreensCatalogCreateCatalogModalBottomEn createCatalogModalBottom = _TranslationsScreensCatalogCreateCatalogModalBottomEn._(_root);
	@override late final _TranslationsScreensCatalogEnterKeyModalBottomEn enterKeyModalBottom = _TranslationsScreensCatalogEnterKeyModalBottomEn._(_root);
}

// Path: screens.multiplatform
class _TranslationsScreensMultiplatformEn extends _TranslationsScreensMultiplatformRu {
	_TranslationsScreensMultiplatformEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsScreensMultiplatformExitMenuEn exitMenu = _TranslationsScreensMultiplatformExitMenuEn._(_root);
	@override late final _TranslationsScreensMultiplatformErorMenuEn erorMenu = _TranslationsScreensMultiplatformErorMenuEn._(_root);
}

// Path: screens.auth.loginField
class _TranslationsScreensAuthLoginFieldEn extends _TranslationsScreensAuthLoginFieldRu {
	_TranslationsScreensAuthLoginFieldEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
}

// Path: screens.auth.passwordField
class _TranslationsScreensAuthPasswordFieldEn extends _TranslationsScreensAuthPasswordFieldRu {
	_TranslationsScreensAuthPasswordFieldEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Password';
}

// Path: screens.auth.validation
class _TranslationsScreensAuthValidationEn extends _TranslationsScreensAuthValidationRu {
	_TranslationsScreensAuthValidationEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get message => 'Required field';
}

// Path: screens.catalog.header
class _TranslationsScreensCatalogHeaderEn extends _TranslationsScreensCatalogHeaderRu {
	_TranslationsScreensCatalogHeaderEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Catalog';
}

// Path: screens.catalog.catalogAction
class _TranslationsScreensCatalogCatalogActionEn extends _TranslationsScreensCatalogCatalogActionRu {
	_TranslationsScreensCatalogCatalogActionEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get action => 'Share';
	@override String get delete => 'Delete';
}

// Path: screens.catalog.settingsModalBottom
class _TranslationsScreensCatalogSettingsModalBottomEn extends _TranslationsScreensCatalogSettingsModalBottomRu {
	_TranslationsScreensCatalogSettingsModalBottomEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get language => 'Language';
	@override String get logOut => 'Log out';
}

// Path: screens.catalog.addCatalogModalBottom
class _TranslationsScreensCatalogAddCatalogModalBottomEn extends _TranslationsScreensCatalogAddCatalogModalBottomRu {
	_TranslationsScreensCatalogAddCatalogModalBottomEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Add element';
	@override String get create => 'Create';
	@override String get secretKey => 'Enter secret key';
	@override String get cansel => 'Cansel';
}

// Path: screens.catalog.createCatalogModalBottom
class _TranslationsScreensCatalogCreateCatalogModalBottomEn extends _TranslationsScreensCatalogCreateCatalogModalBottomRu {
	_TranslationsScreensCatalogCreateCatalogModalBottomEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Enter name';
	@override String get add => 'Add';
}

// Path: screens.catalog.enterKeyModalBottom
class _TranslationsScreensCatalogEnterKeyModalBottomEn extends _TranslationsScreensCatalogEnterKeyModalBottomRu {
	_TranslationsScreensCatalogEnterKeyModalBottomEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Enter secret key';
	@override String get add => 'Enter';
}

// Path: screens.multiplatform.exitMenu
class _TranslationsScreensMultiplatformExitMenuEn extends _TranslationsScreensMultiplatformExitMenuRu {
	_TranslationsScreensMultiplatformExitMenuEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get dialogTitle => 'Are you sure you want to leave?';
	@override String get dialogDescriptionTitle => 'Your authorized data will be deleted from the device';
	@override String get buttonTitle => 'Exit';
	@override String get cancelButtonTitle => 'Stay';
}

// Path: screens.multiplatform.erorMenu
class _TranslationsScreensMultiplatformErorMenuEn extends _TranslationsScreensMultiplatformErorMenuRu {
	_TranslationsScreensMultiplatformErorMenuEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get dialogTitle => 'Error';
	@override late final _TranslationsScreensMultiplatformErorMenuDialogDescriptionTitleEn dialogDescriptionTitle = _TranslationsScreensMultiplatformErorMenuDialogDescriptionTitleEn._(_root);
}

// Path: screens.multiplatform.erorMenu.dialogDescriptionTitle
class _TranslationsScreensMultiplatformErorMenuDialogDescriptionTitleEn extends _TranslationsScreensMultiplatformErorMenuDialogDescriptionTitleRu {
	_TranslationsScreensMultiplatformErorMenuDialogDescriptionTitleEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get edit => 'You do not have permission to edit this directory';
	@override String get delete => 'You do not have permission to delete this directory';
	@override String get generateKey => 'You do not have permission to generate a key for this directory';
}
