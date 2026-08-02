package sn.supdeco.controller;

import sn.supdeco.modele.Cours;
import sn.supdeco.service.CoursService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/cours")
public class CoursController extends HttpServlet {

    private CoursService coursService;

    @Override
    public void init() throws ServletException {
        coursService = new CoursService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            action = "liste";
        }

        try {
            switch (action) {
                case "ajouter":
                    // Afficher le formulaire d'ajout
                    request.getRequestDispatcher("/WEB-INF/vues/form_cours.jsp")
                            .forward(request, response);
                    break;

                case "modifier":
                    // Afficher le formulaire de modification
                    String idParam = request.getParameter("id");
                    if (idParam != null && !idParam.isEmpty()) {
                        int id = Integer.parseInt(idParam);
                        Cours cours = coursService.getCoursById(id);
                        if (cours != null) {
                            request.setAttribute("cours", cours);
                            request.getRequestDispatcher("/WEB-INF/vues/form_cours.jsp")
                                    .forward(request, response);
                        } else {
                            request.getSession().setAttribute("message", "Cours non trouvé");
                            request.getSession().setAttribute("messageType", "danger");
                            response.sendRedirect(request.getContextPath() + "/cours?action=liste");
                        }
                    }
                    break;

                case "supprimer":
                    // Supprimer un cours
                    String idSuppr = request.getParameter("id");
                    if (idSuppr != null && !idSuppr.isEmpty()) {
                        int idSupprInt = Integer.parseInt(idSuppr);
                        if (coursService.supprimerCours(idSupprInt)) {
                            request.getSession().setAttribute("message", "Cours supprimé avec succès !");
                            request.getSession().setAttribute("messageType", "success");
                        } else {
                            request.getSession().setAttribute("message", "Erreur lors de la suppression");
                            request.getSession().setAttribute("messageType", "danger");
                        }
                    }
                    response.sendRedirect(request.getContextPath() + "/cours?action=liste");
                    break;

                case "rechercher":
                    // Recherche (BONUS)
                    String keyword = request.getParameter("keyword");
                    List<Cours> resultats = coursService.rechercherCours(keyword);
                    request.setAttribute("listeCours", resultats);
                    request.getRequestDispatcher("/WEB-INF/vues/liste_cours.jsp")
                            .forward(request, response);
                    break;

                default: // liste
                    // Afficher la liste des cours
                    List<Cours> listeCours = coursService.getAllCours();
                    request.setAttribute("listeCours", listeCours);

                    // Récupérer les messages flash de la session
                    String message = (String) request.getSession().getAttribute("message");
                    String messageType = (String) request.getSession().getAttribute("messageType");

                    if (message != null) {
                        request.setAttribute("message", message);
                        request.setAttribute("messageType", messageType != null ? messageType : "info");
                        // Supprimer les messages de la session
                        request.getSession().removeAttribute("message");
                        request.getSession().removeAttribute("messageType");
                    }

                    request.getRequestDispatcher("/WEB-INF/vues/liste_cours.jsp")
                            .forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Une erreur est survenue : " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/vues/liste_cours.jsp")
                    .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            // Récupération des paramètres
            String code = request.getParameter("code");
            String intitule = request.getParameter("intitule");
            String creditsStr = request.getParameter("credits");
            String enseignant = request.getParameter("enseignant");

            // Validation des champs
            if (code == null || code.trim().isEmpty() ||
                    intitule == null || intitule.trim().isEmpty() ||
                    creditsStr == null || creditsStr.trim().isEmpty() ||
                    enseignant == null || enseignant.trim().isEmpty()) {

                request.setAttribute("error", "Tous les champs sont obligatoires");
                request.getRequestDispatcher("/WEB-INF/vues/form_cours.jsp")
                        .forward(request, response);
                return;
            }

            // Conversion des crédits
            int credits = Integer.parseInt(creditsStr);
            if (credits < 1 || credits > 10) {
                request.setAttribute("error", "Les crédits doivent être entre 1 et 10");
                request.getRequestDispatcher("/WEB-INF/vues/form_cours.jsp")
                        .forward(request, response);
                return;
            }

            Cours cours = new Cours(code.trim(), intitule.trim(), credits, enseignant.trim());

            if ("ajouter".equals(action)) {
                // Ajouter un nouveau cours
                if (coursService.ajouterCours(cours)) {
                    request.getSession().setAttribute("message", "Cours ajouté avec succès !");
                    request.getSession().setAttribute("messageType", "success");
                } else {
                    request.getSession().setAttribute("message", "Erreur lors de l'ajout du cours");
                    request.getSession().setAttribute("messageType", "danger");
                }
            } else if ("modifier".equals(action)) {
                // Modifier un cours
                String idParam = request.getParameter("id");
                if (idParam != null && !idParam.isEmpty()) {
                    int id = Integer.parseInt(idParam);
                    cours.setId(id);
                    if (coursService.modifierCours(cours)) {
                        request.getSession().setAttribute("message", "Cours modifié avec succès !");
                        request.getSession().setAttribute("messageType", "success");
                    } else {
                        request.getSession().setAttribute("message", "Erreur lors de la modification");
                        request.getSession().setAttribute("messageType", "danger");
                    }
                }
            }

            response.sendRedirect(request.getContextPath() + "/cours?action=liste");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Format de crédits invalide");
            request.getRequestDispatcher("/WEB-INF/vues/form_cours.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Une erreur est survenue : " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/vues/form_cours.jsp")
                    .forward(request, response);
        }
    }
}