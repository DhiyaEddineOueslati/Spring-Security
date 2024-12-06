<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="header.jsp" %> 
<c:set var="cxt" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un emprunt</title>
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #6e7a5e, #3a4a5e);
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            flex-direction: column;
        }

        /* Form Styling */
        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #444;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        select, input[type="date"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            color: #333;
        }

        select:focus, input[type="date"]:focus {
            border-color: #007bff;
            outline: none;
        }
        .logout {
            background-color: #dc3545;
        }

        .logout:hover {
            background-color: #c82333;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Responsive */
        @media (max-width: 768px) {
            body {
                padding: 15px;
            }

            form {
                padding: 15px;
            }
        }
    </style>
</head>

<body>

    <h2>Ajouter un emprunt</h2>
    <form action="${pageContext.request.contextPath}/emprunts/ajout" method="post">
        <label for="livre">Livre:</label>
        <select name="livre.id" id="livre" required>
            <c:forEach var="livre" items="${livres}">
                <option value="${livre.id}">${livre.titre}</option>
            </c:forEach>
        </select>

        <label for="adherant">Adhérent:</label>
        <select name="adherant.id" id="adherant" required>
            <c:forEach var="adherant" items="${adherants}">
                <option value="${adherant.id}">${adherant.nom} ${adherant.prenom}</option>
            </c:forEach>
        </select>

        <label for="dateEmprunt">Date d'emprunt:</label>
        <input type="date" id="dateEmprunt" name="dateEmprunt" required>

        <input type="submit" value="Ajouter">
    </form>

</body>

</html>
