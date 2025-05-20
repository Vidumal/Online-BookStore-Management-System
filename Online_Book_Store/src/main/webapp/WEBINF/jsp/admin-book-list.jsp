<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navbar.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Books</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        window.onload = function() {
            document.getElementById("categoryFilter").addEventListener("change", function () {
                const selectedCategory = this.value;
                const rows = document.querySelectorAll("tbody tr[data-category]");
                rows.forEach(row => {
                    const rowCategory = row.getAttribute("data-category");
                    row.style.display = (!selectedCategory || rowCategory === selectedCategory) ? "" : "none";
                });
            });
        };
    </script>
</head>
