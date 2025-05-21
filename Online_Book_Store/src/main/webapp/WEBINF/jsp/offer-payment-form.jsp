<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Make Your Payment</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
  <div class="container mx-auto px-4 py-8 flex-1">
    <h1 class="text-3xl font-bold text-gray-800 mb-8">Make Your Payment</h1>

    <form action="/payment/submit" method="post" class="grid grid-cols-1 lg:grid-cols-2 gap-8">

      <!-- Payment Method Card -->
      <div class="bg-white rounded-2xl shadow p-6">
        <h2 class="text-lg font-semibold text-gray-800 mb-4">Choose a payment method</h2>
        <fieldset class="space-y-3">
          <label class="flex items-center justify-between border border-gray-200 rounded-lg p-4 cursor-pointer focus-within:ring-2 focus-within:ring-indigo-500">
            <div class="flex items-center">
              <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg" alt="Visa" class="h-6 mr-3"/>
              <span class="font-medium text-gray-700">VISA</span>
            </div>
            <input type="radio" name="method" value="visa" checked class="form-radio h-5 w-5 text-indigo-600"/>
          </label>

          <label class="flex items-center justify-between border border-gray-200 rounded-lg p-4 cursor-pointer focus-within:ring-2 focus-within:ring-indigo-500">
            <div class="flex items-center">
              <img src="https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg" alt="MasterCard" class="h-6 mr-3"/>
              <span class="font-medium text-gray-700">MasterCard</span>
            </div>
            <input type="radio" name="method" value="mastercard" class="form-radio h-5 w-5 text-indigo-600"/>
          </label>