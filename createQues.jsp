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
    <a href="createQuiz.jsp">Create Quiz</a>
    <a class="active" href="createQues.jsp">Create Question</a>
    <a href="quesView.jsp">View Questions</a>
    <a href="#viewRes">View Results</a>
    <a href="#viewStuds">View Students</a>
</div>
<form action="/makeQues.jsp">
    <center>
        <div class="container">
            <div class="row">
                <div class="colnarrow">
                    <label for="quesText">Question Text</label>
                </div>
                <div class="colwide">
                    <input type="text" id="quesText" name="quesText" placeholder="Enter the Question">
                </div>
                <div class="colnarrow">
                    <label for="optNo">Number of Options</label>
                </div>
                <div class="colwide">
                    <input type="text" id="optNo" placeholder="Number of options to be shown" onChange="createTables()">
                </div>
                <div id="opts">
                </div>
                <div class="colnarrow">
                    <label for="ans">Correct Answer</label>
                </div>
                <div class="colwide">
                    <input type="text" id="ans" name="ans" placeholder="Enter the option number of the correct answer">
                </div>
                <div class="colnarrow">
                    <label for="optsComs">Comments</label>
                </div>
                <div id="optsComs">
                </div>
                <div class="colwide"/>
                    <button type="submit" id="subBut">Submit</button>
                </div>
            </div>
        </div>
    </center>
</form>
</body>
</html>