<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Offer List</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        // Function to filter offers based on selected category
        function filterOffers() {
            const selectedCategory = document.getElementById('category-filter').value;
            const offerCards = document.querySelectorAll('.offer-card');  // Assuming each offer card has class 'offer-card'

            offerCards.forEach(card => {
                const offerCategory = card.getAttribute('data-category'); // Assuming the category is stored as a data attribute

                // Show the offer if it matches the selected category, else hide it
                if (selectedCategory === '' || selectedCategory === offerCategory) {
                    card.style.display = '';  // Show
                } else {
                    card.style.display = 'none';  // Hide
                }
            });
        }
    </script>
</head>
<body class="bg-gray-100">
    <!-- Page Header -->
    <div class="bg-blue-400 py-8">
        <h1 class="text-3xl font-bold text-white text-center">Offer List</h1>
    </div>

    <!-- Filter by Category Dropdown -->
    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-end">
        <select id="category-filter" class="bg-white border border-gray-300 rounded px-4 py-2 shadow-sm focus:outline-none" onchange="filterOffers()">
            <option value="" selected>-- Select Category --</option>
            <option value="books">Books</option>
            <option value="stationary">Stationary</option>
            <option value="books_plus_stationary">Books plus Stationary</option>
        </select>
    </div>

    <!-- Offers Grid -->
    <div class="max-w-7xl mx-auto px-4 py-6">
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            <c:forEach items="${offers}" var="offer">
                <div class="bg-white rounded-lg shadow-lg overflow-hidden flex flex-col h-full offer-card" data-category="${offer.category}">
                    <!-- Dynamic Image -->
                    <c:choose>
                        <c:when test="${not empty offer.imagePath}">
                            <img src="${offer.imagePath}" alt="Offer ${offer.id}" class="h-48 w-full object-cover" />
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/400x250?text=Offer+Image" alt="Offer ${offer.id}" class="h-48 w-full object-cover" />
                        </c:otherwise>
                    </c:choose>

                    <div class="p-5 flex-1 flex flex-col justify-between">
                        <h2 class="text-lg font-semibold text-gray-800 mb-2">${offer.description}</h2>

                        <!-- Category Badge -->
                        <span class="inline-block bg-gray-200 text-gray-700 text-xs font-semibold px-2 py-1 rounded-full mb-4">
                            ${offer.category}
                        </span>

                        <div class="flex items-center justify-between mt-auto">
                            <span class="text-base font-medium text-indigo-600">Price : Rs. ${offer.save}</span>
                            <a href="/payment?amount=${offer.save}&bookId=${offer.id}">
                                <button class="px-3 py-1 bg-indigo-600 hover:bg-indigo-700 text-white text-sm rounded">
                                    Buy Now
                                </button>
                            </a>
                        </div>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
        <%@ include file="footer.jsp" %>

</body>
</html>
