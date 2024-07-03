<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancel Success</title>
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
        You have cancelled the ticket successfully. Click the button below to go to the home page.
    </div>
    <form action="cancelSuccess" method="post">
        <input type="submit" value="Go to Home Page" class="button">
    </form>
    <%
        response.setHeader("Refresh", "2; URL=home.jsp");
    %>
    <div class="message">
        You will be redirected to the home page in a few seconds.
    </div>
</body>
</html>
