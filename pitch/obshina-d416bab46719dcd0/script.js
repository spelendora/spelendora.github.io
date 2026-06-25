/* ОБЩИНА — THE CONGREGATION · v01 cinematic full-bleed
   Рендерит несущие слова / палитру / правила / родословную из данных питча,
   управляет scroll-snap анимациями появления и счётчиком ленты.
   Только рендер: копия зеркалит data/pitch.json, без выдуманных утверждений. */

/* ---- несущие слова (load-bearing, из concept.mood_words) ---- */
const MOOD = ["своя земля","родная кровь","одно лицо","холодный свет","стылые поля","чёрная вода","сухие деревья","лошади в тумане","грубое полотно","бледные лица","ни одной улыбки","застывшее время","тихо и строго"];

/* несущие отрицания / холодные ноты читаются приглушённо/курсивом */
const OFF = new Set(["ни одной улыбки","чёрная вода","сухие деревья","застывшее время"]);

/* ---- палитра (зафиксирована, из concept.palette) ---- */
const PALETTE = [
  ["снежно-белый","#eef0ee"],
  ["угольно-чёрный","#15171c"],
  ["сланцево-серебристый серый","#6f7681"],
  ["ледяной барвинок","#9fb0c6"],
  ["приглушённый шалфей","#8b9486"],
  ["выцветшая солома","#b3a17e"],
  ["клетка глен / гусиная лапка","#3a3d44"],
  ["бледная вымытая кожа","#d7cfc4"]
];

/* ---- правила (зафиксированный бриф: цвет+ч/б смешаны, поздний золотой свет, сумрачно-но-не-темно) ---- */
const RULES = [
  "Цвет и чёрно-белое, вперемешку — диптих это грамматика: каждому цветному кадру отвечает ч/б, каждому общему плану — деталь.",
  "Снимаем позднее окно, 15:00–18:00 — жёсткое боковое солнце вначале, низкий золотой скользящий свет под конец.",
  "Кастинг-двойники — одна бледная кожа и почти одинаковые лица читаются как одна тихая кровь. Никаких улыбок, никогда.",
  "Сдержанно-амишский гардероб — простые платья, кружевные чепцы, клетчатая шерсть; скромно, но не наглухо. Зеландская траурная жила.",
  "Сломанная природа как сцена — голые деревья, чёрная вода, покосившиеся изгороди, небеса в синяках; лошади на воле. Ничего ухоженного.",
  "Кадрирование по шкале трепета — крошечные одинокие фигуры в огромной земле низкого горизонта или тесные клаустрофобные группы-двойники.",
  "Тон сумрачный, но не тёмный — сдержанно, живописно, безопасно для рекрутинга. Анти-гламур как сила, никогда не хоррор.",
  "Плёночное зерно и документальная рамка повсюду — неподвижность старого портрета, никогда не студийный глянец."
];

