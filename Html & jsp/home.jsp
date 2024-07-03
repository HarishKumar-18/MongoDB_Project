<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 20px;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .button {
            display: inline-block;
            padding: 15px 25px;
            font-size: 18px;
            color: #fff;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #007BFF;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= session.getAttribute("email") %>!</h1>
        <div class="button-container">
            <a href="bookTickets.jsp" class="button">Book Tickets</a>
            <%--<a href="viewBookings.jsp" class="button">View Booking History</a>--%>
            <a href="/MongoDB/ViewBookingsServlet" class="button">View Booking History</a>
            <a href="cancelTickets.jsp" class="button">Cancel Tickets</a>
            <a href="logout.jsp" class="button">Sign Out</a>
        </div>
    </div>
</body>
</html>
