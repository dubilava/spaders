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
  geom_segment(aes(x=-.54,y=.62,xend=-.13,yend=.15),linewidth=3,color="slategray")+
  geom_segment(aes(x=-.61,y=.39,xend=-.47,yend=.88),linewidth=3,color="slategray",lineend="round")+
  geom_text(aes(x=0,y=0),label="SPA      ERS",size=16,fontface="bold",color="limegreen")+
  geom_text(aes(x=0,y=-.85),label="Semi-Periodic Agricultural & Development Economics Research Symposium",size=2.3,family="Segoe Print",fontface="bold",color="slategray")+
  theme_void()+
  theme(panel.background=element_rect(fill="white",color=NA))

gg_comb <- ggdraw(gg_spades) +
  draw_image(d,scale=0.85,x=1.08,y=.27,hjust=1,halign=0,valign=0,clip="off")

gg_comb

ggsave(gg_comb,file="logo.png",width=1280,height=640,dpi=320,units="px")

