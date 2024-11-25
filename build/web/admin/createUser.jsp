<%-- 
    Document   : createUser
    Created on : 10-10-2024, 22:09:09
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
        <link rel="stylesheet" href="admin/admin-create.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Add a new user</h1>
            <form action="create-user" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required/>

                <label for="password">Password:</label>
                <input type="text" id="password" name="password" required/>

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required/>

                <label for="date_of_bird">Date of birth:</label>
                <input type="date" id="date_of_bird" name="date_of_bird" required/>

                <label>Role:</label>
                <div class="radio-group">
                    <input type="radio" id="role0" name="role" value="0" checked/>0
                    <input type="radio" id="role1" name="role" value="1"/>1
                </div>

                <label>Status:</label>
                <div class="radio-group">
                    <input type="radio" id="status0" name="status" value="0" checked/>0
                    <input type="radio" id="status1" name="status" value="1"/>1
                </div>

                <button type="submit">Create</button>
            </form>
        </div>
    </body>


</html>
