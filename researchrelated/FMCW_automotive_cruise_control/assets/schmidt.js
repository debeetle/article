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

// 参数格式: [中心点2D坐标], [大小], [3D包围盒范围]
var view = board.create(
  "view3d",
  [
    [-3, 0],
    [8, 8],
    [
      [-1, 6],
      [-1, 6],
      [0, 5],
    ],
  ],
  {
    az: 0.5,
    el: 0.8,
    trackball: { enabled: true },
    projection: "central",
    xPlaneRear: { visible: false }, // 隐藏背景盒子
    yPlaneRear: { visible: false },
    zPlaneRear: { fillColor: "pink", visible: true },
    // xAxisBorder: { ticks3d: { ticksDistance: 1 } },
    xAxis: { visible: false }, // 隐藏默认3D轴，我们自己画更好看的
    yAxis: { visible: false },
    zAxis: { visible: false },
  },
);

var O = [0, 0, 0];

var a3_end = [3, 4, 5];
var a2_end = [1, 5, 0];
var a1_end = [4, 0, 0];
var C = [3, 4, 0];

// 平面的四个角点
var plane = [
  [-1, -1, 0],
  [6, -1, 0],
  [6, 6, 0],
  [-1, 6, 0],
];

// var p1 = view.create("point3d", plane[0], { visible: false });
// var p2 = view.create("point3d", plane[1], { visible: false });
// var p3 = view.create("point3d", plane[2], { visible: false });
// var p4 = view.create("point3d", plane[3], { visible: false });

// var plane = view.create("polygon3d", [plane[0], plane[1], plane[2], plane[3]], {
//   fillColor: "#ccccff",
//   fillOpacity: 0.9,
//   strokeColor: "#888888",
//   strokeWidth: 1,
// });

// 原点
var origin = view.create("point3d", O, { size: "1", name: "$O$" });

// var alpha_3 = view.create("point3d", v_coord, { size: 0, name: "" });
var vec_v = view.create("line3d", [O, a3_end], {
  strokeColor: "blue",
  strokeWidth: 1,
  lastArrow: { type: 6, size: 6 },
});

view.create("point3d", [1.5, 2, 2.5], {
  size: 0,
  name: "$\\alpha_3$",
  label: { offset: [-10, 10], color: "blue", fontSize: 16 },
});

var vec_v = view.create("line3d", [O, a2_end], {
  strokeColor: "green",
  strokeWidth: 1,
  lastArrow: { type: 6, size: 10 },
});

view.create("point3d", [1.5, 2, 0], {
  size: 0,
  name: "$\\alpha_2$",
  label: { offset: [-10, 10], color: "green", fontSize: 16 },
});

var vec_v = view.create("line3d", [O, a1_end], {
  strokeColor: "olive",
  strokeWidth: 1,
  lastArrow: { type: 6, size: 10 },
});

view.create("point3d", [2, 0, 0], {
  size: 0,
  name: "$\\beta_1 = \\alpha_1$",
  label: { offset: [-10, 10], color: "olive", fontSize: 16 },
});

// --- 垂直向量 beta_3 (红色) ---
var vec_beta = view.create("line3d", [C, a3_end], {
  strokeColor: "red",
  strokeWidth: 1,
  lastArrow: { type: 6, size: 10 },
});
// 标签 beta
view.create("point3d", [3, 4, 2.5], {
  size: 0,
  name: "$\\displaystyle{\\beta_3 = \\alpha_3 - \\frac{\\langle\\vec{\\beta_1}, \\vec{\\alpha_3}\\rangle}{\\langle\\vec{\\beta_1}, \\vec{\\beta_1}\\rangle}\\vec\\beta_1 - \\frac{\\langle\\vec{\\beta_2}, \\vec{\\alpha_3}\\rangle}{\\langle\\vec{\\beta_2}, \\vec{\\beta_2}\\rangle}\\vec\\beta_2}$",
  label: { offset: [10, 0], color: "red", fontSize: 16 },
});

// 直角符号 (简单的折线模拟)
var d = 0.4;
var r1 = view.create("point3d", [3, 4, d], { visible: false });
var r2 = view.create("point3d", [3, 4 - d, d], { visible: false });
var r3 = view.create("point3d", [3, 4 - d, 0], { visible: false });
view.create("line3d", [r1, r2], { strokeColor: "gray", strokeWidth: 1 });
view.create("line3d", [r2, r3], { strokeColor: "gray", strokeWidth: 1 });
