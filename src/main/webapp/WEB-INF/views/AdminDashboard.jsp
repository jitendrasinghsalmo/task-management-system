<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Premium Admin Workspace</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root { 
            --bg-grad: linear-gradient(135deg, #0f172a 0%, #312e81 100%); 
            --card-bg: rgba(255,255,255,0.05); 
            --text-col: white;
        }
        [data-theme='light'] { 
            --bg-grad: linear-gradient(135deg, #e0e7ff 0%, #ffffff 100%); 
            --card-bg: rgba(0,0,0,0.03); 
            --text-col: #1e293b;
        }
        body { background: var(--bg-grad); color: var(--text-col); min-height: 100vh; transition: 0.5s; font-family: 'Plus Jakarta Sans', sans-serif; }
        .premium-card { background: var(--card-bg); backdrop-filter: blur(15px); border: 1px solid rgba(255,255,255,0.1); border-radius: 24px; padding: 30px; animation: fadeInUp 0.8s ease; }
        .pulse-icon { animation: pulse 2s infinite; color: #fbbf24; }
        @keyframes pulse { 0% { transform: scale(1); } 50% { transform: scale(1.2); } 100% { transform: scale(1); } }
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
    </style>
</head>
<body>

<div class="container py-5">
    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-5">
        <h2 class="fw-bold"><i class="fa-solid fa-shield-halved me-2 text-warning"></i>Admin Core Control</h2>
        <button class="btn btn-outline-light" onclick="toggleTheme()">
            <i class="fa-solid fa-circle-half-stroke me-2"></i>Toggle Mode
        </button>
    </div>

    <!-- Registry Card -->
    <div class="premium-card">
        <div class="d-flex justify-content-between mb-4">
            <h5 class="fw-bold"><i class="fa-solid fa-circle-notch pulse-icon me-2"></i>Live User Registry</h5>
            <form action="${pageContext.request.contextPath}/admin/dashboard" method="GET" class="d-flex">
                <input type="text" name="name" class="form-control me-2" placeholder="Search name..." value="${searchQuery}">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>

        <table class="table align-middle text-inherit">
            <thead>
                <tr><th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Status</th><th class="text-center">Action</th></tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${allUsers}">
                    <tr>
                        <td class="fw-bold text-info">#${u.id}</td>
                        <td class="fw-bold">${u.name}</td>
                        <td>${u.email}</td>
                        <td><span class="badge bg-primary">${u.role}</span></td>
                        <td>
                            <span class="badge ${u.active ? 'bg-success' : 'bg-danger'}">
                                ${u.active ? 'Active' : 'Blocked'}
                            </span>
                        </td>
                        <td class="text-center">
                            <c:choose>
                                <c:when test="${u.role == 'ADMIN'}"><small class="text-muted">No Action</small></c:when>
                                <c:otherwise>
                                    <div class="d-flex justify-content-center gap-2">
                                        <a href="${pageContext.request.contextPath}/admin/toggleStatus/${u.id}" 
                                           class="btn btn-sm ${u.active ? 'btn-outline-danger' : 'btn-outline-success'}">
                                           ${u.active ? 'Block User' : 'Unblock User'}
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/viewUserTasks/${u.id}" 
                                           class="btn btn-sm btn-outline-info">View Tasks</a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    function toggleTheme() {
        const html = document.documentElement;
        html.setAttribute('data-theme', html.getAttribute('data-theme') === 'light' ? 'dark' : 'light');
    }
</script>
</body>
</html>