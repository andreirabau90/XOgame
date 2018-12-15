<%--
  Created by IntelliJ IDEA.
  User: Андрей
  Date: 08.12.2018
  Time: 01:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Андрей
  Date: 02.12.2018
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-2.0.3.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/mymodel" id="mod">
    <input type="text" name="col" value="3">
    <input type="text" name="st" value="3">>
    <input type="submit" name="send">
</form>

<input type="hidden" name="col" value=${col}>
<input type="hidden" name="st" value=${st}>
<table style="border: 1px solid black">
    <tbody id="line">

    </tbody>
</table>


${ar}
<input type="button" class="start" value="start">
<script type="text/javascript">
    // xMove = true;
    // var result = new Map();


    // k = r + "_"  + c;
    // v = (xMove) ? "x" : "o";
    // xMove = !xMove;
    // result.set(k, v);
    //
    // var myJsonString = JSON.stringify(Array.from(result.entries()));

    //map2 = new Map(JSON.parse(myJsonString));

    // alert(myJsonString);
    function xoButtonClicked(r, c) {
        $.ajax({
            url:'sun',
            type: "GET",
            data: {button: r+''+c,value:r+c},
            dataType: 'json',
            success: function (data) {
                alert(data);
                document.getElementById(r+''+c).value=123456;
            }
        });


        alert("i here");




    };
    <%--function Myturn(xoButtonClicked (r, c)){--%>
    <%--$.ajax({--%>
    <%--url: "/sun",--%>
    <%--type: "POST",--%>
    <%--callback: ('${ar}'),--%>
    <%--data: {button:document.getElementById(r + '' + c) },--%>
    <%--success: function () {--%>
    <%--document.getElementById(r + '' + c).value = "${ar}";--%>
    <%--alert(111);--%>
    <%--}--%>

    <%--});--%>
    <%----%>
    <%--};--%>

    $(document).ready(function () {
        var rowsNum = ${col};
        var colsNum = ${st};

        function drawTable() {
            for (r = 1; r <= rowsNum; r++) {
                var tr = "";
                for (c = 1; c <= colsNum; c++) {
                    var td = "<td><input onclick='xoButtonClicked( " + r + ", " + c + ");' type='button' id='" + r + c + "' class='button' value=''></td>";
                    tr = tr + td;
                }
                tr = "<tr><td></td>" + tr + "</tr>"
                $('#line').html($('#line').html() + tr);
            }
        }


        $(".start").click(function (event, callback) {
            $('#line').html('');

            $.ajax({
                url: "sun",
                type: "GET",
                data: {button: "true",value:document.getElementsByClassName("button")},
                success: function () {

                    drawTable();
                }
            });
        });
        <%--$(".button").click(function () {--%>
        <%--$.ajax({--%>
        <%--url: "/mymodel",--%>
        <%--type: "POST",--%>
        <%--callback: ('${ar}'),--%>
        <%--data: {button: document.onclick},--%>
        <%--success: function () {--%>

        <%--}--%>

        <%--})--%>
        <%--})--%>
    })
    ;
</script>
</body>
</html>
