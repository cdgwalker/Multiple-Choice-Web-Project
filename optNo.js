function createOptions() {
    //Get table location
    var loc = document.getElementById("opts");

    //Clear any previous table
    loc.innerHTML="";

    //Get number of options entered
    var num = document.getElementById("optNo").value;

    //Create table element
    var tbl = document.createElement("table");

    //Create rows
    for (var r = 0; r < num; r++) {
        var row = document.createElement("tr");

        //Add columns to row
        var col = document.createElement("td");
        var lab = document.createElement("label");
        lab.setAttribute("for", "option" + r);
        lab.setAttribute("name", "option" + r);
        lab.innerHTML = "option " + (r+1);
        col.appendChild(lab);
        row.appendChild(col);
        var col = document.createElement("td");
        var inp = document.createElement("input");
        inp.type = "text";
        inp.setAttribute("name", "option");
        col.appendChild(inp);
        row.appendChild(col);
        tbl.appendChild(row);
    }
    loc.appendChild(tbl);
}

function createOptionComments() {
    //Get table location
    var loc = document.getElementById("optsComs");

    //Clear any previous table
    loc.innerHTML="";

    //Get number of options entered
    var num = document.getElementById("optNo").value;

    //Create table element
    var tbl = document.createElement("table");

    //Create rows
    for (var r = 0; r < num; r++) {
        var row = document.createElement("tr");

        //Add columns to row
        var col = document.createElement("td");
        var lab = document.createElement("label");
        lab.setAttribute("for", "option" + r);
        lab.setAttribute("name", "option" + r);
        lab.innerHTML = "option comment " + (r+1);
        col.appendChild(lab);
        row.appendChild(col);
        var col = document.createElement("td");
        var inp = document.createElement("input");
        inp.type = "text";
        inp.setAttribute("name", "optionComms");
        col.appendChild(inp);
        row.appendChild(col);
        tbl.appendChild(row);
    }
    loc.appendChild(tbl);
}

function createTables() {
    createOptions();
    createOptionComments();
}