/* ---- родословная (проверенный ресёрч, из pitch.research) ---- */
const LINEAGE = [
  { group:"Фотографы", items:[
    ["Charles Fréger", "Wilder Mann — языческие ряженые в холодной типологической фронтальности."],
    ["Sally Mann", "Immediate Family / Deep South — мать, дети-двойники, готический распад."],
    ["Roger Ballen", "Platteland — бледные, фронтальные, тревожные сельские портреты."],
    ["Laura Makabresku", "Ледяная приглушённая неподвижность фолк-ритуала, образец палитры."],
    ["Deborah Turbeville", "Зернистые, выцветшие группы женщин вне времени."],
    ["Alec Soth", "Sleeping by the Mississippi — простая, анти-гламурная Американа."]
  ]},
  { group:"Кино", items:[
    ["The Witch", "Eggers, 2015 — семья в простой одежде на краю мёртвого леса, серое и мёртвое по замыслу."],
    ["Picnic at Hanging Rock", "Weir, 1975 — единообразная масса девушек-двойников в белом, трепет среди дня."],
    ["November", "Sarnet, 2017 — отмеченная наградой высококонтрастная крестьянская монохромность."],
    ["Hagazussa", "Feigelfeld, 2017 — одинокая семья против сельской общины, общие планы по шкале трепета."]
  ]},
  { group:"Музыка", items:[
    ["16 Horsepower / Wovenhand", "David Eugene Edwards — суровый сельско-американский трепет-фолк."],
    ["Mark Korven", "The Witch (2015) — целиком акустический, диссонантный, холод старой Новой Англии."],
    ["Sacred Harp", "Хоровое пение нотами-фигурами — много голосов в один, резкое и некрасивое."],
    ["Chelsea Wolfe", "Birth of Violence — холодная, оголённая дум-Американа."]
  ]},
  { group:"Живопись", items:[
    ["Grant Wood", "American Gothic, 1930 — источник названия, фронтальная пара без улыбки."],
    ["Diane Arbus", "Identical Twins, 1967 — единообразная одежда, ужас в микро-различиях."],
    ["Walker Evans", "Allie Mae Burroughs, 1936 — клиническая фронтальная простота, четыре почти одинаковых кадра."],
    ["Andrew Wyeth", "Christina's World — крошечная фигура, поглощённая полем низкого горизонта."]
  ]},
  { group:"Мода", items:[
    ["Jamie Hawkesworth", "Сельская британская документальная мода — естественный свет, без стайлинга, плёночное зерно."],
    ["Batsheva Hay", "Прерийная / скромная одежда, читающаяся как серьёзный эдиториал, а не костюм."],
    ["ROUW — Rituals from Zeeland", "Van Drimmelen — траурные женщины в кружевных чепцах и сельском платье, ядро жилы."]
  ]}
];

/* ---- render ---- */
(function render(){
  const ml = document.getElementById("moodlist");
  if (ml) MOOD.forEach(w=>{
    const li=document.createElement("li");
    li.textContent=w;
    if(OFF.has(w)) li.classList.add("off");
    ml.appendChild(li);
  });

  const pal = document.getElementById("palette");
  if (pal) PALETTE.forEach(([name,hex])=>{
    const li=document.createElement("li");
    const sw=document.createElement("span"); sw.className="sw"; sw.style.background=hex;
    const t=document.createElement("span"); t.textContent=name;
    li.append(sw,t); pal.appendChild(li);
  });

  const rl = document.getElementById("rules");
  if (rl) RULES.forEach(r=>{
    const li=document.createElement("li");
    const dash=r.indexOf(" — ");
    if(dash>-1){
      const strong=document.createElement("strong");
      strong.textContent=r.slice(0,dash);
      li.appendChild(strong);
      li.appendChild(document.createTextNode(r.slice(dash)));
    } else { li.textContent=r; }
    rl.appendChild(li);
  });

  const lin = document.getElementById("lineage");
  if (lin) LINEAGE.forEach(col=>{
    const div=document.createElement("div");
    div.className="lineage__col";
    const h=document.createElement("h3"); h.className="lineage__group"; h.textContent=col.group;
    div.appendChild(h);
    const ul=document.createElement("ul"); ul.className="lineage__list";
    col.items.forEach(([name,note])=>{
      const li=document.createElement("li");
      const n=document.createElement("span"); n.className="lineage__name"; n.textContent=name;
      const note_=document.createElement("span"); note_.className="lineage__note"; note_.textContent=note;
      li.append(n,note_); ul.appendChild(li);
    });
    div.appendChild(ul);
    lin.appendChild(div);
  });
})();

