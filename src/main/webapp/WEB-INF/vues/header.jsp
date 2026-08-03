<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supdeco Dakar - Gestion des Cours</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        .navbar-brand img {
            height: 40px;
            width: auto;
            object-fit: contain;
        }
        .logo-placeholder {
            display: inline-block;
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #1a237e, #0d47a1);
            border-radius: 8px;
            text-align: center;
            line-height: 40px;
            color: white;
            font-weight: bold;
            font-size: 18px;
        }
        .footer {
            margin-top: auto;
        }
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .main-content {
            flex: 1;
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4 shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/cours?action=liste">
            <!-- LOGO RÉEL -->
            <img src="${pageContext.request.contextPath}/assets/images/supdeco.jpg"
                 alt="Logo Supdeco Dakar"
                 height="40"
                 class="d-inline-block align-text-top me-2">
            <span class="text-white">Supdeco Dakar</span>
            <small class="text-info ms-2">JEE L3 Info</small>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/cours?action=liste">
                        <i class="bi bi-house"></i> Accueil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/cours?action=ajouter">
                        <i class="bi bi-plus-circle"></i> Ajouter
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Contenu principal -->
<div class="container main-content"> </div>