<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<ul class="nav nav-pills justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Active</a>
  </li>
<!--   mireu link -->
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
    	mireu</a>
    <ul class="dropdown-menu">
      <li><a class="dropdown-item" href="${mycontext }/hospital/hospitalList">hospitalList</a></li>
      <li><hr class="dropdown-divider"></li>
      <li><a class="dropdown-item" href="${mycontext }/quesboard/qbForm">QuesBoard Form</a></li>
      <li><a class="dropdown-item" href="${mycontext }/quesboard/qbList">QuesBoard List</a></li>
      <li><a class="dropdown-item" href="#">Separated link</a></li>
    </ul>
  </li>
<!--    -->

  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
  </li>
</ul>
