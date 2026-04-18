package servlets;

import java.util.HashMap;
import java.util.Map;

import dao.UtilisateurDao;

public class UtilisateurValidator {

    private static final int MIN_NAME = 2;
    private static final int MAX_NAME = 50;
    private static final int MIN_LOGIN = 3;
    private static final int MAX_LOGIN = 30;
    private static final int MIN_PASSWORD = 6;

    public static Map<String, String> validate(String nom, String prenom, String login, String password,
                                               int excludeId) {
        Map<String, String> errors = new HashMap<>();

        if (isBlank(nom)) {
            errors.put("nom", "Le nom est obligatoire");
        } else if (nom.trim().length() < MIN_NAME || nom.trim().length() > MAX_NAME) {
            errors.put("nom", "Le nom doit contenir entre " + MIN_NAME + " et " + MAX_NAME + " caractères");
        } else if (!nom.trim().matches("[\\p{L} '-]+")) {
            errors.put("nom", "Le nom contient des caractères invalides");
        }

        if (isBlank(prenom)) {
            errors.put("prenom", "Le prénom est obligatoire");
        } else if (prenom.trim().length() < MIN_NAME || prenom.trim().length() > MAX_NAME) {
            errors.put("prenom", "Le prénom doit contenir entre " + MIN_NAME + " et " + MAX_NAME + " caractères");
        } else if (!prenom.trim().matches("[\\p{L} '-]+")) {
            errors.put("prenom", "Le prénom contient des caractères invalides");
        }

        if (isBlank(login)) {
            errors.put("login", "Le login est obligatoire");
        } else if (login.trim().length() < MIN_LOGIN || login.trim().length() > MAX_LOGIN) {
            errors.put("login", "Le login doit contenir entre " + MIN_LOGIN + " et " + MAX_LOGIN + " caractères");
        } else if (!login.trim().matches("[A-Za-z0-9._-]+")) {
            errors.put("login", "Le login ne doit contenir que des lettres, chiffres, points, tirets ou underscores");
        } else if (UtilisateurDao.loginExists(login.trim(), excludeId)) {
            errors.put("login", "Ce login est déjà utilisé");
        }

        if (isBlank(password)) {
            errors.put("password", "Le mot de passe est obligatoire");
        } else if (password.length() < MIN_PASSWORD) {
            errors.put("password", "Le mot de passe doit contenir au moins " + MIN_PASSWORD + " caractères");
        }

        return errors;
    }

    private static boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
}
