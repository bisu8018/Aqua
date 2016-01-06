<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:if test="${empty param.p}">
	<c:set var="p" value="1" />
</c:if>
<c:if test="${not empty param.p}">
	<c:set var="p" value="${param.p}" />
</c:if>



<c:set var="prev" value="${param.p-10}" />
<c:set var="next" value="${param.p+10}" />
<c:set var="lastNum"
	value="${fn:substringBefore((recordCount/10==0? recordCount/10 : recordCount/10+1),'.')}" />



<section>
	<c:if test="${p>10}">
		<a href="?p=${prev}&f=${param.f}&q=${param.q}"> <input
			type="button" value="<"></a>
	</c:if>
	<c:forEach var="i" begin="${p-(p%10)+1}" end="${p-(p%10)+10}">
		<c:if test="${i <= lastNum }">
			<c:if test="${i==p}">
				<a class="strong" href="?p=${i}&f=${param.f}&q=${param.q}">${i}</a>
			</c:if>
			<c:if test="${i!=p}">
				<a href="?p=${i}&f=${param.f}&q=${param.q}">${i}</a>
			</c:if>
		</c:if>
	</c:forEach>

	<c:if test="${lastNum-lastNum%10+1 <=p}">
	</c:if>
	<c:if test="${lastNum-lastNum%10+1 >p}">
		<a href="?p=${next}&f=${param.f}&q=${param.q}"> <input
			type="button" value=">"></a>
	</c:if>
</section>
