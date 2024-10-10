<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
   <%@include file="public/header.jsp" %>
   <style>
        @media screen and (min-width: 768px) and (max-width: 992px) {
        
            .row .brandAndPrice {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .row .brandAndPrice p {
                margin-left: 0 !important;
            }
            
            .car-wrap .text .mb-0 {
                text-align: center;
            }
            
            .car-wrap .text h2 {
                height: 90px;
            }
}
   </style>
  <body>
    
	 <%@include file="public/menu.jsp" %>
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Cars <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">Choose Your Car</h1>
          </div>
        </div>
      </div>
    </section>
		

    <section class="ftco-section bg-light">
    	<div class="container">
            
            <!--Filter-->
            <form class="filter" action="car" method="GET" 
                  style= "display: flex;
                          justify-content: center;
                          flex-direction: column;
                          margin-bottom: 50px;
                          align-items: center;
                          ">
                
            <!--Search Bar-->
                <div class="search__bar">
                     <input type="text" name="car_name" class="search" placeholder="Nhập tên xe" value="${name}">
                     <button type="submit" style="background: none;
                                                    border: none;
                                                    outline: none">
                        <i class="fa-solid fa-magnifying-glass" style="color: #007bff;
                                                                        font-size: 18px;"></i>

                    </a>
                </div>
            
            <!--Search Fields-->            
                <div class="select__box" 
                     style="display: flex;
                            flex-wrap: wrap;
                            align-item: center;
                            "
                        >
                    <div class="select__box--item">
                        <label for="color">Màu</label>
                        <select name="color" id="color">
                            <option value="">Tất cả</option>
                            <c:forEach var="item" items="${colors}">
                                <option value="${item}" ${(item == color) ? "selected" : ""}>${item}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="select__box--item">
                        <label for="district_id">Điểm thuê</label>
                        <select name="district_id" id="district_id">
                            <option value="">Tất cả</option>
                            <c:forEach var="item" items="${districts}">
                                <option value="${item.id}" ${(item.id == district_id) ? "selected" : ""}>${item.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="select__box--item">
                        <label for="car_brand_id">Hãng xe</label>
                        <select name="car_brand_id" id="car_brand_id">
                            <option value="">Tất cả</option>
                            <c:forEach var="item" items="${brands}">
                                <option value="${item.id}" ${(item.id == car_brand_id) ? "selected" : ""}>${item.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="select__box--item">
                        <label for="car_type_id">Loại xe</label>
                        <select name="car_type_id" id="car_type_id">
                            <option value="">Tất cả</option>
                            <c:forEach var="item" items="${types}">
                                <option value="${item.id}" ${(item.id == car_type_id) ? "selected" : ""}>${item.type}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="select__box--item">
                        <label for="seats">Số chỗ</label>
                        <select name="seats" id="seats">
                            <option value="">Tất cả</option>
                            <c:forEach var="item" items="${seats}">
                                <option value="${item}" ${(item == seat) ? "selected" : ""}>${item}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="select__box--item">
                        <label for="transmission">Loại hộp số</label>
                        <select name="transmission" id="transmission">
                            <option value="">Tất cả</option>
                            <c:forEach var="item" items="${transmissions}">
                                <option value="${item}" ${(item == transmission) ? "selected" : ""}>${item}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="select__box--item">
                        <label for="priceFrom">Giá thuê từ</label>
                        <input type="text" id="priceFrom" name="priceFrom" value="${priceFrom}">
                    </div>
                    <div class="select__box--item">
                        <label for="priceTo">Giá thuê đến</label>
                        <input type="text" id="priceTo" name="priceTo" value="${priceTo}">
                    </div>
                </div>
                <button type="submit" class="submit">Tìm kiếm</button>
                <!--<input type="submit" class="submit">-->
            </form>
            
            <!--Render Car-->
            <div class="row">
                <c:forEach var="item" items="${cars}">  
                    <div class="col-md-4">
                            <div class="car-wrap rounded ftco-animate">
                                    <div class="img rounded d-flex align-items-end" style="background-image: url(images/Car_Images/${item.image});">
                                    </div>
                                    <div class="text">
                                            <h2 class="mb-0"><a href="car-single.html">${item.name}</a></h2>
                                            <div class="d-flex mb-3 brandAndPrice">
                                                    <span class="cat">${item.brand}</span>
                                                    <p class="price ml-auto">${item.price}đ <span>/day</span></p>
                                            </div>
                                            <p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a href="cardetails" class="btn btn-secondary py-2 ml-1 carDetails">Details</a></p>
                                    </div>
                            </div>
                    </div>
                </c:forEach >  

        <!--Pagination--> 
    	</div>
                <div class="row mt-5">
              <div class="col text-center">
                <div class="block-27">
                  <ul>
                    <c:if test="${page != 1}">
                        <li><a href="car?page=${page - 1}&car_name=${name}&color=${color}&district_id=${district_id}&car_brand_id=${car_brand_id}&car_type_id=${car_type_id}&seats=${seat}&transmission=${transmission}&priceFrom=${priceFrom}&priceTo=${priceTo}">&lt;</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="link ${i == page ? "active" : ""}"><a href="car?page=${i}&car_name=${name}&color=${color}&district_id=${district_id}&car_brand_id=${car_brand_id}&car_type_id=${car_type_id}&seats=${seat}&transmission=${transmission}&priceFrom=${priceFrom}&priceTo=${priceTo}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${page != totalPages && totalItems != 0}">
                        <li><a href="car?page=${page + 1}&car_name=${name}&color=${color}&district_id=${district_id}&car_brand_id=${car_brand_id}&car_type_id=${car_type_id}&seats=${seat}&transmission=${transmission}&priceFrom=${priceFrom}&priceTo=${priceTo}">&gt;</a></li>
                    </c:if>
                  </ul>
                </div>
              </div>
            </div>
    </section>
    

   <%@include file="public/footer.jsp" %>

     
  </body>
</html>