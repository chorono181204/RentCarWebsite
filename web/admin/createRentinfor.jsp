<%-- 
    Document   : createRentinfor
    Created on : 17-10-2024, 00:03:32
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create rentinfor</title>
        <link rel="stylesheet" href="admin/admin-create2.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Add a new rental information</h1>
            <form action="create-rentinfor" method="post">
                <div class="form-field">
                    <label for="customer_name">Customer Name:</label>
                    <input type="text" id="customer_name" name="customer_name" required />
                </div>

                <div class="form-field">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" required />
                </div>

                <div class="form-field">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" required />
                </div>

                <div class="form-field">
                    <label for="customer_note">Customer Note:</label>
                    <textarea id="customer_note" name="customer_note" required></textarea>
                </div>

                <div class="form-field">
                    <label for="pick_up_date">Pick-Up Date:</label>
                    <input type="date" id="pick_up_date" name="pick_up_date" required />
                </div>

                <div class="form-field">
                    <label for="pick_off_date">Pick-Off Date:</label>
                    <input type="date" id="pick_off_date" name="pick_off_date" required />
                </div>

                <div class="form-field">
                    <label for="pick_up_location">Pick-Up Location:</label>
                    <input type="text" id="pick_up_location" name="pick_up_location" required />
                </div>

                <div class="form-field">
                    <label for="pick_off_location">Pick-Off Location:</label>
                    <input type="text" id="pick_off_location" name="pick_off_location" required />
                </div>

                <div class="form-field">
                    <label for="id_user">User ID:</label>
                    <input type="text" id="id_user" name="id_user" required />
                </div>

                <div class="form-field">
                    <label for="time_sent">Time Sent:</label>
                    <input type="date" id="time_sent" name="time_sent" required />
                </div>

                <div class="form-field">
                    <label for="status">Status:</label>
                    <input type="text" id="status" name="status" required />
                </div>

                <button type="submit">Create</button>
            </form>
        </div>
    </body>

</html>
