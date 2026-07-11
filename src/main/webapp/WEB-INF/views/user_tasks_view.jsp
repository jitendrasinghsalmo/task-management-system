<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Task Workspace</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { 
            background: linear-gradient(135deg, #0f172a 0%, #312e81 100%); 
            min-height: 100vh; 
            color: white; 
            font-family: 'Plus Jakarta Sans', sans-serif; 
        }
        .glass-card { 
            background: rgba(255, 255, 255, 0.07); 
            backdrop-filter: blur(15px); 
            border: 1px solid rgba(255, 255, 255, 0.1); 
            border-radius: 24px; 
            padding: 30px; 
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }
        .back-btn { 
            border: 1px solid rgba(255,255,255,0.2); 
            border-radius: 12px; 
            padding: 10px 20px; 
            color: white; 
            transition: 0.3s;
        }
        .back-btn:hover { background: rgba(255,255,255,0.1); color: #fbbf24; }
        .table { color: white !important; }
        .badge-status { padding: 6px 12px; border-radius: 8px; font-size: 0.85rem; }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="glass-card">
        <div class="d-flex align-items-center mb-4">
            <a href="${isAdmin ? pageContext.request.contextPath.concat('/admin/dashboard') : pageContext.request.contextPath.concat('/')}" 
               class="back-btn text-decoration-none">
                <i class="fa-solid fa-arrow-left me-2"></i>Back
            </a>
            <h3 class="ms-4 fw-bold">
                <i class="fa-solid fa-list-check text-warning me-2"></i>
                ${isAdmin ? 'Admin View: '.concat(user.name) : 'My Workspace'}
            </h3>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="text-secondary">
                    <tr>
                        <th>ID</th><th>Task Title</th><th>Status</th>
                        <c:if test="${isAdmin}"><th class="text-center">Action</th></c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${tasks}" var="t">
                        <tr>
                            <td class="text-info fw-bold">#${t.id}</td>
                            <td class="fw-bold">${t.taskName}</td>
                            <td>
                                <span class="badge ${t.status == 'Completed' ? 'bg-success' : 'bg-warning text-dark'} badge-status">
                                    ${t.status}
                                </span>
                            </td>
                            <c:if test="${isAdmin}">
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/deleteTask/${t.id}" 
                                       class="btn btn-sm btn-outline-danger" onclick="return confirm('Delete this?')">
                                       <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>