<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">
                    <i class="bi bi-${empty cours ? 'plus-circle' : 'pencil'}"></i>
                    ${empty cours ? 'Ajouter un nouveau cours' : 'Modifier un cours'}
                </h4>
            </div>
            <div class="card-body">
                <!-- Messages d'erreur -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-triangle-fill"></i> ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/cours" method="post" novalidate>
                    <input type="hidden" name="action" value="${empty cours ? 'ajouter' : 'modifier'}">
                    <input type="hidden" name="id" value="${cours.id}">

                    <div class="mb-3">
                        <label for="code" class="form-label fw-bold">
                            <i class="bi bi-code-square"></i> Code du cours
                        </label>
                        <input type="text" class="form-control" id="code" name="code"
                               value="${cours.code}" required minlength="5"
                               placeholder="Ex: JEE601"
                               pattern="[A-Za-z0-9]{5,}">
                        <div class="invalid-feedback">Le code est obligatoire (minimum 5 caractères alphanumériques)</div>
                        <small class="text-muted">Format: lettres et chiffres uniquement</small>
                    </div>

                    <div class="mb-3">
                        <label for="intitule" class="form-label fw-bold">
                            <i class="bi bi-book"></i> Intitulé du module
                        </label>
                        <input type="text" class="form-control" id="intitule" name="intitule"
                               value="${cours.intitule}" required minlength="5"
                               placeholder="Ex: Architecture Jakarta EE">
                        <div class="invalid-feedback">L'intitulé est obligatoire (minimum 5 caractères)</div>
                    </div>

                    <div class="mb-3">
                        <label for="credits" class="form-label fw-bold">
                            <i class="bi bi-star"></i> Crédits
                        </label>
                        <input type="number" class="form-control" id="credits" name="credits"
                               value="${cours.credits}" required min="1" max="10" step="1">
                        <div class="invalid-feedback">Les crédits doivent être entre 1 et 10</div>
                        <small class="text-muted">Valeur entre 1 et 10</small>
                    </div>

                    <div class="mb-3">
                        <label for="enseignant" class="form-label fw-bold">
                            <i class="bi bi-person"></i> Enseignant Responsable
                        </label>
                        <input type="text" class="form-control" id="enseignant" name="enseignant"
                               value="${cours.enseignant}" required
                               placeholder="Ex: M. DIOP">
                        <div class="invalid-feedback">L'enseignant est obligatoire</div>
                    </div>

                    <div class="d-flex gap-2 justify-content-end">
                        <a href="${pageContext.request.contextPath}/cours?action=liste" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> Annuler
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-save"></i> Enregistrer
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Validation côté client -->
<script>
    (function() {
        'use strict';
        const forms = document.querySelectorAll('form');
        forms.forEach(form => {
            form.addEventListener('submit', function(event) {
                if (!this.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                this.classList.add('was-validated');
            });
        });
    })();
</script>

<jsp:include page="footer.jsp"/>