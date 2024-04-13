<?php
// Only process the form if the request is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // MySQL connection variables
    $servername = "db";  // The hostname (Docker service name)
    $username = "tsrlearning";
    $password = "tsrlearning";
    $dbname = "InventoryDB";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO inventory (item_name, quantity, date_received, supplier_name, price_per_item) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sisds", $item_name, $quantity, $date_received, $supplier_name, $price_per_item);

    // Set parameters from POST data
    $item_name = $_POST['item-name'];
    $quantity = $_POST['quantity'];
    $date_received = $_POST['date-received'];
    $supplier_name = $_POST['supplier-name'];
    $price_per_item = $_POST['price-per-item'];

    // Execute and close
    if ($stmt->execute()) {
        echo "<p>New records created successfully</p>";
    } else {
        echo "<p>Error: " . $stmt->error . "</p>";
    }
    $stmt->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inventory Registration Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    form {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    h2 {
        text-align: center;
    }
    .input-group {
        margin-bottom: 15px;
    }
    .input-group label {
        display: block;
        margin-bottom: 5px;
    }
    .input-group input {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .input-group input[type="date"] {
        font-family: Arial, sans-serif;
    }
    button {
        width: 100%;
        padding: 10px;
        border: none;
        background-color: #007BFF;
        color: white;
        border-radius: 4px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<form action="" method="post">
    <h2>Inventory Registration</h2>
    <div class="input-group">
        <label for="item-name">Item Name</label>
        <input type="text" id="item-name" name="item-name" required>
    </div>
    <div class="input-group">
        <label for="quantity">Quantity</label>
        <input type="number" id="quantity" name="quantity" required>
    </div>
    <div class="input-group">
        <label for="date-received">Date Received</label>
        <input type="date" id="date-received" name="date-received" required>
    </div>
    <div class="input-group">
        <label for="supplier-name">Supplier Name</label>
        <input type="text" id="supplier-name" name="supplier-name">
    </div>
    <div class="input-group">
        <label for="price-per-item">Price Per Item</label>
        <input type="text" id="price-per-item" name="price-per-item" required>
    </div>
    <button type="submit">Submit</button>
</form>
</body>
</html>
