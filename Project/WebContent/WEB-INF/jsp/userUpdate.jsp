<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ユーザ情報更新</title>
    <!-- Bootstrap -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  </head>
  <body>
    <!-- body code goes here -->
  <header class="bg-secondary text-white text-right">
    <ul class="list-inline font-weight-bold">
      <li class="list-inline-item"><p>${userInfo.name} さん</p></li>
      <li class="list-inline-item"><a href="LogoutServlet"><u class="text-danger">ログアウト</u></a></li>
    </ul>
  </header>
  <main>
  <h1 class="text-center" style="margin: 20px;"><strong>ユーザ情報更新</strong></h1>
  <form action="UserUpdateServlet" method="post">
  <input type="hidden" name="id"value="${user.id}">
  <div style="margin-top: 50px;">
  <table width="100%" height="100" border="0" cellpadding="10" cellspacing="10">
    <tr>
      <td width="250" class="text-center">ログインID</td>
      <td width="250">${user.loginId}</td>
    </tr>
    <tr>
      <td class="text-center">パスワード</td>
      <td><input type="password" name="password"></td>
    </tr>
    <tr>
      <td class="text-center">パスワード（確認）</td>
      <td><input type="password"></td>
    </tr>
    <tr>
      <td class="text-center">ユーザ名</td>
      <td><input type="text" value="${user.name}" name="name"></td>
    </tr>
    <tr>
      <td class="text-center">生年月日</td>
      <td><input type="date" value="${user.birthDate}" name="birthDate"></td>
    </tr>
  </table>
  </div>

  <div style="text-align: center; margin-top: 50px;">
    <input type="submit" value="更新" style="width: 100px; padding: 2px,5px,2px,5px">
  </div>
  </form>
  <p style="margin: 50px 20px;"><a href="UserListServlet"><u>戻る</u></a></p>
  </main>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>
