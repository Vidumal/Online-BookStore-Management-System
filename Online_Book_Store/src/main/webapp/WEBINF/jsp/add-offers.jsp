<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add New Offer</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body
  class="min-h-screen bg-cover bg-center"
  style="background-image: url('https://cdn.pixabay.com/photo/2017/08/07/01/40/books-2598503_1280.jpg');"
>
  <div class="min-h-screen flex items-center justify-center bg-black bg-opacity-50 p-4">
    <div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md">
      <h1 class="text-3xl font-semibold text-center mb-6">Add New Offer</h1>

      <!-- Success/Error Messages -->
      <c:if test="${not empty successMessage}">
        <div class="mb-4 text-green-700 bg-green-100 border border-green-200 rounded-lg px-4 py-2">
          ${successMessage}
        </div>
      </c:if>
      <c:if test="${not empty errorMessage}">
        <div class="mb-4 text-red-700 bg-red-100 border border-red-200 rounded-lg px-4 py-2">
          ${errorMessage}
        </div>
      </c:if>