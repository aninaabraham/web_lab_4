<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:html="http://www.w3.org/1999/xhtml">
    <xsl:template match="/">
        <html>
            <head>
                <title> Hotel Booking Information</title>  
             <h1 align="center">Hotel Booking Information</h1>
            <style>
                table{
                    width:100%;
                    border-collapse:collapse;
                }
                th, td {
                    border: 1px solid black;
                    padding: 6px;
                    text-align: left;
                }
                .map {
                    width: 100%;
                    height: 500px; /* Increased height for better visibility */
                    margin-top: 20px; /* Add margin for better spacing */
                  }
            </style>
             <!-- Load Leaflet CSS -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
        <!-- Load Leaflet JavaScript -->
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    </head>
            <body  onload="initMap()">
             
                <h2>Rooms</h2>
                <table border="1">
                    <tr>
                        <th>Room Type</th>
                        <th>Rate</th>
                        <th>Availability</th>
                        <th>Beds</th>
                    </tr>
                    <xsl:for-each select="hotel/room">
                        <tr>
                            <td><xsl:value-of select="type"/></td>
                            <td><xsl:value-of select="rate"/></td>
                            <td><xsl:value-of select="availability"/></td>
                            <td><xsl:value-of select="beds"/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <!-- Table for Guests -->
                <h2>Guests</h2>
                <table border="1">
                    <tr>
                        <th>Guest Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Place</th>
                        <!-- <th>Check-out</th> -->
                        <th>Room ID</th>
                        <th>ID Card</th>
                    </tr>
                    <xsl:for-each select="hotel/guest">
                        <tr>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="email"/></td>
                            <td><xsl:value-of select="phone"/></td>
                            <td><xsl:value-of select="location"/></td>
                            <!-- <td><xsl:value-of select="checkout"/></td> -->
                            <td><xsl:value-of select="room_id"/></td>
                            <td><xsl:value-of select="id_card"/></td>
                        </tr>
                    </xsl:for-each>

                    
                </table>
                  <!-- Table for booking -->
                  <h2>Booking</h2>
                <table border="1">
                    <tr>
                        <th>Guest ID</th>
                        <th>Room ID</th>
                        <th>Check-in</th>
                        <th>Check-out</th>
                        <th>Status</th>
                    </tr>
                    <!-- Ensure this XPath expression matches your XML structure -->
                    <xsl:for-each select="hotel/booking">
                        <tr>
                            <td><xsl:value-of select="guest_id"/></td>
                            <td><xsl:value-of select="room_id"/></td>
                            <td><xsl:value-of select="checkin"/></td>
                            <td><xsl:value-of select="checkout"/></td>
                            <td><xsl:value-of select="status"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                 <!-- Table for staff -->
                 <h2>Staff</h2>
                 <table border="1">
                     <tr>
                         <th>Staff ID</th>
                         <th>Room ID</th>
                         <th>Name</th>
                         <th>Position</th>
                         
                     </tr>
                     <!-- Ensure this XPath expression matches your XML structure -->
                     <xsl:for-each select="hotel/staff">
                         <tr>
                             <td><xsl:value-of select="staff_id"/></td>
                             <td><xsl:value-of select="room_id"/></td>
                             <td><xsl:value-of select="name"/></td>
                             <td><xsl:value-of select="position"/></td>
                           
                         </tr>
                     </xsl:for-each>
                 </table>
                 <h2>Service</h2>
                 <table border="1">
                     <tr>
                         <th>Staff ID</th>
                         <th>Service name</th>
                         <th>Descrpition</th>
                         <th>Price</th>
                         
                     </tr>
                     <!-- Ensure this XPath expression matches your XML structure -->
                     <xsl:for-each select="hotel/service">
                         <tr>
                             <td><xsl:value-of select="staff_id"/></td>
                             <td><xsl:value-of select="service_name"/></td>
                             <td><xsl:value-of select="description"/></td>
                             <td><xsl:value-of select="price"/></td>
                           
                         </tr>
                     </xsl:for-each>
                 </table>
                 <h2>Payment</h2>
                 <table border="1">
                     <tr>
                         <th>Booking ID</th>
                         <th>Amount</th>
                         <th>Paymentdate</th>
                         <th>Paymentmethod</th>
                         
                     </tr>
                     <!-- Ensure this XPath expression matches your XML structure -->
                     <xsl:for-each select="hotel/payment">
                         <tr>
                             <td><xsl:value-of select="booking_id"/></td>
                             <td><xsl:value-of select="amount"/></td>
                             <td><xsl:value-of select="paymentdate"/></td>
                             <td><xsl:value-of select="paymentmethod"/></td>
                           
                         </tr>
                     </xsl:for-each>
                 </table>
                 <h2>Facility</h2>
                 <table border="1">
                     <tr>
                         <th>Name</th>
                         <th>Description</th>
                         <th>Availability</th>
                      
                         
                     </tr>
                     <!-- Ensure this XPath expression matches your XML structure -->
                     <xsl:for-each select="hotel/facility">
                         <tr>
                             <td><xsl:value-of select="name"/></td>
                             <td><xsl:value-of select="description"/></td>
                             <td><xsl:value-of select="availabilty"/></td>
                           
                           
                         </tr>
                     </xsl:for-each>
                 </table>
                 <h2>Feedback</h2>
                 <table border="1">
                     <tr>
                         <th>Guest ID</th>
                         <th>Rating</th>
                         <th>Comments</th>
                         <th>Feedback date</th>
                      
                         
                     </tr>
                     <!-- Ensure this XPath expression matches your XML structure -->
                     <xsl:for-each select="hotel/feedback">
                         <tr>
                             <td><xsl:value-of select="guest_id"/></td>
                             <td><xsl:value-of select="rating"/></td>
                             <td><xsl:value-of select="comments"/></td>
                             <td><xsl:value-of select="fdate"/></td>
                           
                           
                         </tr>
                     </xsl:for-each>
                 </table>

                 <h2>Route Map between Delhi and Agra</h2>
        <div id="map" class="map"></div>

        <script>
          function initMap() {
            // Initialize map centered between Delhi and Agra
            var map = L.map('map').setView([27.84, 77.57], 7); // Centered between Delhi and Agra

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
              maxZoom: 19,
              attribution: '© OpenStreetMap contributors'
            }).addTo(map);

            // Define the coordinates for the route
            var routeCoordinates = [
              [28.7041, 77.1025], // Delhi
              [27.1751, 78.0421]  // Agra
            ];

            // Draw the route on the map with better visibility
            var polyline = L.polyline(routeCoordinates, { color: 'blue', weight: 5 }).addTo(map);
            map.fitBounds(polyline.getBounds()); // Fit map to the route

            // Add markers for each location
            L.marker(routeCoordinates[0]).addTo(map).bindPopup('Delhi').openPopup();
            L.marker(routeCoordinates[1]).addTo(map).bindPopup('Agra').openPopup();
          }
        </script>
            </body>
        </html>

    </xsl:template>
</xsl:stylesheet> 
