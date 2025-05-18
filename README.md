# 📚 Online Book Store

An interactive web-based **Online Book Store** system built using JSP and Spring Boot, designed to handle book inventory, stationary management, offers, and support ticket handling. The system supports dynamic content updates using Linked Lists and offers efficient sorting using Quick Sort.

## 🚀 Features

### 1. User Management
- **Register/Login**
- **Profile Handling** – View, update, and delete user information

### 2. Book Inventory Management
- **Create** – Admin adds new books
- **Read** – View book details (title, author, price, etc.)
- **Delete** – Remove books
- **Data Structure** – `LinkedList` for dynamic inventory and `Quick Sort` for sorting by price/rating

### 3. Stationary Management
- **Create / Read / Update / Delete**
- **Data Structure** – `LinkedList` and `Quick Sort`

### 4. Offers Management
- **Create / Read / Update / Delete**
- **Data Structure** – `LinkedList` and `Quick Sort`

### 5. Help Desk / Support Tickets
- **Create** – Users submit support requests
- **Read / Update / Delete** – Admin manages and resolves tickets

---

## 🛠️ Technology Stack

- **Backend:** JSP, Java (JDK 17), Spring Boot  
- **Frontend:** HTML  
- **Server:** Apache Tomcat (via IntelliJ using SmartTomcat)  
- **IDE:** IntelliJ IDEA  
- **Data Handling:** File-based storage (`books.txt`, `stationary.txt`, `offer.txt`, `ticket.txt`, `users.txt`, `payment.txt`)  
- **Data Structures Used:**  
  - `LinkedList` – for dynamic data handling  
  - `Quick Sort` – for sorting inventory, offers, and stationaries

---


## 🧪 How to Run

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/online-book-store.git
 
2. **Open in IntelliJ IDEA**
   - Ensure JDK 17 is installed
   - Import the project as a Maven or Spring Boot project

3. **Configure SmartTomcat**
   - Set the deployment directory to `webapp`
   - Assign the correct context path (e.g., `/OnlineBookStore`)

4. **Run the Application**
    - Start SmartTomcat server
    - Navigate to `http://localhost:8080/OnlineBookStore` in your browser
## 🌱 Future Improvements

- Migrate to a database (e.g., MySQL or PostgreSQL)
- Enhance UI using modern frameworks (React/Bootstrap)
- Role-based access control
- Pagination and search filters
- REST API support

## 📜 License

**This project is open-source and available under the MIT License.**