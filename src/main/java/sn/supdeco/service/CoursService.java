package sn.supdeco.service;

import sn.supdeco.modele.Cours;
import sn.supdeco.modele.CoursDAO;

import java.util.List;

public class CoursService {
    private CoursDAO coursDAO;

    public CoursService() {
        this.coursDAO = new CoursDAO();
    }

    // Récupérer tous les cours
    public List<Cours> getAllCours() {
        return coursDAO.getAllCours();
    }

    // Récupérer un cours par ID
    public Cours getCoursById(int id) {
        return coursDAO.getCoursById(id);
    }

    // Ajouter un cours
    public boolean ajouterCours(Cours cours) {
        if (cours == null || cours.getCode() == null || cours.getCode().isEmpty()) {
            return false;
        }
        return coursDAO.addCours(cours);
    }

    // Modifier un cours
    public boolean modifierCours(Cours cours) {
        if (cours == null || cours.getId() <= 0) {
            return false;
        }
        return coursDAO.updateCours(cours);
    }

    // Supprimer un cours
    public boolean supprimerCours(int id) {
        if (id <= 0) {
            return false;
        }
        return coursDAO.deleteCours(id);
    }

    // Rechercher des cours (BONUS)
    public List<Cours> rechercherCours(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return coursDAO.getAllCours();
        }
        return coursDAO.searchCours(keyword.trim());
    }
}