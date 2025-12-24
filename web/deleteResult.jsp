<%-- 
    Document   : deleteResult
    Created on : Dec 24, 2025, 9:52:59 PM
    Author     : USER
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Profile Result</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #ffe6ee 0%, #ffd6e7 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .result-container {
            max-width: 700px;
            width: 100%;
            animation: fadeIn 0.6s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .result-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(255, 107, 157, 0.15);
            overflow: hidden;
            border: 2px solid #ffb6c1;
        }
        
        .result-header {
            padding: 40px;
            text-align: center;
            background: ${success ? '#ffe6e6' : '#e6ffed'};
            color: ${success ? '#dc3545' : '#28a745'};
            border-bottom: 1px solid ${success ? '#f5c6cb' : '#b7e4c7'};
            position: relative;
            overflow: hidden;
        }
        
        .result-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, ${success ? '#dc3545' : '#28a745'}, ${success ? '#ff6fa8' : '#ff8fb1'});
        }
        
        .result-icon {
            font-size: 5rem;
            margin-bottom: 20px;
            display: block;
            animation: ${success ? 'shake' : 'bounce'} 0.8s ease;
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }
        
        .result-header h1 {
            font-size: 2.3rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        
        .result-body {
            padding: 35px;
        }
        
        .message-box {
            background: #fff9fb;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 25px;
            border-left: 5px solid ${success ? '#dc3545' : '#28a745'};
            box-shadow: 0 5px 15px rgba(255, 182, 193, 0.1);
        }
        
        .message-box p {
            font-size: 1.2rem;
            line-height: 1.6;
            color: #333;
            text-align: center;
            font-weight: 500;
        }
        
        .deleted-info {
            background: #fff0f6;
            border: 2px solid #ffb6c1;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .info-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            padding-bottom: 12px;
            border-bottom: 1px dashed #ffd6e7;
        }
        
        .info-label {
            color: #ff4f9a;
            font-weight: 600;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .info-value {
            color: #333;
            font-weight: 500;
            font-size: 1.05rem;
        }
        
        .student-name {
            color: #ff6fa8;
            font-weight: 600;
            background: #fff0f6;
            padding: 5px 15px;
            border-radius: 20px;
            border: 1px solid #ffb6c1;
        }
        
        .action-buttons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 35px;
        }
        
        .btn {
            padding: 16px;
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }
        
        .btn-list {
            background: linear-gradient(135deg, #ff6fa8, #ff8fb1);
            color: white;
            box-shadow: 0 5px 15px rgba(255, 111, 168, 0.3);
        }
        
        .btn-list:hover {
            background: linear-gradient(135deg, #ff5a9c, #ff7ba9);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(255, 111, 168, 0.4);
        }
        
        .btn-home {
            background: #fff0f6;
            color: #ff4f9a;
            border: 2px solid #ffb6c1;
        }
        
        .btn-home:hover {
            background: #ffe6ee;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 182, 193, 0.3);
        }
        
        .btn-new {
            background: #e6ffed;
            color: #28a745;
            border: 2px solid #b7e4c7;
        }
        
        .btn-new:hover {
            background: #d4edda;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
        }
        
        .btn-delete {
            background: #ffe6e6;
            color: #dc3545;
            border: 2px solid #f5c6cb;
        }
        
        .btn-delete:hover {
            background: #dc3545;
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
        }
        
        .warning-note {
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            background: #fff9fb;
            border-radius: 10px;
            border: 2px solid #ffeaa7;
            color: #e8590c;
            font-size: 0.95rem;
            line-height: 1.5;
        }
        
        .warning-icon {
            color: #ff6fa8;
            font-size: 1.2rem;
            margin-right: 8px;
        }
        
        .auto-redirect {
            text-align: center;
            margin-top: 20px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 10px;
            color: #6c757d;
            font-size: 0.9rem;
            border: 1px solid #dee2e6;
            display: ${success ? 'block' : 'none'};
        }
        
        .countdown {
            color: #ff6fa8;
            font-weight: bold;
            font-size: 1.1rem;
        }
        
        @media (max-width: 768px) {
            .result-container {
                padding: 10px;
            }
            
            .result-header {
                padding: 25px;
            }
            
            .result-header h1 {
                font-size: 1.8rem;
            }
            
            .result-icon {
                font-size: 4rem;
            }
            
            .result-body {
                padding: 20px;
            }
            
            .action-buttons {
                grid-template-columns: 1fr;
            }
            
            .btn {
                padding: 14px;
                font-size: 1rem;
            }
        }
        
        .floating-trash {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 2rem;
            color: rgba(220, 53, 69, 0.1);
            animation: floatUp 4s ease-in-out infinite;
        }
        
        @keyframes floatUp {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(10deg); }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="result-container">
        <div class="result-card">
            <div class="result-header">
                <c:if test="${success}">
                    <i class="fas fa-trash-alt floating-trash"></i>
                </c:if>
                <c:choose>
                    <c:when test="${success}">
                        <i class="fas fa-trash-alt result-icon"></i>
                        <h1>Profile Deleted</h1>
                        <p style="color: #666; font-size: 1.1rem;">Successfully removed from database</p>
                    </c:when>
                    <c:otherwise>
                        <i class="fas fa-exclamation-triangle result-icon"></i>
                        <h1>Deletion Failed</h1>
                        <p style="color: #666; font-size: 1.1rem;">Unable to delete profile</p>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="result-body">
                <div class="message-box">
                    <p>${message}</p>
                </div>
                
                <c:if test="${success && not empty studentName}">
                    <div class="deleted-info">
                        <div class="info-item">
                            <span class="info-label">Deleted Profile:</span>
                            <span class="info-value">
                                <span class="student-name">${studentName}</span>
                            </span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Time:</span>
                            <span class="info-value">
                                <i class="far fa-clock" style="color: #ff6fa8; margin-right: 5px;"></i>
                                <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>
                            </span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Action:</span>
                            <span class="info-value" style="color: #dc3545; font-weight: 600;">
                                <i class="fas fa-exclamation-circle" style="margin-right: 5px;"></i>
                                Permanently Removed
                            </span>
                        </div>
                    </div>
                </c:if>
                
                <div class="action-buttons">
                    <a href="viewProfiles.jsp" class="btn btn-list">
                        <i class="fas fa-list"></i> View All Profiles
                    </a>
                    <a href="index.html" class="btn btn-home">
                        <i class="fas fa-home"></i> Back to Home
                    </a>
                    <a href="index.html" class="btn btn-new">
                        <i class="fas fa-user-plus"></i> Create New Profile
                    </a>
                    <c:if test="${success}">
                        <a href="viewProfiles.jsp" class="btn btn-delete">
                            <i class="fas fa-trash"></i> Delete Another
                        </a>
                    </c:if>
                </div>
                
                <div class="warning-note">
                    <i class="fas fa-exclamation-triangle warning-icon"></i>
                    Deleted profiles cannot be recovered. This action is permanent.
                </div>
            </div>
        </div>
    </div>
    
    <c:if test="${success}">
        <div class="auto-redirect" id="redirectMessage">
            <i class="fas fa-sync-alt" style="color: #ff6fa8; margin-right: 8px;"></i>
            Auto-redirecting to profiles list in <span class="countdown" id="countdown">10</span> seconds...
        </div>
        
        <script>
            let seconds = 10;
            const countdownElement = document.getElementById('countdown');
            const redirectMessage = document.getElementById('redirectMessage');
            
            const countdown = setInterval(function() {
                seconds--;
                countdownElement.textContent = seconds;
                
                if (seconds <= 0) {
                    clearInterval(countdown);
                    window.location.href = 'viewProfiles.jsp';
                }
                
                
                if (seconds <= 3) {
                    countdownElement.style.color = '#dc3545';
                    countdownElement.style.animation = 'pulse 1s infinite';
                    redirectMessage.style.borderColor = '#dc3545';
                    redirectMessage.style.background = '#ffe6e6';
                }
            }, 1000);
            
            
            const style = document.createElement('style');
            style.textContent = `
                @keyframes pulse {
                    0%, 100% { transform: scale(1); }
                    50% { transform: scale(1.2); }
                }
            `;
            document.head.appendChild(style);
            
            
            redirectMessage.addEventListener('click', function() {
                clearInterval(countdown);
                this.innerHTML = '<i class="fas fa-check" style="color: #28a745; margin-right: 8px;"></i> Auto-redirect stopped';
                this.style.background = '#e6ffed';
                this.style.borderColor = '#b7e4c7';
                this.style.color = '#28a745';
            });
        </script>
    </c:if>
    
    <script>
        
        document.querySelectorAll('.btn').forEach(btn => {
            btn.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-3px)';
            });
            btn.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });
        
        // Keyboard shortcuts
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                window.location.href = 'viewProfiles.jsp';
            }
            if (e.key === 'h' || e.key === 'H') {
                window.location.href = 'index.html';
            }
        });
    </script>
</body>
</html>