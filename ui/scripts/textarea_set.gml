with (TextArea) if (action==argument0) {
    text=argument1
    th=max(0.0000001,string_height_ext(text,-1,w-16)-(h-8)+4)
    scroll=0
    scrollf=0
    with (Scrollbar) if (scroll==other.id) sy=ystart
}
