var height3l;
height3l=6

switch (action) {
    case "source up": {with (SCROLL_IN) {
        scroll.scroll=max(0,scroll.scroll-height3l/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break
    case "source down": {with (SCROLL_IN) {
        scroll.scroll=min(1,scroll.scroll+height3l/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break

    case "output up": {with (SCROLL_OUT) {
        scroll.scroll=max(0,scroll.scroll-height3l/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break
    case "output down": {with (SCROLL_OUT) {
        scroll.scroll=min(1,scroll.scroll+height3l/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break
}
