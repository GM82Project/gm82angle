//activate textfield
with (TextField) textfield_actions()
active=1
oldtext=text
if (text!="") selected=1
if (type==0 || type=4) {
    keyboard_string=text
}
if (type==2 || type==3) {
    active=0
}
/*if (action=="such and such") {
    do things and shit
}
