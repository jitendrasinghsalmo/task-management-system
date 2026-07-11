<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>View Tasks - Task Workspace</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2 family=Plus+Jakarta+Sans:wght@700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-brand: #3b82f6;
            --text-main: #ffffff;
            --luxury-gold-gradient: linear-gradient(135deg, #0f172a 0%, #451a03 40%, #78350f 70%, #b45309 100%);
            --solid-dark-card: #090f1c; 
            --id-highlight: #facc15; 
        }

        body {
            background: var(--luxury-gold-gradient);
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: var(--text-main);
            min-height: 100vh;
            padding: 30px 12px;
            -webkit-font-smoothing: antialiased;
        }

        .workspace-container {
            width: 100%;
            max-width: 1140px;
            margin: 0 auto;
        }

        /* ==========================================================================
           ⭐ SOLID ULTRA-CONTRAST CONTAINER
           ========================================================================== */
        .custom-board-card {
            background: var(--solid-dark-card) !important;
            border: 2px solid #b45309;
            border-radius: 24px;
            padding: 24px;
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.6);
        }

        /* Header Area with Left Top Corner Back Arrow */
        .card-header-workspace {
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid rgba(255, 255, 255, 0.1);
        }

        .back-arrow-btn {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            color: #ffffff !important;
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.08);
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid rgba(255, 255, 255, 0.15);
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .back-arrow-btn:hover {
            color: #00f2fe !important;
            border-color: #00f2fe;
            background: rgba(180, 83, 9, 0.3);
            transform: translateY(-50%) translateX(-3px);
            box-shadow: 0 0 12px rgba(0, 242, 254, 0.4);
        }

        /* Shiny Wave Text Animation for Title Header */
        .page-main-title {
            font-size: 1.8rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            margin: 0;
            background: linear-gradient(90deg, #ffffff, #facc15, #f59e0b, #ffffff);
            background-size: 200% auto;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: shinyWave 4s linear infinite;
        }

        @keyframes shinyWave {
            0% { background-position: 0% center; }
            100% { background-position: 200% center; }
        }

        /* ==========================================================================
           ⭐ SEARCH FIELD CONTRAST FIX - GUARANTEED 100% TEXT VISIBILITY
           ========================================================================== */
        .form-control-custom {
            background: #ffffff !important; /* ⭐ Pure white panel box so words pop out */
            border: 2px solid #cbd5e1 !important;
            color: #000000 !important; /* ⭐ Strict high-density solid black input typing text color */
            border-radius: 12px;
            height: 48px;
            font-weight: 800 !important; /* Heavy bold for readability */
            font-size: 1rem;
        }

        .form-control-custom:focus {
            border-color: #f59e0b !important;
            color: #000000 !important;
            box-shadow: 0 0 0 4px rgba(245, 158, 11, 0.3) !important;
        }

        /* Custom high visibility deep placeholder text color rules */
        .form-control-custom::placeholder {
            color: #475569 !important; /* Slate gray placeholder instead of invisible grey */
            font-weight: 700;
        }

        .form-select-custom {
            background: #111a2e url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23ffffff' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e") no-repeat right 1rem center/10px 10px !important;
            border: 2px solid rgba(255, 255, 255, 0.2) !important;
            color: #ffffff !important;
            border-radius: 12px;
            height: 48px;
            font-weight: 700;
        }

        /* Responsive encapsulated table structures */
        .table-responsive-custom {
            border-radius: 16px;
            overflow-x: auto; 
            border: 2px solid rgba(255, 255, 255, 0.12);
            background: #060b14; 
            -webkit-overflow-scrolling: touch;
        }

        .table-custom {
            margin-bottom: 0;
            color: #ffffff !important;
            white-space: nowrap; 
            width: 100%;
        }

        .table-custom thead {
            background: #0f172a !important;
        }

        .table-custom th {
            color: #cbd5e1 !important; 
            font-weight: 800;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.6px;
            padding: 16px;
            border-bottom: 2px solid rgba(255, 255, 255, 0.15) !important;
            text-align: center;
        }

        .table-custom td {
            padding: 16px 12px;
            font-weight: 700; 
            font-size: 0.98rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08) !important;
            vertical-align: middle;
            text-align: center;
        }

        .id-column-highlight {
            color: var(--id-highlight) !important;
            font-size: 1.05rem !important;
            font-weight: 800 !important;
            text-shadow: 0 0 10px rgba(250, 204, 21, 0.3);
        }

        /* Dynamic Hour Counter Indicator Spin Effect */
        .hour-log-indicator {
            color: #00f2fe !important;
            font-weight: 800;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .hour-log-indicator i {
            animation: loopClockSpin 4s linear infinite;
        }

        @keyframes loopClockSpin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .table-custom tbody tr:hover {
            background: rgba(255, 255, 255, 0.04) !important;
        }

        /* Badges configurations */
        .badge-custom {
            padding: 6px 12px;
            border-radius: 8px;
            font-weight: 800;
            font-size: 0.82rem;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .badge-pending { background: rgba(239, 68, 68, 0.2); color: #f87171; border: 1px solid #ef4444; }
        .badge-progress { background: rgba(234, 179, 8, 0.2); color: #fbbf24; border: 1px solid #eab308; }
        .badge-completed { background: rgba(34, 197, 94, 0.2); color: #4ade80; border: 1px solid #22c55e; }
        .badge-low { background: rgba(59, 130, 246, 0.2); color: #60a5fa; border: 1px solid #3b82f6; }

        /* Actions configuration block wrapper */
        .action-btn-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-action-edit {
            background-color: #eab308 !important;
            color: #000000 !important;
            font-weight: 800;
            border-radius: 8px;
            padding: 6px 14px;
            border: none;
            font-size: 0.88rem;
            text-decoration: none;
        }
        .btn-action-edit:hover { background-color: #ca8a04 !important; }

        .btn-action-drop {
            background-color: #ef4444 !important;
            color: #ffffff !important;
            font-weight: 800;
            border-radius: 8px;
            padding: 6px 14px;
            border: none;
            font-size: 0.88rem;
            text-decoration: none;
        }
        .btn-action-drop:hover { background-color: #b91c1c !important; }

        .btn-action-search { background: #1e293b !important; color: #ffffff !important; font-weight: 800; border-radius: 12px; height: 48px; padding: 0 24px; border: none; }
        .btn-action-search:hover { background: #000000 !important; }
        .btn-action-add { background: linear-gradient(135deg, #10b981 0%, #059669 100%); color: white !important; font-weight: 800; border-radius: 12px; padding: 12px 24px; border: none; text-decoration: none; display: inline-flex; align-items: center; }
        .btn-action-refresh { background: rgba(255, 255, 255, 0.05); color: #ffffff !important; font-weight: 800; border-radius: 12px; padding: 10px 22px; border: 2px solid rgba(255, 255, 255, 0.15); text-decoration: none; }
        .btn-action-delete-all { background: rgba(239, 68, 68, 0.12); color: #f87171 !important; font-weight: 800; border-radius: 12px; padding: 10px 22px; border: 2px solid rgba(239, 68, 68, 0.25); text-decoration: none; }

        /* Pagination Elements formatting */
        .page-link-custom {
            background: #111a2e !important;
            border: 2px solid rgba(255, 255, 255, 0.15) !important;
            color: #ffffff !important;
            font-weight: 800;
            padding: 8px 16px;
            border-radius: 10px;
        }
        .page-item.active .page-link-custom {
            background: linear-gradient(135deg, #eab308, #ca8a04) !important;
            border-color: #ca8a04 !important;
            color: #ffffff !important;
        }
    </style>

    <script>
        function handleSortChange(selectElement) {
            const val = selectElement.value;
            let sortBy = "id";
            let direction = "desc";

            if (val === "latest") { sortBy = "id"; direction = "desc"; }
            else if (val === "oldest") { sortBy = "id"; direction = "asc"; }
            else if (val === "nameAsc") { sortBy = "taskName"; direction = "asc"; }
            else if (val === "nameDesc") { sortBy = "taskName"; direction = "desc"; }
            else if (val === "durationAsc") { sortBy = "duration"; direction = "asc"; }
            else if (val === "durationDesc") { sortBy = "duration"; direction = "desc"; }
            else if (val === "statusAsc") { sortBy = "status"; direction = "asc"; }
            else if (val === "statusDesc") { sortBy = "status"; direction = "desc"; }
            else if (val === "priorityAsc") { sortBy = "priority"; direction = "asc"; }
            else if (val === "priorityDesc") { sortBy = "priority"; direction = "desc"; }

            document.getElementById("sortByHidden").value = sortBy;
            document.getElementById("directionHidden").value = direction;
            document.getElementById("sortForm").submit();
        }
    </script>
</head>
<body>

<div class="workspace-container">
    <div class="custom-board-card">
        
        <div class="card-header-workspace">
            <a href="${pageContext.request.contextPath}/" class="back-arrow-btn" title="Back Home">
                <i class="fa-solid fa-arrow-left"></i>
            </a>
            <h3 class="page-main-title">Task Management Operations</h3>
        </div>

        <div class="row g-3 mb-4">
            <div class="col-md-6">
                <form action="${pageContext.request.contextPath}/viewTasks" method="get">
                    <input type="hidden" name="sortBy" value="${sortBy}">
                    <input type="hidden" name="direction" value="${direction}">
                    
                    <div class="input-group">
                        <input type="text" class="form-control form-control-custom" name="keyword" value="${keyword}" placeholder="Search Task Name..." required>
                        <button class="btn btn-action-search" type="submit">
                            <i class="fa-solid fa-magnifying-glass me-2"></i>Find Task
                        </button>
                    </div>
                </form>
            </div>

            <div class="col-md-6">
                <form id="sortForm" action="${pageContext.request.contextPath}/viewTasks" method="get">
                    <input type="hidden" name="keyword" value="${keyword}">
                    <input type="hidden" id="sortByHidden" name="sortBy" value="${sortBy}">
                    <input type="hidden" id="directionHidden" name="direction" value="${direction}">
                    
                    <select class="form-select form-select-custom" onchange="handleSortChange(this)">
                        <option value="latest" ${sortBy == 'id' && direction == 'desc' ? 'selected' : ''}>Newest First</option>
                        <option value="oldest" ${sortBy == 'id' && direction == 'asc' ? 'selected' : ''}>Oldest First</option>
                        <option value="nameAsc" ${sortBy == 'taskName' && direction == 'asc' ? 'selected' : ''}>Task Name (A-Z)</option>
                        <option value="nameDesc" ${sortBy == 'taskName' && direction == 'desc' ? 'selected' : ''}>Task Name (Z-A)</option>
                        <option value="durationAsc" ${sortBy == 'duration' && direction == 'asc' ? 'selected' : ''}>Duration Low-High</option>
                        <option value="durationDesc" ${sortBy == 'duration' && direction == 'desc' ? 'selected' : ''}>Duration High-Low</option>
                        <option value="statusAsc" ${sortBy == 'status' && direction == 'asc' ? 'selected' : ''}>Status (A-Z)</option>
                        <option value="statusDesc" ${sortBy == 'status' && direction == 'desc' ? 'selected' : ''}>Status (Z-A)</option>
                        <option value="priorityAsc" ${sortBy == 'priority' && direction == 'asc' ? 'selected' : ''}>Priority (A-Z)</option>
                        <option value="priorityDesc" ${sortBy == 'priority' && direction == 'desc' ? 'selected' : ''}>Priority (Z-A)</option>
                    </select>
                </form>
            </div>
        </div>

        <div class="d-flex gap-2 flex-wrap mb-4">
            <a href="${pageContext.request.contextPath}/addTask" class="btn-action-add"><i class="fa-solid fa-plus me-2"></i>Add New Task</a>
            <a href="${pageContext.request.contextPath}/viewTasks" class="btn-action-refresh"><i class="fa-solid fa-rotate me-1"></i> Refresh Grid</a>
            <a href="${pageContext.request.contextPath}/deleteAll" class="btn-action-delete-all" onclick="return confirm('Delete all tasks?')"><i class="fa-solid fa-trash-can me-1"></i> Delete All Records</a>
        </div>

        <div class="table-responsive table-responsive-custom">
            <table class="table table-dark table-striped table-hover table-custom align-middle">
                <thead>
                    <tr>
                        <th style="width: 90px;">Task ID</th>
                        <th class="text-start">Task Title Description</th>
                        <th>Logged Duration</th>
                        <th>Status Badge</th>
                        <th>Priority Trapping</th>
                        <th>Due Target Date</th>
                        <th style="width: 180px;">Control Actions</th> 
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty tasks}">
                            <c:forEach items="${tasks}" var="t">
                                <tr>
                                    <td class="id-column-highlight">#${t.id}</td>
                                    <td class="text-start text-white fw-bold">${t.taskName}</td>
                                    <td>
                                        <span class="hour-log-indicator">
                                            <i class="fa-solid fa-stopwatch"></i> ${t.duration} Hours
                                        </span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${t.status == 'Pending'}">
                                                <span class="badge-custom badge-pending">Pending</span>
                                            </c:when>
                                            <c:when test="${t.status == 'In Progress'}">
                                                <span class="badge-custom badge-progress">In Progress</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge-custom badge-completed">Completed</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${t.priority == 'High'}">
                                                <span class="badge-custom badge-pending">High</span>
                                            </c:when>
                                            <c:when test="${t.priority == 'Medium'}">
                                                <span class="badge-custom badge-progress">Medium</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge-custom badge-low">Low</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-white fw-bold"><i class="fa-regular fa-calendar text-info me-2"></i>${t.dueDate}</td>
                                    <td>
                                        <div class="action-btn-wrapper">
                                            <a href="${pageContext.request.contextPath}/editTask/${t.id}" class="btn-action-edit"><i class="fa-solid fa-pen"></i> Edit</a>
                                            <a href="${pageContext.request.contextPath}/deleteTask/${t.id}" class="btn-action-drop" onclick="return confirm('Delete this task?')"><i class="fa-solid fa-trash"></i> Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="7" class="text-center text-danger fw-bold py-5">
                                    <i class="fa-solid fa-folder-open fa-2x d-block mb-2 opacity-50"></i>
                                    No Operational Tasks Found In Active Server Schema
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <c:if test="${totalPages > 1}">
            <nav class="mt-4">
                <ul class="pagination justify-content-center gap-1">
                    <c:if test="${currentPage > 0}">
                        <li class="page-item">
                            <a class="page-link page-link-custom" href="${pageContext.request.contextPath}/viewTasks?page=${currentPage-1}&size=${size}&keyword=${keyword}&sortBy=${sortBy}&direction=${direction}"><i class="fa-solid fa-chevron-left"></i></a>
                        </li>
                    </c:if>

                    <c:forEach begin="0" end="${totalPages-1}" var="i">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link page-link-custom" href="${pageContext.request.contextPath}/viewTasks?page=${i}&size=${size}&keyword=${keyword}&sortBy=${sortBy}&direction=${direction}">${i+1}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages-1}">
                        <li class="page-item">
                            <a class="page-link page-link-custom" href="${pageContext.request.contextPath}/viewTasks?page=${currentPage+1}&size=${size}&keyword=${keyword}&sortBy=${sortBy}&direction=${direction}"><i class="fa-solid fa-chevron-right"></i></a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </c:if>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>