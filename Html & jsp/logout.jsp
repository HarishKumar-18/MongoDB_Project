<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        .message {
            font-size: 20px;
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="message">
        You have been logged out successfully. Click the button below to go to the login page.
    </div>
    <form action="logout" method="post">
        <input type="submit" value="Go to Login Page" class="button">
    </form>
    <%
        response.setHeader("Refresh", "1; URL=login.html");
    %>
    <div class="message">
        You will be redirected to the login page in a few seconds.
    </div>
</body>
</html>
