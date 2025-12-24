<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Saved</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ffe6ee 0%, #ffd6e7 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .profile-container {
            max-width: 900px;
            width: 100%;
            animation: fadeIn 0.6s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .success-card {
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(255, 107, 157, 0.15);
            border: 2px solid #ffb6c1;
            position: relative;
            overflow: hidden;
        }
        
        .success-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, #ff6fa8, #ff8fb1, #ffb6c1);
        }
        
        .success-badge {
            background: linear-gradient(135deg, #ff8fb1, #ff6fa8);
            color: white;
            padding: 12px 25px;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 25px;
            font-weight: 600;
            box-shadow: 0 5px 15px rgba(255, 111, 168, 0.3);
        }
        
        .success-badge i {
            font-size: 1.2em;
        }
        
        .profile-header {
            text-align: center;
            margin-bottom: 35px;
            padding-bottom: 25px;
            border-bottom: 2px dashed #ffe6ee;
        }
        
        .profile-header h1 {
            color: #d63384;
            font-size: 2.2rem;
            margin-bottom: 15px;
            text-shadow: 2px 2px 4px rgba(214, 51, 132, 0.1);
        }
        
        .student-id-badge {
            background: #fff0f6;
            color: #ff4f9a;
            padding: 8px 20px;
            border-radius: 25px;
            font-weight: bold;
            display: inline-block;
            border: 2px solid #ffb6c1;
            font-family: 'Courier New', monospace;
            font-size: 1.1rem;
            margin-top: 10px;
        }
        
        .profile-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .detail-card {
            background: #fff9fb;
            padding: 20px;
            border-radius: 15px;
            border: 1px solid #ffd6e7;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .detail-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(255, 182, 193, 0.2);
        }
        
        .detail-icon {
            color: #ff6fa8;
            margin-right: 10px;
            font-size: 1.2em;
        }
        
        .detail-label {
            color: #ff4f9a;
            font-weight: 600;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .detail-value {
            color: #333;
            font-size: 1.1rem;
            padding-left: 28px;
            line-height: 1.5;
        }
        
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 15px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .status-success {
            background: #e6ffed;
            color: #28a745;
            border: 1px solid #b7e4c7;
        }
        
        .status-fail {
            background: #ffe6e6;
            color: #dc3545;
            border: 1px solid #f5c6cb;
        }
        
        .intro-section {
            background: #fff0f6;
            padding: 25px;
            border-radius: 15px;
            margin: 25px 0;
            border-left: 5px solid #ff6fa8;
            box-shadow: inset 0 2px 10px rgba(255, 182, 193, 0.1);
        }
        
        .intro-label {
            color: #d63384;
            font-weight: 600;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.1rem;
        }
        
        .intro-content {
            color: #555;
            line-height: 1.8;
            padding: 15px;
            background: white;
            border-radius: 10px;
            border: 1px solid #ffd6e7;
            white-space: pre-wrap;
            font-size: 1rem;
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 2px dashed #ffe6ee;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 14px 30px;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            font-size: 1rem;
            min-width: 180px;
            justify-content: center;
        }
        
        .btn-pink {
            background: linear-gradient(135deg, #ff6fa8, #ff8fb1);
            color: white;
            box-shadow: 0 5px 15px rgba(255, 111, 168, 0.3);
        }
        
        .btn-pink:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(255, 111, 168, 0.4);
            background: linear-gradient(135deg, #ff5a9c, #ff7ba9);
        }
        
        .btn-secondary {
            background: #fff0f6;
            color: #ff4f9a;
            border: 2px solid #ffb6c1;
        }
        
        .btn-secondary:hover {
            background: #ffe6ee;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 182, 193, 0.3);
        }
        
        .btn i {
            font-size: 1.1em;
        }
        
        @media (max-width: 768px) {
            .profile-container {
                padding: 10px;
            }
            
            .success-card {
                padding: 25px;
            }
            
            .profile-grid {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                max-width: 300px;
            }
            
            .profile-header h1 {
                font-size: 1.8rem;
            }
        }
        
        .floating-icons {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            gap: 10px;
            opacity: 0.7;
        }
        
        .floating-icons i {
            color: #ffb6c1;
            font-size: 1.5rem;
            animation: float 3s ease-in-out infinite;
        }
        
        .floating-icons i:nth-child(2) {
            animation-delay: 0.5s;
        }
        
        .floating-icons i:nth-child(3) {
            animation-delay: 1s;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <c:set var="profile" value="${requestScope.profile}" />
    <c:set var="message" value="${requestScope.message}" />
    <c:set var="success" value="${requestScope.success}" />
    
    <div class="profile-container">
        <div class="success-card">
            <div class="floating-icons">
                <i class="fas fa-heart"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-check-circle"></i>
            </div>
            
            <c:if test="${not empty message}">
                <div class="success-badge">
                    <i class="fas fa-check-circle"></i> ${message}
                </div>
            </c:if>
            

<div class="profile-header">
    <c:choose>
        <c:when test="${success}">
            <h1>✨ Profile Saved Successfully!</h1>
            <div class="student-id-badge">
                <i class="fas fa-id-card"></i> ${profile.studentId}
            </div>
            <p style="color: #666; margin-top: 15px; font-size: 1.1rem;">
                Your profile has been securely stored in the database
            </p>
        </c:when>
        <c:otherwise>
            <h1 style="color: #dc3545;">⚠️ Profile Not Saved</h1>
            <div class="student-id-badge" style="background: #ffe6e6; border-color: #f5c6cb;">
                <i class="fas fa-exclamation-circle"></i> Student ID Conflict
            </div>
            <p style="color: #666; margin-top: 15px; font-size: 1.1rem;">
                Profile could not be saved. Student ID may already exist.
            </p>
        </c:otherwise>
    </c:choose>
</div>
            
            <div class="profile-grid">
                <div class="detail-card">
                    <div class="detail-label">
                        <i class="fas fa-user detail-icon"></i> Full Name
                    </div>
                    <div class="detail-value">${profile.name}</div>
                </div>
                
                <div class="detail-card">
                    <div class="detail-label">
                        <i class="fas fa-graduation-cap detail-icon"></i> Program
                    </div>
                    <div class="detail-value">${profile.program}</div>
                </div>
                
                <div class="detail-card">
                    <div class="detail-label">
                        <i class="fas fa-envelope detail-icon"></i> Email
                    </div>
                    <div class="detail-value">${profile.email}</div>
                </div>
                
                <div class="detail-card">
                    <div class="detail-label">
                        <i class="fas fa-heart detail-icon"></i> Hobbies
                    </div>
                    <div class="detail-value">${profile.hobbies}</div>
                </div>
                
                <div class="detail-card">
                    <div class="detail-label">
                        <i class="fas fa-database detail-icon"></i> Database Status
                    </div>
                    <div class="detail-value">
                        <span class="status-badge ${success ? 'status-success' : 'status-fail'}">
                            <i class="fas ${success ? 'fa-check' : 'fa-times'}"></i>
                            ${success ? 'Successfully Saved' : 'Not Saved'}
                        </span>
                    </div>
                </div>
            </div>
            
            <div class="intro-section">
                <div class="intro-label">
                    <i class="fas fa-comment-dots"></i> Self Introduction
                </div>
                <div class="intro-content">${profile.intro}</div>
            </div>
            
            <div class="action-buttons">
    <c:choose>
        <c:when test="${success}">
            <a href="index.html" class="btn btn-pink">
                <i class="fas fa-user-plus"></i> Create Another
            </a>
            <a href="viewProfiles.jsp" class="btn btn-secondary">
                <i class="fas fa-list"></i> View All Profiles
            </a>
        </c:when>
        <c:otherwise>
            <a href="index.html" class="btn btn-pink">
                <i class="fas fa-edit"></i> Try Again
            </a>
            <a href="viewProfiles.jsp" class="btn btn-secondary">
                <i class="fas fa-search"></i> Check Existing Profiles
            </a>
        </c:otherwise>
    </c:choose>
</div>
        </div>
    </div>
    
    <script>

        <c:if test="${success}">
        setTimeout(() => {
            document.querySelector('.success-badge').style.animation = 'none';
            setTimeout(() => {
                document.querySelector('.success-badge').style.animation = 'float 2s ease-in-out infinite';
            }, 10);
        }, 1000);
        </c:if>
    </script>
</body>
</html>