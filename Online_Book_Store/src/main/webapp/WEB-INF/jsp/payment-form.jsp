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

    <!-- Unified Payment Form -->
    <form action="/payment/submit" method="post"
          class="grid grid-cols-1 lg:grid-cols-2 gap-8 bg-white rounded-2xl shadow p-6">

      <!-- Left Column: Payment Method Only -->
      <div>
        <h2 class="text-lg font-semibold text-gray-800 mb-4">Choose Payment Method</h2>
        <fieldset class="space-y-3">
          <label class="flex items-center justify-between border border-gray-200 rounded-lg p-4">
            <div class="flex items-center">
              <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg"
                   alt="Visa" class="h-6 mr-3"/>
              <span>VISA</span>
            </div>
            <input type="radio" name="method" value="visa" checked/>
          </label>
          <label class="flex items-center justify-between border border-gray-200 rounded-lg p-4">
            <div class="flex items-center">
              <img src="https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg"
                   alt="MasterCard" class="h-6 mr-3"/>
              <span>MasterCard</span>
            </div>
            <input type="radio" name="method" value="mastercard"/>
          </label>
          <label class="flex items-center justify-between border border-gray-200 rounded-lg p-4">
            <div class="flex items-center">
              <img src="https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg"
                   alt="PayPal" class="h-6 mr-3"/>
              <span>PayPal</span>
            </div>
            <input type="radio" name="method" value="paypal"/>
          </label>
        </fieldset>
      </div>

      <!-- Right Column: All Input Fields + Submit -->
      <div class="flex flex-col justify-between">
        <div>
          <!-- Name on Card -->
          <div class="mb-4">
            <label for="name" class="block text-gray-700 mb-1">Name on card</label>
            <input id="name" name="name" type="text" required
                   class="w-full bg-gray-100 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"/>
          </div>

          <!-- Card Number -->
          <div class="mb-4">
            <label for="cardNumber" class="block text-gray-700 mb-1">Card number</label>
            <input id="cardNumber" name="cardNumber" type="text" required
                   class="w-full bg-gray-100 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"/>
          </div>

          <!-- CVV & Expiration Date -->
          <div class="grid grid-cols-2 gap-4 mb-4">
            <div>
              <label for="cvv" class="block text-gray-700 mb-1">CVV</label>
              <input id="cvv" name="cvv" type="text" required
                     class="w-full bg-gray-100 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"/>
            </div>
            <div>
              <label for="expDate" class="block text-gray-700 mb-1">Expiration date</label>
              <select id="expDate" name="expDate" required
                      class="w-full bg-gray-100 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                <option value="" disabled selected>MM/YY</option>
                <option>01/25</option>
                <option>02/25</option>
                <!-- … -->
              </select>
            </div>
          </div>

          <!-- Address -->
          <div class="mb-4">
            <label for="address" class="block text-gray-700 mb-1">Address</label>
            <input id="address" name="address" type="text" required
                   class="w-full bg-gray-100 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"/>
          </div>

          <!-- Hidden Amount Field -->
          <input type="hidden" name="amount" value="${amount}" />

          <!-- Display Total -->
          <div class="text-lg font-semibold text-gray-800 mb-6">
            Total (Rs) <span class="ml-2">${amount}</span>
          </div>
        </div>

        <!-- Submit Button -->
        <button type="submit"
                class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-medium rounded-lg px-6 py-3 flex items-center justify-center">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none"
               viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M5 13l4 4L19 7" />
          </svg>
          Pay now
        </button>
      </div>

    </form>
  </div>
      <%@ include file="footer.jsp" %>

</body>
</html>
