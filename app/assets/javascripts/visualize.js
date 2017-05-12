function loadStateGraph() {
  if ($('body#visualize').length) {
    Morris.Bar({
      element: 'state_chart',
      data: gon.state_data,
      xkey: 'state',
      ykeys: ['average_cost'],
      labels: ['Cost (Dollars)'],
      preUnits: '$',
      gridTextSize: '14',
      resize: 'true'
    });
    $('svg').height(450)
  }
}

function loadDRGGraph() {
  if ($('body#visualize').length) {
    Morris.Bar({
      element: 'drg_chart',
      data: gon.drg_data,
      xkey: 'drg_definition',
      ykeys: ['average_cost1'],
      labels: ['Cost (Dollars)'],
      preUnits: '$',
      barColors: ['green'],
      gridTextSize: '14',
      resize: 'true'
    });
    $('svg').height(450)
  }
}

function loadChoropleth() {
  if ($('body#visualize').length) {
      var data = [{
          type: 'choropleth',
          locationmode: 'USA-states',
          locations: gon.state_array,
          z: gon.cost_per_state_array,
          zmin: 0,
          zmax: 22500,
          colorscale: [
              [0, 'rgb(255,253,158)'], [0.2, 'rgb(255,213,112)'],
              [0.4, 'rgb(255,191,38)'], [0.6, 'rgb(255,179,0)'],
              [0.8, 'rgb(255,128,0)'], [.9, 'rgb(255,94,0)']
          ],
          colorbar: {
              title: 'USD',
              thickness: 0.2
          },
          marker: {
              line:{
                  color: 'rgb(255,255,255)',
                  width: 2
              }
          }
      }];

      var layout = {
          title: 'Average Cost Per State',
          width: 900,
          height: 700,
          geo:{
              scope: 'usa',
              showlakes: true,
              lakecolor: 'rgb(255,255,255)'
          }
      };
      Plotly.plot(state_choro, data, layout, {showLink: false});
    }
}

// toggle graphs
function toggleGraph() {
  $(document).ready(function() {
    var x = 0;
    $("#toggle").click(function() {
      $("#state_choro").toggle();
      $("#state_chart").toggle();
      if (x === 0) {
        $(this).text("View as Bar Chart");
        x = 1;
      }
      else {
        $(this).text("View as Choropleth Map");
        x = 0;
      }
    });
  });
}

document.addEventListener("turbolinks:load", function() {
  loadStateGraph();
  loadDRGGraph();
  loadChoropleth();
  toggleGraph();
})
