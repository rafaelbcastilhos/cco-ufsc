transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/rafael/Documents/qt/somadorMulticilo4T/multiplexer2x1.vhd}
vcom -93 -work work {/home/rafael/Documents/qt/somadorMulticilo4T/registerN.vhd}
vcom -93 -work work {/home/rafael/Documents/qt/somadorMulticilo4T/fulladder1bit.vhd}
vcom -93 -work work {/home/rafael/Documents/qt/somadorMulticilo4T/compare.vhd}
vcom -93 -work work {/home/rafael/Documents/qt/somadorMulticilo4T/blocoOperativo4T.vhd}
vcom -93 -work work {/home/rafael/Documents/qt/somadorMulticilo4T/BC_State.vhd}
vcom -93 -work work {/home/rafael/Documents/qt/somadorMulticilo4T/addersubtractor.vhd}
vcom -93 -work work {/home/rafael/Documents/qt/somadorMulticilo4T/blocoControle4T.vhd}
vcom -93 -work work {/home/rafael/Documents/qt/somadorMulticilo4T/somadorMulticilo4T.vhd}

