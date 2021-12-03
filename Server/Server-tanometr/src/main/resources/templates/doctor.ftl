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
<header class="header">
    <div class="container row">
        <div class="header__user row">
            <img src="/static/img/user-img.png" alt="" class="header__user__icon">
            <p class="header__user__name">${authorizedUser.lastname} ${authorizedUser.firstname} ${authorizedUser.middlename}</p>
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
        <ul class="plates__side-bar plate">
            <li class="plates__side-bar__search-bar row">
                <input type="text" placeholder="Поиск пациента" class="plates__side-bar__search-bar__input input">
            </li>

            <#list patients as patient>
            <#--
                            <#list relevanceOfMeasurements as relevanceOfMeasurement>
            -->
                <#if selected?has_content>
                    <#if selected.id=patient.id >
                        <li class="color_selected plates__side-bar__item row">
                        <style>color_selected {
                                background: #848CA0;
                            }</style>
                    <#else >
                        <li class="plates__side-bar__item row">
                    </#if>
                <#else >
                    <li class="plates__side-bar__item row">
                </#if>
                <a href="/doctor?id=${patient.getId()}"
                   class="plates__side-bar__item__link">${patient.lastname} ${patient.firstname} ${patient.middlename}</a>
            <#if healthyOfMeasurements[patient?index]?has_content>
                <#if healthyOfMeasurements[patient?index] =  "true">
            <div class="warning_div">
                    <img src="/static/img/YellowWarning.svg" alt=""
                         class="plates__side-bar__item__icon">
            </div>
                </#if>
            </#if>
                <#if relevanceOfMeasurements[patient?index]?has_content>
                <#--  <div class="warning_div">

                      <img src="/static/img/RedWarning.svg" alt="" class="plates__side-bar__item__icon">
                      <img src="/static/img/Right%20Chevron.svg" alt="" class="plates__side-bar__item__icon">
                  </div>-->
                    <#if relevanceOfMeasurements[patient?index] =  "true">
                        <div class="warning_div">

                            <img src="/static/img/RedWarning.svg" alt="" class="plates__side-bar__item__icon">
                            <img src="/static/img/Right%20Chevron.svg" alt="" class="plates__side-bar__item__icon">
                        </div>
                    <#else >
                        <div class="warning_div">

                            <#--
                                                <img src="/static/img/RedWarning.svg" alt="" class="plates__side-bar__item__icon">
                            -->
                            <img src="/static/img/Right%20Chevron.svg" alt="" class="plates__side-bar__item__icon">
                        </div>
                    </#if>

                </#if>
                </li>
            <#--
                            </#list>
            -->
            </#list>


        </ul>
        <#if selected?has_content>
            <div class="plates__column-1 column">
                <h1 class="plates__column-1__title title-1">${selected.lastname} ${selected.firstname} ${selected.middlename}</h1>
                <div class="plates__column-1__plate-1 plate column">
                    <#if measurements?has_content>
                    <table class="plates__column-1__plate-1__sheet ">
                        <colgroup>
                            <col style="width:24%">
                            <col style="width:18%">
                            <col style="width:14%">
                            <col style="width:13%">
                            <col style="width:16%">
                            <col style="width:16%">
                        </colgroup>

                        <tr class=" plates__column-1__plate-1__sheet__header plates__column-1__plate-1__sheet__row ">

                            <td class="header_table_font plates__column-1__plate-1__sheet__header__item plates__column-1__plate-1__sheet__header__item-1">
                                Дата и время
                            </td>
                            <td class="header_table_font plates__column-1__plate-1__sheet__header__item">
                                Давление
                            </td>
                            <td class="header_table_font plates__column-1__plate-1__sheet__header__item">Пульс
                            </td>
                            <td class="header_table_font plates__column-1__plate-1__sheet__header__item">
                                Недост.(вы)
                            </td>
                            <td class="header_table_font plates__column-1__plate-1__sheet__header__item">
                                Недост.(пациент)
                            </td>
                            <td class="header_table_font plates__column-1__plate-1__sheet__header__item plates__column-1__plate-1__sheet__header__item-6">
                                Коммент.
                            </td>
                        </tr>
                    </table>
                    <div class="meausurement_table">
                        <table>


                            <colgroup>
                                <col style="width:24%">
                                <col style="width:18%">
                                <col style="width:14%">
                                <col style="width:13%">
                                <col style="width:16%">
                                <col style="width:16%">
                            </colgroup>
                            <#list measurements as measurement>

                                <tr class="plates__column-1__plate-1__sheet__row ">
                                    <td class="plates__column-1__plate-1__sheet__row__item td_line">${measurement.time}</td>
                                    <td class="plates__column-1__plate-1__sheet__row__item td_line">   ${measurement.blood_pressure_upper}
                                        /${measurement.blood_pressure_lower}</td>
                                    <td class="plates__column-1__plate-1__sheet__row__item td_line">  ${measurement.pulseRate}</td>
                                    <td class="plates__column-1__plate-1__sheet__row__item td_line">
                                        <#if !measurement.getIsCorrectByDoctor()>
                                            <form action="/doctor/editCustomer"<#-- method="post"-->>
                                                <input type="hidden" name="checkboxName" value="checked">
                                                <input type="hidden" name="id" value="${selected.getId()}">
                                                <input type="hidden" name="measurement_id"
                                                       value="${measurement.getId()}">
                                                <input type="checkbox" checked name="checkboxName"
                                                       onchange="this.form.submit()"
                                                       class="plates__column-1__plate-1__sheet__row__item__checkbox">
                                            </form>
                                        <#else  >
                                            <form action="/doctor/editCustomer"<#-- method="post"-->>
                                                <input type="hidden" name="checkboxName" value="checked">
                                                <input type="hidden" name="id" value="${selected.getId()}">
                                                <input type="hidden" name="measurement_id"
                                                       value="${measurement.getId()}">
                                                <input type="checkbox" name="checkboxName"
                                                       onchange="this.form.submit()"
                                                       class="plates__column-1__plate-1__sheet__row__item__checkbox">
                                            </form>

                                        </#if>
                                        <#--
                                                                                <input type="checkbox"  onclick="  ${measurement.setCorrectByDoctor()}=${!measurement.isCorrectByDoctor()}"
                                                                                       class="plates__column-1__plate-1__sheet__row__item__checkbox">
                                        -->
                                    </td>
                                    <td class="plates__column-1__plate-1__sheet__row__item td_line">
                                        <#if !measurement.getIsCorrectByPatient()>
                                            <input type="checkbox" checked onclick="return false"
                                                   class="plates__column-1__plate-1__sheet__row__item__checkbox">
                                        <#else  >
                                            <input type="checkbox" onclick="return false"
                                                   class="plates__column-1__plate-1__sheet__row__item__checkbox">
                                        </#if>
                                    </td>
                                    <#if measurement.comment?has_content>
                                        <td class="plates__column-1__plate-1__sheet__row__item td_line"> ${measurement.comment}</td>
                                    <#else  >
                                        <td class="plates__column-1__plate-1__sheet__row__item td_line"></td>
                                    </#if>

                                </tr>


                            </#list>


                            <tr class="additional_line">
                                <td class="plates__column-1__plate-1__sheet__row__item additional_line">1</td>
                                <td class="plates__column-1__plate-1__sheet__row__item additional_line">1
                                </td>
                                <td class="plates__column-1__plate-1__sheet__row__item additional_line">1</td>
                                <td class="plates__column-1__plate-1__sheet__row__item additional_line">1</td>
                                <td class="plates__column-1__plate-1__sheet__row__item additional_line">1</td>

                                <td class="additional_line">...</td>

                            </tr>
                            <#--<tr class="plates__column-1__plate-1__sheet__row">
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
                            </tr>-->
                            <#else >
                            <#--<style>
                                .plates__column-1__plate-1 {
                                    height: 300px;
                                }
                            </style>-->
                            <div class="no_izmerenie_div">
                                <h1 class=" no_izmerenie plates__column-1__title title-1
                                    ">Нет измерений</h1>
                            </div>
                            <div>
                                </#if>


                        </table>
                    </div>
                    <div class="plates__column-1__plate-1__export column">
                        <h2 class="plates__column-1__plate-1__export__title title-2">Экспортировать таблицу в CSV</h2>
                        <form action="/doctor/download_file" class="plates__column-1__plate-1__export__form row">
                            <input type="hidden" name="id" value="${selected.getId()}">
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
                        <#--<img src="/static/img/Line%20chart.png" alt="" class="plates__column-2__plate-2__chart">-->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
                        <#--
                                                <#if selected.id=26 >
                        -->

                        <#--
                                                <#list measurements as measurement>
                        -->
                        <script> $(function () {
                                // for (let i = 0; i < 3; i += 1) {
                                //     series = [{'lineWidth': 1, 'data': [0, 90]}];
                                //  }
                                $('#container').highcharts({


                                    title: {

                                        text: 'Показания артериального давления',
                                        x: -20 //center
                                    }, yAxis: {
                                        title: {
                                            text: 'АД мм.рт.ст'
                                        }
                                    },
                                    chart: {
                                        type: 'scatter'
                                    },
                                    /*yAxis: {
                                        title: {
                                            text: 'Давление'
                                        },*/
                                    series:
                                        [{
                                            lineWidth: 1,
                                            data: (function () {
                                                var data1 = []
                                                var data2 = []
                                                <#list measurements as measurement>

                                                data1.push(${measurement.getBlood_pressure_lower()})
                                                data2.push(${measurement.getBlood_pressure_upper()})
                                                </#list>
                                                // generate an array of random data
                                                var data = []

                                                let i
                                                for (i = 0; i <= data1.length; i++) {
                                                    data.push({
                                                        x: i,
                                                        // y: Math.random()
                                                        y: data1[i]//measurements.get(i).blood_pressure_upper
                                                    });
                                                    data.push({
                                                        x: i,
                                                        // y: Math.random()
                                                        // y: .get(i)
                                                        y: data2[i]//<#--${measurement.getBlood_pressure_lower()}-->
                                                    });
                                                    data.push({
                                                        x: i,
                                                        // y: Math.random()
                                                        y: null
                                                    });
                                                }
                                                return data;
                                            }())




                                            /*[
                                            /!*[0, 43],
                                            [0, 140],
                                            [0, null],*!/
                                            [0, 43],
                                            [0, 140],
                                            [0, null],
                                            [1, 150],
                                            [1, 60],
                                            [1, null],
                                            [2, 80],
                                            [2, 170],
                                            [2, null],
                                            [3, 70],
                                            [3, 165],
                                        //   [3, null],
                                        ]*/
                                        }]

                                });//series.push({lineWidth: 1, data: [3, 177]})
                                // series.push({'lineWidth': 1, 'data': [3, null]})
                            }); </script>
                        <#--
                                                </#list>
                        -->
                        <#--</#if>-->
                        <script src="https://code.highcharts.com/highcharts.js"></script>
                        <script src="https://code.highcharts.com/modules/exporting.js"></script>


                        <div class="container_line">
                            <div id="container"
                                 style="min-width: 400px; height: 300px; max-width: 450px; margin: 0 auto"></div>
                        </div>
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

        <#else >
            <h1 class="choosetitle plates__column-1__title title-1">Выберите пациента</h1>

        </#if>
    </div>


</section>
</body>
</html>