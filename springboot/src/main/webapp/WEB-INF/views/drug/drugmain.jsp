<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%-- <nav class="navbar navbar-expand-sm mybgColor" >
     <div class="container-fluid" >
        <ul class="navbar-nav" >
            <li class="nav-item"><a href="/semi_secondProject/web/main" class="nav-link active" >��ǰ����Ʈ</a></li>
            <li class="nav-item"><a href="${mycontext}" class="nav-link">�̹����� ��ǰ��ȸ</a></li>
            <li class="nav-item"><a href="${mycontext}#" class="nav-link">���� �Ǿ�ǰ���̽�</a></li>
            <li class="nav-item"><a href="/semi_secondProject/web/complainBoard/complainBoardList" class="nav-link">��ǰ�˻����</a></li>
        </ul>
      </div>
</nav> --%>
<article>
	<div class="form-body">
		<div class="row">
			<div class="form-holder">
				<div class="form-content">
					<div class="form-items">
						<h4 class="mt-3 mb-3 text-center">��ǰ ���</h4>

						<p class="text-center mb-5">��ǰ������ ���� �ĺ��̹����� ÷���� �ּ���.</p>
						<form method="get" action="shapeSearch" id="shapeSearchform">

							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_idx" name="drug_idx" placeholder="�࿡ ���� ���ڸ� �Է��ϼ���  "
									required>

							</div>
							<span style='margin-right: 3px'>
								<p style="font-size: 15px; margin-bottom: 0px">
									���� ���� ���� <select name="drug_color_F">
										<option value="�Ͼ�">�Ͼ�</option>
										<option value="���">���</option>
										<option value="��Ȳ">��Ȳ</option>
										<option value="��ȫ">��ȫ</option>
										<option value="����">����</option>
										<option value="����">����</option>
										<option value="����">����</option>
										<option value="�ʷ�">�ʷ�</option>
										<option value="û��">û��</option>
										<option value="�Ķ�">�Ķ�</option>
										<option value="����">����</option>
										<option value="����">����</option>
										<option value="����">����</option>
										<option value="ȸ��">ȸ��</option>
										<option value="����">����</option>
										<option value="����">����</option>

									</select>
								</p>
							</span> <span style='margin-right: 3px'>
								<p style="font-size: 15px; margin-bottom: 0px">
									���� ���� ���� <select name="drug_color_B">
										<option value="selectedName">�Ͼ�</option>
										<option value="selectedCompnent">���</option>
										<option value="selectedCompany">��Ȳ</option>
										<option value="selectedCompany">��ȫ</option>
										<option value="selectedCompany">����</option>
										<option value="selectedCompany">����</option>
										<option value="selectedCompany">����</option>
										<option value="selectedCompany">�ʷ�</option>
										<option value="selectedCompany">û��</option>
										<option value="selectedCompany">�Ķ�</option>
										<option value="selectedCompany">����</option>
										<option value="selectedCompany">����</option>
										<option value="selectedCompany">����</option>
										<option value="selectedCompany">ȸ��</option>
										<option value="selectedCompany">����</option>
										<option value="selectedCompany">����</option>

									</select>
								</p>
							</span>




							<div class="row mb-1 mt-3 ">
								<div class="col-sm-10">

									<input type="submit" value="�˻�" id="sahpeSearchTag"
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