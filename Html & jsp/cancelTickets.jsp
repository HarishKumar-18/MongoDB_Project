<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancel Tickets</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Cancel Tickets</h1>
    <form action="cancelTickets" method="post">
        <label for="bookingId">Booking ID:</label>
        <input type="text" id="bookingId" name="bookingId" required>
        <br><br>
        <input type="submit" value="Cancel Ticket">
    </form>
    <%
        String error = request.getParameter("error");
        if (error != null) {
            out.println("<p style='color: red;'>" + error + "</p>");
        }
    %>
</body>
</html>
