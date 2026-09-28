<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Staff Login</title>

<style>

body {
    font-family: Arial;
    background: #f2f2f2;
}

.login-box {
    width: 350px;
    margin: 100px auto;
    padding: 30px;
    background: white;
    box-shadow: 0px 0px 10px gray;
}

input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    box-sizing: border-box;
}

button {
    width: 100%;
    padding: 10px;
    background: #1976d2;
    color: white;
    border: none;
    cursor: pointer;
}

</style>

</head>

<body>

<div class="login-box">

<h2>Staff Login</h2>

<form action="login" method="post">

<label>User name</label>

<input type="text" name="username"required>

<label>Password</label>

<input type="text" name="password"  required>

<button type="submit">
    Login
</button>

</form>

</div>

</body>
</html>