<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Login - Task Workspace</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            /* ⭐ NEW PREMIUM DEEP ROYAL VIOLET GRADIENT BACKGROUND SYSTEM */
            --bg-body: linear-gradient(135deg, #0f172a 0%, #2e1065 40%, #4c1d95 70%, #6d28d9 100%);
            --card-base: #080f1d;
            --text-heading: #ffffff;
            --text-para: #cbd5e1;
            --form-input-bg: #111a2e;
            --form-border: rgba(255, 255, 255, 0.2);
            --form-text: #ffffff;
            --label-color: #00f2fe;
            --brand-panel-bg: linear-gradient(135deg, #5b21b6 0%, #0c1524 100%);
            --panel-border: rgba(255, 255, 255, 0.15);
            --accent-glow: 0 20px 50px rgba(0, 0, 0, 0.6);
            --input-focus-border: #8b5cf6;
        }

        [data-theme="light"] {
            /* ⭐ LIGHT MODE VARIABLES CONFIG */
            --bg-body: linear-gradient(135deg, #ddd6fe 0%, #eedffc 50%, #ddd6fe 100%);
            --card-base: #ffffff;
            --text-heading: #000000;
            --text-para: #475569;
            --form-input-bg: #f8fafc;
            --form-border: #cbd5e1;
            --form-text: #000000;
            --label-color: #1e293b;
            --brand-panel-bg: linear-gradient(135deg, #7c3aed 0%, #5b21b6 100%);
            --panel-border: #e2e8f0;
            --accent-glow: 0 15px 35px rgba(0, 0, 0, 0.15);
            --input-focus-border: #6d28d9;
        }

        body {
            background: var(--bg-body);
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: var(--text-heading);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 12px;
            transition: background 0.4s ease;
            -webkit-font-smoothing: antialiased;
        }

        /* Split Dashboard Container */
        .split-auth-container {
            width: 100%;
            max-width: 850px;
            background: var(--card-base);
            border: 2px solid var(--input-focus-border);
            border-radius: 24px;
            overflow: hidden;
            box-shadow: var(--accent-glow);
            position: relative;
            transition: all 0.4s ease;
        }

        /* Theme Switcher Toggle Placement */
        .theme-toggle-corner {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 1000;
        }

        .theme-switch-btn {
            background: rgba(255, 255, 255, 0.12);
            border: 2px solid var(--form-border);
            color: var(--text-heading);
            width: 44px;
            height: 44px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
        }
        [data-theme="light"] .theme-switch-btn {
            background: #f1f5f9;
            color: #000000;
        }

        /* Left Sidebar Branded Panel */
        .left-brand-panel {
            background: var(--brand-panel-bg);
            border-right: 2px solid var(--panel-border);
            padding: 40px 30px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            transition: all 0.4s ease;
        }

        /* Top Left Header Back Arrow */
        .back-arrow-btn {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.15);
            color: #ffffff !important;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid rgba(255, 255, 255, 0.2);
            text-decoration: none;
            transition: all 0.2s ease;
            font-size: 1.1rem;
        }
        [data-theme="light"] .back-arrow-btn {
            background: #ffffff;
            color: #000000 !important;
            border-color: #cbd5e1;
        }

        .back-arrow-btn:hover {
            color: #00f2fe !important;
            border-color: #00f2fe;
            transform: translateX(-3px);
        }

        .brand-meta-title {
            font-size: 1.9rem;
            font-weight: 800;
            line-height: 1.3;
            color: #ffffff !important;
        }

        .brand-meta-title span {
            color: #a78bfa !important;
            text-shadow: 0 0 10px rgba(167, 139, 250, 0.3);
        }

        .brand-footer-text {
            color: #ffffff !important;
            font-weight: 800;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
            opacity: 0.8;
        }

        /* Right Side Form Panel */
        .right-form-panel {
            padding: 40px;
            position: relative;
        }

        @media (max-width: 767.98px) {
            .left-brand-panel {
                padding: 24px;
                border-right: none;
                border-bottom: 2px solid var(--panel-border);
            }
            .right-form-panel {
                padding: 24px;
                padding-top: 50px;
            }
            .theme-toggle-corner {
                top: 15px;
                right: 15px;
            }
        }

        /* Form Inputs Controls */
        .form-label-custom {
            color: var(--label-color) !important;
            font-weight: 800;
            font-size: 0.95rem;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .form-control-custom {
            background: var(--form-input-bg) !important;
            border: 2px solid var(--form-border) !important;
            color: var(--form-text) !important;
            border-radius: 12px;
            height: 50px;
            font-weight: 700;
            font-size: 1rem;
            padding: 0.5rem 1rem;
            transition: all 0.2s ease;
        }

        .form-control-custom:focus {
            border-color: var(--input-focus-border) !important;
            box-shadow: 0 0 0 4px rgba(109, 40, 217, 0.25) !important;
        }

        .form-control-custom::placeholder {
            color: #94a3b8 !important;
            font-weight: 600;
            opacity: 0.7;
        }

        /* ⭐ INTERACTIVE PASSWORD EYE CONTAINER OVERLAYS */
        .password-container-relative {
            position: relative;
        }

        .password-toggle-trigger {
            cursor: pointer;
            position: absolute;
            right: 16px;
            top: 42px; /* Precision inline bounds balance */
            color: #94a3b8;
            z-index: 10;
            font-size: 1.1rem;
            transition: color 0.2s;
        }
        [data-theme="light"] .password-toggle-trigger {
            color: #475569;
        }
        .password-toggle-trigger:hover {
            color: var(--input-focus-border);
        }

        /* Submit Button Action Triggers */
        .btn-submit-save {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            color: #ffffff !important;
            border: none;
            border-radius: 12px;
            height: 50px;
            font-weight: 800;
            font-size: 1rem;
            box-shadow: 0 4px 14px rgba(59, 130, 246, 0.35);
            transition: all 0.2s ease;
        }
        .btn-submit-save:hover { transform: translateY(-1px); box-shadow: 0 6px 20px rgba(59, 130, 246, 0.5); }

        .redirect-wrapper-box {
            color: var(--text-para) !important;
            font-weight: 700;
            font-size: 0.92rem;
        }
        .redirect-link-anchor {
            color: var(--input-focus-border) !important;
            font-weight: 800;
            text-decoration: none;
        }
    </style>

    <script>
        // Theme Toggle Mode Manager
        function toggleThemeMode() {
            const currentTheme = document.documentElement.getAttribute("data-theme");
            const targetTheme = currentTheme === "light" ? "dark" : "light";
            document.documentElement.setAttribute("data-theme", targetTheme);
            
            const modeIcon = document.getElementById("themeModeIcon");
            if (targetTheme === "light") {
                modeIcon.classList.replace("fa-sun", "fa-moon");
            } else {
                modeIcon.classList.replace("fa-moon", "fa-sun");
            }
        }

        // ⭐ INTERACTIVE PASSWORD HIDE/SHOW TOGGLE ACTION
        function togglePasswordView() {
            const passInput = document.getElementById("passwordInput");
            const icon = document.getElementById("toggleIcon");
            if (passInput.type === "password") {
                passInput.type = "text";
                icon.classList.replace("fa-eye", "fa-eye-slash");
            } else {
                passInput.type = "password";
                icon.classList.replace("fa-eye-slash", "fa-eye");
            }
        }
    </script>
</head>
<body data-theme="dark">

<div class="split-auth-container">
    
    <div class="theme-toggle-corner">
        <div class="theme-switch-btn" onclick="toggleThemeMode()" title="Switch Light/Dark Layout">
            <i id="themeModeIcon" class="fa-solid fa-sun fs-5"></i>
        </div>
    </div>

    <div class="row g-0">
        
        <div class="col-md-5 left-brand-panel">
            <div>
                <a href="${pageContext.request.contextPath}/" class="back-arrow-btn" title="Back Home">
                    <i class="fa-solid fa-arrow-left"></i>
                </a>
            </div>
            <div class="mt-4 mb-3">
                <h3 class="brand-meta-title">Access Secure<br><span>Workspace Panel.</span></h3>
                <p class="text-white small fw-bold mt-3 opacity-90">Log in using authorization keys to synchronize dynamic operations logs.</p>
            </div>
            <div class="brand-footer-text d-none d-md-block">
                <i class="fa-solid fa-square-kanban me-1"></i> TaskWorkspace Board
            </div>
        </div>

        <div class="col-md-7 right-form-panel">
            
            <div class="mb-4">
                <h3 class="fw-bold mb-1" style="color: var(--text-heading);">Welcome Back</h3>
                <p class="small fw-bold opacity-70" style="color: var(--text-para);">Log in to manage tasks seamlessly.</p>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger fw-bold rounded-3 mb-3 py-2 px-3 small">
                    <i class="fa-solid fa-triangle-exclamation me-1"></i> ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="post">
                
                <div class="mb-3">
                    <label class="form-label-custom" for="emailInput"><i class="fa-regular fa-envelope"></i> Email Address</label>
                    <input type="email" name="email" class="form-control form-control-custom" id="emailInput" placeholder="name@example.com" required>
                </div>

                <div class="mb-4 password-container-relative">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <label class="form-label-custom m-0" for="passwordInput"><i class="fa-solid fa-lock"></i> Account Password</label>
                        <a href="${pageContext.request.contextPath}/forgotPassword" class="redirect-link-anchor small fw-bold text-danger">Forgot Password?</a>
                    </div>
                    <input type="password" name="password" class="form-control form-control-custom w-100" id="passwordInput" placeholder="••••••••" required>
                    <span class="password-toggle-trigger" onclick="togglePasswordView()">
                        <i id="toggleIcon" class="fa-regular fa-eye"></i>
                    </span>
                </div>

                <div class="mb-2">
                    <button type="submit" class="btn btn-submit-save w-100">
                        <i class="fa-solid fa-right-to-bracket me-2"></i> Access Account
                    </button>
                </div>

            </form>

            <div class="text-center mt-4 pt-3 redirect-wrapper-box border-top border-secondary border-opacity-20">
                <span>Don't have an account?</span> 
                <a href="${pageContext.request.contextPath}/registerPage" class="redirect-link-anchor ms-1">Register here</a>
            </div>

        </div>
    </div>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>