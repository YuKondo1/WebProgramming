<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ユーザ一覧</title>
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
    <h1 style="text-align: center; padding: 20px 0px;">ユーザ一覧</h1>
    <div style="text-align: right; padding: 0px 50px 20px 0px;"><u><a href="UserRegisterServlet">新規登録</a></u></div>
    <div style="text-align: center;">
    <form action="UserListServlet" method="post">
    <table width="100%" cellspacing="5" cellpadding="20" style="text-align: center;">
      <tr>
        <th width="450">ログインID</th>
        <td><input type="text" name="loginId" style="width: 400px;"></td>
      </tr>
      <tr>
        <th>ユーザー名</th>
        <td><input type="text" name="name" style="width: 400px;"></td>
      </tr>
      <tr>
        <th>生年月日</th>
        <td><input type="date" name="birthDateB" style="width: 170px;">　〜　　<input type="date" name="birthDateA" style="width: 170px;"></td>
      </tr>
    </table>
    </div>

    <div style="text-align: right; padding-right: 20px;"><input type="submit" value="検索" style="width: 200px;"></div>
    </form>
    <p style="border-bottom: solid 1px; padding-top: 30px;"></p>




            <div class="table-responsive" style="text-align: center;">
             <table class="table table-striped" border="1px">
               <thead>
                 <tr class="bg-light">
                   <th width="200">ログインID</th>
                   <th width="200">ユーザ名</th>
                   <th width="250">生年月日</th>
                   <th width="250"></th>
                 </tr>
               </thead>
               <tbody>
                 <c:forEach var="user" items="${userList}" >
                   <tr class="bg-white">
                     <td>${user.loginId}</td>
                     <td>${user.name}</td>
                     <td>${user.birthDate}</td>
                     <!-- TODO 未実装；ログインボタンの表示制御を行う -->
                     <td>
                       <a class="btn btn-primary" href="UserDetailServlet?id=${user.id}" style="margin: 0px 10px">詳細</a>
                       <c:if test="${user.loginId == userInfo.loginId}">
                       <a class="btn btn-success" href="UserUpdateServlet?id=${user.id}" style="margin-right: 10px">更新</a>
                       </c:if>
                       <c:if test="${userInfo.loginId == 'admin'}">
                       <a class="btn btn-success" href="UserUpdateServlet?id=${user.id}" style="margin-right: 10px">更新</a>
                       <a class="btn btn-danger" href ="UserDeleteServlet?id=${user.id}">削除</a>
                       </c:if>
                     </td>
                   </tr>
                 </c:forEach>
               </tbody>
             </table>
           </div>
  </main>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>
