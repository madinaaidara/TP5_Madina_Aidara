<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<h2 class="mb-4">
    <i class="bi bi-book"></i> Gestion des Cours
</h2>

<!-- Messages flash -->
<c:if test="${not empty message}">
    <div class="alert alert-${messageType} alert-dismissible fade show" role="alert">
        <i class="bi bi-${messageType == 'success' ? 'check-circle-fill' : 'exclamation-triangle-fill'}"></i>
            ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>

<!-- Barre de recherche et bouton ajouter -->
<div class="row mb-3">
    <div class="col-md-6">
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-search"></i></span>
            <input type="text" id="searchInput" class="form-control" placeholder="Rechercher un cours par code, intitulé ou enseignant...">
        </div>
    </div>
    <div class="col-md-6 text-end">
        <a href="${pageContext.request.contextPath}/cours?action=ajouter" class="btn btn-primary">
            <i class="bi bi-plus-circle"></i> Ajouter un nouveau cours
        </a>
    </div>
</div>

<!-- Tableau des cours -->
<div class="table-responsive">
    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>Code</th>
            <th>Intitulé du module</th>
            <th>Volume Crédits</th>
            <th>Enseignant Responsable</th>
            <th class="text-center">Actions</th>
        </tr>
        </thead>
        <tbody id="coursTableBody">
        <c:forEach var="cours" items="${listeCours}">
            <tr>
                <td><strong>${cours.code}</strong></td>
                <td>${cours.intitule}</td>
                <td>
                    <c:choose>
                        <c:when test="${cours.credits >= 3}">
                                <span class="badge bg-success">
                                    <i class="bi bi-star-fill"></i> ${cours.credits} Crédits
                                </span>
                        </c:when>
                        <c:when test="${cours.credits == 2}">
                                <span class="badge bg-warning text-dark">
                                    <i class="bi bi-star"></i> ${cours.credits} Crédits
                                </span>
                        </c:when>
                        <c:otherwise>
                                <span class="badge bg-danger">
                                    <i class="bi bi-star"></i> ${cours.credits} Crédit
                                </span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${cours.enseignant}</td>
                <td class="text-center">
                    <a href="${pageContext.request.contextPath}/cours?action=modifier&id=${cours.id}"
                       class="btn btn-sm btn-info" title="Modifier">
                        <i class="bi bi-pencil"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/cours?action=supprimer&id=${cours.id}"
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce cours ?')"
                       title="Supprimer">
                        <i class="bi bi-trash"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>

        <!-- Message si liste vide -->
        <c:if test="${empty listeCours}">
            <tr>
                <td colspan="5" class="text-center text-muted py-4">
                    <i class="bi bi-inbox" style="font-size: 2rem; display: block;"></i>
                    Aucun cours disponible
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>

<!-- Script pour la recherche en temps réel (BONUS) -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('searchInput');
        if (searchInput) {
            searchInput.addEventListener('keyup', function() {
                const searchText = this.value.toLowerCase().trim();
                const rows = document.querySelectorAll('#coursTableBody tr');
                let found = false;

                rows.forEach(row => {
                    const text = row.textContent.toLowerCase();
                    if (text.includes(searchText)) {
                        row.style.display = '';
                        found = true;
                    } else {
                        row.style.display = 'none';
                    }
                });

                // Afficher un message si aucun résultat
                const noResult = document.getElementById('noResult');
                if (!found && rows.length > 0) {
                    if (!noResult) {
                        const tr = document.createElement('tr');
                        tr.id = 'noResult';
                        tr.innerHTML = `<td colspan="5" class="text-center text-muted py-4">
                            <i class="bi bi-search" style="font-size: 2rem; display: block;"></i>
                            Aucun cours ne correspond à votre recherche
                        </td>`;
                        document.querySelector('#coursTableBody').appendChild(tr);
                    }
                } else if (noResult) {
                    noResult.remove();
                }
            });
        }
    });
</script>

<jsp:include page="footer.jsp"/>