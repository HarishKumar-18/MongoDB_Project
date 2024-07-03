<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
</head>
<body>
    <h1>Booking Confirmation</h1>

    <p>Thank you for your booking!</p>

    <h2>Booking Details:</h2>
    <table border="1">
        <tr>
            <th>Route Name</th>
            <td><%= request.getAttribute("routeName") %></td>
        </tr>
        <tr>
            <th>Schedule ID</th>
            <td><%= request.getAttribute("scheduleId") %></td>
        </tr>
        <tr>
            <th>Date</th>
            <td><%= request.getAttribute("date") %></td>
        </tr>
        <tr>
            <th>Number of Tickets</th>
            <td><%= request.getAttribute("numTickets") %></td>
        </tr>
        <tr>
            <th>Total Price</th>
            <td><%= request.getAttribute("totalPrice") %></td>
        </tr>
    </table>

    <br>
    <form action="/MongoDB/ViewBookingsServlet" method="get">
        
        <button type="submit">View My Bookings</button>
    </form>
    <br>
    <form action="home.jsp" method="get">
        
        <button type="submit">Back to Home</button>
    </form>
</body>
</html>
