dojo.require("dojox.widget.AnalogGauge");
dojo.require("dojox.widget.gauge.AnalogArrowIndicator");
dojo.require("dojox.layout.GridContainerLite");

 function init() {
     var gauge;
     var ranges1 = [
			{low: 0,high: 40, hover: '0 - 39 (Poor)', color: 'red'},
     	{low: 40, high: 60, hover: '10 - 20', color: 'yellow' },
      {low: 60, high: 100, hover: '60 - 100', color: 'green'}
		];
     gauge = dojo.byId('defaultGauge');
     gauge = new dojox.widget.AnalogGauge({
         id: "defaultGauge",
         width: 350,
         height: 180,
         cx: 170,
         cy: 175,
         radius: 125,
         ranges: ranges1,
         minorTicks: {
             offset: 125,
             interval: 5,
             length: 5,
             color: 'gray'
         },
         majorTicks: {
             offset: 125,
             interval: 10,
             length: 10
         },
         indicators: [
          new dojox.widget.gauge.AnalogArrowIndicator({
              value: 17,
              width: 3,
              hover: 'Value: 17',
							noChange: true
							
          })]
     },
     gauge);
     gauge.startup();
 }
 dojo.addOnLoad(init);
