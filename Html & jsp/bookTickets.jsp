<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="org.bson.Document" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Tickets</title>
    <script>
        function showRoutes() {
            document.getElementById('routeButtons').style.display = 'block';
        }

        function showSchedules(routeName) {
            fetch('BookTicketsServlet?routeName=' + routeName + '&action=getSchedules')
                .then(response => response.json())
                .then(data => {
                    if (data.schedules.length === 0) {
                        document.getElementById('scheduleSection').innerHTML = 'No schedules available';
                    } else {
                    
                        const scheduleButtons = document.getElementById('scheduleButtons');
                        scheduleButtons.innerHTML = '';

                        data.schedules.forEach(schedule => {
                            const button = document.createElement('button');
                            button.textContent = schedule.scheduleId;
                            button.onclick = () => selectSchedule(schedule.scheduleId, routeName);
                            scheduleButtons.appendChild(button);
                        });

                        document.getElementById('scheduleSection').style.display = 'block';
                    }
                })
                .catch(error => {
                    console.error('Error fetching schedules:', error);
                });
        }

        function selectSchedule(scheduleId, routeName) {
            document.getElementById('routeName').value = routeName;
            document.getElementById('scheduleId').value = scheduleId;

            // Show booking details section
            document.getElementById('bookingDetails').style.display = 'block';
        }
        
    </script>
</head>
<body>
    <h1>Book Tickets</h1>
    <form action="BookTicketsServlet" method="post">
        <label for="date">Select Date:</label>
        <input type="date" id="date" name="date" onchange="showRoutes()" required><br><br>

        <div id="routeButtons" style="display:none;">
            <h2>Select Route:</h2>
            <% 
                try (var mongoClient = MongoClients.create("mongodb://localhost:27017")) {
                    MongoDatabase database = mongoClient.getDatabase("Ticket_Booking");
                    MongoCollection<Document> collection = database.getCollection("routes");
                    List<Document> routes = collection.find().into(new ArrayList<>());
                    for (Document route : routes) {
                        String routeName = route.getString("routeName");
            %>
                        <button type="button" onclick="showSchedules('<%= routeName %>')"><%= routeName %></button>
            <%
                    }
                }
            %>
        </div>

        <div id="scheduleSection" style="display:none;">
            <h2>Select Schedule:</h2>
            <div id="scheduleButtons"></div>
        </div>

        <div id="bookingDetails" style="display:none;">
            <h2>Booking Details</h2>
            <label for="numTickets">Number of Tickets:</label>
            <input type="number" id="numTickets" name="numTickets" max="50" required><br><br>

            <input type="hidden" id="routeName" name="routeName">
            <input type="hidden" id="scheduleId" name="scheduleId">
            <input type="hidden" id="action" name="action" value="book">
            <button type="submit">Buy</button>
        </div>
    </form>
</body>
</html>

