def_graf : dialog {
	label = "Desenhador de Gráficos";
	:popup_list {
		label = "Escala de Plotagem = 1000  :";
		key = "plot_scale";
	}
        : row {
            :boxed_column {
			label = "Eixo Horizontal";
			:popup_list {
				label = "Escala = 1 :";
				key = "hz_scale";
			}
			:edit_box {
				label = "X Mínimo";
				key = "hz_start";
			}
			:edit_box {
				label = "X Máximo";
				key = "hz_larg";
			}

			:edit_box {
				label = "Numerar cada...";
				key = "hz_increm";
			}
		}
            :boxed_column {
			label = "Eixo Vertical";
			:popup_list {
				label = "Escala = 1 :";
				key = "vt_scale";
			}
			:edit_box {
				label = "Y Minimo";
				key = "vt_start";
			}
			:edit_box {
				label = "Y Máximo";
				key = "vt_prof";
			}

			:edit_box {
				label = "Numerar cada...";
				key = "vt_increm";
			}
		}
	}

		ok_cancel;

}

graf : dialog {
	label = "Desenha gráficos a partir de um arquivo...";
	:radio_row {
		label = "O que fazer ?";
		key = "gf_draw_radio2";
		:radio_button {
			key = "radio2_point";
			label = "Marcar Pontos";
		}
		:radio_button {
			key = "radio2_pline";
			label = "Desenhar Gráfico";
		}
	}
	ok_cancel;
}


graf_capt :dialog {
	label = "Capturando Dados de Eixos...";
	:paragraph {
		:text {
			label = "Nos gráficos criados pelo CADNorma,";
			alignment = centered;
		}
		:text {
			label = "existe um traço oblíquo na origem";
			alignment = centered;
		}
		:text {
			label = "dos eixos, como ilustrado no slide.";
			alignment = centered;
		}
	}
	: icon_image {
        	key         = "graf_capt";
        	fixed_width = true;
        	fixed_height = true;
        	alignment = centered;
        	width = 35;
        	height = 10;
	}
	:text {
		label = "Clique OK e selecione esse traço...";
		alignment = centered;
	}
	:text {
		label = "para capturar os dados desses eixos.";
		alignment = centered;
	}

	ok_cancel;
}

