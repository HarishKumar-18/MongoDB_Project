<%@ page import="java.util.List" %>
<%@ page import="org.bson.Document" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings</title>
    <link rel="stylesheet" href="styles.css"> 
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Booking Details</h1>
        
        <h2>Active Bookings</h2>
        <table border="1" cellpadding="10" cellspacing="0">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Route Name</th>
                    <th>Schedule ID</th>
                    <th>Number of Tickets</th>
                    <th>Total Price</th>
                    <th>Booking ID</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Document> activeBookingsList = (List<Document>) request.getAttribute("activeBookings");
                    if (activeBookingsList != null && !activeBookingsList.isEmpty()) {
                        for (Document booking : activeBookingsList) {
                            String date = booking.getString("date");
                            String routeName = booking.getString("routeName");
                            String scheduleId = booking.getString("scheduleId");
                            Integer numTickets = booking.getInteger("numTickets");
                            Integer totalPrice = booking.getInteger("totalPrice");
                            String bookingId = booking.getObjectId("_id").toHexString();
                            String status = booking.getString("status");
                %>
                        <tr>
                            <td><%= date %></td>
                            <td><%= routeName %></td>
                            <td><%= scheduleId %></td>
                            <td><%= numTickets %></td>
                            <td><%= totalPrice %></td>
                            <td><%= bookingId %></td>
                            <td><%= status %></td>
                        </tr>
                <% 
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="7">No active bookings found.</td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>

        <h2>Cancelled Bookings</h2>
        <table border="1" cellpadding="10" cellspacing="0">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Route Name</th>
                    <th>Schedule ID</th>
                    <th>Number of Tickets</th>
                    <th>Total Price</th>
                    <th>Booking ID</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Document> cancelledBookingsList = (List<Document>) request.getAttribute("cancelledBookings");
                    if (cancelledBookingsList != null && !cancelledBookingsList.isEmpty()) {
                        for (Document booking : cancelledBookingsList) {
                            String date = booking.getString("date");
                            String routeName = booking.getString("routeName");
                            String scheduleId = booking.getString("scheduleId");
                            Integer numTickets = booking.getInteger("numTickets");
                            Integer totalPrice = booking.getInteger("totalPrice");
                            String bookingId = booking.getObjectId("_id").toHexString();
                            String status = booking.getString("status");
                %>
                        <tr>
                            <td><%= date %></td>
                            <td><%= routeName %></td>
                            <td><%= scheduleId %></td>
                            <td><%= numTickets %></td>
                            <td><%= totalPrice %></td>
                            <td><%= bookingId %></td>
                            <td><%= status %></td>
                        </tr>
                <% 
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="7">No cancelled bookings found.</td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
        <a href="home.jsp">Back to Home</a> 
    </div>
</body>
</html>
