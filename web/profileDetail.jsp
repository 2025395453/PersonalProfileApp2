<%-- 
    Document   : profileDetail
    Created on : Dec 24, 2025, 9:04:33 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
    <title>Profile Details</title>
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
        
        .profile-container {
            max-width: 900px;
            width: 100%;
            animation: fadeIn 0.6s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .profile-card {
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(255, 107, 157, 0.15);
            border: 2px solid #ffb6c1;
            position: relative;
            overflow: hidden;
        }
        
        .profile-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, #ff6fa8, #ff8fb1, #ffb6c1);
        }
        
        .profile-header {
            text-align: center;
            margin-bottom: 35px;
            padding-bottom: 25px;
            border-bottom: 2px dashed #ffe6ee;
        }
        
        .profile-header h2 {
            color: #d63384;
            font-size: 2.2rem;
            margin-bottom: 15px;
            text-shadow: 2px 2px 4px rgba(214, 51, 132, 0.1);
        }
        
        .profile-id-badge {
            background: #fff0f6;
            color: #ff6fa8;
            padding: 8px 20px;
            border-radius: 25px;
            font-weight: bold;
            display: inline-block;
            border: 2px solid #ffb6c1;
            font-family: 'Courier New', monospace;
            font-size: 1.1rem;
            margin-top: 10px;
        }
        
        .details-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .detail-item {
            background: #fff9fb;
            padding: 20px;
            border-radius: 15px;
            border: 1px solid #ffd6e7;
            transition: transform 0.3s ease;
        }
        
        .detail-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(255, 182, 193, 0.2);
        }
        
        .detail-label {
            color: #ff4f9a;
            font-weight: 600;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .detail-icon {
            color: #ff6fa8;
            margin-right: 10px;
            font-size: 1.2em;
        }
        
        .detail-value {
            color: #333;
            font-size: 1.1rem;
            padding-left: 28px;
            line-height: 1.5;
        }
        
        .student-id-badge {
            background: #e7f5ff;
            color: #ff6fa8;
            padding: 8px 16px;
            border-radius: 10px;
            font-family: 'Courier New', monospace;
            font-weight: 600;
            border: 1px solid #ffb6c1;
            display: inline-block;
        }
        
        .program-badge {
            background: #fff0f6;
            color: #ff4f9a;
            padding: 8px 18px;
            border-radius: 20px;
            font-weight: 600;
            border: 1px solid #ffb6c1;
            display: inline-block;
        }
        
        .email-link {
            color: #ff6fa8;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        .email-link:hover {
            color: #e55a95;
            text-decoration: underline;
        }
        
        .hobbies-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 5px;
        }
        
        .hobby-tag {
            background: #e6ffed;
            color: #28a745;
            padding: 6px 14px;
            border-radius: 15px;
            font-size: 0.85rem;
            border: 1px solid #b7e4c7;
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
            padding: 20px;
            background: white;
            border-radius: 10px;
            border: 1px solid #ffd6e7;
            white-space: pre-wrap;
            font-size: 1.05rem;
        }
        
        .timestamp {
            background: #f8f9fa;
            padding: 10px 15px;
            border-radius: 10px;
            border: 1px solid #dee2e6;
            color: #666;
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 8px;
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
            min-width: 160px;
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
        
        .btn-danger {
            background: #ffe6e6;
            color: #dc3545;
            border: 2px solid #f5c6cb;
        }
        
        .btn-danger:hover {
            background: #dc3545;
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
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
        
        .error-state {
            text-align: center;
            padding: 40px;
        }
        
        .error-icon {
            color: #ff6fa8;
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0.7;
        }
        
        .error-message {
            color: #d63384;
            font-size: 1.5rem;
            margin-bottom: 20px;
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
        
        @media (max-width: 768px) {
            .profile-container {
                padding: 10px;
            }
            
            .profile-card {
                padding: 25px;
            }
            
            .details-section {
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
            
            .profile-header h2 {
                font-size: 1.8rem;
            }
            
            .floating-icons {
                display: none;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <sql:setDataSource 
        var="db"
        driver="org.apache.derby.jdbc.ClientDriver"
        url="jdbc:derby://localhost:1527/studentProfiles"
        user="app"
        password="app"
    />
    
    <sql:query var="result" dataSource="${db}">
        SELECT * FROM PROFILES WHERE ID = ?
        <sql:param value="${param.id}"/>
    </sql:query>
    
    <div class="profile-container">
        <div class="profile-card">
            <div class="floating-icons">
                <i class="fas fa-user-circle"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-heart"></i>
            </div>
            
            <c:choose>
                <c:when test="${result.rowCount > 0}">
                    <c:set var="p" value="${result.rows[0]}"/>
                    
                    <div class="profile-header">
                        <h2><i class="fas fa-user-circle" style="color: #ff6fa8; margin-right: 10px;"></i> Profile Details</h2>
                        <div class="profile-id-badge">
                            <i class="fas fa-hashtag"></i> Profile ID: ${p.ID}
                        </div>
                    </div>
                    
                    <div class="details-section">
                        <div class="detail-item">
                            <div class="detail-label">
                                <i class="fas fa-id-card detail-icon"></i> Student ID
                            </div>
                            <div class="detail-value">
                                <span class="student-id-badge">${p.STUDENT_ID}</span>
                            </div>
                        </div>
                        
                        <div class="detail-item">
                            <div class="detail-label">
                                <i class="fas fa-user detail-icon"></i> Full Name
                            </div>
                            <div class="detail-value" style="font-weight: 600; color: #333;">
                                ${p.NAME}
                            </div>
                        </div>
                        
                        <div class="detail-item">
                            <div class="detail-label">
                                <i class="fas fa-graduation-cap detail-icon"></i> Program
                            </div>
                            <div class="detail-value">
                                <span class="program-badge">${p.PROGRAM}</span>
                            </div>
                        </div>
                        
                        <div class="detail-item">
                            <div class="detail-label">
                                <i class="fas fa-envelope detail-icon"></i> Email Address
                            </div>
                            <div class="detail-value">
                                <a href="mailto:${p.EMAIL}" class="email-link">
                                    <i class="fas fa-envelope" style="margin-right: 8px;"></i>${p.EMAIL}
                                </a>
                            </div>
                        </div>
                        
                        <div class="detail-item">
                            <div class="detail-label">
                                <i class="fas fa-heart detail-icon"></i> Hobbies & Interests
                            </div>
                            <div class="detail-value">
                                <c:if test="${not empty p.HOBBIES}">
                                    <div class="hobbies-tags">
                                        <c:forEach var="hobby" items="${fn:split(p.HOBBIES, ',')}">
                                            <span class="hobby-tag">${fn:trim(hobby)}</span>
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <c:if test="${empty p.HOBBIES}">
                                    <span style="color: #999; font-style: italic;">Not specified</span>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    
                    <div class="intro-section">
                        <div class="intro-label">
                            <i class="fas fa-comment-dots"></i> Self Introduction
                        </div>
                        <div class="intro-content">${p.INTRO}</div>
                    </div>
                    
                    <c:if test="${not empty p.CREATED_AT}">
                        <div style="text-align: center; margin: 20px 0;">
                            <span class="timestamp">
                                <i class="far fa-clock"></i>
                                Profile Created: ${p.CREATED_AT}
                            </span>
                        </div>
                    </c:if>
                    
                    <div class="action-buttons">
                        <a href="DeleteServlet?id=${p.ID}" 
                           class="btn btn-danger"
                           onclick="return confirm('Are you sure you want to delete this profile? This action cannot be undone.')">
                            <i class="fas fa-trash"></i> Delete Profile
                        </a>
                        <a href="viewProfiles.jsp" class="btn btn-secondary">
                            <i class="fas fa-list"></i> Back to List
                        </a>
                        <a href="index.html" class="btn btn-pink">
                            <i class="fas fa-user-plus"></i> Add New Profile
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="error-state">
                        <div class="error-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                        <h3 class="error-message">Profile Not Found</h3>
                        <p style="color: #666; margin-bottom: 30px; max-width: 500px; margin: 0 auto 30px;">
                            The requested profile was not found in the database.
                            It may have been deleted or the ID is incorrect.
                        </p>
                        <div class="action-buttons">
                            <a href="viewProfiles.jsp" class="btn btn-secondary">
                                <i class="fas fa-list"></i> View All Profiles
                            </a>
                            <a href="index.html" class="btn btn-pink">
                                <i class="fas fa-user-plus"></i> Create New Profile
                            </a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <script>
        // Keyboard navigation
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                window.location.href = 'viewProfiles.jsp';
            }
            if (e.key === 'Backspace' && e.ctrlKey) {
                if (confirm('Go back to profiles list?')) {
                    window.location.href = 'viewProfiles.jsp';
                }
            }
        });
    </script>
</body>
</html>