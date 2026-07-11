<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Reset Password - Task Workspace</title>

    <!-- Bootstrap 5 & FontAwesome for Premium Real App Feel -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            /* ⭐ PREMIUM DEEP VIOLET-CRIMSON ACCENT SYSTEM */
            --bg-body: linear-gradient(135deg, #0f172a 0%, #311042 40%, #581c44 70%, #9d174d 100%);
            --card-base: #080f1d;
            --text-heading: #ffffff;
            --text-para: #cbd5e1;
            --form-input-bg: #111a2e;
            --form-border: rgba(255, 255, 255, 0.2);
            --form-text: #ffffff;
            --label-color: #00f2fe;
            --brand-panel-bg: linear-gradient(135deg, #9d174d 0%, #0c1524 100%);
            --panel-border: rgba(255, 255, 255, 0.15);
            --accent-glow: 0 20px 50px rgba(0, 0, 0, 0.6);
            --input-focus-border: #ec4899;
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
        }

        /* ⭐ ARROW INTEGRATED ON THE TOP LEFT FOR SYSTEM LOGIN BACK ROUTING */
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

        .back-arrow-btn:hover {
            color: #00f2fe !important;
            border-color: #00f2fe;
            transform: translateX(-3px);
            box-shadow: 0 0 12px rgba(0, 242, 254, 0.4);
        }

        .brand-meta-title {
            font-size: 1.9rem;
            font-weight: 800;
            line-height: 1.3;
            color: #ffffff !important;
        }

        .brand-meta-title span {
            color: #f472b6 !important;
            text-shadow: 0 0 10px rgba(244, 114, 182, 0.3);
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
            }
        }

        /* OPAQUE HIGH-CONTRAST LABELS & FORM FIELDS */
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
            box-shadow: 0 0 0 4px rgba(236, 72, 153, 0.25) !important;
        }

        .form-control-custom::placeholder {
            color: #94a3b8 !important;
            font-weight: 600;
            opacity: 0.7;
        }

        /* Core Action Submissions Button Styling */
        .btn-submit-save {
            background: linear-gradient(135deg, #ec4899 0%, #be185d 100%);
            color: #ffffff !important;
            border: none;
            border-radius: 12px;
            height: 50px;
            font-weight: 800;
            font-size: 1rem;
            box-shadow: 0 4px 14px rgba(236, 72, 153, 0.35);
            transition: all 0.2s ease;
        }
        .btn-submit-save:hover { transform: translateY(-1px); box-shadow: 0 6px 20px rgba(236, 72, 153, 0.5); }

        .btn-submit-success {
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
        .btn-submit-success:hover { transform: translateY(-1px); box-shadow: 0 6px 20px rgba(16, 185, 129, 0.5); }
    </style>
</head>
<body>

<div class="split-auth-container">
    <div class="row g-0">
        
        <!-- Left Side: Branded Panel with Navigation Row Arrow -->
        <div class="col-md-5 left-brand-panel">
            <div>
                <a href="${pageContext.request.contextPath}/loginPage" class="back-arrow-btn" title="Back to Login">
                    <i class="fa-solid fa-arrow-left"></i>
                </a>
            </div>
            <div class="mt-4 mb-3">
                <h3 class="brand-meta-title">Recover Account<br><span>Security Key.</span></h3>
                <p class="text-white small fw-bold mt-3 opacity-90">Verify your registered context mailbox array to authorize high-precision credential updates.</p>
            </div>
            <div class="brand-footer-text d-none d-md-block">
                <i class="fa-solid fa-square-kanban me-1"></i> TaskWorkspace Board
            </div>
        </div>

        <!-- Right Side: Reset Password Interface -->
        <div class="col-md-7 right-form-panel">
            
            <div class="mb-4">
                <h3 class="fw-bold mb-1" style="color: var(--text-heading);">Reset Password</h3>
                <p class="small fw-bold opacity-70" style="color: var(--text-para);">Follow steps to secure your deployment account.</p>
            </div>

            <!-- Context Processing Alerts Notification Layer -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger fw-bold rounded-3 mb-3 py-2 px-3 small">
                    <i class="fa-solid fa-triangle-exclamation me-1"></i> ${error}
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="alert alert-success fw-bold rounded-3 mb-3 py-2 px-3 small">
                    <i class="fa-solid fa-circle-check me-1"></i> ${success}
                </div>
            </c:if>

            <!-- Condition A: Send OTP Operation Layer -->
            <c:if test="${empty otpSent}">
                <form action="${pageContext.request.contextPath}/sendOtp" method="POST">
                    <div class="mb-4">
                        <label class="form-label-custom" for="emailInput"><i class="fa-regular fa-envelope"></i> Registered Email Identity</label>
                        <input type="email" name="email" class="form-control form-control-custom w-100" id="emailInput" placeholder="example@gmail.com" required>
                    </div>
                    <div class="mb-2">
                        <button type="submit" class="btn btn-submit-save w-100">
                            <i class="fa-solid fa-paper-plane me-2"></i> Dispatch Verification OTP
                        </button>
                    </div>
                </form>
            </c:if>

            <!-- Condition B: Verify OTP & Change Password Block Matrix -->
            <c:if test="${otpSent}">
                <form action="${pageContext.request.contextPath}/resetPassword" method="POST">
                    
                    <!-- Token field entry -->
                    <div class="mb-3">
                        <label class="form-label-custom" for="otpInput"><i class="fa-solid fa-key"></i> Enter 6-Digit Secret OTP</label>
                        <input type="number" name="userOtp" class="form-control form-control-custom w-100" id="otpInput" placeholder="X X X X X X" required>
                    </div>
                    
                    <!-- Structural encryption replacement input -->
                    <div class="mb-4">
                        <label class="form-label-custom" for="passInput"><i class="fa-solid fa-lock"></i> Define New Account Password</label>
                        <input type="password" name="newPassword" class="form-control form-control-custom w-100" id="passInput" placeholder="Enter new custom security password" required>
                    </div>

                    <div class="mb-2">
                        <button type="submit" class="btn btn-submit-success w-100">
                            <i class="fa-solid fa-square-check me-2"></i> Verify Token & Commit Changes
                        </button>
                    </div>
                </form>
            </c:if>

        </div>
    </div>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>