<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Edit Task - Task Workspace</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-brand: #3b82f6;
            --primary-hover: #2563eb;
            --text-main: #ffffff;
            --blue-gradient: linear-gradient(135deg, #0b1329 0%, #111e40 40%, #1e3c72 100%);
            --solid-dark-card: #080f1d; 
        }

        body {
            background: var(--blue-gradient);
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 12px;
            -webkit-font-smoothing: antialiased;
        }

        /* Split Dashboard Container Style */
        .split-auth-container {
            width: 100%;
            max-width: 850px;
            background: var(--solid-dark-card);
            border: 2px solid #eab308; /* Premium Yellow/Warning theme accent line */
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.6);
        }

        /* Left Sidebar Branded Panel */
        .left-brand-panel {
            background: linear-gradient(135deg, #ca8a04 0%, #0c1524 100%);
            border-right: 2px solid rgba(255, 255, 255, 0.15);
            padding: 40px 30px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
        }

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
            background: rgba(234, 179, 8, 0.4);
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
            color: #eab308 !important;
            text-shadow: 0 0 10px rgba(234, 179, 8, 0.3);
        }

        .brand-footer-text {
            color: #ffffff !important;
            font-weight: 800;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }

        /* Right Side Form Panel */
        .right-form-panel {
            padding: 40px;
            background: #080f1d;
        }

        @media (max-width: 767.98px) {
            .left-brand-panel {
                padding: 24px;
                border-right: none;
                border-bottom: 2px solid rgba(255, 255, 255, 0.15);
            }
            .right-form-panel {
                padding: 24px;
            }
        }

        /* OPAQUE HIGH-CONTRAST FORM INPUTS & LABELS */
        .form-label-custom {
            color: #00f2fe !important; 
            font-weight: 800;
            font-size: 1rem;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 8px;
            letter-spacing: 0.3px;
        }

        .form-control-custom {
            background: #111a2e !important;
            border: 2px solid rgba(255, 255, 255, 0.2) !important;
            color: #ffffff !important;
            border-radius: 12px;
            height: 52px;
            font-weight: 700;
            font-size: 1rem;
            padding: 0.5rem 1rem;
            transition: all 0.2s ease;
        }

        .form-control-custom:focus {
            border-color: #eab308 !important;
            box-shadow: 0 0 0 4px rgba(234, 179, 8, 0.25) !important;
        }

        /* Custom Highly Visible Calendar Icon integration */
        .form-control-custom::-webkit-calendar-picker-indicator {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%2300f2fe' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Crect x='3' y='4' width='18' height='18' rx='2' ry='2'%3E%3C/rect%3E%3Cline x1='16' y1='2' x2='16' y2='6'%3E%3C/line%3E%3Cline x1='8' y1='2' x2='8' y2='6'%3E%3C/line%3E%3Cline x1='3' y1='10' x2='21' y2='10'%3E%3C/line%3E%3C/svg%3E") !important;
            background-size: 22px 24px;
            cursor: pointer;
            border-radius: 6px;
            padding: 5px;
            transition: all 0.2s;
        }

        .form-control-custom::-webkit-calendar-picker-indicator:hover {
            background-color: rgba(0, 242, 254, 0.15);
            transform: scale(1.1);
        }

        .form-select-custom {
            background: #111a2e url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23ffffff' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e") no-repeat right 1rem center/10px 10px !important;
            border: 2px solid rgba(255, 255, 255, 0.2) !important;
            color: #ffffff !important;
            border-radius: 12px;
            height: 52px;
            font-weight: 700;
            font-size: 1rem;
            padding-left: 1rem;
        }

        .form-select-custom:focus {
            border-color: #eab308 !important;
            box-shadow: 0 0 0 4px rgba(234, 179, 8, 0.25) !important;
        }

        /* Core Action Buttons Styles */
        .btn-submit-update {
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
        .btn-submit-update:hover { transform: translateY(-1px); box-shadow: 0 6px 20px rgba(16, 185, 129, 0.5); }

        .btn-reset-clear {
            background: rgba(255, 255, 255, 0.08);
            color: #ffffff !important;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            height: 50px;
            font-weight: 800;
            font-size: 1rem;
            transition: all 0.2s ease;
        }
        .btn-reset-clear:hover { background: rgba(255, 255, 255, 0.15); border-color: rgba(255, 255, 255, 0.3); }
    </style>

    <script>
        function clearFields(){
            document.getElementById("taskName").value="";
            document.getElementById("duration").value="";
            document.getElementById("status").selectedIndex=0;
            document.getElementById("priority").selectedIndex=0;
            document.getElementById("dueDate").value="";
        }
    </script>
</head>
<body>

<div class="split-auth-container">
    <div class="row g-0">
        
        <div class="col-md-4 left-brand-panel">
            <div>
                <a href="${pageContext.request.contextPath}/viewTasks" class="back-arrow-btn" title="Back to Workspace">
                    <i class="fa-solid fa-arrow-left"></i>
                </a>
            </div>
            <div class="mt-4 mb-3">
                <h3 class="brand-meta-title">Modify<br>Active <span>Task Stream.</span></h3>
                <p class="text-white small fw-bold mt-3 opacity-90">Commit live updates directly inside your synchronized transaction pipeline table arrays.</p>
            </div>
            <div class="brand-footer-text d-none d-md-block">
                <i class="fa-solid fa-square-kanban text-warning me-1"></i> TaskWorkspace Stack
            </div>
        </div>

        <div class="col-md-8 right-form-panel">
            <form action="${pageContext.request.contextPath}/updateTask" method="post">
                
                <input type="hidden" name="id" value="${task.id}">

                <div class="mb-3">
                    <label class="form-label-custom"><i class="fa-solid fa-signature"></i> Task Target Title</label>
                    <input type="text" id="taskName" name="taskName" class="form-control form-control-custom" value="${task.taskName}" required>
                </div>

                <div class="row">
                    <div class="col-sm-6 mb-3">
                        <label class="form-label-custom"><i class="fa-regular fa-clock"></i> Stream Duration</label>
                        <input type="number" id="duration" name="duration" class="form-control form-control-custom" value="${task.duration}" required>
                    </div>
                    
                    <div class="col-sm-6 mb-3">
                        <label class="form-label-custom"><i class="fa-regular fa-calendar-days"></i> Timeline Due Date</label>
                        <input type="date" id="dueDate" name="dueDate" class="form-control form-control-custom" value="${task.dueDate}">
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label-custom"><i class="fa-solid fa-circle-nodes"></i> Operational State Progression</label>
                    <select id="status" name="status" class="form-select form-select-custom">
                        <option value="Pending" ${task.status=='Pending'?'selected':''}>🟡 Pending Verification</option>
                        <option value="In Progress" ${task.status=='In Progress'?'selected':''}>🔵 Active Progress Loop</option>
                        <option value="Completed" ${task.status=='Completed'?'selected':''}>🟢 Completed Lifecycle</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label class="form-label-custom"><i class="fa-solid fa-arrow-up-wide-short"></i> Priority Allocation Matrix</label>
                    <select id="priority" name="priority" class="form-select form-select-custom">
                        <option value="High" ${task.priority=='High'?'selected':''}>🔴 High Priority Trapping</option>
                        <option value="Medium" ${task.priority=='Medium'?'selected':''}>🟡 Medium Execution Layer</option>
                        <option value="Low" ${task.priority=='Low'?'selected':''}>🟢 Low Operational Metric</option>
                    </select>
                </div>

                <div class="row g-3">
                    <div class="col-sm-8">
                        <button type="submit" class="btn btn-submit-update w-100">
                            <i class="fa-solid fa-square-check me-2"></i> Commit Structural Changes
                        </button>
                    </div>
                    <div class="col-sm-4">
                        <button type="button" onclick="clearFields()" class="btn btn-reset-clear w-100">
                            Clear Config
                        </button>
                    </div>
                </div>

            </form>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>