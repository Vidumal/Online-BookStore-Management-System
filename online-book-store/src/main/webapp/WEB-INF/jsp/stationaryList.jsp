<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>All Stationary</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    window.onload = function () {
      // Category Filter (if you wish to add one, similar to books page)
      // document.getElementById("categoryFilter").addEventListener("change", ...);

      // Buy Now Handling
      let selectedId = null, selectedPrice = null;
      document.querySelectorAll('.buy-now-btn').forEach(btn => {
        btn.addEventListener('click', () => {
          selectedId    = btn.dataset.id;
          selectedPrice = parseFloat(btn.dataset.price);
          const maxQty  = parseInt(btn.dataset.quantity, 10);

          const input = document.getElementById('quantityInput');
          input.max   = maxQty;
          input.value = 1;
          document.getElementById('quantityModal').classList.remove('hidden');
        });
      });

      document.getElementById('confirmBtn').addEventListener('click', () => {
        const qty = parseInt(document.getElementById('quantityInput').value, 10);
        if (!qty || qty < 1) {
          alert('Please enter a valid quantity.');
          return;
        }
        const total = selectedPrice * qty;
       window.location.href = "/payment?amount=" + total + "&stationaryId=" + selectedId;
      });
    };

    function closeModal() {
      document.getElementById('quantityModal').classList.add('hidden');
    }
  </script>
</head>
<body class="bg-gray-50">

  <!-- Header -->
  <div class="bg-blue-500 py-6">
    <h1 class="text-3xl font-bold text-white text-center">All Stationary</h1>
  </div>

  <!-- (Optional) Category Filter -->
  <!--
  <div class="max-w-7xl mx-auto px-4 py-4 flex justify-end">
    <select id="categoryFilter" class="bg-white border border-gray-300 rounded px-4 py-2 shadow-sm focus:outline-none">
      <option value="">All Categories</option>
      <option value="Pens">Pens</option>
      <option value="Notebooks">Notebooks</option>
      <option value="Accessories">Accessories</option>
    </select>
  </div>
  -->

  <!-- Grid of Cards -->
  <div class="max-w-7xl mx-auto px-4 py-8">
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
      <c:forEach var="item" items="${stationary}">
        <div class="bg-white rounded-lg shadow overflow-hidden flex flex-col h-full">
          <c:choose>
            <c:when test="${not empty item.imagePath}">
              <img src="${pageContext.request.contextPath}${item.imagePath}"
                   alt="${item.itemName}"
                   class="h-64 w-full object-cover" />
            </c:when>
            <c:otherwise>
              <div class="h-64 w-full bg-gray-100 flex items-center justify-center">
                <span class="text-gray-400">No Image</span>
              </div>
            </c:otherwise>
          </c:choose>
          <div class="p-4 flex-1 flex flex-col justify-between">
            <div>
              <h2 class="text-lg font-semibold text-gray-800 mb-2">${item.itemName}</h2>
            </div>
            <div class="flex items-center justify-between mt-4">
              <span class="text-xl font-bold text-gray-900">Rs. ${item.price}</span>
              <button
                class="buy-now-btn px-3 py-1 bg-indigo-600 hover:bg-indigo-700 text-white text-sm rounded disabled:opacity-50"
                data-id="${item.id}"
                data-price="${item.price}"
                data-quantity="${item.quantity}"
                <c:if test="${item.quantity == 0}">disabled</c:if>>
                <c:choose>
                  <c:when test="${item.quantity == 0}">Out of Stock</c:when>
                  <c:otherwise>Buy Now</c:otherwise>
                </c:choose>
              </button>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

  <!-- Quantity Modal -->
  <div id="quantityModal"
       class="fixed inset-0 z-50 hidden bg-black bg-opacity-50 flex items-center justify-center p-4">
    <div class="bg-white rounded-2xl shadow-lg p-6 w-full max-w-sm">
      <h3 class="text-xl font-semibold mb-4">Select Quantity</h3>
      <input id="quantityInput"
             type="number"
             min="1"
             class="w-full border border-gray-300 rounded-lg px-4 py-2 mb-4 focus:outline-none focus:ring-2 focus:ring-indigo-500" />
      <button id="confirmBtn"
              class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 rounded-lg mb-2">
        Confirm
      </button>
      <button onclick="closeModal()"
              class="w-full text-center text-gray-600 hover:text-gray-800 text-sm">
        Cancel
      </button>
    </div>
  </div>

  <%@ include file="footer.jsp" %>
</body>
</html>
