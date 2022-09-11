<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>

</style>

<div class="container" style="height: 50%">
    
        <div class="panel panel-success" style="width: 35%; margin: auto;" >
            <div class="panel-heading">
                <div class="panel-title">환영합니다!</div>
            </div>
            <div class="panel-body" >
                <form id="login-form" action="memberLogin" method="post">
                    <div class="login-div">
                        <input type="text" class="form-control" name="id" placeholder="id" autofocus>
                    </div>
                    <div class="login-div">
                        <input type="password" class="form-control" name="pwd" id="pwd"  placeholder="Password">
                    </div>
                    <div class="login-div">
                        <button type="submit" class="form-control btn btn-primary">로그인</button>
                    </div>
                </form>
            </div>
        </div>
  
</div>

