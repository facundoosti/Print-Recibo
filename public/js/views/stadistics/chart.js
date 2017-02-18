var ctx = $("#areaChart");
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels,
        datasets: [{
            label: 'Kilos de Miel',
            data: data,
            borderWidth: 1,
            backgroundColor: 'rgba(255, 99, 132, 0.2)'
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
