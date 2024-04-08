import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';

class AboutApplicationPage extends StatelessWidget {
  const AboutApplicationPage({super.key});

  TextSpan get _textSpanBold => const TextSpan(
        text: 'Купи - и точка!',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).aboutApplication,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: ColorsCollection.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ColorsCollection.onSurfaceVariant,
                      ),
                  children: <TextSpan>[
                    const TextSpan(text: 'Добро пожаловать в '),
                    _textSpanBold,
                    const TextSpan(
                        text:
                            ' – ваш универсальный помощник в мире объявлений! Наше приложение предоставляет удобный и безопасный способ купить или продать практически что угодно, от бытовой техники до недвижимости и автомобилей.'),
                    const TextSpan(
                        text:
                            '\n \nЗдесь вы найдете широкий выбор товаров и услуг, предлагаемых как частными лицами, так и компаниями. Будь то поиск квартиры, покупка машины или выбор исполнителя для домашних работ – все это доступно в несколько кликов.'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Особенности приложения:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorsCollection.onSurface,
                    ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ColorsCollection.onSurfaceVariant,
                      ),
                  children: <TextSpan>[
                    const TextSpan(
                        text: '• Разнообразие Категорий: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                        text:
                            'От недвижимости и автомобилей до бытовой техники и одежды.\n'),
                    const TextSpan(
                        text: '• Поиск и Фильтры: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                        text:
                            'Настройте фильтры поиска, чтобы быстро найти то, что вам нужно.\n'),
                    const TextSpan(
                        text: '• Безопасность: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                        text:
                            'Мы прилагаем все усилия, чтобы сделать сделки безопасными и прозрачными.\n'),
                    const TextSpan(
                        text: '• Легкость Публикации Объявлений: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                        text:
                            'Продавайте ваши товары, публикуя объявления легко и быстро.\n'),
                    const TextSpan(
                        text: '• Личный Кабинет: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                        text:
                            'Управляйте своими объявлениями и настройками через персональный аккаунт.'),
                    const TextSpan(text: '\n \n В '),
                    _textSpanBold,
                    const TextSpan(
                        text:
                            ' мы стремимся предоставить вам лучший опыт покупок и продаж. Постоянные обновления и улучшения делают наше приложение еще удобнее и функциональнее.'),
                    const TextSpan(text: '\n \n Спасибо, что выбрали '),
                    _textSpanBold,
                    const TextSpan(
                        text: ' Мы рады помочь вам сделать удачные сделки.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
