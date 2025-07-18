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

          <label class="flex items-center justify-between border border-gray-200 rounded-lg p-4 cursor-pointer focus-within:ring-2 focus-within:ring-indigo-500">
            <div class="flex items-center">
              <img src="https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg" alt="PayPal" class="h-6 mr-3"/>
              <span class="font-medium text-gray-700">PayPal</span>
            </div>
            <input type="radio" name="method" value="paypal" class="form-radio h-5 w-5 text-indigo-600"/>
          </label>
        </fieldset>
      </div>

      <!-- Card Details + Submit -->
      <div class="bg-white rounded-2xl shadow p-6 flex flex-col justify-between">
        <div class="space-y-4">

          <div>
            <label class="block text-gray-700 mb-1" for="name">Name on card</label>
            <input id="name" name="name" type="text" placeholder="Enter name on card"
                   class="w-full bg-gray-100 text-gray-700 placeholder-gray-400 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500" required/>
          </div>

          <div>
            <label class="block text-gray-700 mb-1" for="cardNumber">Card number</label>
            <input id="cardNumber" name="cardNumber" type="text" placeholder="Enter card number"
                   class="w-full bg-gray-100 text-gray-700 placeholder-gray-400 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500" required/>
          </div>

          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-gray-700 mb-1" for="cvv">CVV</label>
              <input id="cvv" name="cvv" type="text" placeholder="Enter CVV"
                     class="w-full bg-gray-100 text-gray-700 placeholder-gray-400 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500" required/>
            </div>
            <div>
              <label class="block text-gray-700 mb-1" for="expDate">Expiration date</label>
              <select id="expDate" name="expDate"
                      class="w-full bg-gray-100 text-gray-700 placeholder-gray-400 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
                <option value="" disabled selected>MM/YY</option>
                <option>01/25</option>
                <option>02/25</option>
              </select>
            </div>
          </div>

          <div>
            <label class="block text-gray-700 mb-1" for="address">Address</label>
            <input id="address" name="address" type="text" placeholder="Add address"
                   class="w-full bg-gray-100 text-gray-700 placeholder-gray-400 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500" required/>
          </div>

          <div>
            <label class="block text-gray-700 mb-1" for="amount">Amount</label>
            <input id="amount" name="amount" type="text" placeholder="Amount"
                   value="${amount}"
                   class="w-full bg-gray-100 text-gray-700 placeholder-gray-400 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500" required/>
          </div>
        </div>

        <div class="border-t border-gray-200 my-4"></div>

        <button type="submit"
                class="w-full sm:w-auto bg-orange-400 hover:bg-orange-500 text-white font-medium rounded-lg px-6 py-3 flex items-center justify-center">

          Pay now
        </button>
      </div>
    </form>
  </div>
      <%@ include file="footer.jsp" %>

</body>
</html>
