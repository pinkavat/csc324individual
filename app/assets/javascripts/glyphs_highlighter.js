// Only meaningful if loaded by the glyphs.html view page

var prevGlyph;
var prevFactoid;
 
function highlightGlyph(obj) {
    if(event != undefined) event.stopPropagation();
    // Unhighlight all other glyphs and factoid containers
    if(prevGlyph != undefined) {
        prevGlyph.classList.remove("selectedGlyph");
        prevFactoid.classList.remove("selectedGlyph");
    }

    // Highlight the selected glyph and factoid container
    // If the clicked glyph was not the current glyph (click-off)
    if(obj == prevGlyph){
        prevGlyph = undefined;
        unhighlightGlyphs();
    } else {
        prevGlyph = obj;
        prevFactoid = obj.nextSibling;
        obj.classList.add("selectedGlyph");
        prevFactoid.classList.add("selectedGlyph");
    
        // Set the parent glyphSet to be blank
        var l = document.getElementsByClassName("glyphSet");
        for(var i = 0; i < l.length; i++){
            l[i].classList.add("unSet");
        }
    }
}

function unhighlightGlyphs(){
    // Unhighlight the highlighted glyph
    if(prevGlyph != undefined) {
        prevGlyph.classList.remove("selectedGlyph");
        prevFactoid.classList.remove("selectedGlyph");
    }

    // Unblank the glyphsets
    var l = document.getElementsByClassName("glyphSet");
    for(var i = 0; i < l.length; i++){
        l[i].classList.remove("unSet");
    }
}
