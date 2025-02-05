<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
            background-color: #f4f4f4;
        }
        .container {
            width: 300px;
            margin: auto;
            padding: 20px;
            background: white;
            box-shadow: 0px 0px 10px gray;
            border-radius: 10px;
        }
        input, select, button {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            font-size: 16px;
        }
        button {
            background: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background: #218838;
        }
        .result {
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Simple Calculator</h2>
        <form method="post">
            <input type="number" name="num1" step="any" placeholder="Enter first number" required>
            <input type="number" name="num2" step="any" placeholder="Enter second number" required>
            <select name="operation">
                <option value="add">Addition (+)</option>
                <option value="subtract">Subtraction (-)</option>
                <option value="multiply">Multiplication (*)</option>
                <option value="divide">Division (/)</option>
            </select>
            <button type="submit">Calculate</button>
        </form>

        <div class="result">
            <%
                String num1Str = request.getParameter("num1");
                String num2Str = request.getParameter("num2");
                String operation = request.getParameter("operation");

                if (num1Str != null && num2Str != null && operation != null) {
                    double num1 = Double.parseDouble(num1Str);
                    double num2 = Double.parseDouble(num2Str);
                    double result = 0;

                    switch (operation) {
                        case "add":
                            result = num1 + num2;
                            out.println("Result: " + result);
                            break;
                        case "subtract":
                            result = num1 - num2;
                            out.println("Result: " + result);
                            break;
                        case "multiply":
                            result = num1 * num2;
                            out.println("Result: " + result);
                            break;
                        case "divide":
                            if (num2 != 0) {
                                result = num1 / num2;
                                out.println("Result: " + result);
                            } else {
                                out.println("Cannot divide by zero.");
                            }
                            break;
                        default:
                            out.println("Invalid operation.");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
