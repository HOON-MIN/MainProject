<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<span>
		<p>
			<a href="drugList" style="margin-right: 40px">��ǰ����Ʈ</a> <a href=""
				style="margin-right: 40px">�̹����ξ�ǰ��ȸ</a> <a href=""
				style="margin-right: 40px">�����Ǿ�ǰ���̽�</a> <a href=""
				style="margin-right: 40px">��ǰ�˻����</a>
		</p>
	</span>
</div>

<article>
	<div class="form-body">
		<div class="row">
			<div class="form-holder">
				<div class="form-content">
					<div class="form-items">
						<h4 class="mt-3 mb-3 text-center">��ǰ ������</h4>

						<p class="text-center mb-5">������� �� ã��.</p>
						<form method="get" action="shapeSearch" id="shapeSearchform">

							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_idx" name="drug_idx" placeholder="�࿡ ���� ���ڸ� �Է��ϼ���  "
									required>

							</div>
							<span style='margin-bottom: 50px'>
								<p style="font-size: 15px">
									���� ���� ���� : <select name="drug_color_F">
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
										<option value="��Ÿ">��Ÿ</option>

									</select> �ĸ� ���� ���� : <select name="drug_color_B">
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
										<option value="��Ÿ">��Ÿ</option>


									</select>
								</p>
							</span>
							<p>
								<span style='margin-bottom: 50px'> ��� ���� : <select
									name="drug_shape">
										<option value="����">"����"</option>
										<option value="Ÿ����">"Ÿ����"</option>
										<option value="�����">"�����"</option>
										<option value="�ݿ���">"�ݿ���"</option>
										<option value="�ﰢ��">"�ﰢ��"</option>
										<option value="�簢��">"�簢��"</option>
										<option value="��������">"��������"</option>
										<option value="������">"������"</option>
										<option value="������">"������"</option>
										<option value="�Ȱ���">"�Ȱ���"</option>
										<option value="��Ÿ">"��Ÿ"</option>
								</select> ���� ���� : <select name="drug_formulation">
										<option value="����">"����"</option>
										<option value="����ĸ��">"����ĸ��"</option>
										<option value="����ĸ��">"����ĸ��"</option>
										<option value="��Ÿ">"��Ÿ"</option>
								</select>
							</p>
							<p>

								</span> <span style='margin-bottom: 50px'> ���� ���Ҽ� ���� : <select
									name="drug_split_line_F">
										<option value="����">"����"</option>
										<option value="(+)��">"(+)��"</option>
										<option value="(-)��">"(-)��"</option>
										<option value="��Ÿ">"��Ÿ"</option>
								</select> �ĸ� ���Ҽ� ���� : <select name="drug_split_line_B">
										<option value="����">"����"</option>
										<option value="(+)��">"(+)��"</option>
										<option value="(-)��">"(-)��"</option>
										<option value="��Ÿ">"��Ÿ"</option>
								</select>
								</span>
							</p>
							<div class="row mb-1 mt-3 ">
								<div class="col-sm-10">

									<input type="submit" value="�˻�" class="btn btn-primary" />
								</div>
							</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</article>
--%>