/* ---- scroll-snap reveals + counter ---- */
(function reel(){
  const slides = Array.from(document.querySelectorAll(".slide"));
  const numEl = document.getElementById("sidecount-num");
  const totalEl = document.querySelector(".sidecount__total");
  const bar = document.getElementById("progress-bar");
  const total = slides.length;
  if(totalEl) totalEl.textContent = "/ " + String(total).padStart(2,"0");

  /* reveal observer — low threshold so tall sections (scouting strip,
     lineage, crew) reveal their content on phones, where 45% of a
     2.5–3× viewport-tall slide can never be on screen at once. */
  const revealIO = new IntersectionObserver((entries)=>{
    entries.forEach(e=>{ if(e.isIntersecting) e.target.classList.add("in-view"); });
  }, { threshold:0, rootMargin:"0px 0px -12% 0px" });

  /* counter / progress observer — higher threshold keeps the active
     index stable to the slide that dominates the viewport. */
  const countIO = new IntersectionObserver((entries)=>{
    entries.forEach(e=>{
      if(e.isIntersecting){
        const pos = slides.indexOf(e.target) + 1;      // real DOM position, not data-index
        if(numEl) numEl.textContent = String(pos).padStart(2,"0");
        if(bar) bar.style.transform = "scaleX(" + (pos/total) + ")";
      }
    });
  }, { threshold:[0.25, 0.45] });

  slides.forEach(s=>{ revealIO.observe(s); countIO.observe(s); });

  /* первый слайд виден сразу */
  if(slides[0]) slides[0].classList.add("in-view");

  /* ---- кнопка «наверх»: плавный скролл .reel к первому слайду ---- */
  const reel = document.getElementById("reel");
  const toTop = document.getElementById("totop");
  if(reel && toTop){
    const reduce = window.matchMedia("(prefers-reduced-motion:reduce)").matches;
    toTop.addEventListener("click", ()=>{
      reel.scrollTo({ top:0, behavior: reduce ? "auto" : "smooth" });
      if(slides[0]) slides[0].scrollIntoView({ behavior: reduce ? "auto" : "smooth", block:"start" });
    });
    /* показываем кнопку только когда лента прокручена за первый экран */
    const onScroll = ()=>{
      if(reel.scrollTop > reel.clientHeight * 0.8) toTop.classList.add("totop--on");
      else toTop.classList.remove("totop--on");
    };
    reel.addEventListener("scroll", onScroll, { passive:true });
    onScroll();
  }
})();

/* ---- лайтбокс: просмотр референса в полном размере ---- */
(function lightbox(){
  const lb = document.getElementById("lightbox");
  if(!lb) return;
  const lbImg = document.getElementById("lb-img");
  const lbCount = document.getElementById("lb-count");
  const elClose = document.getElementById("lb-close");
  const elPrev = document.getElementById("lb-prev");
  const elNext = document.getElementById("lb-next");

  // все кликабельные картинки-референсы (галереи, мозаика, стрипы, трип, диптих)
  const sel = ".gallery figure img, .mosaic figure img, .strip__rail figure img, .slide--trip figure img, .dip img";
  const imgs = Array.from(document.querySelectorAll(sel));
  let idx = 0;

  function show(i){
    idx = (i + imgs.length) % imgs.length;
    const el = imgs[idx];
    lbImg.src = el.currentSrc || el.src;
    lbImg.alt = el.alt || "";
    lbCount.textContent = (idx+1) + " / " + imgs.length;
  }
  function open(i){ show(i); lb.hidden = false; document.body.style.overflow="hidden"; elClose.focus(); }
  function close(){ lb.hidden = true; lbImg.src=""; document.body.style.overflow=""; }

  imgs.forEach((el,i)=>{
    el.addEventListener("click", ()=>open(i));
  });
  elClose.addEventListener("click", close);
  elPrev.addEventListener("click", ()=>show(idx-1));
  elNext.addEventListener("click", ()=>show(idx+1));
  lb.addEventListener("click", e=>{ if(e.target===lb) close(); });   // клик по фону закрывает
  document.addEventListener("keydown", e=>{
    if(lb.hidden) return;
    if(e.key==="Escape") close();
    else if(e.key==="ArrowLeft") show(idx-1);
    else if(e.key==="ArrowRight") show(idx+1);
  });
})();
