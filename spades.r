# load the libraries (install them if needed)
library(data.table)
library(ggplot2)
library(cowplot)
library(magick)
library(extrafont)
loadfonts(device="win",quiet=T)

gg_d <- ggplot(data.table(x=c(-1,1),y=c(-1,1)),aes(x=x,y=y))+
  geom_text(aes(x=0,y=0),label="D",size=22,color="slategray")+
  theme_void()

gg_d

ggsave(gg_d,file="d.png",width=3.5,height=2.5,dpi=320)

d <- image_read("d.png")
d <- image_rotate(d,30)
d <- image_crop(d,"800x300+150+200")

gg_spades <- ggplot(data.table(x=c(-1,1),y=c(-1,1)),aes(x=x,y=y))+
  geom_blank()+
  geom_segment(aes(x=-.40,y=.68,xend=.0,yend=.14),linewidth=3,color="slategray")+
  geom_segment(aes(x=-.46,y=.48,xend=-.35,yend=.9),linewidth=3,color="slategray",lineend="round")+
  geom_text(aes(x=0,y=0),label="SPA     ES",size=16,fontface="bold",color="limegreen")+
  geom_text(aes(x=0,y=-.85),label="Semi-Periodic Agricultural & Development Economics Symposium",size=2.2,family="Segoe Print",fontface="bold",color="slategray")+
  theme_void()+
  theme(panel.background = element_rect(fill="white"))

gg_comb <- ggdraw(gg_spades) +
  draw_image(d,scale=0.85,x=1.14,y=.22,hjust=1,halign=0,valign=0,clip="off")

gg_comb

ggsave(gg_comb,file="logo.png",width=3.5,height=1.5,dpi=320)

