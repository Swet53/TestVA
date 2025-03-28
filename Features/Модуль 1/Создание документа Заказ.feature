﻿#language: ru

Функционал: Фича Создание документа Заказ

Как Менеджер по закупкам я хочу
Создание документ Заказ
Чтобы заказать товар у поставщика

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Сценарий Создание документа Заказ
// Создание документа Заказ 
* Закрытие всех окон
	И я закрываю все окна клиентского приложения
* Открытие формы создания документов
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"
* Заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
	И я нажимаю кнопку выбора у поля с именем 'Покупатель'
	Тогда открылось окно "Контрагенты"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000012" | "Мосхлеб ОАО"  |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно "Заказ (создание) *"
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Малый"
* Заполнение ТЧ
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000006" | "Ботинки"      |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "5"
	И в таблице 'Товары' я завершаю редактирование строки
*проверка суммы
	Тогда таблица 'Товары' стала равной:
		| 'Товар'   | 'Цена'     | 'Количество' | 'Сумма'     |
		| 'Ботинки' | '2 100,00' | '5'          | '10 500,00' |
И я нажимаю на кнопку "Записать"
* изменение количества и цены
	Когда открылось окно "Заказ * от *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "2 500,00"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "3"
	И в таблице 'Товары' я завершаю редактирование строки
* проверка после изменения
	Тогда таблица 'Товары' стала равной:
		| 'Товар'   | 'Цена'     | 'Количество' | 'Сумма'     |
		| 'Ботинки' | '2 500,00' | '3'          | '7 500,00' |
И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд
* Проверка создания документа
	И таблица  "Список" содержит строки:
	| 'Номер' | 
	| '$Номер$' | 
	