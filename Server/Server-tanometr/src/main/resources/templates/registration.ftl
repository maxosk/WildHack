<!DOCTYPE html>
<html lang="en">
<head>





 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 <!-- Bootstrap CSS -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

 <meta charset="UTF-8">
 <title>Вход</title>
 <link rel="stylesheet" href="/static/login.css">
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>

${message!" "}
<section class="sign-in container column">

 <h4 class="sign-in__title title-1">Регистрация</h4>

 <form action="${"/registration"}" method="post" class="sign-in__form column">
  <input type="text" name="username" class="sign-in__form__input input" placeholder="Логин">
  <input type="password"  name="password" class="sign-in__form__input input" placeholder="Пароль">
  <input type="hidden" name="_csrf" value="${_csrf.token}" />
  <button  type="submit" value="Sign In" class="sign-in__form__button button">Регистрация</button>



 </form>
</section>
</body>
</html>


<#--<@c.page>-->
<#-- Add new user-->
<#-- ${message!" "}-->
<#-- <@l.login "/registration" />-->
<#--</@c.page>-->


