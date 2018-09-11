<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/sellerAside.jsp"></jsp:include>

                  <div class="col-12 col-md-8 col-lg-9">
                    <div class="row">
                      <h4>통계</h4>
                    </div>
                    <hr>

                    <div class="row">

                						<div class="col-xs-12">
                              <div class="select-group" style="margin">

                              </div>
    	                        <form class="form-inline pull-right" action="">
                                <label for="">월 별 조회</label>
                                &nbsp;&nbsp;

                                <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                    <option value="searchUser">2018</option>
                                    <option value="searchTitle">2017</option>
                                    <option value="searchTitle">2016</option>
                                </select>
                                &nbsp;&nbsp;
                                <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                    <option value="searchUser">1</option>
                                    <option value="searchTitle">2</option>
                                    <option value="searchTitle">3</option>
                                    <option value="searchTitle">4</option>
                                    <option value="searchTitle">5</option>
                                    <option value="searchTitle">6</option>
                                    <option value="searchTitle">7</option>
                                    <option value="searchTitle">8</option>
                                    <option value="searchTitle">9</option>
                                    <option value="searchTitle">10</option>
                                    <option value="searchTitle">11</option>
                                    <option value="searchTitle">12</option>
                                </select>
                                &nbsp;&nbsp;
                                <button type="submit" class="btn btn-primary btn-lg floa">조회</button>
    	                        </form>
                            </div>
                        </div>
                        <!-- /.content -->
                        <div class="row" style="margin-top:3%;">
                          <table class="tableTL table table-striped"  style="text-align:center;">
                          <!-- <colgroup>
                             <col width="1%"/>
                                <col width="2%"/>
                                <col width="10%"/>
                                <col width="2%"/>
                                <col width="25%"/>
                                <col width="4%"/>
                                <col width="5%"/>
                                <col width="6%"/>
                          </colgroup> -->
                          <thead>
                              <tr>
                                  <th scope="col">티켓명</th>
                                  <th scope="col">가격</th>
                                  <th scope="col">판매매수</th>
                                  <th scope="col">총매출</th>
                              </tr>
                          </thead>
                          <tbody>
                          	<c:set var="totalAmount" value="0"></c:set>
							<c:forEach items="${totalAcountList }" var="total">
          		               	<tr>
          			                <td><a href="${path }/ticketsky/user/sellerStatusInfo">${total.PERFORMNAME }</a></td>
                                <td><fmt:formatNumber value="${total.ORIPRICE }" pattern="#,###" />원</td>
          			                <td>${total.SELLCOUNT }</td>
          			                <td><fmt:formatNumber value="${total.AMOUNT }" pattern="#,###" />원</td>
          			                <c:set var="totalAmount" value="${totalAmount + total.AMOUNT }" ></c:set>
          			            </tr>
          			        </c:forEach>
                          <tfoot>
                            <tr>
                              <td colspan="3">합계</td>
                              <td id="totalAmount"><fmt:formatNumber value="${totalAmount }" pattern="#,###" />원</td>
                            </tr>
                          </tfoot>
          		             </tbody>
                          </table>
                          <div class="row" style="margin:auto;">
                            <nav aria-label="Page navigation example" >
                            <ul class="pagination">
                            <li class="page-item" style="margin:0;">
                            <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                            </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"  style="margin:0;">
                            <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                            </a>
                            </li>
                            </ul>
                            </nav>
                          </div>
                    </div>
                    <br>


                    <div class="row">
                      <div class="col-md-6">
                        <!-- DONUT CHART -->
                        <div class="card card-danger">
                          <div class="card-header">
                            <h3 class="card-title">연령별 차트</h3>
                          </div>
                          <div class="card-body">
                            <canvas id="pieChart" style=""></canvas>
                          </div>
                          <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                      </div>

                      <div class="col-md-6">
                        <!-- DONUT CHART -->
                        <div class="card card-danger">
                          <div class="card-header">
                            <h3 class="card-title">성별 차트</h3>
                          </div>
                          <div class="card-body">
                            <canvas id="pieChart2" style=""></canvas>
                          </div>
                          <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                      </div>
                    </div>
                    <br>
                    <div class="row">
                      <div class="col-md-12">
                        <!-- LINE CHART -->
                        <div class="card card-info">
                          <div class="card-header">
                            <h3 class="card-title">Line Chart</h3>
                          </div>
                          <div class="card-body">
                            <div class="chart">
                              <canvas id="lineChart" style=""></canvas>
                            </div>
                          </div>
                          <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                      </div>


                    </div>


                  </div> <!-- content -->
              </div>
          </div>

    
    <!-- ChartJS 1.0.1 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>


    <!-- jQuery -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>


	<script>
	</script>
    <script type="text/javascript">
      $(function(){
        //-------------
        //- PIE CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.
        var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
        var pieChart       = new Chart(pieChartCanvas)
        var PieData        = [
          {
            value    : 700,
            color    : '#f56954',
            highlight: '#f56954',
            label    : '10대'
          },
          {
            value    : 500,
            color    : '#00a65a',
            highlight: '#00a65a',
            label    : '20대'
          },
          {
            value    : 400,
            color    : '#f39c12',
            highlight: '#f39c12',
            label    : '30대'
          },
          {
            value    : 600,
            color    : '#00c0ef',
            highlight: '#00c0ef',
            label    : '40대 이상'
          }
        ]
        var pieOptions     = {
          //Boolean - Whether we should show a stroke on each segment
          segmentShowStroke    : true,
          //String - The colour of each segment stroke
          segmentStrokeColor   : '#fff',
          //Number - The width of each segment stroke
          segmentStrokeWidth   : 2,
          //Number - The percentage of the chart that we cut out of the middle
          percentageInnerCutout: 50, // This is 0 for Pie charts
          //Number - Amount of animation steps
          animationSteps       : 100,
          //String - Animation easing effect
          animationEasing      : 'easeOutBounce',
          //Boolean - Whether we animate the rotation of the Doughnut
          animateRotate        : true,
          //Boolean - Whether we animate scaling the Doughnut from the centre
          animateScale         : false,
          //Boolean - whether to make the chart responsive to window resizing
          responsive           : true,
          // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
          maintainAspectRatio  : true,
          //String - A legend template
        }
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        pieChart.Doughnut(PieData, pieOptions);



        //-------------
        //- PIE CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.
        var pieChartCanvas2 = $('#pieChart2').get(0).getContext('2d')
        var pieChart2       = new Chart(pieChartCanvas2)
        var PieData2        = [
          {
            value    : 700,
            color    : '#f56954',
            highlight: '#f56954',
            label    : '남자'
          },
          {
            value    : 500,
            color    : '#00a65a',
            highlight: '#00a65a',
            label    : '여자'
          }
        ]
        var pieOptions2     = {
          //Boolean - Whether we should show a stroke on each segment
          segmentShowStroke    : true,
          //String - The colour of each segment stroke
          segmentStrokeColor   : '#fff',
          //Number - The width of each segment stroke
          segmentStrokeWidth   : 2,
          //Number - The percentage of the chart that we cut out of the middle
          percentageInnerCutout: 50, // This is 0 for Pie charts
          //Number - Amount of animation steps
          animationSteps       : 100,
          //String - Animation easing effect
          animationEasing      : 'easeOutBounce',
          //Boolean - Whether we animate the rotation of the Doughnut
          animateRotate        : true,
          //Boolean - Whether we animate scaling the Doughnut from the centre
          animateScale         : false,
          //Boolean - whether to make the chart responsive to window resizing
          responsive           : true,
          // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
          maintainAspectRatio  : true,
          //String - A legend template
        }
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        pieChart2.Doughnut(PieData2, pieOptions2);


      var areaChartData = {
          labels  : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          datasets: [

            {
              label               : '연간 통계',
              fillColor           : 'rgba(60,141,188,0.9)',
              strokeColor         : 'rgba(60,141,188,0.8)',
              pointColor          : '#3b8bba',
              pointStrokeColor    : 'rgba(60,141,188,1)',
              pointHighlightFill  : '#fff',
              pointHighlightStroke: 'rgba(60,141,188,1)',
              data                : [240, 800, 400, 270, 650, 550, 400, 300, 150, 700, 900, 400]

            }
          ]
        }

        var areaChartOptions = {
          //Boolean - If we should show the scale at all
          showScale               : true,
          //Boolean - Whether grid lines are shown across the chart
          scaleShowGridLines      : false,
          //String - Colour of the grid lines
          scaleGridLineColor      : 'rgba(0,0,0,.05)',
          //Number - Width of the grid lines
          scaleGridLineWidth      : 1,
          //Boolean - Whether to show horizontal lines (except X axis)
          scaleShowHorizontalLines: true,
          //Boolean - Whether to show vertical lines (except Y axis)
          scaleShowVerticalLines  : true,
          //Boolean - Whether the line is curved between points
          bezierCurve             : true,
          //Number - Tension of the bezier curve between points
          bezierCurveTension      : 0.3,
          //Boolean - Whether to show a dot for each point
          pointDot                : false,
          //Number - Radius of each point dot in pixels
          pointDotRadius          : 4,
          //Number - Pixel width of point dot stroke
          pointDotStrokeWidth     : 1,
          //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
          pointHitDetectionRadius : 20,
          //Boolean - Whether to show a stroke for datasets
          datasetStroke           : true,
          //Number - Pixel width of dataset stroke
          datasetStrokeWidth      : 2,
          //Boolean - Whether to fill the dataset with a color
          datasetFill             : true,
          //String - A legend template
          //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
          maintainAspectRatio     : true,
          //Boolean - whether to make the chart responsive to window resizing
          responsive              : true
        }
        //-------------
        //- LINE CHART -
        //--------------
        var lineChartCanvas          = $('#lineChart').get(0).getContext('2d')
        var lineChart                = new Chart(lineChartCanvas)
        var lineChartOptions         = areaChartOptions
        lineChartOptions.datasetFill = false
        lineChart.Line(areaChartData, lineChartOptions)


      });
    </script>

</body>

</html>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>