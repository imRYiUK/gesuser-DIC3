<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="beans.Utilisateur" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Liste des utilisateurs</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/style.css?v=<%= System.currentTimeMillis() %>">
</head>
<body>
<main class="page">
    <header class="page-header">
        <div class="title-block">
            <h1>Gestion des utilisateurs</h1>
            <p>Tableau de bord des comptes, avec actions rapides de modification et suppression.</p>
        </div>
        <div class="action-row">
            <a class="btn-add" href="<%= request.getContextPath() %>/add">Ajouter un utilisateur</a>
        </div>
    </header>

<%
    List<Utilisateur> utilisateurs = (List<Utilisateur>) request.getAttribute("utilisateurs");

    String message = request.getParameter("message");
    String status  = request.getParameter("status");
    if (message != null && status != null) {
%>
    <div class="message <%= status.equals("success") ? "success" : "error" %>">
        <%= message %>
    </div>
<%
    }

    if (utilisateurs == null || utilisateurs.isEmpty()) {
%>
    <section class="card empty-state">
        <h2>Aucun utilisateur trouvé</h2>
        <p>Commencez par créer le premier utilisateur pour initialiser la base.</p>
        <a class="btn" href="<%= request.getContextPath() %>/add">Créer un utilisateur</a>
    </section>
<%
    } else {
%>
    <section class="card table-card">
        <table class="data-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Login</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (Utilisateur u : utilisateurs) {
            %>
                <tr>
                    <td data-label="ID"><span class="id-pill"><%= u.getId() %></span></td>
                    <td data-label="Nom"><%= u.getNom() %></td>
                    <td data-label="Prénom"><%= u.getPrenom() %></td>
                    <td data-label="Login"><%= u.getLogin() %></td>
                    <td data-label="Actions">
                        <div class="actions">
                            <a class="btn-edit" href="<%= request.getContextPath() %>/update?id=<%= u.getId() %>">Modifier</a>
                            <a class="btn-delete" href="<%= request.getContextPath() %>/delete?id=<%= u.getId() %>">Supprimer</a>
                        </div>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </section>
<%
    }
%>
</main>
</body>
</html>
