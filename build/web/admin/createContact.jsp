<%-- 
    Document   : createContact
    Created on : 16-10-2024, 23:22:51
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create contact</title>
        <link rel="stylesheet" href="admin/admin-create.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Add a new contact</h1>
            <form action="create-contact" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required /><br/>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required /><br/>

                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" required /><br/>

                <label for="message">Message:</label>
                <textarea id="message" name="message" required ></textarea><br/>

                <label>Status:</label>
                <div class="radio-group">
                    <input type="radio" id="status0" name="status" value="0" checked />0
                    <input type="radio" id="status1" name="status" value="1" />1
                </div>

                <label for="time_sent">Time Sent:</label>
                <input type="date" id="time_sent" name="time_sent" required /><br/>

                <button type="submit">Create</button>
            </form>
        </div>
    </body>

</html>
