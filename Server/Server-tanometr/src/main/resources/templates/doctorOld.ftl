<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="style-doctor.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

</head>
<body>
<script src="/static/tabsanim.js"></script>
<header class="header">
    <div class="container row">
        <div class="header__user row">
            <img src="/static/img/user-img.png" alt="" class="header__user__icon">
            <p class="header__user__name">Имя Фамилия Отчество</p>
        </div>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="log-out" type="submit">Выход</button>
            <#-- <a href="sign-in.html" type="submit" class="header__link">Выход</a>-->
        </form>

    </div>
</header>
<section class="plates">


    <div class="container row">
        <ul class="plates__side-bar plate nav nav-tabs">
            <li class="plates__side-bar__search-bar row">
                <input type="text" placeholder="Поиск пациента" class="plates__side-bar__search-bar__input input">
            </li>

            <#list patients as patient>
                <li class="plates__side-bar__item row nav-item">
                    <a href="#${patient.id}" data-toggle="tab"
                       class="plates__side-bar__item__link nav-link">${patient.lastname} ${patient.firstname} ${patient.middlename}</a>
                    <img src="/static/img/Right%20Chevron.svg" alt="" class="plates__side-bar__item__icon">
                </li>
            </#list>


        </ul>

        <div class="tab-content">
            <div class="plates__column-1 column show active tab-pane "id="${selectuser.id}">
                <h1 class="plates__column-1__title title-1">Фамилия Имя Отчество</h1>
                <div class="plates__column-1__plate-1 plate column">
                    <table class="plates__column-1__plate-1__sheet">
                        <tr class="plates__column-1__plate-1__sheet__header">
                            <td class="plates__column-1__plate-1__sheet__header__item plates__column-1__plate-1__sheet__header__item-1">
                                Дата и время
                            </td>
                            <td class="plates__column-1__plate-1__sheet__header__item">Давление</td>
                            <td class="plates__column-1__plate-1__sheet__header__item">Пульс</td>
                            <td class="plates__column-1__plate-1__sheet__header__item">Недост.(вы)</td>
                            <td class="plates__column-1__plate-1__sheet__header__item">Недост.(пациент)</td>
                            <td class="plates__column-1__plate-1__sheet__header__item plates__column-1__plate-1__sheet__header__item-6">
                                Коммент.
                            </td>
                        </tr>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item">11 сент. 2021, 12.00</td>
                            <td class="plates__column-1__plate-1__sheet__row__item">111</td>
                            <td class="plates__column-1__plate-1__sheet__row__item">111</td>
                            <td class="plates__column-1__plate-1__sheet__row__item">
                                <input type="checkbox" class="plates__column-1__plate-1__sheet__row__item__checkbox">
                            </td>
                            <td class="plates__column-1__plate-1__sheet__row__item">
                                <input type="checkbox" class="plates__column-1__plate-1__sheet__row__item__checkbox">
                            </td>
                            <td class="plates__column-1__plate-1__sheet__row__item">...</td>
                        </tr>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="jhgfd">-</td>

                        </tr>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="jhgfd">-</td>

                        </tr>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="jhgfd">-</td>

                        </tr>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="jhgfd">-</td>

                        </tr>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="jhgfd">-</td>

                        </tr>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="jhgfd">-</td>

                        </tr>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="jhgfd">-</td>

                        </tr>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="plates__column-1__plate-1__sheet__row__item"></td>
                            <td class="jhgfd">-</td>

                        </tr>

                    </table>
                    <div class="plates__column-1__plate-1__export column">
                        <h2 class="plates__column-1__plate-1__export__title title-2">Экспортировать таблицу в CSV</h2>
                        <form action="#" class="plates__column-1__plate-1__export__form row">
                            <input type="date" class="plates__column-1__plate-1__export__form__input input">
                            <p>-</p>
                            <input type="date" class="plates__column-1__plate-1__export__form__input input">
                            <button class="plates__column-1__plate-1__export__form__button secondary-button">Скачать
                            </button>
                        </form>
                    </div>
                </div>

            </div>

            <div class="plates__column-2 column">
                <div class="plates__column-2 column">
                    <div class="plates__column-2__plate-2 plate column">
                        <h2 class="plates__column-2__plate-2__title title-2">Динамика показаний</h2>
                        <form action="#" class="plates__column-2__plate-2__form row">
                            <input type="date" class="plates__column-2__plate-2__form__input input">
                            <p>-</p>
                            <input type="date" class="plates__column-2__plate-2__form__input input">
                            <button class="plates__column-2__plate-2__form__button secondary-button">Показать</button>
                        </form>
                        <img src="/static/img/Line%20chart.png" alt="" class="plates__column-2__plate-2__chart">
                    </div>
                    <div class="plates__column-2__message">
                        <h2 class="plates__column-2__message__title title-2">Отправить сообщение пациенту</h2>
                        <form action="" class="plates__column-2__message__form">
                        <textarea name="message" id="message" cols="30" rows="5"
                                  class="plates__column-2__message__input input">Сообщение...</textarea>
                            <button class="plates__column-2__message__button button">Отправить</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>