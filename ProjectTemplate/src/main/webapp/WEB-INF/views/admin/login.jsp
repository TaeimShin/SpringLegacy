<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./commons/header.jsp" %>
<body>
<script type="text/javascript">
    function caps_lock(e) {
    		
            var keyCode = 0;
            var shiftKey = false;
            keyCode = e.keyCode;
            shiftKey = e.shiftKey;
            if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
                    || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
                show_caps_lock();
            } 
        }
 
    function show_caps_lock() {
    	/* alert("d"); */
    	toastr.warning('Capslock키 켜져있음');
    }

    
    toastr.options = {
			  "closeButton": false,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": true,
			  "positionClass": "toast-top-right",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "100",
			  "hideDuration": "1000",
			  "timeOut": "1500",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
			}
			
	
</script>
<div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
		<div class="app-main">
			<!-- <div class="app-main__outer"> -->
			<div class="app-main__inner">
				<div class="app-page-title">
					<div class="page-title-wrapper">
						<div class="page-title-heading">
							<div class="page-title-icon">
								<i class="pe-7s-graph text-success"> </i>
							</div>
							<div>
								로그인페이지
								<div class="page-title-subheading">로그인하세요</div>
							</div>
						</div>
					</div>
				</div>

				<div class="main-card mb-3 card">
					<div class="card-body">
						<h5 class="card-title">관리자페이지 로그인</h5>
						<form class="">
							<div class="position-relative row form-group">
								<label for="exampleId" class="col-sm-2 col-form-label">Id</label>
								<div class="col-sm-5">
								<!-- 수정~ -->
									<input name="Id" id="exampleId"
										placeholder="with a placeholder" 
										class="form-control" >
								</div>
							</div>
							<div class="position-relative row form-group">
								<label for="examplePassword" class="col-sm-2 col-form-label">Password</label>
								<div class="col-sm-5">
									<input name="password" id="examplePassword"
										placeholder="password placeholder" type="password"
										class="form-control" onkeypress="caps_lock(event)">
								</div>
							</div>
							
							<div class="position-relative row form-group">
								<label for="checkbox2" class="col-sm-2 col-form-label"></label>
								<div class="col-sm-10">
									<div class="position-relative form-check">
										<label class="form-check-label"><input id="checkbox2"
											type="checkbox" class="form-check-input"> 아이디 저장</label>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label class="form-check-label"><input id="checkbox2"
											type="checkbox" class="form-check-input"> 로그인 정보 저장</label>	
									</div>
							
								</div>
							</div>
							
							<div class="position-relative row form-check">
								<div class="col-sm-10 offset-sm-2">
									<button class="btn btn-primary">Login</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!--      </div> -->
			</div>
		</div>
	</div> 
    
<script type="text/javascript" src="./assets/scripts/main.js"></script>
</body>
</html>