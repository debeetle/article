// hljs.highlightAll();
// JXG.Options.line.fixed = true;
// JXG.Options.point.fixed = true;
// JXG.Options.text.fixed = true;
// JXG.Options.polygon.fixed = true;
// JXG.Options.line.highlight = false;
// JXG.Options.point.highlight = false;
// JXG.Options.polygon.highlight = false;
// JXG.Options.text.highlight = false;
temml.renderMathInElement(document.body, {
  fences: "$+",
});

const marks = document.querySelectorAll("figure[data-key], table[data-key], .formula[data-key]");
const counters = { figure: 0, table: 0, formula: 0 };
const refs = {};
marks.forEach((el) => {
  const type = el.matches("figure") ? "figure" : el.matches("table") ? "table" : el.classList.contains("formula") ? "formula" : null;
  counters[type]++;
  const key = el.dataset.key;
  el.id = `${type}-${key}`;
  refs[key] = { type, num: counters[type], id: el.id };
});

document.querySelectorAll("[data-ref-target]").forEach((a) => {
  const { refTarget: key, refType: t } = a.dataset;
  const target = refs[key];
  if (target && target.type === t) {
    a.textContent = target.num;
    a.href = "#" + target.id;
  }
});

const content = document.getElementById("content");
document.querySelectorAll("section > h2").forEach((h2) => {
  const li = document.createElement("li");
  const a = document.createElement("a");
  a.href = "#" + h2.id;
  a.textContent = h2.textContent;
  li.appendChild(a);
  content.appendChild(li);
});

document.querySelectorAll(".annotate").forEach((annotate) => {
  const closebtn = document.createElement("button");
  closebtn.textContent = "Got";
  annotate.appendChild(closebtn);
  closebtn.onclick = () => {
    // e.stopPropagation();
    annotate.classList.remove("fixed");
    annotate.style.pointerEvents = "none";
  };
});

document.querySelectorAll("cite").forEach((cite) => {
  cite.title = "click to fix";
});

function toggleAnnotate(cite) {
  const nearannotate = cite.nextElementSibling;
  nearannotate.classList.toggle("fixed");
  nearannotate.style.pointerEvents = "auto";
}

document.querySelectorAll("pre code").forEach((code) => {
  const wrapper = document.createElement("div");
  wrapper.className = "codebox";

  const pre = code.parentElement;
  pre.parentElement.insertBefore(wrapper, pre);
  wrapper.appendChild(pre);
  const closebtn = document.createElement("button");

  const lang = Array.from(code.classList)
    .find((c) => c.startsWith("language-"))
    .replace("language-", "");
  closebtn.dataset.lang = lang;
  closebtn.textContent = closebtn.dataset.lang;
  wrapper.appendChild(closebtn);
  closebtn.addEventListener("mouseenter", () => {
    closebtn.textContent = "copy";
  });
  closebtn.addEventListener("mouseleave", () => {
    closebtn.textContent = closebtn.dataset.lang;
  });

  closebtn.onclick = () => {
    const copytext = pre.textContent;
    navigator.clipboard
      .writeText(copytext)
      .then(() => {
        closebtn.textContent = "copied!";
        setTimeout(() => (closebtn.textContent = closebtn.dataset.lang), 2000);
      })
      .catch(() => {
        closebtn.textContent = "failed!";
        setTimeout(() => (closebtn.textContent = closebtn.dataset.lang), 2000);
      });
  };
});
