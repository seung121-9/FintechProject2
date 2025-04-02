<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Admin Login</h2>
    <form action="login" method="POST">
        <label for="adminId">Admin ID:</label>
        <input type="text" id="adminId" name="adminId" required /><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required /><br><br>

        <button type="submit">Login</button>
    </form>
</body>
</html>
