

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>admin</title>


    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link rel="stylesheet" href="/static/admin-style.css">

    </head>
</head>
<body>

    <header class="header">
        <div class="containers rows">
            <div class="header__user rows">
                <img src="user-img.png" alt="" class="header__user__icon">
                <p class="header__user__name">${authorizedUser.lastname} ${authorizedUser.firstname} ${authorizedUser.middlename}</p>
            </div>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="log-out" type="submit">Выход</button>
                <#-- <a href="sign-in.html" type="submit" class="header__link">Выход</a>-->
            </form>
        </div>
    </header>

    <section class="plates rows">
        <div class="containers rows">
        <div class="plates__column-1 column">
            <div class="plates__column-1__plate-1 plate column">
                <div class="plates__column-1__plate-1__header rows">
                    <h2 class="plates__column-1__plate-1__header__title title-2">Врачи</h2>
                    <#--<a href="" class="plates__column-1__plate-1__header__button button" >Добавить</a>-->
                    <a class="btn btn-primary hide-me" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                        Добавить
                    </a>
                    <div class="collapse" id="collapseExample">
                        <div class="form-group mt-3">
                            <form method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="username" placeholder="Логин" />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="password" placeholder="Пароль">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="firstname" placeholder="Имя">
                                </div><div class="form-group">
                                    <input type="text" class="form-control" name="lastname" placeholder="Фамилия">
                                </div><div class="form-group">
                                    <input type="text" class="form-control" name="middlename" placeholder="Отчество">
                                </div>
                                <input type="hidden" name="roles" value="${"USER"}" />

                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Сделать запись</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
                <table class="plates__column-1__plate-1__sheet">

                    <tr class="plates__column-1__plate-1__sheet__header">
                        <td class="plates__column-1__plate-1__sheet__header__item">ФИО</td>
                        <td class="plates__column-1__plate-1__sheet__header__item">Изменить</td>
                        <td class="plates__column-1__plate-1__sheet__header__item">Удалить</td>
                    </tr>
                    <#list workers as worker>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item">${worker.lastname} ${worker.firstname} </td>
                            <td class="plates__column-1__plate-1__sheet__row__item">
                                <a class="btn  " data-toggle="collapse" href="#collapseEditWorker${worker.id}" role="button" aria-expanded="false" aria-controls="collapseExample">
                                    <img src="/static/img/Edit.svg">
                                </a>

                                <div class="collapse" id="collapseEditWorker${worker.id}">
                                    <div class="form-group mt-3">
                                        <form method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <input type="hidden" class="form-control" name="id" placeholder="Логин" value=${worker.id} <#--value="${patient.getUsername()}-->" />
                                            </div>
                                            <div class="form-group">
                                                <input type="text" value="${worker.getUsername()}" class="form-control" name="username" placeholder="Логин"  />
                                            </div>
                                            <#--<div class="form-group">
                                                <input type="password" class="form-control" name="password" placeholder="Пароль" value="${patient.password} >
                                            </div>-->
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="firstname" placeholder="Имя" value="${worker.getFirstname()}">
                                            </div><div class="form-group">
                                                <input type="text" class="form-control" name="lastname" placeholder="Фамилия" value="${worker.getLastname()}">
                                            </div><div class="form-group">
                                                <input type="text" class="form-control" name="middlename" placeholder="Отчество" value="${worker.getMiddlename()}">
                                            </div>
                                            <input type="hidden" name="roles" value="${"USER"}" />

                                            <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary">Сделать запись</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </td>
                            <td class="plates__column-1__plate-1__sheet__row__item">
                                <a href="/user/${worker.id}/remove" class="plates__column-1__plate-1__sheet__row__item__link">
                                    <img src="/static/img/Trash.svg" alt="Удалить" class="plates__column-1__plate-1__sheet__row__item__link__img">
                                </a>
                            </td>
                        </tr>
                    </#list>


                </table>
            </div>
        </div>

        <div class="plates__column-1 column">
            <div class="plates__column-1__plate-1 plate column">
                <div class="plates__column-1__plate-1__header rows">
                    <h2 class="plates__column-1__plate-1__header__title title-2">Пациенты</h2>
                    <a class="btn btn-primary hide-me" data-toggle="collapse" href="#collapseExamplee" role="button" aria-expanded="false" aria-controls="collapseExample">
                        Добавить
                    </a>
                    <div class="collapse" id="collapseExamplee">
                        <div class="form-group mt-3">
                            <form method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="username" placeholder="Логин" />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="password" placeholder="Пароль">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="firstname" placeholder="Имя">
                                </div><div class="form-group">
                                    <input type="text" class="form-control" name="lastname" placeholder="Фамилия">
                                </div><div class="form-group">
                                    <input type="text" class="form-control" name="middlename" placeholder="Отчество">
                                </div>
                                <input type="hidden" name="roles" value="${"PATIENT"}" />

                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Сделать запись</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <table class="plates__column-1__plate-1__sheet">
                    <tr class="plates__column-1__plate-1__sheet__header">
                        <td class="plates__column-1__plate-1__sheet__header__item">ФИО</td>
                        <td class="plates__column-1__plate-1__sheet__header__item">Изменить</td>
                        <td class="plates__column-1__plate-1__sheet__header__item">Удалить</td>
                    </tr>
                    <#list patients as patient>
                        <tr class="plates__column-1__plate-1__sheet__row">
                            <td class="plates__column-1__plate-1__sheet__row__item">${patient.lastname} ${patient.firstname}</td>
                            <td class="plates__column-1__plate-1__sheet__row__item">
                                <a class="btn  " data-toggle="collapse" href="#collapseEditPatient${patient.id}" role="button" aria-expanded="false" aria-controls="collapseExample">
                                    <img src="/static/img/Edit.svg">
                                </a>
                                <div class="collapse" id="collapseEditPatient${patient.id}">
                                    <div class="form-group mt-3">
                                        <form method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <input type="hidden" class="form-control" name="id" placeholder="Логин" value=${patient.id} <#--value="${patient.getUsername()}-->" />
                                            </div>
                                            <div class="form-group">
                                                <input type="text" value="${patient.getUsername()}" class="form-control" name="username" placeholder="Логин"  />
                                            </div>
                                            <#--<div class="form-group">
                                                <input type="password" class="form-control" name="password" placeholder="Пароль" value="${patient.password} >
                                            </div>-->
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="firstname" placeholder="Имя" value="${patient.getFirstname()}">
                                            </div><div class="form-group">
                                                <input type="text" class="form-control" name="lastname" placeholder="Фамилия" value="${patient.getLastname()}">
                                            </div><div class="form-group">
                                                <input type="text" class="form-control" name="middlename" placeholder="Отчество" value="${patient.getMiddlename()}">
                                            </div>
                                            <input type="hidden" name="roles" value="${"PATIENT"}" />

                                            <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary">Сделать запись</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </td>

                            <#--
                                                        <td class="plates__column-1__plate-1__sheet__row__item">
                                                            <a href="/user/${patient.id}" class="plates__column-1__plate-1__sheet__row__item__link">
                                                                <img src="/static/img/Edit.svg" alt="Редактировать" class="plates__column-1__plate-1__sheet__row__item__link__img">
                                                            </a>
                                                        </td>
                            -->
                            <td class="plates__column-1__plate-1__sheet__row__item">
                                <a href="/user/${patient.id}/remove" class="plates__column-1__plate-1__sheet__row__item__link">
                                    <img src="/static/img/Trash.svg" alt="Удалить" class="plates__column-1__plate-1__sheet__row__item__link__img">
                                </a>
                            </td>
                        </tr>
                    </#list>

                </table>
            </div>
        </div>
        </div>
    </section>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

</body>

</html>