<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Workspace - Streamline Your Productivity</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            /* ⭐ DEFAULT DARK THEME VARIABLES (ORIGINAL BLUE THEME) */
            --blue-gradient: linear-gradient(135deg, #0b1329 0%, #111e40 40%, #1e3c72 100%);
            --solid-dark-card: #0c1524; 
            --navbar-bg: #090f21;
            --navbar-border: rgba(255, 255, 255, 0.15);
            --text-heading: #ffffff;
            --text-para: #ffffff;
            --card-border-line: #3b82f6;
            --badge-pill-bg: #112824;
            --keyword-highlight: #00f2fe;
            --text-muted-config: #ffffff;
        }

        [data-theme="light"] {
            /* ⭐ TOGGLED LIGHT THEME VARIABLES (RICH HALDI YELLOW THEME MATCH) */
            --blue-gradient: linear-gradient(135deg, #eab308 0%, #f59e0b 50%, #ca8a04 100%);
            --solid-dark-card: #ffffff;
            --navbar-bg: #ffffff;
            --navbar-border: #cbd5e1;
            --text-heading: #000000;
            --text-para: #000000; /* ⭐ Fixed text hide issue in light mode completely */
            --card-border-line: #78350f;
            --badge-pill-bg: #fee2e2;
            --keyword-highlight: #b45309;
            --text-muted-config: #475569;
        }

        body {
            background: var(--blue-gradient);
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: var(--text-heading);
            min-height: 100vh;
            overflow-x: hidden;
            transition: background 0.4s ease, color 0.4s ease;
        }

        .main-wrapper {
            padding-top: 110px; 
        }

        /* ==========================================================================
           ⭐ NAVIGATION BAR LAYOUT WITH STATE TOGGLES
           ========================================================================== */
        .navbar-container {
            position: fixed;
            top: 16px;
            left: 0;
            right: 0;
            z-index: 1050;
            padding: 0 1.5rem;
        }

        .custom-navbar {
            background: var(--navbar-bg) !important; 
            border: 2px solid var(--navbar-border);
            border-radius: 20px;
            padding: 0.6rem 1.5rem;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.6);
            transition: all 0.4s ease;
        }

        .navbar-brand {
            font-weight: 800;
            color: var(--text-heading) !important;
            letter-spacing: -0.5px;
        }

        .brand-logo-box {
            background: linear-gradient(135deg, #3b82f6, #06b6d4);
            color: white !important;
            width: 36px;
            height: 36px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .custom-nav-link {
            color: var(--text-heading) !important;
            font-weight: 700;
            font-size: 0.92rem;
            padding: 0.5rem 1rem !important;
            border-radius: 10px;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .custom-nav-link:hover {
            background: rgba(255, 255, 255, 0.15);
        }
        [data-theme="light"] .custom-nav-link:hover {
            background: rgba(0, 0, 0, 0.05);
        }

        /* ⭐ NAV THEME ICON TRIGGER CONTROLLER */
        .theme-switch-nav-btn {
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid var(--navbar-border);
            color: var(--text-heading);
            width: 38px;
            height: 38px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
        }
        [data-theme="light"] .theme-switch-nav-btn {
            background: #e2e8f0;
            color: #000000;
        }

        .profile-dropdown-btn {
            background: rgba(255, 255, 255, 0.15);
            border: 2px solid var(--navbar-border);
            padding: 6px 14px 6px 6px;
            border-radius: 100px;
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            position: relative;
        }
        [data-theme="light"] .profile-dropdown-btn {
            background: #f1f5f9;
            border-color: #cbd5e1;
        }

        .avatar-circle {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: linear-gradient(135deg, #3b82f6, #06b6d4);
            color: white;
            font-weight: 700;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .live-green-dot {
            width: 10px;
            height: 10px;
            background-color: #10b981;
            border-radius: 50%;
            border: 2px solid #070b19;
            position: absolute;
            bottom: 2px;
            left: 28px;
            z-index: 5;
            box-shadow: 0 0 10px #10b981;
        }

        .custom-dropdown-menu {
            background: var(--solid-dark-card) !important;
            border: 2px solid var(--navbar-border);
            border-radius: 18px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.6);
            padding: 0.6rem;
            min-width: 250px;
            margin-top: 14px !important;
        }

        .dropdown-user-details {
            background: rgba(0, 0, 0, 0.4);
            border-radius: 12px;
            padding: 0.75rem;
            border: 1px solid var(--navbar-border);
        }
        [data-theme="light"] .dropdown-user-details {
            background: #f8fafc;
        }

        .custom-dropdown-menu .dropdown-item {
            color: var(--text-heading) !important;
            font-size: 0.9rem;
            font-weight: 700;
            padding: 0.65rem 1rem;
            border-radius: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .custom-dropdown-menu .dropdown-item:hover {
            background: rgba(255, 255, 255, 0.1);
        }
        [data-theme="light"] .custom-dropdown-menu .dropdown-item:hover {
            background: #f1f5f9;
        }

        .dropdown-item-logout {
            border-radius: 12px;
            padding: 0.7rem 1rem;
            font-size: 0.9rem;
            font-weight: 700;
            color: #f87171 !important;
            background: rgba(239, 68, 68, 0.2);
            display: flex;
            align-items: center;
            justify-content: space-between;
            text-decoration: none;
        }

        /* ==========================================================================
           ⭐ HERO CONFIGURATIONS BREATHING SYSTEMS
           ========================================================================== */
        .hero-section {
            padding: 40px 0 80px 0;
        }

        .hero-badge {
            background: rgba(59, 130, 246, 0.3);
            color: #38bdf8;
            padding: 10px 20px;
            border-radius: 100px;
            font-weight: 800;
            font-size: 0.92rem;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            border: 2px solid rgba(59, 130, 246, 0.5);
            margin-bottom: 24px;
        }
        [data-theme="light"] .hero-badge {
            background: #fee2e2;
            color: #b45309;
            border-color: #ca8a04;
        }

        .hero-title {
            font-size: 3.8rem;
            font-weight: 800;
            line-height: 1.15;
            letter-spacing: -1.5px;
            color: var(--text-heading);
            margin-bottom: 24px;
        }

        .hero-title span {
            background: linear-gradient(135deg, #3b82f6 0%, #00f2fe 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        [data-theme="light"] .hero-title span {
            background: linear-gradient(135deg, #78350f 0%, #b45309 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero-desc-text {
            color: var(--text-para) !important;
            font-size: 1.15rem;
            line-height: 1.6;
            font-weight: 700;
            max-width: 540px;
            border-left: 5px solid #00f2fe;
            padding-left: 16px;
            margin-bottom: 32px;
        }
        [data-theme="light"] .hero-desc-text {
            border-left-color: #ca8a04;
        }

        .image-animation-container {
            position: relative;
            display: inline-block;
        }

        .animated-hero-img {
            max-height: 350px;
            z-index: 2;
            position: relative;
            animation: breatheAnimation 4s ease-in-out infinite;
            filter: drop-shadow(0 0 25px rgba(0, 242, 254, 0.35));
        }

        @keyframes breatheAnimation {
            0% { transform: scale(1); }
            50% { transform: scale(1.06); }
            100% { transform: scale(1); }
        }

        .image-hour-badge {
            position: absolute;
            bottom: -5px;
            right: 5px;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: white;
            font-weight: 800;
            padding: 10px 20px;
            border-radius: 50px;
            font-size: 0.92rem;
            z-index: 5;
            box-shadow: 0 8px 24px rgba(16, 185, 129, 0.4);
            border: 2px solid #ffffff;
        }

        /* ==========================================================================
           ⭐ CARDS SYSTEMS MAPS - CARTS SPECIFIC MATRIX PRESERVED
           ========================================================================== */
        .stats-card-box {
            background: var(--solid-dark-card) !important; 
            border: 2px solid var(--card-border-line); 
            border-radius: 20px;
            padding: 24px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
            height: 100%;
            transition: all 0.4s ease;
        }

        .stat-number-text {
            font-size: 2.2rem;
            font-weight: 800;
            color: var(--text-heading) !important;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .stat-label-text {
            color: #00f2fe !important; 
            font-size: 1.25rem;
            font-weight: 800;
            letter-spacing: 0.5px;
            margin-top: 8px;
            margin-bottom: 8px;
        }
        [data-theme="light"] .stat-label-text { color: #b45309 !important; }

        .stat-subtext-clear, .tech-description-text {
            color: var(--text-para) !important; 
            font-size: 0.98rem;
            font-weight: 700;
            line-height: 1.6;
        }

        /* Asymmetric visual mapping cards */
        .capabilities-glow-card {
            background: var(--solid-dark-card) !important;
            border: 1px solid rgba(255,255,255,0.1);
            border-left: 5px solid #00f2fe; 
            border-radius: 4px 24px 4px 24px; 
            padding: 26px 24px;
            transition: all 0.3s ease;
            height: 100%;
            box-shadow: 0 10px 25px rgba(0,0,0,0.4);
        }
        [data-theme="light"] .capabilities-glow-card {
            border-color: #cbd5e1;
            border-left-color: #78350f;
        }

        .capabilities-glow-card:hover {
            transform: translateY(-5px);
        }

        .highlight-keyword {
            color: var(--keyword-highlight) !important;
            font-weight: 800;
        }

        /* ⭐ GLOBAL HOUR PILL IMPLEMENTATION ACROSS MATRIX MODULES */
        .hour-badge-pill {
            background: var(--badge-pill-bg);
            color: #10b981 !important;
            border: 1px solid #10b981;
            font-weight: 800;
            padding: 5px 12px;
            border-radius: 6px;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            margin-top: 14px;
        }
        [data-theme="light"] .hour-badge-pill {
            color: #15803d !important;
            border-color: #22c55e;
        }

        /* Industrial Slot slips horizontal workflow matrix */
        .workflow-slip-card {
            background: var(--solid-dark-card) !important; 
            border: 2px solid var(--navbar-border);
            border-radius: 16px;
            padding: 24px;
            transition: all 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 0 8px 24px rgba(0,0,0,0.3);
        }

        .step-badge-counter {
            background: linear-gradient(135deg, #3b82f6, #00f2fe);
            color: white;
            font-weight: 800;
            width: 36px;
            height: 36px;
            border-radius: 10px; 
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            margin-bottom: 12px;
        }

        /* Technology framework grid cards */
        .tech-card {
            background: var(--solid-dark-card) !important; 
            border: 2px solid var(--navbar-border);
            border-radius: 20px;
            padding: 24px;
            transition: all 0.3s ease;
            height: 100%;
        }

        .tech-card:hover { transform: translateY(-5px); }

        .tech-card.card-java { border-color: #ef4444; }
        .tech-card.card-spring { border-color: #22c55e; }
        .tech-card.card-security { border-color: #0ea5e9; }
        .tech-card.card-postgres { border-color: #3b82f6; }
        .tech-card.card-bootstrap { border-color: #a855f7; }
        .tech-card.card-html { border-color: #f97316; }
        .tech-card.card-css { border-color: #06b6d4; }
        .tech-card.card-js { border-color: #eab308; }
        .tech-card.card-jsp { border-color: #64748b; }

        .tech-card-header { display: flex; align-items: center; gap: 16px; margin-bottom: 1rem; }
        .tech-icon-wrapper { width: 52px; height: 52px; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 1.75rem; flex-shrink: 0; }

        .tech-sub-header {
            color: var(--text-muted-config) !important; 
            font-weight: 800 !important;
            font-size: 0.98rem !important;
            display: block;
            margin-top: 4px;
            letter-spacing: 0.5px;
        }

        .text-java-head { color: #f87171 !important; font-weight: 800; font-size: 1.35rem; }
        .text-spring-head { color: #4ade80 !important; font-weight: 800; font-size: 1.35rem; }
        .text-security-head { color: #38bdf8 !important; font-weight: 800; font-size: 1.35rem; }
        [data-theme="light"] .text-java-head { color: #b91c1c !important; }
        [data-theme="light"] .text-spring-head { color: #15803d !important; }
        [data-theme="light"] .text-security-head { color: #1d4ed8 !important; }

        .icon-java-wrap { background: rgba(239, 68, 68, 0.25); color: #ef4444; }
        .icon-spring-wrap { background: rgba(34, 197, 94, 0.25); color: #22c55e; }
        .icon-security-wrap { background: rgba(14, 165, 233, 0.25); color: #0ea5e9; }
        .icon-postgres-wrap { background: rgba(59, 130, 246, 0.25); color: #3b82f6; }
        .icon-bootstrap-wrap { background: rgba(168, 85, 247, 0.25); color: #a855f7; }
        .icon-html-wrap { background: rgba(249, 115, 22, 0.25); color: #f97316; }
        .icon-css-wrap { background: rgba(6, 182, 212, 0.25); color: #06b6d4; }
        .icon-js-wrap { background: rgba(234, 179, 8, 0.25); color: #eab308; }
        .icon-jsp-wrap { background: rgba(100, 116, 139, 0.25); color: #64748b; }

        /* Triggers Buttons styles */
        .btn-brand-primary { background: linear-gradient(135deg, #3b82f6, #2563eb); color: white !important; border: none; border-radius: 12px; padding: 12px 28px; font-weight: 700; box-shadow: 0 4px 14px rgba(59, 130, 246, 0.3); }
        .btn-brand-success { background: linear-gradient(135deg, #10b981, #059669); color: white !important; border: none; border-radius: 12px; padding: 12px 28px; font-weight: 700; box-shadow: 0 4px 14px rgba(16, 185, 129, 0.3); }
        .btn-workspace-view { background: linear-gradient(135deg, #6366f1, #4f46e5); color: white !important; border: none; border-radius: 12px; padding: 12px 28px; font-weight: 700; box-shadow: 0 4px 14px rgba(99, 102, 241, 0.3); }
        .btn-secondary-custom { background-color: rgba(255,255,255,0.05); color: var(--text-heading); border: 2px solid var(--navbar-border); border-radius: 12px; padding: 12px 28px; font-weight: 700; }

        .highlight-footer { background-color: #060911; color: #cbd5e1; padding: 4rem 0 2.5rem 0; margin-top: 120px; border-top: 4px solid #3b82f6; }
        .footer-brand-title { color: #ffffff !important; font-weight: 800; font-size: 1.4rem; }
        .footer-highlight-text { color: #ffffff; font-weight: 800; }
        .footer-description-highlight { color: #ffffff !important; font-size: 0.98rem; line-height: 1.6; font-weight: 500; }
        .footer-copyright-highlight { color: #38bdf8 !important; font-weight: 700; font-size: 0.98rem; }
    </style>

    <script>
        // ⭐ THEME TOGGLE ENGINE SWITCH ROUTINE
        function toggleHomeThemeMode() {
            const currentTheme = document.documentElement.getAttribute("data-theme");
            const targetTheme = currentTheme === "light" ? "dark" : "light";
            document.documentElement.setAttribute("data-theme", targetTheme);
            
            const modeIcon = document.getElementById("navThemeIcon");
            if (targetTheme === "light") {
                modeIcon.classList.replace("fa-sun", "fa-moon");
            } else {
                modeIcon.classList.replace("fa-moon", "fa-sun");
            }
        }
    </script>
</head>
<body data-theme="dark">

<div class="navbar-container">
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container-fluid p-0">
            
            <a class="navbar-brand d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/">
                <div class="brand-logo-box"><i class="fa-solid fa-square-kanban fa-md"></i></div>
                <span class="fw-bold tracking-tight">TaskWorkspace</span>
            </a>

            <div class="d-flex align-items-center gap-3 ms-auto order-lg-last">
                <div class="theme-switch-nav-btn" onclick="toggleHomeThemeMode()" title="Toggle Viewmode Layout">
                    <i id="navThemeIcon" class="fa-solid fa-sun fs-5"></i>
                </div>
            </div>
            
            <button class="navbar-toggler border-0 text-white ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
                <i class="fa-solid fa-bars-staggered"></i>
            </button>

            <div class="collapse navbar-collapse" id="menu">
                <ul class="navbar-nav ms-auto align-items-center gap-1 mt-3 mt-lg-0 me-2">
                    <li class="nav-item">
                        <a class="custom-nav-link" href="${pageContext.request.contextPath}/"><i class="fa-solid fa-house-user opacity-70"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="custom-nav-link" href="#aboutPlatform"><i class="fa-solid fa-circle-info opacity-70"></i> About Platform</a>
                    </li>
                    
                    <c:choose>
                        <c:when test="${sessionScope.loggedInUser != null}">
                            <li class="nav-item me-2">
                                <a class="custom-nav-link" href="${pageContext.request.contextPath}/viewTasks"><i class="fa-solid fa-chart-pie opacity-70"></i> Workspace Board</a>
                            </li>

                            <li class="nav-item dropdown ms-lg-2">
                                <div class="profile-dropdown-btn" id="profileMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                    <div class="avatar-circle">
                                        ${sessionScope.loggedInUser.name.substring(0,1).toUpperCase()}
                                    </div>
                                    <span class="live-green-dot"></span>
                                    <span class="d-none d-sm-inline text-white small fw-bold">${sessionScope.loggedInUser.name}</span>
                                    <i class="fa-solid fa-chevron-down text-muted small" style="font-size: 0.75rem;"></i>
                                </div>
                                
                                <ul class="dropdown-menu dropdown-menu-end custom-dropdown-menu" aria-labelledby="profileMenu">
                                    <li class="p-2 mb-1">
                                        <div class="dropdown-user-details">
                                            <div class="small text-muted" style="font-size: 0.72rem; font-weight: 700;">WORKSPACE IDENTITY</div>
                                            <div class="fw-bold text-white text-truncate small mt-0.5">${sessionScope.loggedInUser.email}</div>
                                        </div>
                                    </li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addTask"><i class="fa-solid fa-plus text-primary"></i> Add New Task</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/viewTasks"><i class="fa-solid fa-list-check text-success"></i> View Tasks List</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/changePassword"><i class="fa-solid fa-key text-warning"></i> Change Password</a></li>
                                    <li><hr class="dropdown-divider opacity-10"></li>
                                    <li class="px-2 pt-1"><a class="dropdown-item-logout" href="${pageContext.request.contextPath}/logout"><span>Logout</span> <i class="fa-solid fa-arrow-right-from-bracket small"></i></a></li>
                                </ul>
                            </li>
                        </c:when>
                        
                        <c:otherwise>
                            <li class="nav-item"><a class="custom-nav-link px-3" href="${pageContext.request.contextPath}/loginPage">Sign In</a></li>
                            <li class="nav-item ms-lg-2"><a class="btn btn-brand-primary btn-sm text-white px-4 py-2" style="border-radius: 10px; font-size: 0.9rem;" href="${pageContext.request.contextPath}/registerPage">Get Started Free</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="main-wrapper">

    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center g-5">
                <div class="col-lg-6 text-center text-lg-start">
                    <div class="hero-badge">
                        <i class="fa-solid fa-clock-history text-warning me-1"></i> Continuous Production Tracking Logs Active
                    </div>
                    
                    <h1 class="hero-title">Simplify workflows.<br><span>Master your productivity.</span></h1>
                    <p class="hero-desc-text">An enterprise grade configuration to create, map, query, and monitor logs of your essential operation items seamlessly with high precision dashboard controls.</p>
                    
                    <div class="d-flex flex-column flex-sm-row justify-content-center justify-content-lg-start gap-3">
                        <c:choose>
                            <c:when test="${sessionScope.loggedInUser == null}">
                                <a href="${pageContext.request.contextPath}/registerPage" class="btn btn-brand-primary shadow-sm d-flex align-items-center justify-content-center gap-2">Start Custom Board <i class="fa-solid fa-arrow-right"></i></a>
                                <a href="${pageContext.request.contextPath}/loginPage" class="btn btn-secondary-custom">Access Workspace</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/addTask" class="btn btn-brand-success shadow-sm"><i class="fa-solid fa-plus me-2"></i> Add New Task</a>
                                <a href="${pageContext.request.contextPath}/viewTasks" class="btn btn-workspace-view shadow-sm"><i class="fa-solid fa-table-list me-2"></i> View Task Workspace</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                
                <div class="col-lg-6 text-center">
                    <div class="image-animation-container">
                        <img src="https://cdn-icons-png.flaticon.com/512/9068/9068671.png" class="img-fluid animated-hero-img" alt="Workspace">
                        <div class="image-hour-badge"><i class="fa-solid fa-stopwatch-20 fa-spin me-1"></i> Live 24h Log Tracking</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container my-5 py-4">
        <div class="row g-4 text-center">
            <div class="col-12 col-sm-6 col-md-3">
                <div class="stats-card-box">
                    <div class="stat-number-text"><i class="fa-solid fa-chart-line text-info fs-4"></i> 99.9%</div>
                    <div class="stat-label-text">Database Uptime</div>
                    <div class="stat-subtext-clear">Continuous Server Stability Asset Framework</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Live Metrics Sync</div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-3">
                <div class="stats-card-box">
                    <div class="stat-number-text"><i class="fa-brands fa-java text-danger fs-4"></i> Java 17</div>
                    <div class="stat-label-text">LTS Core Engine</div>
                    <div class="stat-subtext-clear">Stable Long Term Support Enterprise Runtime</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> 0.5 Hours Runtime</div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-3">
                <div class="stats-card-box">
                    <div class="stat-number-text"><i class="fa-solid fa-gauge-high text-warning fs-4"></i> &lt; 50ms</div>
                    <div class="stat-label-text">MVC Architecture</div>
                    <div class="stat-subtext-clear">Ultra-Fast Database Commit Compile Indexing</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Saves 1.5 Hours</div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-3">
                <div class="stats-card-box">
                    <div class="stat-number-text"><i class="fa-solid fa-lock text-success fs-4"></i> Secured</div>
                    <div class="stat-label-text">Session Cryptography</div>
                    <div class="stat-subtext-clear">Isolated Authorized Session Storage Keys</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Continuous Guard</div>
                </div>
            </div>
        </div>
    </section>

    <section id="aboutPlatform" class="container my-5 py-5">
        <div class="text-center mb-5">
            <h6 class="text-info text-uppercase fw-bold small mb-2">Capabilities Mapping</h6>
            <h2 class="fw-bold text-white">Engineered for <span class="text-decoration-underline text-info">absolute tracking</span></h2>
        </div>

        <div class="row g-4">
            <div class="col-md-6 col-lg-3">
                <div class="capabilities-glow-card">
                    <h5 class="stat-label-text">Core</h5>
                    <div class="text-white fw-bold fs-5 mb-2">Create Stream</div>
                    <div class="stat-subtext-clear">Quickly spin items with configurations, <span class="highlight-keyword">priority tags</span>, and timelines.</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Optimizes 2.5 Hours</div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="capabilities-glow-card">
                    <h5 class="stat-label-text">Secure</h5>
                    <div class="text-white fw-bold fs-5 mb-2">User Isolation</div>
                    <div class="stat-subtext-clear">Strict <span class="highlight-keyword">session layer segregation</span> protects schemas to isolate user spaces.</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> 24h Guard Active</div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="capabilities-glow-card">
                    <h5 class="stat-label-text">Dynamic</h5>
                    <div class="text-white fw-bold fs-5 mb-2">Adaptive Sorting</div>
                    <div class="stat-subtext-clear">Instant server compilation returns clean custom lists sorted across <span class="highlight-keyword">task titles</span> keys.</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Saves 1.0 Hours</div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="capabilities-glow-card">
                    <h5 class="stat-label-text">Alert</h5>
                    <div class="text-white fw-bold fs-5 mb-2">Overdue Signals</div>
                    <div class="stat-subtext-clear">System executes auto <span class="highlight-keyword">visual warning flashes</span> for operations lagging checkpoints.</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Real-time Sync</div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="capabilities-glow-card">
                    <h5 class="stat-label-text">Logic</h5>
                    <div class="text-white fw-bold fs-5 mb-2">Analytics Logs</div>
                    <div class="stat-subtext-clear">Review metrics records processing allocations tracking operations logs inside <span class="highlight-keyword">workspace filters</span>.</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> 0.5 Hours Saved</div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="capabilities-glow-card">
                    <h5 class="stat-label-text">Layer</h5>
                    <div class="text-white fw-bold fs-5 mb-2">Priority Matrix</div>
                    <div class="stat-subtext-clear">Organize rows into transparent <span class="highlight-keyword">high, medium, and low</span> groups allocations frameworks.</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Saves 1.5 Hours</div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="capabilities-glow-card">
                    <h5 class="stat-label-text">Wipe</h5>
                    <div class="text-white fw-bold fs-5 mb-2">Batch Purge</div>
                    <div class="stat-subtext-clear">Drop complete dashboard tasks tables assets natively via authorized <span class="highlight-keyword">cascade loops scripts</span>.</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> 1-Sec Execution</div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="capabilities-glow-card">
                    <h5 class="stat-label-text">Assets</h5>
                    <div class="text-white fw-bold fs-5 mb-2">Pagination Core</div>
                    <div class="stat-subtext-clear">Chunk large SQL results chunks into fast data buckets protecting <span class="highlight-keyword">execution benchmarks</span>.</div>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Optimized Payload</div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 my-5" style="background: rgba(15, 23, 42, 0.4); border-y: 1px solid rgba(255,255,255,0.08);">
        <div class="container py-4">
            <div class="text-center mb-5">
                <h6 class="text-info text-uppercase fw-bold small mb-2">Workflow Matrix</h6>
                <h2 class="fw-bold text-white">How TaskWorkspace operates</h2>
            </div>
            <div class="row g-4 row-cols-1 row-cols-md-2 row-cols-lg-3">
                <div class="col">
                    <div class="workflow-slip-card">
                        <div>
                            <div class="step-badge-counter">1</div>
                            <h5 class="text-white fw-bold mb-2">Register Secure Account</h5>
                            <p class="stat-subtext-clear mb-0">Create unique credential profiles isolated completely on <span class="highlight-keyword">PostgreSQL schema configurations</span> safely.</p>
                        </div>
                        <div class="hour-badge-pill"><i class="fa-regular fa-hourglass-half"></i> Requires 1-Hour Allocation</div>
                    </div>
                </div>
                <div class="col">
                    <div class="workflow-slip-card">
                        <div>
                            <div class="step-badge-counter">2</div>
                            <h5 class="text-white fw-bold mb-2">Log Dynamic Tasks</h5>
                            <p class="stat-subtext-clear mb-0">Input operations data targets, track specific <span class="highlight-keyword">hourly duration metrics</span>, and define limits.</p>
                        </div>
                        <div class="hour-badge-pill"><i class="fa-regular fa-hourglass-half"></i> 10-Seconds Response Hook</div>
                    </div>
                </div>
                <div class="col">
                    <div class="workflow-slip-card">
                        <div>
                            <div class="step-badge-counter">3</div>
                            <h5 class="text-white fw-bold mb-2">Audit & Filter Realtime</h5>
                            <p class="stat-subtext-clear mb-0">Query database files via search keywords sorting data logs immediately in <span class="highlight-keyword">frameworks grid tables</span>.</p>
                        </div>
                        <div class="hour-badge-pill"><i class="fa-regular fa-hourglass-half"></i> 50ms Data Compile</div>
                    </div>
                </div>
                <div class="col">
                    <div class="workflow-slip-card">
                        <div>
                            <div class="step-badge-counter">4</div>
                            <h5 class="text-white fw-bold mb-2">State Progression</h5>
                            <p class="stat-subtext-clear mb-0">Advance ongoing workspace records parameters seamlessly from open queues down into full <span class="highlight-keyword">termination workflows</span>.</p>
                        </div>
                        <div class="hour-badge-pill"><i class="fa-regular fa-hourglass-half"></i> Continuous Live Sync</div>
                    </div>
                </div>
                <div class="col">
                    <div class="workflow-slip-card">
                        <div>
                            <div class="step-badge-counter">5</div>
                            <h5 class="text-white fw-bold mb-2">Overdue Trapping</h5>
                            <p class="stat-subtext-clear mb-0">Automated runtime comparisons intercept <span class="highlight-keyword">lagging items</span> immediately during active system query intervals.</p>
                        </div>
                        <div class="hour-badge-pill"><i class="fa-regular fa-hourglass-half"></i> 24h Clock Checks</div>
                    </div>
                </div>
                <div class="col">
                    <div class="workflow-slip-card">
                        <div>
                            <div class="step-badge-counter">6</div>
                            <h5 class="text-white fw-bold mb-2">Data Archival</h5>
                            <p class="stat-subtext-clear mb-0">Commit multi-row tabular resets or full workspace purging operations under safe <span class="highlight-keyword">security transaction boundaries</span>.</p>
                        </div>
                        <div class="hour-badge-pill"><i class="fa-regular fa-hourglass-half"></i> Secured Execution</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container my-5 py-4">
        <div class="text-center mb-5">
            <h6 class="text-info text-uppercase fw-bold small mb-2">Technology Framework</h6>
            <h2 class="fw-bold text-white">Robust Multi-Layer Infrastructure Stack</h2>
        </div>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-3 g-4">
            <div class="col">
                <div class="tech-card card-java">
                    <div class="tech-card-header">
                        <div class="tech-icon-wrapper icon-java-wrap"><i class="fa-brands fa-java"></i></div>
                        <div>
                            <h5 class="text-java-head">Java 17</h5>
                            <span class="tech-sub-header">LTS Core Engine</span>
                        </div>
                    </div>
                    <p class="tech-description-text mb-0">Object Oriented application backbone providing computational safety and reliable multi-threading handling layers.</p>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Core Architecture</div>
                </div>
            </div>
            <div class="col">
                <div class="tech-card card-spring">
                    <div class="tech-card-header">
                        <div class="tech-icon-wrapper icon-spring-wrap"><i class="fa-solid fa-leaf"></i></div>
                        <div>
                            <h5 class="text-spring-head">Spring Boot</h5>
                            <span class="tech-sub-header">MVC Architecture</span>
                        </div>
                    </div>
                    <p class="tech-description-text mb-0">Robust server execution micro-framework facilitating structural IOC management and automated injection beans mappings.</p>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> REST Logic Pool</div>
                </div>
            </div>
            <div class="col">
                <div class="tech-card card-security">
                    <div class="tech-card-header">
                        <div class="tech-icon-wrapper icon-security-wrap"><i class="fa-solid fa-user-shield"></i></div>
                        <div>
                            <h5 class="text-security-head">Spring Security</h5>
                            <span class="tech-sub-header">Session Cryptography</span>
                        </div>
                    </div>
                    <p class="tech-description-text mb-0">Manages high fidelity user context state authentication guards to strictly isolate session memory arrays securely.</p>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Authorization Lock</div>
                </div>
            </div>
            <div class="col">
                <div class="tech-card card-postgres">
                    <div class="tech-card-header">
                        <div class="tech-icon-wrapper icon-postgres-wrap"><i class="fa-solid fa-database"></i></div>
                        <div>
                            <h5 class="text-high-contrast mb-0">PostgreSQL</h5>
                            <span class="tech-sub-header text-info">Relational Storage</span>
                        </div>
                    </div>
                    <p class="tech-description-text mb-0">Enterprise-grade ACID relational data clusters executing atomic queries index compilations sub-50ms thresholds.</p>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Relational Cluster</div>
                </div>
            </div>
            <div class="col">
                <div class="tech-card card-bootstrap">
                    <div class="tech-card-header">
                        <div class="tech-icon-wrapper icon-bootstrap-wrap"><i class="fa-brands fa-bootstrap"></i></div>
                        <div>
                            <h5 class="text-high-contrast mb-0">Bootstrap 5</h5>
                            <span class="tech-sub-header" style="color: #c084fc;">Responsive Layouts</span>
                        </div>
                    </div>
                    <p class="tech-description-text mb-0">Sleek mobile first utility classes fluid styling arrays maintaining consistency across variable view resolutions perfectly.</p>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Layout Control UI</div>
                </div>
            </div>
            <div class="col">
                <div class="tech-card card-html">
                    <div class="tech-card-header">
                        <div class="tech-icon-wrapper icon-html-wrap"><i class="fa-brands fa-html5"></i></div>
                        <div>
                            <h5 class="text-high-contrast mb-0">HTML5</h5>
                            <span class="tech-sub-header text-warning">Semantic Layout</span>
                        </div>
                    </div>
                    <p class="tech-description-text mb-0">Provides structural DOM tree definitions optimizing metadata rendering processing models inside browser view ports safely.</p>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Semantic Elements</div>
                </div>
            </div>
            <div class="col">
                <div class="tech-card card-css">
                    <div class="tech-card-header">
                        <div class="tech-icon-wrapper icon-css-wrap"><i class="fa-brands fa-css3-alt"></i></div>
                        <div>
                            <h5 class="text-high-contrast mb-0">CSS3</h5>
                            <span class="tech-sub-header text-info">Visual System</span>
                        </div>
                    </div>
                    <p class="tech-description-text mb-0">Delivers micro-interaction transformations, adaptive canvas mesh background layers and layout consistency variables.</p>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Style Component</div>
                </div>
            </div>
            <div class="col">
                <div class="tech-card card-js">
                    <div class="tech-card-header">
                        <div class="tech-icon-wrapper icon-js-wrap"><i class="fa-brands fa-js"></i></div>
                        <div>
                            <h5 class="text-high-contrast mb-0">JavaScript</h5>
                            <span class="tech-sub-header text-warning">Asynchronous Runtime</span>
                        </div>
                    </div>
                    <p class="tech-description-text mb-0">Controls modular DOM manipulation listeners, client validation checks and responsive dropdown operations dynamically.</p>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Client Actions Sync</div>
                </div>
            </div>
            <div class="col">
                <div class="tech-card card-jsp">
                    <div class="tech-card-header">
                        <div class="tech-icon-wrapper icon-jsp-wrap"><i class="fa-solid fa-code"></i></div>
                        <div>
                            <h5 class="text-high-contrast mb-0">Jakarta JSP</h5>
                            <span class="tech-sub-header text-muted">Server Compilation</span>
                        </div>
                    </div>
                    <p class="tech-description-text mb-0">Translates taglibs dynamic values down into native bytecode components during active server deployment cycles flawlessly.</p>
                    <div class="hour-badge-pill"><i class="fa-regular fa-clock"></i> Server Render Logic</div>
                </div>
            </div>
        </div>
    </section>

</div>

<footer class="highlight-footer">
    <div class="container">
        <div class="row g-4 mb-4">
            <div class="col-md-5">
                <h5 class="footer-brand-title mb-3"><i class="fa-solid fa-square-kanban text-primary me-2"></i>TaskWorkspace</h5>
                <p class="footer-description-highlight">A high-performance enterprise architecture application designed to balance production database scaling with elegant task lifecycle management frameworks seamlessly.</p>
            </div>
            <div class="col-6 col-md-3">
                <h6 class="footer-highlight-text text-uppercase text-white small mb-3">Core Stack Components</h6>
                <ul class="list-unstyled small d-grid gap-2">
                    <li><span class="text-white fw-bold">Java 17 LTS Engine</span></li>
                    <li><span class="text-white fw-bold">Spring Framework Ecosystem</span></li>
                    <li><span class="text-white fw-bold">PostgreSQL Relational DB</span></li>
                    <li><span class="text-white fw-bold">Spring Security Sandbox</span></li>
                </ul>
            </div>
            <div class="col-6 col-md-4">
                <h6 class="footer-highlight-text text-uppercase text-white small mb-3">Developer Credentials</h6>
                <ul class="list-unstyled small d-grid gap-2">
                    <li><span class="text-white fw-bold"><i class="fa-solid fa-user-tie me-2 text-info"></i>Lead Engineer: Jitendra Singh</span></li>
                    <li><span class="text-white fw-bold"><i class="fa-solid fa-layer-group me-2 text-info"></i>Stack: Enterprise Java Systems Specialist</span></li>
                    <li><span class="text-white fw-bold"><i class="fa-regular fa-calendar-check me-2 text-info"></i>Active Baseline Deployment: Year 2026</span></li>
                </ul>
            </div>
        </div>
        <div class="border-top border-secondary pt-3 mt-4 text-center">
            <p class="m-0 footer-copyright-highlight">&copy; 2026 TaskWorkspace Systems Inc. All rights reserved globally across secure operational networks.</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>