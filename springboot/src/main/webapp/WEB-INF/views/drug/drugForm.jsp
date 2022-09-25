<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="form-body">
		<div class="row">
			<div class="form-holder">
				<div class="form-content">
					<div class="form-items">
						<h4 class="mt-3 mb-3 text-center">��ǰ ���</h4>

						<p class="text-center mb-5">��ǰ������ ���� �ĺ��̹����� ÷���� �ּ���.</p>
						<form class="requires-validation nav justify-content-center"
							method="post" action="drugInsert" enctype="multipart/form-data"
							id="cbupform">

							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_name" name="drug_name" placeholder="��ǰ���� �Է��ϼ��� "
									required>
							</div>

							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_code" maxlength="13" name="drug_code"
									placeholder="��ǰ��ȣ�� �Է��ϼ���(13�ڸ�) " required>

							</div>

							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_identification" name="drug_identification"
									placeholder="�ĺ�ǥ�ø� �Է��ϼ��� ">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_formulation" name="drug_formulation"
									placeholder="������ �Է��ϼ��� ">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_component" name="drug_component"
									placeholder="������ �Է��ϼ��� ">
							</div>


							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_company" name="drug_company" placeholder="�����縦 �Է��ϼ��� ">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_description" name="drug_description"
									placeholder="������ �Է��ϼ��� ">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="number"
									id="drug_size_l" name="drug_size_l" placeholder="���� �Է� ">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="number"
									id="drug_size_s" name="drug_size_s" placeholder="���� �Է�">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="number"
									id="drug_size_w" name="drug_size_w" placeholder="�β� �Է� ">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_effect" name="drug_effect" placeholder="ȿ��.ȿ�� �Է�">
							</div>
							<div class="col-md-10 mb-3 ">
								<label>����/�Ϲ� ��ǰ ����</label> <input type="radio"
									name="drug_Professional_General" value="����" checked> <input
									type="radio" name="drug_Professional_General" value="�Ϲ�">
							</div>

							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_color_F" name="drug_color_F" placeholder="���������  �Է�">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_color_B" name="drug_color_B" placeholder="���ĸ����  �Է�">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_split_line_F" name="drug_split_line_F"
									placeholder="�� ���� ���Ҽ�  �Է�">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_split_line_B" name="drug_split_line_B"
									placeholder="�� �ĸ� ���Ҽ� �Է�">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control	 text-center" type="text"
									id="drug_disposal" name="drug_disposal" placeholder="�ľ�ó�з�  �Է�">
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text"
									id="drug_shape" name="drug_shape" placeholder="���� �Է�">
							</div>



							<div class="col-md-10 mb-3  nav justify-content-end">
								<label class="col-sm-3 col-form-label btn btn-primary  mb-3"
									for="mfile">�̹������ε�</label>
								<div class="col-sm-10 class">
									<input type="file" name="mfile" id="mfile" value="fileOriName" style="display: none;" />
								</div>
								<div class="col-sm-10 d-flex justify-content-center form-control " >
									<img 
										src="kimsungwook/loadimg/noimage.jpg" alt=""
				  						id="imgx" style="width: 120px" height="120px">
								</div>

								<div class="row mb-1 mt-3 ">
									<div class="col-sm-10">

										<input type="submit" value="���" id="btn1"
											class="btn btn-primary" />
									</div>
								</div>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$("#mfile").on('change', function() {
				readURL(this);
			});
			//---------------------------
			
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#imgx').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>


</article>