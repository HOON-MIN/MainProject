<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%-- <nav class="navbar navbar-expand-sm mybgColor" >
     <div class="container-fluid" >
        <ul class="navbar-nav" >
            <li class="nav-item"><a href="/semi_secondProject/web/main" class="nav-link active" >약품리스트</a></li>
            <li class="nav-item"><a href="${mycontext}" class="nav-link">이미지로 약품조회</a></li>
            <li class="nav-item"><a href="${mycontext}#" class="nav-link">나의 의약품케이스</a></li>
            <li class="nav-item"><a href="/semi_secondProject/web/complainBoard/complainBoardList" class="nav-link">약품검색기록</a></li>
        </ul>
      </div>
</nav> --%>
<article>
	<div class="form-body">
		<div class="row">
			<div class="form-holder">
				<div class="form-content">
					<div class="form-items">
						<h4 class="mt-3 mb-3 text-center">약품 등록</h4>

						<p class="text-center mb-5">약품정보와 관련 식별이미지를 첨부해 주세요.</p>
						<form method="get" action="shapeSearch" id="shapeSearchform">

							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_idx" name="drug_idx" placeholder="약에 적힌 문자를 입력하세요  "
									required>

							</div>
							<span style='margin-right: 3px'>
								<p style="font-size: 15px; margin-bottom: 0px">
									전면 색깔 선택 <select name="drug_color_F">
										<option value="하양">하양</option>
										<option value="노랑">노랑</option>
										<option value="주황">주황</option>
										<option value="분홍">분홍</option>
										<option value="빨강">빨강</option>
										<option value="갈색">갈색</option>
										<option value="연두">연두</option>
										<option value="초록">초록</option>
										<option value="청록">청록</option>
										<option value="파랑">파랑</option>
										<option value="남색">남색</option>
										<option value="자주">자주</option>
										<option value="보라">보라</option>
										<option value="회색">회색</option>
										<option value="검정">검정</option>
										<option value="투명">투명</option>

									</select>
								</p>
							</span> <span style='margin-right: 3px'>
								<p style="font-size: 15px; margin-bottom: 0px">
									전면 색깔 선택 <select name="drug_color_B">
										<option value="selectedName">하양</option>
										<option value="selectedCompnent">노랑</option>
										<option value="selectedCompany">주황</option>
										<option value="selectedCompany">분홍</option>
										<option value="selectedCompany">빨강</option>
										<option value="selectedCompany">갈색</option>
										<option value="selectedCompany">연두</option>
										<option value="selectedCompany">초록</option>
										<option value="selectedCompany">청록</option>
										<option value="selectedCompany">파랑</option>
										<option value="selectedCompany">남색</option>
										<option value="selectedCompany">자주</option>
										<option value="selectedCompany">보라</option>
										<option value="selectedCompany">회색</option>
										<option value="selectedCompany">검정</option>
										<option value="selectedCompany">투명</option>

									</select>
								</p>
							</span>




							<div class="row mb-1 mt-3 ">
								<div class="col-sm-10">

									<input type="submit" value="검색" id="sahpeSearchTag"
										class="btn btn-primary" />
								</div>
							</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	

</article> --%>