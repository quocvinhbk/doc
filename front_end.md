## HTML
  #### reflist
  *  [JS Bin](https://jsbin.com/)
  *  [CodePen](https://codepen.io/)
  *  [Image source](https://pixabay.com/)
  *  [Image source2](https://picsum.photos/)
  *  [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)
  *  [CSS best practice](https://courses.edx.org/courses/course-v1:W3Cx+HTML5.0x+2T2018/courseware/5854bfc005394517ae62fc55fd58242e/bcb896dff4594fec9939c512437c6219/?child=first)

### Elements
  * html
    * head
      * title
    * body
      * h1
      * p

### Tags
  * ```<p>Emphatic!</p>```
  * TAG: ```<p>```
  * Close tag: ```</p>```
  * Element content: Emphatic!
  * self closing tag: ```<img src="" alt = ""> : <img src = 'http://....' atl="some meaning sentence" >```
  * style: support CSS code between ```<open>``` & ```<closing>``` tag

### Attributes
  * identify: id
  * class: class
  * example: ```<p id="confirm-button" class="btn-btn-primary">```
  * name value: case sensitive

#### Attributes scope
  * global : id, class
  * non-global: ```<img src alt>```


## semantic
  * semantic: for struct web
  * h1 - h6: for decorate content
  * element list
    * header
    * footer
    * nav
    * section
    * article
    * aside
    * detail
      * summary
    * mark
    * figcaption
    * code
    * abbr
    * br
    * address
    * hr
  * ```#div vs #span```
    * div: block-level element
    * span: inline element => can not contain block-level children

#### Block-level vs inline element
  * Block-level element:
    * use within body
    * block of space
    * new line 'above ^' and 'below.'
    * can contain inline or other block level element
    * e.g.: p, h1 - h6, div
  * inline element:
    * start any where in-the-line
    * only contain data: text, other in-line element ( ```<em>, <strong>```)
    * e.g.: ```<em>, <strong>, <abbr>, <cite>, <code>```

#### img element
  * attributes
    * src
    * alt: alternate infomation
    * title: additional infomation
    * height:
    * width:
    * ```<img src="images/html5.png" alt="HTML resized image" title="Resized image seems to fit the page better" height="173" width="262">```

#### #hyperlink element
  * ```<a> the anchor element```
    * href: '#id' / 'link'
    * target: '_self' / '_blank'
    * download:
    * mailto: protocol

## CSS    [link to REF](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)

#### style and link tag
  * style: ```<style> h1 { background-color: #FFF } </style>```
    * tag contain css code
  * link :```<link rel='stylesheet' href='app.css'>```
    * file contain css code


### Rules: selectors and declarations
  * ```p { font-size: 12px; color: #223344; }```
  * selector: p
  * declaration: hash of property-value pair


### Common CSS properties
#### font-size
  * ```fonts-size: px, em, %, vh```
  * unit:
    * px, em, %, vh
    * readable: xx-small, x-small, small, medium, large, x-large, xx-large
    * relative sizing: larger, smaller  <= rel to text of parent


#### text-align
  * ```text-align: left, center, right;```
  * value: left, center, right
  * additional:  justify and justify-all
  * exeption: inline element: ```<span>, <a>, <i>, <b>, <q>```


#### text-decoration
  * ```text-decoration: underline;```
  * value: underline, overline, line-through, none
  * can combine: ``` text-decoration: underline, overline, line-through; ```

#### font-weight: bold
  * ```font-weight: bold;```
  * value: normal, bold, bolder, lighter, 100 - 900

#### font-style: italic
  * ```font-style: italic;```
  * value: normal, italic

#### font-family:
  * ```font-family: "Helvetica", "Verdana", "Arial", sans-serif;```
  * first try: Helvetica -> not found -> Verdana -> .... -> build in browser font: sans-serif
  * build in font: serif, sans-serif, monospace, cursive, fantasy

#### margin
  * ```margin-left: 10px;```
  * margin-left-right-top-bottom
  * value: px

#### color
  * ```color: blue;```
  * value: transparent
    * name: blue, black
    * rgb: rgb(0,0,0)
    * hex: #FFF

#### Units: px, em, rem, %, vh, vw
  * px: pixel
  * em: vertical dimention
    * font-size: 0.9em; => smaller than parent
    * font-size: 1.2em; => greater than parent
    * font-size: 0.5em; => halfsize
  * rem: ```em``` relative to root size
    * root: html, body { font-size: 20px; }
  * %: reference to parent dimention: horizon and vertical too
    * margin: 10%;

#### rem test:
  * h1 reference to root font size: change root size => h1 size change
  ```
  <style>
    html, body { font-size: 16px;}
    h1, li { font-size: 1.2rem; }
  </style>
  ```
  * h1 reference to root font size: change root size => h1 size change
  ``` 
  <style>
    html, body { font-size: 16px;}
    li { font-size: 1.2rem; }
    h1 { font-size: 20px; }
  </style>
  ```

### li: 
  * list-style-type:
    * ul:
      * list-style-type: default, disc, circle, square, none
    * ol:
      * list-style-type: decimal, decimal-leading-zero, lower-roman, upper-alpha
  * list-style-position: inside, outside
  * list-style-image: url("my_triangle.png");


### Combining selectors

  ```
  blockquote,
  q,
  .speech {
    color: red;
    font-style: italic;
  }
  ```

  ```
  li.insect.flying { font-weight: bold;
                   text-decoration: underline; }
  ```

  * decendant selector
  ```#intro q a { color: blueviolet; }```

  * direct decendant slector ( > )
    * only apply to direct children of parent
  ```#intro > a { color: blue;}```

  * Everything selector ( * ): aterisk
    * ```body > * { margin-left: 10px; }```
    * ``` p * { text-decoration: underline; } ```


### Cascading: inheritance and precedence
  * inheritance type:
    * not inheritance:
      * position and padding
      * decorative properties (borders, background images, .. )
    * inheritance: 
      * beging with text-
      * beging with font-
  * Precedence rule:
    * most specific rule: ```span { color: blue; }``` vs ```ul li span { color: red; }```
    * #id > class > tag ```#physics { color: red; }; .rainbow { color: green; }``` => output: red
    * rule later override earlier
  * !important: ```p { color: orange !important; }```


## module 4 fixing and debug
  ### box: margin - border - pading
  

#### code precedent
  * using html debug to check what style is override
  * write code in order 
  * use selector more specific
  

## module 5: content: use html with css file seperate to code

### table
#### table element
  * ```<table>  <tbody>  ... </tbody>  </table>```
  * row: tr
  * cell: th, td
  * colspan, rowspan: number of cell that will span ( cover)
    * ``` colspan = 2;  rowspan = 4```
  * scope: ```scope= row, col, rowgroup, colgroup, auto
  * colgroup
    * attribute: span = 1,  number of span cell

#### table attributes
  * border
    * border-width: thin, medium, thick, in pixels
    * border-style: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset
    * border-color: color name or color values, transparent
    * initial: default cell value
    * inherit: inherits property from parent element
    * border-collapse: collapse, separate, initial;
    * border-spacing: only with ```border-collapse: separate;```
    * side border: border-top, border-bottom, ...
  * width, heigh: ```width: 25%;```
  * zebra table
    * ```tr:nth-child(even) { background-color: grey; }```
  * hover & highlight

### Video - Audio - iframe

### Decorative images and backgrounds
  * background-color: color name, transparent, none
  * background-image: url("")
  * background-size: 100px auto;
  * background-repeat: no-repeat;

## Managing element size
  * Wrong way
    * control width, heigh, top, left
  * Right way
    * Padding
      * ```padding: <top> <right> <bottom> <left>;```
      * ```padding: <top and bottom> <right and left>;```
      * ```padding: <all>; ```
  * Thing to remember:  
    * ```height``` & ```width``` properties do not work on ```inline elements```.
    * many element have natural behavios when height & width **not** set => advantageous
    * flexbox layout is power full if default, set width && height lost advantagous

### Pseudo class
  * a: ``` a:visited { color: purple; } ```
    * visited, hover, active
  * nth-child ```tr:nth-child(odd)  { background-color: lightgray; }```
    * nth-child(old / even / 1 / 2 / )


## Module 6: basic of page layout
### display and position
#### [Display](https://courses.edx.org/courses/course-v1:W3Cx+HTML5.0x+2T2018/courseware/306cfa0313a449a29b2dbcb0b2afcb86/1fe35eaba7534b5d86b69fa0e09494a3/?child=first)
  * baseline => browser make layout decision
  * block
  * inline

| block         | inline  |
| ------------- |:-------:|
| p             | a       |
| h1            | span    |
| div           | q       |
| blockquote    | i       |
| ul            | b       |
| ol            |         |
| li            |         |


#### Block Level
* appears below and to the left of their block level neighbors (like a carriage return on a typewriter going to the next new line)
* will expand to fill the width of the parent container by default
* respects all margin properties
* can have its width property set, which will make it narrower and cause its children to wrap, but not crop.
* takes on the height of all its children (pending certain exceptions) as long as its own height is unset. (We will cover * setting the height later)
* ignores the vertical-align property

#### Inline elements: ```<a>, <span>, <q>, <i>, <b>```

* simply appear to the right of their preceding inline neighbor. They do not drop to the next line unless they must "wrap".
* **by default, the width is simply the width of the content of the element, plus any padding**
* **ignore top and bottom margin settings**
* **ignore width and height properties**
* are subject  to vertical-align property as well as CSS white-space settings
* support padding, but any padding-top or padding-bottom does not contribute to the calculation of the height of the text line it sits upon
* cleave to the baseline where they are being placed

#### Inline-block element
  * inline-block elements respect margin-top and margin-bottom
  * the vertical padding for inline-block elements contributes to the calculation of the height of the line it falls on
  * inline-block elements respect width and height properties

### display attribute
  * ```display: inline, block, inline-block```
  * ```display: none, flex```

#### Horizontal centering
  * Inline element
    * no CSS property can set to inline element
    * parent: ```.parent { text-align: center; }``` => all inline children center
    * OR: change inline => inline-block / block
  
  * Block
    * default: width <= parent
    * margin: ```div { margin: auto; }``` => horizon only

  * Flexbox <= better way

### 