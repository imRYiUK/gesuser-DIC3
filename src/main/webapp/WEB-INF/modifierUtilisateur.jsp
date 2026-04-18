<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.Utilisateur" %>
<%@ page import="java.util.Map" %>
<%
    Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
    if (errors == null) errors = new java.util.HashMap<>();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modifier un utilisateur</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/style.css?v=<%= System.currentTimeMillis() %>">
</head>
<body>
<% Utilisateur utilisateur = (Utilisateur) request.getAttribute("utilisateur"); %>
<main class="page">
    <section class="form-wrapper">
        <div class="card form-card">
            <div class="form-head">
                <h1>Modifier un utilisateur</h1>
                <p class="subtitle">Mettez à jour les informations du compte puis enregistrez les changements.</p>
            </div>

            <form action="<%= request.getContextPath() %>/update" method="post">
                <input type="hidden" name="id" value="<%= utilisateur.getId() %>">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="nom">Nom</label>
                        <input type="text" name="nom" id="nom" value="<%= utilisateur.getNom() == null ? "" : utilisateur.getNom().trim() %>" required>
                        <% if (errors.get("nom") != null) { %><span class="error"><%= errors.get("nom") %></span><% } %>
                    </div>
                    <div class="form-group">
                        <label for="prenom">Prénom</label>
                        <input type="text" name="prenom" id="prenom" value="<%= utilisateur.getPrenom() == null ? "" : utilisateur.getPrenom().trim() %>" required>
                        <% if (errors.get("prenom") != null) { %><span class="error"><%= errors.get("prenom") %></span><% } %>
                    </div>
                    <div class="form-group full">
                        <label for="login">Login</label>
                        <input type="text" name="login" id="login" value="<%= utilisateur.getLogin() == null ? "" : utilisateur.getLogin().trim() %>" required>
                        <% if (errors.get("login") != null) { %><span class="error"><%= errors.get("login") %></span><% } %>
                    </div>
                    <div class="form-group full">
                        <label for="password">Mot de passe</label>
                        <input type="password" name="password" id="password" value="<%= utilisateur.getPassword() %>" required>
                        <% if (errors.get("password") != null) { %><span class="error"><%= errors.get("password") %></span><% } %>
                    </div>
                </div>

                <div class="form-actions">
                    <input type="submit" class="btn-submit" value="Enregistrer">
                    <a class="btn-ghost" href="<%= request.getContextPath() %>/list">Retour à la liste</a>
                </div>
            </form>
        </div>
    </section>
</main>

</body>
</html>
