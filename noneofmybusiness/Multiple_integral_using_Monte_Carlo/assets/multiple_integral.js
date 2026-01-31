JXG.Options.line.fixed = true;
JXG.Options.point.fixed = true;
JXG.Options.text.fixed = true;
JXG.Options.polygon.fixed = true;
JXG.Options.line.highlight = false;
JXG.Options.point.highlight = false;
JXG.Options.polygon.highlight = false;
JXG.Options.text.highlight = false;

var board = JXG.JSXGraph.initBoard("schmidt_eigenspace", {
  boundingbox: [-2, 8, 5, -4],
  keepaspectratio: true,
  axis: false, // 关闭默认的2D坐标轴
  showCopyright: false,
  showNavigation: true,
  showScreenshot: true,
  showInfobox: false,
});

var view = board.create(
"view3d", 
[
[]])
