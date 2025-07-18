<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navbar.jsp" %>
<%@ include file="authCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>All Support Tickets</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    function filterTickets() {
      const selectedSubject = document.getElementById('subject').value;
      const rows = document.querySelectorAll('.ticket-row');

      rows.forEach(row => {
        const ticketSubject = row.getAttribute('data-subject');

        // If "All Subjects" is selected or no subject is selected, show all rows
        if (selectedSubject === '' || selectedSubject === 'all') {
          row.style.display = '';
        } else if (ticketSubject === selectedSubject) {
          row.style.display = '';  // Show the row if it matches the selected subject
        } else {
          row.style.display = 'none';  // Hide the row if it does not match the selected subject
        }
      });
    }
  </script>
</head>
<body class="bg-gray-50">
  <div class="container mx-auto p-6">
    <h2 class="text-2xl font-semibold text-gray-800 mb-4">All Support Tickets</h2>

    <!-- Filter by Subject Dropdown -->
    <label for="subject" class="mr-2">Filter by Subject:</label>
    <select id="subject" class="border border-gray-300 rounded-md p-2" onchange="filterTickets()">
      <option value="all">-- All Subjects --</option>  <!-- Option for all subjects -->
      <option value="books_related">Books Related</option>
      <option value="stationary_related">Stationary Related</option>
      <option value="others">Others</option>
    </select>

    <c:if test="${empty tickets}">
      <div class="bg-white shadow-md rounded-lg p-6 text-center">
        <p class="text-gray-600">No tickets available.</p>
      </div>
    </c:if>

    <c:if test="${not empty tickets}">
      <div class="overflow-x-auto bg-white shadow-md rounded-lg">
        <table class="min-w-full table-auto border-separate border-spacing-y-2">
          <thead>
            <tr class="bg-gray-200 text-left">
              <th class="px-4 py-2">ID</th>
              <th class="px-4 py-2">User Email</th>
              <th class="px-4 py-2">Subject</th>
              <th class="px-4 py-2">Message</th>
              <th class="px-4 py-2">Status</th>
              <th class="px-4 py-2 text-center">Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="t" items="${tickets}">
              <tr class="ticket-row border-b border-gray-200 hover:bg-gray-50" data-subject="${t.subject}">
                <td class="px-4 py-2">${t.id}</td>
                <td class="px-4 py-2">${t.userEmail}</td>
                <td class="px-4 py-2">${t.subject}</td>
                <td class="px-4 py-2">${t.message}</td>
                <td class="px-4 py-2">${t.status}</td>
                <td class="px-4 py-2 text-center">
                  <div class="flex justify-center items-center space-x-2">
                    <!-- Update (GET) -->
                    <form action="${pageContext.request.contextPath}/ticket/update/${t.id}" method="get" class="inline-block">
                      <button type="submit" class="bg-yellow-500 text-white px-3 py-1 rounded-md hover:bg-yellow-600">Update</button>
                    </form>
                    <!-- Delete (POST) -->
                    <form action="${pageContext.request.contextPath}/ticket/delete/${t.id}" method="post" class="inline-block">
                      <button type="submit" onclick="return confirm('Delete this ticket?');" class="bg-red-500 text-white px-3 py-1 rounded-md hover:bg-red-600">Delete</button>
                    </form>
                  </div>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </c:if>
  </div>
      <%@ include file="footer.jsp" %>

</body>
</html>
