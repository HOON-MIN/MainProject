<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
   <canvas id="myBarChart" width="500" height="300"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
var ctx = $("#myBarChart").get(0).getContext("2d");
console.log(ctx);
var myBarChart = new Chart(ctx).Bar(data);


var data = {
    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
    datasets: [{
        label: "My First dataset",
        fillColor: "#FC9775",
        data: [65, 59, 80, 81, 56, 55, 40]
    }, {
        label: "My Second dataset",
        fillColor: "#5A69A6",
        data: [28, 48, 40, 19, 86, 27, 90]
    }]
};

$(document).ready(function () {
    var data = {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
        datasets: [{
            label: "My First dataset",
            fillColor: "#FC9775",
            data: [65, 59, 80, 81, 56, 55, 40]
        }, {
            label: "My Second dataset",
            fillColor: "#5A69A6",
            data: [28, 48, 40, 19, 86, 27, 90]
        }]
    };

    var ctx = $("#myBarChart").get(0).getContext("2d");
    var myBarChart = new Chart(ctx).Bar(data);
});
</script>