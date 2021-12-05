<link rel="stylesheet" href="listUsers.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
<link rel="stylesheet" href="listUsers.css">

<div class="container mt-3 mb-4">
    <div class="col-lg-9 mt-4 mt-lg-0">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm">
                    <table class="table manage-candidates-top mb-0">
                        <thead>
                        <tr>
                            <th>Имя кандидата в  волонтёры </th>
                            <th class="text-center">Статус</th>
                            <th class="action text-right">Действие</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list users as user>
                        <tr class="candidates-list">
                            <td class="title">
                                <div class="thumb">
                                    <img class="img-fluid" src="https://img.icons8.com/pastel-glyph/344/person-male.png" alt="">
<#--                                    <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="">-->
                                </div>
                                <div class="candidate-list-details">
                                    <div class="candidate-list-info">
                                        <div class="candidate-list-title">

                                            <h5 class="mb-0"><a href="/user?id=${user.getIndividual_id()}">${user.lastname} ${user.firstname} </a></h5>

                                        </div>
                                        <div class="candidate-list-option">
                                            <ul class="list-unstyled">
                                                <li><i class="fas fa-filter pr-1"></i>${questionnaires[user?index].getPhone_number()}</li>
                                                <li><i class="fas fa-map-marker-alt pr-1"></i>г. ${questionnaires[user?index].getCity()}</li>
                                            </ul>
                                        </div>

                                    </div>

                                </div>
                            </td>
                            <td class="candidate-list-favourite-time text-center">
<#--
                                <a class="candidate-list-favourite order-2 text-danger" href="#"> <img src="/static/img/galoshka.svg" alt=""></a>
-->
                                <div class="stack">
                                <img src="/static/img/check_mark.svg" class="mycssgaloshka">




                                <span class="candidate-list-time order-1">Активен</span>
                                </div>
                            </td>
                            <td>
                                <ul class="list-unstyled mb-0 d-flex justify-content-end">
                                    <li><a href="/user/trash?id=${user.getIndividual_id()}" >
                                            <img src="https://www.svgrepo.com/show/208296/trash.svg"class="mytrash"  >
                                        </a></li>
                                </ul>
                            </td>
                        </tr>
                        </#list>
                        <a href="main/download_file" class="battoncvc btn btn-primary btn-lg active battoncvc" role="button" aria-pressed="true">Скачать CSV</a>
                        <#--<form action="main/download_file" method="get" target="_blank">
                            <button type="button" class="btn btn-primary btn-lg battoncvc">Скачать CSV</button>
                        </form>-->
                        <#--<form action="page/new.html" target="_blank">
                            <button>Переход по ссылке</button>
                        </form>-->
                       <#-- <form action="/main/download_file" class="plates__column-1__plate-1__export__form row">

                            <button type="button" class="btn btn-primary btn-lg battoncvc">Скачать CSV</button>
                        </form>
-->

<#--                        <button type="button" class="btn btn-primary btn-lg battoncvc">Скачать CSV</button>-->

                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>