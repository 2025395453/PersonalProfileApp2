<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Profile Summary</title>
<style>
    body {
        font-family: Arial;
        background: #ffe0f0; 
        padding: 30px;
    }
    .card {
        background: white;
        padding: 20px;
        width: 500px;
        margin: auto;
        border-radius: 10px;
        box-shadow: 0 0 10px #ffb3c6;
    }
    h2 {
        text-align: center;
        color: #d63384;
    }
    p {
        font-size: 18px;
    }
    b {
        color: #ff4f9a; 
    }
</style>
</head>
<body>

<div class="card">
    <h2>Your Personal Profile</h2>
    <p><b>Name:</b> ${name}</p>
    <p><b>Student ID:</b> ${studentId}</p>
    <p><b>Program:</b> ${program}</p>
    <p><b>Email:</b> ${email}</p>
    <p><b>Hobbies:</b> ${hobbies}</p>
    <p><b>About Me:</b><br> ${intro}</p>
</div>

</body>
</html>
