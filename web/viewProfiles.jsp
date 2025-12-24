<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Profiles Database</title>
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
            padding: 20px;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            animation: fadeIn 0.5s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .header {
            background: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 25px;
            box-shadow: 0 10px 25px rgba(255, 107, 157, 0.1);
            border: 2px solid #ffb6c1;
            text-align: center;
        }
        
        .header h1 {
            color: #d63384;
            font-size: 2.3rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(214, 51, 132, 0.1);
        }
        
        .header p {
            color: #666;
            font-size: 1.1rem;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }
        
        .stats-bar {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(255, 182, 193, 0.15);
            text-align: center;
            min-width: 180px;
            border: 2px solid #ffd6e7;
            transition: transform 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(255, 182, 193, 0.25);
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #ff6fa8;
            display: block;
            margin-bottom: 8px;
            text-shadow: 2px 2px 4px rgba(255, 111, 168, 0.2);
        }
        
        .stat-label {
            color: #ff4f9a;
            font-size: 0.95rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .controls {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 8px 20px rgba(255, 182, 193, 0.1);
            border: 2px solid #ffd6e7;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .search-box {
            flex: 1;
            min-width: 300px;
        }
        
        .search-input {
            padding: 12px 20px;
            border: 2px solid #ffb6c1;
            border-radius: 50px;
            width: 100%;
            font-size: 1rem;
            background: #fff9fb;
            color: #333;
            transition: all 0.3s ease;
        }
        
        .search-input:focus {
            outline: none;
            border-color: #ff6fa8;
            box-shadow: 0 0 0 3px rgba(255, 111, 168, 0.2);
            background: white;
        }
        
        .btn {
            padding: 12px 25px;
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
        
        .btn-clear {
            background: #fff0f6;
            color: #ff4f9a;
            border: 2px solid #ffb6c1;
            padding: 10px 20px;
        }
        
        .btn-clear:hover {
            background: #ffe6ee;
        }
        
        .table-container {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 10px 25px rgba(255, 107, 157, 0.1);
            border: 2px solid #ffb6c1;
            overflow-x: auto;
        }
        
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            min-width: 1000px;
        }
        
        thead {
            background: linear-gradient(135deg, #ffe6ee 0%, #ffd6e7 100%);
        }
        
        th {
            padding: 18px 15px;
            text-align: left;
            font-weight: 600;
            color: #d63384;
            border-bottom: 3px solid #ffb6c1;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }
        
        tbody tr {
            border-bottom: 1px solid #ffe6ee;
            transition: all 0.3s ease;
        }
        
        tbody tr:hover {
            background: #fff9fb;
            transform: scale(1.005);
            box-shadow: 0 5px 15px rgba(255, 182, 193, 0.1);
        }
        
        td {
            padding: 16px 15px;
            color: #333;
            border-bottom: 1px solid #ffe6ee;
        }
        
        .profile-id {
            color: #ff6fa8;
            font-weight: bold;
            font-family: 'Courier New', monospace;
            background: #fff0f6;
            padding: 5px 10px;
            border-radius: 8px;
            display: inline-block;
        }
        
        .student-id {
            background: #e6f7ff;
            color: #ff6fa8;
            padding: 6px 12px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-weight: 600;
            border: 1px solid #ffb6c1;
        }
        
        .program-badge {
            background: #fff0f6;
            color: #ff4f9a;
            padding: 6px 15px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            display: inline-block;
            border: 1px solid #ffb6c1;
        }
        
        .email-link {
            color: #ff6fa8;
            text-decoration: none;
            font-weight: 500;
        }
        
        .email-link:hover {
            text-decoration: underline;
            color: #e55a95;
        }
        
        .hobbies-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
        }
        
        .hobby-tag {
            background: #e6ffed;
            color: #28a745;
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 0.8rem;
            border: 1px solid #b7e4c7;
        }
        
        .action-buttons {
            display: flex;
            gap: 8px;
        }
        
        .btn-action {
            padding: 8px 14px;
            border: none;
            border-radius: 8px;
            font-size: 0.9rem;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            min-width: 40px;
            height: 40px;
        }
        
        .btn-view {
            background: #fff0f6;
            color: #ff6fa8;
            border: 2px solid #ffb6c1;
        }
        
        .btn-view:hover {
            background: #ff6fa8;
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 111, 168, 0.3);
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
        
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }
        
        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #ffb6c1;
            opacity: 0.7;
        }
        
        .empty-state h3 {
            color: #d63384;
            margin-bottom: 15px;
        }
        
        .timestamp {
            font-size: 0.85rem;
            color: #888;
            font-family: 'Courier New', monospace;
            background: #f8f9fa;
            padding: 6px 12px;
            border-radius: 8px;
            display: inline-block;
        }
        
        .action-buttons-main {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            
            .controls {
                flex-direction: column;
                align-items: stretch;
            }
            
            .search-box {
                min-width: 100%;
            }
            
            .action-buttons-main {
                justify-content: center;
                width: 100%;
            }
            
            .header h1 {
                font-size: 1.8rem;
            }
            
            .table-container {
                padding: 15px;
            }
        }
        
        .footer-note {
            text-align: center;
            margin-top: 30px;
            color: #888;
            font-size: 0.9rem;
            padding: 15px;
            background: white;
            border-radius: 10px;
            border: 1px solid #ffd6e7;
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
    
    <c:set var="searchQuery" value="${param.search}" />
    
    <sql:query var="result" dataSource="${db}">
        SELECT 
            ID, 
            STUDENT_ID, 
            NAME, 
            PROGRAM, 
            EMAIL, 
            HOBBIES, 
            INTRO, 
            CREATED_AT
        FROM PROFILES
        <c:if test="${not empty searchQuery}">
            WHERE 
                NAME LIKE ? OR 
                STUDENT_ID LIKE ? OR 
                PROGRAM LIKE ? OR 
                EMAIL LIKE ?
            <sql:param value="%${searchQuery}%"/>
            <sql:param value="%${searchQuery}%"/>
            <sql:param value="%${searchQuery}%"/>
            <sql:param value="%${searchQuery}%"/>
        </c:if>
        ORDER BY CREATED_AT DESC
    </sql:query>
    
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-database" style="color: #ff6fa8;"></i> Student Profiles Database</h1>
            <p>Manage all student profiles stored in the system</p>
        </div>
        
        <div class="stats-bar">
            <div class="stat-card">
                <span class="stat-number">${result.rowCount}</span>
                <span class="stat-label">Total Profiles</span>
            </div>
            <div class="stat-card">
                <span class="stat-number">
                    <sql:query var="uniquePrograms" dataSource="${db}">
                        SELECT COUNT(DISTINCT PROGRAM) AS PROG_COUNT FROM PROFILES
                    </sql:query>
                    ${uniquePrograms.rows[0].PROG_COUNT}
                </span>
                <span class="stat-label">Unique Programs</span>
            </div>
            <div class="stat-card">
                <span class="stat-number">
                    <sql:query var="recentProfiles" dataSource="${db}">
                        SELECT COUNT(*) AS TODAY_COUNT FROM PROFILES 
                        WHERE DATE(CREATED_AT) = CURRENT_DATE
                    </sql:query>
                    ${recentProfiles.rows[0].TODAY_COUNT}
                </span>
                <span class="stat-label">Added Today</span>
            </div>
        </div>
        
        <div class="controls">
            <div class="search-box">
                <form method="get" action="viewProfiles.jsp" style="display: flex; gap: 12px;">
                    <input type="text" 
                           name="search" 
                           class="search-input" 
                           placeholder="🔍 Search by name, ID, program, or email..."
                           value="${searchQuery}">
                    <button type="submit" class="btn btn-pink">
                        <i class="fas fa-search"></i> Search
                    </button>
                    <c:if test="${not empty searchQuery}">
                        <a href="viewProfiles.jsp" class="btn btn-clear">
                            <i class="fas fa-times"></i> Clear
                        </a>
                    </c:if>
                </form>
            </div>
            
            <div class="action-buttons-main">
                <a href="index.html" class="btn btn-pink">
                    <i class="fas fa-user-plus"></i> Add New Profile
                </a>
                <a href="viewProfiles.jsp" class="btn btn-secondary">
                    <i class="fas fa-sync-alt"></i> Refresh
                </a>
            </div>
        </div>
        
        <div class="table-container">
            <c:choose>
                <c:when test="${result.rowCount > 0}">
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Student ID</th>
                                <th>Name</th>
                                <th>Program</th>
                                <th>Email</th>
                                <th>Hobbies</th>
                                <th>Created</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${result.rows}" varStatus="status">
                                <tr>
                                    <td>
                                        <span class="profile-id">${row.ID}</span>
                                    </td>
                                    <td>
                                        <span class="student-id">${row.STUDENT_ID}</span>
                                    </td>
                                    <td>
                                        <strong style="color: #333;">${row.NAME}</strong>
                                    </td>
                                    <td>
                                        <span class="program-badge">${row.PROGRAM}</span>
                                    </td>
                                    <td>
                                        <a href="mailto:${row.EMAIL}" class="email-link">
                                            <i class="fas fa-envelope" style="margin-right: 5px;"></i>${row.EMAIL}
                                        </a>
                                    </td>
                                    <td>
                                        <div class="hobbies-tags">
                                            <c:if test="${not empty row.HOBBIES}">
                                                <c:set var="hobbyList" value="${fn:split(row.HOBBIES, ',')}" />
                                                <c:forEach var="hobby" items="${hobbyList}" begin="0" end="2">
                                                    <span class="hobby-tag">
                                                        ${fn:trim(hobby)}
                                                    </span>
                                                </c:forEach>
                                                <c:if test="${fn:length(hobbyList) > 3}">
                                                    <span class="hobby-tag">+${fn:length(hobbyList) - 3}</span>
                                                </c:if>
                                            </c:if>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="timestamp">
                                            <i class="far fa-clock" style="margin-right: 5px;"></i>
                                            <fmt:formatDate value="${row.CREATED_AT}" pattern="yyyy-MM-dd HH:mm" />
                                        </span>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="profileDetail.jsp?id=${row.ID}" 
                                               class="btn-action btn-view"
                                               title="View Details">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a href="DeleteServlet?id=${row.ID}" 
                                               class="btn-action btn-delete"
                                               title="Delete"
                                               onclick="return confirm('Delete profile for ${row.NAME}?')">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="fas fa-database fa-4x"></i>
                        <h3>No Profiles Found</h3>
                        <p style="color: #666; max-width: 500px; margin: 0 auto 20px;">
                            ${not empty searchQuery ? 
                                'No profiles match your search criteria.' : 
                                'The database is empty. Add the first profile!'}
                        </p>
                        <a href="index.html" class="btn btn-pink" style="margin-top: 20px;">
                            <i class="fas fa-user-plus"></i> Create First Profile
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="footer-note">
            <i class="fas fa-info-circle" style="color: #ff6fa8; margin-right: 8px;"></i>
            Showing ${result.rowCount} profile(s) • Auto-refreshes every 60 seconds
        </div>
    </div>
    
    <script>
        setTimeout(function() {
            if (!document.querySelector('.search-input')?.value) {
                window.location.reload();
            }
        }, 60000);
        
        document.querySelector('.search-input')?.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                this.form.submit();
            }
        });
        
        // Add row hover effects for better UX
        document.querySelectorAll('tbody tr').forEach(row => {
            row.addEventListener('mouseenter', function() {
                this.style.transition = 'all 0.3s ease';
            });
        });
    </script>
</body>
</html>