<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin"/>
<link rel="preload" as="style"
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&amp;family=Roboto:wght@300;400;500;700&amp;display=swap"/>
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&amp;family=Roboto:wght@300;400;500;700&amp;display=swap"
      media="print" onload="this.media='all'"/>

<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&amp;family=Roboto:wght@300;400;500;700&amp;display=swap"/>

<link href="font-awesome/css/all.min.css?ver=1.2.0" rel="stylesheet">
<link href="bootstrap.min.css?ver=1.2.0" rel="stylesheet">
<link href="aos.css" rel="stylesheet">
<link href="main.css" rel="stylesheet">


<body id="top">
<header class="d-print-none">
    <div class="container text-center text-lg-left">

    </div>
</header>
<div class="page-content">
    <div class="container">
        <div class="cover shadow-lg bg-white">
            <div class="cover-bg p-3 p-lg-4 text-white">
                <div class="row">
                    <div class="col-lg-4 col-md-5">
                        <div class="avatar hover-effect bg-white shadow-sm p-1"><img
                                    src="https://img.icons8.com/pastel-glyph/344/person-male.png" width="200"
                                    height="200"/></div>
                    </div>
                    <div class="col-lg-8 col-md-7 text-center text-md-start">
                        <h2 class="h1 mt-2" data-aos="fade-left"
                            data-aos-delay="0">${user.lastname} ${user.firstname}</h2>
                        <p data-aos="fade-left" data-aos-delay="100">${questionnaire.getProfession()}</p>
                    </div>
                </div>
            </div>
            <div class="about-section pt-4 px-3 px-lg-4 mt-1">
                <div class="row">
                    <div class="col-md-6">
                        <h2 class="h3 mb-3">О походном опыте</h2>
                        <p> ${questionnaire.getCamping_experience()}</p>
                    </div>
                    <div class="col-md-5 offset-md-1">
                        <div class="row mt-2">
                            <div class="col-sm-4">
                                <div class="pb-1">Дата рождения</div>
                            </div>
                            <div class="col-sm-8">
                                <div class="pb-1 text-secondary">${questionnaire.getTime()}</div>
                            </div>
                            <div class="col-sm-4">
                                <div class="pb-1">Email</div>
                            </div>
                            <div class="col-sm-8">
                                <div class="pb-1 text-secondary">${questionnaire.getE_mail()}</div>
                            </div>
                            <div class="col-sm-4">
                                <div class="pb-1">Телефон</div>
                            </div>
                            <div class="col-sm-8">
                                <div class="pb-1 text-secondary">${questionnaire.getPhone_number()}</div>
                            </div>
                            <div class="col-sm-4">
                                <div class="pb-1">Город проживания</div>
                            </div>
                            <div class="col-sm-8">
                                <div class="pb-1 text-secondary">${questionnaire.getCity()}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="d-print-none"/>

            <hr class="d-print-none"/>
            <div class="work-experience-section px-3 px-lg-4">
                <h2 class="h3 mb-4">Анкета волонтёра </h2>
                <div class="timeline">
                    <div class="timeline-card timeline-card-primary card shadow-sm">
                        <div class="card-body">
                            <div class="h5 mb-1">Какую самую дальнюю точку РФ ты посетил? <span
                                        class="text-muted h6"></span></div>

                            <div>${questionnaire.getFathest_point_in_russia()}</div>
                        </div>
                    </div>
                    <div class="timeline-card timeline-card-primary card shadow-sm">
                        <div class="card-body">
                            <div class="h5 mb-1">По каким критериям ты выбираешь волонтёрские проекты? <span
                                        class="text-muted h6"></span></div>

                            <div>${questionnaire.getCriteria_of_volunteer_projects()}</div>
                        </div>
                    </div>
                    <div class="timeline-card timeline-card-primary card shadow-sm">
                        <div class="card-body">
                            <div class="h5 mb-1">Расскажи, пожалуйста, чем ты руководствовался при выборе ВУЗа/ будущей
                                профессии? <span class="text-muted h6"></span></div>

                            <div>${questionnaire.getFathest_point_in_russia()}</div>
                        </div>
                    </div>
                    <div class="timeline-card timeline-card-primary card shadow-sm">
                        <div class="card-body">
                            <div class="h5 mb-1">Отметь галочками то, что точно про тебя <span
                                        class="text-muted h6"></span></div>

                            <div>${questionnaire.getAbout_your_hard_skills_check_boxes_first()}</div>
                        </div>
                    </div>
                  <div class="timeline-card timeline-card-primary card shadow-sm">
                    <div class="card-body">
                      <div class="h5 mb-1">И здесь тоже: что про тебя, отмечай! Если у тебя есть другие навыки, которые могут быть полезны для волонтёрской практики, опиши их в последнем варианте.<span
                                class="text-muted h6"></span></div>

                      <div>${questionnaire.getAbout_your_hard_skills_check_boxes_first()}</div>
                    </div>
                  </div>

                </div>
            </div>
            <hr class="d-print-none"/>
            <div class="page-break"></div>

            <hr class="d-print-none"/>

        </div>
    </div>
</div>

<script src="scripts/bootstrap.bundle.min.js?ver=1.2.0"></script>
<script src="scripts/aos.js?ver=1.2.0"></script>
<script src="scripts/main.js?ver=1.2.0"></script>
</body>
</html>