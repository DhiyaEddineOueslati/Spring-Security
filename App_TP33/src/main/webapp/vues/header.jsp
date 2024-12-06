<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
        }

        /* Navigation Bar Styling */
        nav {
            background-color: #343a40;
            color: white;
            padding: 15px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        nav a {
            color: white;
            font-size: 16px;
            text-decoration: none;
            margin: 0 20px;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        nav a:hover {
            background-color: #007bff;
            transform: scale(1.05);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            nav {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px 20px;
            }

            nav a {
                margin: 10px 0;
                font-size: 14px;
                padding: 8px;
            }
        }
    </style>
</head>

<body>

    <nav>
        <a href="${contextPath}/livres">Liste des Livres</a>
        <a href="${contextPath}/livres/ajout">Ajouter un Livre</a>
        <a href="${contextPath}/adherants">Liste des Adhérents</a>
        <a href="${contextPath}/adherants/ajout">Ajouter un Adhérent</a>
        <a href="${contextPath}/emprunts/ajout">Ajouter un Emprunt</a>
    </nav>

</body>

</html>
