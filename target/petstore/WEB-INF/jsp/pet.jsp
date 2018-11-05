<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>宠物列表</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>宠物id</th>
        <th>宠物类型</th>
        <th>宠物名</th>
        <th>标签</th>
        <th>状态</th>
    </tr>
    </thead>
    <tbody id="">
    <tr>
        <td><input type="text" name="pid"></td>
        <td>
            <select name="pcg">
                <option value="猫类型">猫类型</option>
                <option value="狗类型">狗类型</option>
            </select>
        </td>
        <td><input type="text" name="pName"></td>
        <td><input type="text" name="ptags"></td>
        <td><input type="text" name="pstatus"></td>
    </tr>
    </tbody>
</table>
<p></p>
<input type="button" id="btn_add" value="批量添加">
<table>
    <tr>
        <th>宠物id</th>
        <th>宠物类型</th>
        <th>宠物名</th>
        <th>标签</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    <c:forEach var="e" items="${ptList}">
        <tr>
            <td>${e.pid}</td>
            <td>${e.pcg}</td>
            <td>${e.pName}</td>
            <td>${e.ptags}</td>
            <td>${e.pstatus}</td>
            <td><a href="/em/del/${e.eId}">删除</a></td>
            <td></td>
        </tr>
    </c:forEach>
</table>

<script src="../js/jquery.js"></script>
<script>
    $(function () {
        var tbody = $("#tbody1");

        trNode = tbody.clone();

        tbody.on("click", " .add", function () {
            $("#tbody1").append(trNode.clone());
        });

        tbody.on("click", ".del", function () {
            var del = $("tr", tbody).length;
            console.log(del);
            if (del === 1) {
                alert("不能再删了");
                return false;
            }
            $(this).parent().parent().remove();
        })
    });

    $("#btn_add").click(function () {
        var data = [];
        $("#tbody1 tr").each(function (index, obj) {
            data.push(
                {
                    pid: $("input[name='pid']", obj).val(),
                    pcg: $("input[name='pcg']", obj).val(),
                    pName: $("select[name='pName']", obj).val(),
                    ptags: $("select[name='ptags']", obj).val(),
                    pstatus: $("input[name='pstatus']", obj).val()
                }
            )
        });
        $.post({
            url: "/pt",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(data)
        }).done(function (data) {
            if (data.msg === "ok") {
                alert("添加成功");
                window.location.href = "/pt";
            }
            else {
                alert("添加失败");
            }
        }).fail(function (xhr, code, ex) {
            console.error(ex);
        });
    })
</script>

</body>
</html>
