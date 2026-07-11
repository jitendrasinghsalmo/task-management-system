<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Create Account - Task Workspace</title>

    <!-- Bootstrap 5 & FontAwesome for Real App Feel & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            /* ⭐ DEFAULT DARK MODE (PREMIUM GOLD HALDI ACCENT SYSTEM) */
            --bg-body: linear-gradient(135deg, #0f172a 0%, #451a03 40%, #78350f 70%, #b45309 100%);
            --card-base: #080f1d;
            --text-heading: #ffffff;
            --text-para: #cbd5e1;
            --form-input-bg: #111a2e;
            --form-border: rgba(255, 255, 255, 0.2);
            --form-text: #ffffff;
            --label-color: #00f2fe;
            --brand-panel-bg: linear-gradient(135deg, #ca8a04 0%, #0c1524 100%);
            --panel-border: rgba(255, 255, 255, 0.15);
            --accent-glow: 0 20px 50px rgba(0, 0, 0, 0.6);
            --input-focus-border: #eab308;
            --gender-btn-inactive-bg: #111a2e;
        }

        [data-theme="light"] {
            /* ⭐ TOGGLED LIGHT MODE VARIABLES */
            --bg-body: linear-gradient(135deg, #fef08a 0%, #fef9c3 50%, #fef08a 100%);
            --card-base: #ffffff;
            --text-heading: #000000;
            --text-para: #475569;
            --form-input-bg: #f8fafc;
            --form-border: #cbd5e1;
            --form-text: #000000;
            --label-color: #1e293b;
            --brand-panel-bg: linear-gradient(135deg, #f59e0b 0%, #ca8a04 100%);
            --panel-border: #e2e8f0;
            --accent-glow: 0 15px 35px rgba(0, 0, 0, 0.15);
            --input-focus-border: #ca8a04;
            --gender-btn-inactive-bg: #f1f5f9;
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
            max-width: 900px;
            background: var(--card-base);
            border: 2px solid var(--input-focus-border);
            border-radius: 24px;
            overflow: hidden;
            box-shadow: var(--accent-glow);
            position: relative;
            transition: all 0.4s ease;
        }

        /* Top Bar Actions Layer (For Switcher Toggle Placement) */
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
        .theme-switch-btn:hover {
            transform: scale(1.05);
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

        /* ⭐ ARROW REMOVED FROM FOOTER AND MOUNTED ON TOP LEFT FOR NAVIGATION */
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
        [data-theme="light"] .back-arrow-btn:hover {
            color: #ca8a04 !important;
            border-color: #ca8a04;
        }

        .brand-meta-title {
            font-size: 1.9rem;
            font-weight: 800;
            line-height: 1.3;
            color: #ffffff !important;
        }

        .brand-meta-title span {
            color: #facc15 !important;
            text-shadow: 0 0 10px rgba(250, 204, 21, 0.3);
        }
        [data-theme="light"] .brand-meta-title span {
            color: #ffffff !important;
            text-shadow: none;
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

        /* ==========================================================================
           ⭐ OPAQUE HIGH-CONTRAST STRUCTURAL FORM LABELS & INPUTS
           ========================================================================== */
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
            box-shadow: 0 0 0 4px rgba(234, 179, 8, 0.25) !important;
        }

        .form-control-custom::placeholder {
            color: #94a3b8 !important;
            font-weight: 600;
            opacity: 0.7;
        }
        [data-theme="light"] .form-control-custom::placeholder {
            color: #64748b !important;
        }

        /* Custom Gender Button Toggles Matrix */
        .gender-group {
            display: flex;
            gap: 10px;
        }

        .gender-btn-label {
            flex: 1;
            background: var(--gender-btn-inactive-bg);
            border: 2px solid var(--form-border);
            border-radius: 12px;
            height: 50px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            cursor: pointer;
            font-weight: 800;
            color: var(--form-text);
            transition: all 0.2s;
        }

        .gender-radio-hook:checked + .gender-btn-label {
            border-color: var(--input-focus-border) !important;
            background: rgba(234, 179, 8, 0.15) !important;
            box-shadow: 0 0 10px rgba(234, 179, 8, 0.2);
        }

        .password-container-relative {
            position: relative;
        }

        .password-toggle-trigger {
            cursor: pointer;
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
            z-index: 10;
            font-size: 1.1rem;
        }
        [data-theme="light"] .password-toggle-trigger {
            color: #475569;
        }

        /* Core Submit Action Buttons Styling */
        .btn-submit-save {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: #ffffff !important;
            border: none;
            border-radius: 12px;
            height: 50px;
            font-weight: 800;
            font-size: 1rem;
            box-shadow: 0 4px 14px rgba(16, 185, 129, 0.35);
            transition: all 0.2s ease;
        }
        .btn-submit-save:hover { transform: translateY(-1px); box-shadow: 0 6px 20px rgba(16, 185, 129, 0.5); }

        .btn-reset-clear {
            background: rgba(255, 255, 255, 0.08);
            color: var(--form-text) !important;
            border: 2px solid var(--form-border);
            border-radius: 12px;
            height: 50px;
            font-weight: 800;
            font-size: 1rem;
            transition: all 0.2s ease;
        }
        [data-theme="light"] .btn-reset-clear {
            background: rgba(0, 0, 0, 0.05);
        }
        .btn-reset-clear:hover { background: rgba(255, 255, 255, 0.15); }

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
        // Dynamic Frontend Toggle Theme Logic 
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
<body data-theme="dark"> <!-- Starts inside high visibility dark mode -->

<div class="split-auth-container">
    
    <!-- Theme Switcher Top Corner Controller Toggle Buttons -->
    <div class="theme-toggle-corner">
        <div class="theme-switch-btn" onclick="toggleThemeMode()" title="Switch Light/Dark Layout">
            <i id="themeModeIcon" class="fa-solid fa-sun fs-5"></i>
        </div>
    </div>

    <div class="row g-0">
        
        <!-- Left Side: Branded Panel with Navigation Row Arrow -->
        <div class="col-md-5 left-brand-panel">
            <div>
                <a href="${pageContext.request.contextPath}/" class="back-arrow-btn" title="Back Home">
                    <i class="fa-solid fa-arrow-left"></i>
                </a>
            </div>
            <div class="mt-4 mb-3">
                <h3 class="brand-meta-title">Manage tasks<br><span>beautifully.</span></h3>
                <p class="text-white small fw-bold mt-3 opacity-90">Join thousands of developers organizing their workflows globally seamlessly.</p>
            </div>
            <div class="brand-footer-text d-none d-md-block">
                <i class="fa-solid fa-square-kanban me-1"></i> TaskWorkspace Board
            </div>
        </div>

        <!-- Right Side: Registration Inputs Interface -->
        <div class="col-md-7 right-form-panel">
            
            <div class="mb-4">
                <h3 class="fw-bold mb-1" style="color: var(--text-heading);">Get Started Free</h3>
                <p class="small fw-bold opacity-70" style="color: var(--text-para);">Create your custom dashboard account below.</p>
            </div>

            <form action="register" method="post">
                
                <!-- Field 1: Full Name Input Layout -->
                <div class="mb-3">
                    <label class="form-label-custom" for="nameInput"><i class="fa-regular fa-user"></i> Full Name</label>
                    <input type="text" name="name" class="form-control form-control-custom" id="nameInput" placeholder="Enter full identity name" required>
                </div>

                <div class="row">
                    <!-- Field 2: Age Number selection -->
                    <div class="col-sm-4 mb-3">
                        <label class="form-label-custom" for="ageInput"><i class="fa-regular fa-calendar"></i> Age</label>
                        <input type="number" name="age" min="1" class="form-control form-control-custom" id="ageInput" placeholder="Age" required>
                    </div>
                    
                    <!-- Field 3: Gender Toggles Options Layout selection -->
                    <div class="col-sm-8 mb-3">
                        <label class="form-label-custom"><i class="fa-solid fa-venus-mars"></i> Gender Allocation Option</label>
                        <div class="gender-group">
                            
                            <input type="radio" name="gender" value="Male" id="male" class="gender-radio-hook d-none" checked required>
                            <label for="male" class="gender-btn-label">
                                <i class="fas fa-mars text-primary"></i> Male
                            </label>

                            <input type="radio" name="gender" value="Female" id="female" class="gender-radio-hook d-none">
                            <label for="female" class="gender-btn-label">
                                <i class="fas fa-venus text-danger"></i> Female
                            </label>
                            
                        </div>
                    </div>
                </div>

                <!-- Field 4: Email Address field input data -->
                <div class="mb-3">
                    <label class="form-label-custom" for="emailInput"><i class="fa-regular fa-envelope"></i> Email Address</label>
                    <input type="email" name="email" class="form-control form-control-custom" id="emailInput" placeholder="name@example.com" required>
                </div>

                <!-- Field 5: Secret Key Password input setup -->
                <div class="mb-4 password-container-relative">
                    <label class="form-label-custom" for="passwordInput"><i class="fa-solid fa-lock"></i> Account Security Password</label>
                    <input type="password" name="password" class="form-control form-control-custom" id="passwordInput" placeholder="••••••••" required>
                    <span class="password-toggle-trigger" onclick="togglePasswordView()">
                        <i id="toggleIcon" class="fa-regular fa-eye"></i>
                    </span>
                </div>

                <!-- Core Action Submissions Buttons -->
                <div class="row g-3">
                    <div class="col-sm-8">
                        <button type="submit" class="btn btn-submit-save w-100">
                            Create Free Account <i class="fas fa-arrow-right ms-2"></i>
                        </button>
                    </div>
                    <div class="col-sm-4">
                        <button type="reset" class="btn btn-reset-clear w-100">
                            Reset Fields
                        </button>
                    </div>
                </div>

            </form>

            <!-- Redirect options interface triggers links -->
            <div class="text-center mt-4 pt-3 redirect-wrapper-box border-top border-secondary border-opacity-20">
                <span>Already registered with us?</span> 
                <a href="loginPage" class="redirect-link-anchor ms-1">Log in here</a>
            </div>

        </div>
    </div>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>