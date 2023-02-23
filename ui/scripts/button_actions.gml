switch (action) {
    case "load": {load_shader()} break
    case "vs2": case "ps2": case "vs3": case "ps3": case "glsl": {TYPE=action} break

    case "edit": {edit_shader()} break
    case "compile": {compile_shader()} break

    case "source up": {with (SCROLL_IN) {
        scroll.scroll=max(0,scroll.scroll-H3L/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break
    case "source down": {with (SCROLL_IN) {
        scroll.scroll=min(1,scroll.scroll+H3L/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break

    case "output up": {with (SCROLL_OUT) {
        scroll.scroll=max(0,scroll.scroll-H3L/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break
    case "output down": {with (SCROLL_OUT) {
        scroll.scroll=min(1,scroll.scroll+H3L/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break
}
