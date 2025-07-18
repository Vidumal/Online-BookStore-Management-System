<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Books</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        window.onload = function () {
            // Category Filter
            document.getElementById("categoryFilter").addEventListener("change", function () {
                const selectedCategory = this.value;
                const bookCards = document.querySelectorAll(".book-card");

                bookCards.forEach(card => {
                    const cardCategory = card.getAttribute("data-category");
                    card.style.display = (!selectedCategory || cardCategory === selectedCategory) ? "" : "none";
                });
            });

            // Buy Now Handling
            let selectedBookId = null;
            let selectedBookPrice = null;

            document.querySelectorAll('.buy-now-btn').forEach(button => {
                button.addEventListener('click', function () {
                    selectedBookId = this.dataset.id;
                    selectedBookPrice = parseFloat(this.dataset.price);
                    const maxQty = parseInt(this.dataset.quantity);

                    console.log("Selected Book ID:", selectedBookId);
                    console.log("Selected Book Price:", selectedBookPrice);

                    const input = document.getElementById('quantityInput');
                    input.max = maxQty;
                    input.value = 1;
                    document.getElementById('quantityModal').classList.remove('hidden');
                });
            });

            document.getElementById('confirmBtn').addEventListener('click', function () {
                const quantity = parseInt(document.getElementById('quantityInput').value);
                if (quantity <= 0 || isNaN(quantity)) {
                    alert("Please enter a valid quantity.");
                    return;
                }

                const totalAmount = selectedBookPrice * quantity;
                window.location.href = "/payment?amount=" + totalAmount + "&bookId=" + selectedBookId;

            });
        };

        function closeModal() {
            document.getElementById('quantityModal').classList.add('hidden');
        }
    </script>
</head>
<body class="bg-gray-100">
    <div class="bg-blue-400 py-8">
        <h1 class="text-3xl font-bold text-white text-center">All Books</h1>
    </div>

    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-end">
        <select id="categoryFilter" class="bg-white border border-gray-300 rounded px-4 py-2 shadow-sm focus:outline-none">
            <option value="">All Categories</option>
            <option value="Child books">Child books</option>
            <option value="Novels">Novels</option>
            <option value="Translations">Translations</option>
            <option value="Subject related">Subject related</option>
        </select>
    </div>

    <div class="max-w-7xl mx-auto px-4 py-6">
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
            <c:forEach items="${books}" var="book">
                <div class="bg-white rounded-lg shadow overflow-hidden flex flex-col h-full book-card" data-category="${book.category}">
                    <c:if test="${not empty book.imagePath}">
                        <img src="${pageContext.request.contextPath}${book.imagePath}" alt="${book.name}" class="h-64 w-full object-cover" />
                    </c:if>
                    <div class="p-4 flex-1 flex flex-col justify-between">
                        <div>
                            <div class="flex justify-between items-center mb-2">
                                <h2 class="text-lg font-semibold text-gray-800">${book.name}</h2>
                            </div>
                            <p class="text-sm text-gray-500 mb-4">${book.author}</p>
                        </div>
                        <div class="flex items-center justify-between mt-auto">
                            <span class="text-lg font-bold text-gray-900">Rs. ${book.price}</span>
                            <button class="buy-now-btn px-3 py-1 bg-indigo-600 hover:bg-indigo-700 text-white text-sm rounded"
                                    data-id="${book.id}"
                                    data-price="${book.price}"
                                    data-quantity="${book.quantity}"
                                    <c:if test="${book.quantity == 0}">disabled</c:if>>
                                <c:if test="${book.quantity == 0}">Out of Stock</c:if>
                                <c:if test="${book.quantity > 0}">Buy Now</c:if>
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Quantity Modal -->
        <div id="quantityModal" class="fixed inset-0 z-50 hidden bg-gray-800 bg-opacity-50 flex justify-center items-center">
            <div class="bg-white rounded-lg p-6 w-80 shadow-md">
                <h2 class="text-lg font-bold mb-4">Select Quantity</h2>
                <input id="quantityInput" type="number" min="1" class="w-full border px-3 py-2 mb-4" />
                <button id="confirmBtn" class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded">Confirm</button>
                <button onclick="closeModal()" class="mt-2 text-sm text-gray-600">Cancel</button>
            </div>
        </div>
    </div>
        <%@ include file="footer.jsp" %>

</body>
</html>
