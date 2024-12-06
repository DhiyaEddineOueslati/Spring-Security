<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="header.jsp" %> 
<c:set var="cxt" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Livres</title>
    <style>
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

        h2 {
            color: #3a4a5e;
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 2px solid #f1f1f1;
        }

        th {
            background-color: #28a745;
            color: #fff;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            text-decoration: none;
            padding: 10px 15px;
            margin: 10px;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }

        .logout {
            background-color: #dc3545;
        }

        .logout:hover {
            background-color: #c82333;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .footer {
            text-align: center;
            font-size: 14px;
            color: #aaa;
            margin-top: 30px;
        }
    </style>
</head>

<body>

    <h2>Liste des livres</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Titre</th>
                <th>Emprunts</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="livre" items="${livres}">
                <tr>
                    <td>${livre.id}</td>
                    <td>${livre.titre}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/emprunts/livre/${livre.id}">Voir emprunts</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="button-container">
        <a href="${pageContext.request.contextPath}/livres/ajout">Ajouter un livre</a>
        <a href="${pageContext.request.contextPath}/logout" class="logout">Se déconnecter</a>
    </div>


</body>

</html>
