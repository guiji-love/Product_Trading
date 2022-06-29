<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/8
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--分页需求，显示5个页码，并且当前选中页码位于中间，如选择页码4，则显示2，3，4，5，6（总页码大于5的情况下）--%>

<%--分页条的开始--%>
<div class="row tm-row tm-mt-100 tm-mb-75">
    <div class="tm-prev-next-wrapper">
            <a href="${ requestScope.page.url }&pageNo=${requestScope.page.pageNo-1}" class="mb-2 tm-btn tm-btn-primary tm-prev-next ">Prev</a>
            <a href="${ requestScope.page.url }&pageNo=${requestScope.page.pageNo+1}" class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
    </div>
    <div class="tm-paging-wrapper">
        <span class="d-inline-block mr-3">Page</span>
        <nav class="tm-paging-nav d-inline-block">
            <ul>
                <%--大于首页，才显示--%>
                <c:if test="${requestScope.page.pageNo > 1}">
                    <li class="tm-paging-item ">
                    <a href="${ requestScope.page.url }&pageNo=1" class="mb-2 tm-btn tm-paging-link">首页</a>
                    </li>
                </c:if>
                <%--页码输出的开始--%>
                <c:choose>
                    <%--情况1：如果总页码小于等于5的情况，页码的范围是：1~总页码--%>
                    <c:when test="${ requestScope.page.pageTotal <= 5 }">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="${requestScope.page.pageTotal}"/>
                    </c:when>
                    <%--情况2：总页码大于5的情况，假定当前总页码为10--%>
                    <c:when test="${requestScope.page.pageTotal > 5}">
                        <c:choose>
                            <%--小情况1：当前页码为前面3个：1，2，3的情况，页码范围是：1~5.--%>
                            <c:when test="${requestScope.page.pageNo <= 3}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="5"/>
                            </c:when>
                            <%--小情况2：当前页码为最后3个，8，9，10，页码范围是：总页码减4~总页码--%>
                            <c:when test="${requestScope.page.pageNo > requestScope.page.pageTotal-3}">
                                <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                                <c:set var="end" value="${requestScope.page.pageTotal}"/>
                            </c:when>
                            <%--小情况3：4，5，6，7，页码范围是：当前页码减2~当前页码加2--%>
                            <c:otherwise>
                                <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                                <c:set var="end" value="${requestScope.page.pageNo+2}"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                </c:choose>
                <c:forEach begin="${begin}" end="${end}" var="i">
                    <c:if test="${i == requestScope.page.pageNo}">
                        <li class="tm-paging-item active">
                            <%--<a href="#" class="mb-2 tm-btn tm-paging-link"> ${i}</a>--%>
                            <span class="mb-2 tm-btn tm-paging-link">
                                    ${i}
                            </span>
                        </li>
                    </c:if>
                    <c:if test="${i != requestScope.page.pageNo}">
                        <li class="tm-paging-item">
                            <a href="${ requestScope.page.url }&pageNo=${i}" class="mb-2 tm-btn tm-paging-link">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <%--页码输出的结束--%>
                <%-- 如果已经是最后一页，则不显示下一页，末页 --%>
                <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
                    <li class="tm-paging-item">
                        <a href="${ requestScope.page.url }&pageNo=${requestScope.page.pageTotal}" class="mb-2 tm-btn tm-paging-link">末页</a>
                    </li>
                </c:if>
                    共${ requestScope.page.pageTotal }页，${ requestScope.page.pageTotalCount }件物品
            </ul>
        </nav>
    </div>
</div>
<%--分页条的结束--%>