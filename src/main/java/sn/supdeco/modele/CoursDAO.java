package sn.supdeco.modele;

import java.util.ArrayList;
import java.util.List;

public class CoursDAO {
    // Simuler une base de données avec une liste
    private static List<Cours> coursList = new ArrayList<>();
    private static int idCounter = 1;

    // Bloc static pour initialiser avec des données de test
    static {
        coursList.add(new Cours(idCounter++, "JEE601", "Architecture Jakarta EE / Servlets", 4, "M. DIOP"));
        coursList.add(new Cours(idCounter++, "WEB602", "Développement Front-End", 2, "Mme. NDIAYE"));
        coursList.add(new Cours(idCounter++, "DB603", "Bases de Données Avancées", 1, "M. FAYE"));
    }

    // Récupérer tous les cours
    public List<Cours> getAllCours() {
        return new ArrayList<>(coursList);
    }

    // Récupérer un cours par son ID
    public Cours getCoursById(int id) {
        for (Cours cours : coursList) {
            if (cours.getId() == id) {
                return cours;
            }
        }
        return null;
    }

    // Ajouter un cours
    public boolean addCours(Cours cours) {
        cours.setId(idCounter++);
        return coursList.add(cours);
    }

    // Modifier un cours
    public boolean updateCours(Cours cours) {
        for (int i = 0; i < coursList.size(); i++) {
            if (coursList.get(i).getId() == cours.getId()) {
                coursList.set(i, cours);
                return true;
            }
        }
        return false;
    }

    // Supprimer un cours
    public boolean deleteCours(int id) {
        return coursList.removeIf(cours -> cours.getId() == id);
    }

    // Rechercher des cours (BONUS)
    public List<Cours> searchCours(String keyword) {
        List<Cours> result = new ArrayList<>();
        String lowerKeyword = keyword.toLowerCase();
        for (Cours cours : coursList) {
            if (cours.getCode().toLowerCase().contains(lowerKeyword) ||
                    cours.getIntitule().toLowerCase().contains(lowerKeyword) ||
                    cours.getEnseignant().toLowerCase().contains(lowerKeyword)) {
                result.add(cours);
            }
        }
        return result;
    }
}