<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%
    Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
    if (errors == null) errors = new java.util.HashMap<>();
    String vNom = (String) request.getAttribute("nom");
    String vPrenom = (String) request.getAttribute("prenom");
    String vLogin = (String) request.getAttribute("login");
    if (vNom == null) vNom = "";
    if (vPrenom == null) vPrenom = "";
    if (vLogin == null) vLogin = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ajouter un utilisateur</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/style.css?v=<%= System.currentTimeMillis() %>">
</head>
<body>
<main class="page">
    <section class="form-wrapper">
        <div class="card form-card">
            <div class="form-head">
                <h1>Ajouter un utilisateur</h1>
                <p class="subtitle">Créez un nouveau compte en remplissant les informations ci-dessous.</p>
            </div>

            <form method="post">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="nom">Nom</label>
                        <input type="text" name="nom" id="nom" value="<%= vNom %>" required>
                        <% if (errors.get("nom") != null) { %><span class="error"><%= errors.get("nom") %></span><% } %>
                    </div>
                    <div class="form-group">
                        <label for="prenom">Prénom</label>
                        <input type="text" name="prenom" id="prenom" value="<%= vPrenom %>" required>
                        <% if (errors.get("prenom") != null) { %><span class="error"><%= errors.get("prenom") %></span><% } %>
                    </div>
                    <div class="form-group full">
                        <label for="login">Login</label>
                        <input type="text" name="login" id="login" value="<%= vLogin %>" required>
                        <% if (errors.get("login") != null) { %><span class="error"><%= errors.get("login") %></span><% } %>
                    </div>
                    <div class="form-group full">
                        <label for="password">Mot de passe</label>
                        <input type="password" name="password" id="password" required>
                        <% if (errors.get("password") != null) { %><span class="error"><%= errors.get("password") %></span><% } %>
                    </div>
                </div>

                <div class="form-actions">
                    <input type="submit" class="btn-submit" value="Ajouter">
                    <a class="btn-ghost" href="<%= request.getContextPath() %>/list">Retour à la liste</a>
                </div>
            </form>
        </div>
    </section>
</main>
</body>
</html>
