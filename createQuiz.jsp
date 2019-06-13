<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/CSS/style.css" type="text/css">
    <title>Create Question</title>
    <script src="/JS/optNo.js"></script>
</head>
<body>
<body>
<div class="topnav" id="myTopnav">
    <a href="teachHome.jsp">Home</a>
    <a href="logout.jsp">Logout</a>
    <a href="#help">Help</a>
</div>
<div class="sidenav">
    <a class="active" href="createQuiz.jsp">Create Quiz</a>
    <a href="createQues.jsp">Create Question</a>
    <a href="quesView.jsp">View Questions</a>
    <a href="#viewRes">View Results</a>
    <a href="#viewStuds">View Students</a>
</div>
<form action="/makeQuiz.jsp">
    <center>
        <div class="container">
            <div class="row">
                <div class="colnarrow">
                    <label for="quizName">Quiz Name</label>
                </div>
                <div class="colwide">
                    <input type="text" id="quizName" name="quizName" placeholder="Enter a Quiz Name">
                </div>
                <div class="colnarrow">
                    <label for="quizTopic">Quiz Topic</label>
                </div>
                <div class="colwide">
                    <input type="text" id="quizTopic" name="quizTopic" placeholder="Enter a Quiz Topic">
                </div>
                <div class="colnarrow">
                    <label for="quesNum">Number of Questions</label>
                </div>
                <div class="colwide">
                    <input type="text" id="quesNum" placeholder="Total Number of Questions">
                </div>
                <button type="submit" id="subBut">Submit</button>
            </div>
        </div>
        </div>
    </center>
</form>
</body>
</html>