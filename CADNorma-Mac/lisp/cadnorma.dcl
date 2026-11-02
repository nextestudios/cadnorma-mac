//*********************************************************************
//*********************************************************************
// CADNorma.dcl                             ***************************
// Caixas de diálogo para o CADNorma        ***************************
// Por Denio Guimarães                      ***************************
//Rio de Janeiro, 20 de fevereiro de 2002   ***************************
//*********************************************************************
//*********************************************************************

//***********************************************************
//*********  FREE - CONFIG***********************************
//***********************************************************

cn7_cfg_main :dialog {
	label = "Cadnorma - Configuração do Desenho...";
	:row {
		:boxed_radio_column{
			label = "Desenho em...";
			fixed_width = true;
			width = 15;
			key = "cn7_cfgmain_dwgunit";
			:radio_button {
				label = "metros";
				key = "cn7_cfgdwg_m";
			}
			:radio_button {
				label = "centímetros";
				key =  "cn7_cfgdwg_cm";
			}
			:radio_button {
				label = "milímetros";
				key =  "cn7_cfgdwg_mm";
			}
		}
		:boxed_radio_column{
			label = "Cotas em...";
			fixed_width = true;
			width = 15;
			key = "cn7_cfgmain_dimunit";
			:radio_button {
				label = "metros";
				key = "cn7_cfgdim_m";
			}
			:radio_button {
				label = "centímetros";
				key =  "cn7_cfgdim_cm";
			}
			:radio_button {
				label = "milímetros";
				key =  "cn7_cfgdim_mm";
			}
		}
		:boxed_column {
			label = "Customizar";
			:button {
				label = "Textos";
				key = "cn7_cfg_pref_text";
			}
			:button {
				label = "Cotas";
				key = "cn7_cfg_pref_dim";
			}
			:button {
				label = "Layers";
				key = "cn7_cfg_pref_layer";
			}
			spacer;
		}
	}
	:boxed_column{
		label = "Limites";
		:row{
		:toggle {
			label = "Aplicar Limites";
			key = "cn7_toggle_limits";
		}
		:button {
			label = "Limites";
			key = "cn7_cfg_pref_limits";
		}
		}
		spacer;
		spacer;
	}
	spacer;
	ok_cancel;
}

//***********************************************************
//*********  PROFESSIONAL - CONFIG***************************
//***********************************************************

cnp_cfg_main :dialog {
label = "CADNorma Mac - Configuração do Desenho";
:boxed_column { label = "Espaço"; :popup_list { key = "cn10_radio_space"; width = 34; } }
:row {
:boxed_column { label = "Desenho em..."; :popup_list { key = "cn7_cfgmain_dwgunit"; width = 18; } }
:boxed_column { label = "Cotas em..."; :popup_list { key = "cn7_cfgmain_dimunit"; width = 18; } }
}
:boxed_row { label = "Customizar";
:button { label = "Textos"; key = "cn7_cfg_pref_text"; }
:button { label = "Cotas"; key = "cn7_cfg_pref_dim"; }
:button { label = "Layers"; key = "cn7_cfg_pref_layer"; }
}
:boxed_row { label = "Limites";
:toggle { label = "Aplicar Limites"; key = "cn7_toggle_limits"; }
:button { label = "Limites"; key = "cn7_cfg_pref_limits"; }
}
ok_cancel;
}

/// Cadnorma - limits
cn7_cfg_limits : dialog {
	label = "Cadnorma - Limites";
	:boxed_column{
		label = "Defição de Limites:";
		:edit_box{
			label = "(X):";
			key = "cn7_cfg_limits_largura";
		}
		:edit_box{
			label = "(Y):";
			key = "cn7_cfg_limits_altura";
		}
		spacer;
		:button{
			label = "Pick Area >";
			key =  "cn7_cfg_limits_area";
		}
		spacer;
	}
	:boxed_column {
		label = "Definição da Origem";
		:edit_box{
			label = "(X0) = ";
			key = "cn7_cfg_limits_x0";
		}
		:edit_box{
			label = "(Y0) = ";
			key = "cn7_cfg_limits_y0";
		}
		spacer;
		:button{
			label = "Pick Point >";
			key =  "cn7_cfg_limits_pick";
		}
		spacer;
	}
	ok_cancel;
}


cn7_cfg_altext :dialog {
	label = "Cadnorma - Texto Custom";
	:boxed_column {
	label = "Estilos de Texto";
	:row{
		:list_box {
			key = "cn7_cfg_altext_stylist";
			fixed_width = true;
			width = 12;
			fixed_height = true;
			height = 8;
		}
		:column{
		:popup_list {
			label = "Fonte";
			key = "cn7_cfg_altext_fontpop";

		}
		: icon_image {
	                       	key = "altext_font_img";
	                        width = 32;
	                        height = 4;
	                }
	        }
	}
	spacer;
	}
		:boxed_column {
			label = "Propriedades";
			:row {
        	        :edit_box {
        	        	key = "altext_edit_altura";
	                	label = "Altura Final (mm)";
	                	fixed_width = true;
	                	width = 5;
	                }
	                spacer;
	                spacer;
				:text {
					label = "Cor:";
				}
				: icon_image {
	                       		key = "altext_color_img";
	                        	width = 8;
	                        	height = 1.4;
	                	}
	                }
	                spacer;

		}
	spacer;
	ok_cancel;
}


cn7_cfg_aldim :dialog {
	label = "Cadnorma - Dim Custom";
		:row {
		:column{
		:boxed_column {
			label = "Linear";
			:popup_list {
				key = "aldim_linear_popup";
				height = 6;
				width = 15;
			}
			: icon_image {
	                       	key = "aldim_linear_img";
	                        width = 20;
	                        height = 4.2;
	                        alignment = centered;
	                }
	        }
	        :boxed_column {
			label = "Angular";
			:popup_list {
				key = "aldim_angular_popup";
				height = 6;
				width = 15;
			}
			: icon_image {
	                       	key = "aldim_angular_img";
	                        width = 20;
	                        height = 4.2;
	                        alignment = centered;
	                }
	        }
	        }//column
	        spacer;
	        :column{
	        :boxed_column {
	        	label = "Propriedades";
	        	:row{
	        	:text{
	        		label = "Estilo de Texto";}
	        		
	        	:popup_list {
	        		key = "aldim_txt_sty";
	        		fixed_width = true;
	        		width = 15;
	        	}
	        	}
	        	:row {
	        	:text{
	        		label = "Suprimir Zeros";}
	        	:popup_list {
	        		key = "aldim_txt_zer";
	        		fixed_width = true;
	        		width = 15;
	        		}
	        		}
	        	:row{
	        	:text{
	        		label = "Casas Decimais";}
	        	:popup_list {
	        		key = "aldim_txt_dec";
	        		fixed_width = true;
	        		width = 15;

	        	}
	        	}
	        	:row{
	        	:text{
	        		label = "Separador Decimal";}
	        	:popup_list {
	        		key = "aldim_txt_sep";
	        		fixed_width = true;
	        		width = 15;
	        	}
	        	}
	        	spacer;
	        	}
	        	spacer;
       		        :boxed_column {
       		        label = "Cores";
	        	:row {
	        		:text {
					label = "Cor do Texto:";
				}
				: icon_image {
	                       		key = "aldim_txt_color";
	                        	width = 31;
	                        	height = 1.4;
	                	}
	                }
	                spacer;
	                :row {
	        		:text {
					label = "Cor das Linhas:";
				}
				: icon_image {
	                       		key = "aldim_lines_color";
	                        	width = 31;
	                        	height = 1.4;
	                	}
	                }
	                spacer;
	                }
	        }
	}
	spacer;
	ok_cancel;
}
	        	


/// Cadnorma - layers
cn7_cfg_layers :dialog {
	label = "Cadnorma - Controle de Layers";
	:row{
		:boxed_column{
			label = "Modelos";
			:toggle {
				label = "Criar Layers";
				key = "allay_create";
			}
			:list_box {
				key = "allayer_modelos";
                		allow_accept = true;
                		width = 20;
                		height = 7;
        		}
        		spacer;
        	}
        	:column{
        	:boxed_column {
        		label = "Mudar layer atual para...";
        		spacer;
        		:toggle {
				label = "Textos Cadnorma (R50, R60,...)";
				key = "allay_text_cadnorma";
			}
			:toggle {
				label = "Textos Customizados (T1, T2,...)";
				key = "allay_text_custom";
			}
			:toggle {
				label = "Cotas Cadnorma";
				key = "allay_dim_cadnorma";
			}
			:toggle {
				label = "Cotas Customizadas";
				key = "allay_dim_custom";
			}
			spacer;
		}
		}
	}
	spacer;	        	
	 ok_cancel;
}


cn7_laycon :dialog {
	label = "Cadnorma - Controle de Layers";
	:boxed_column {
		label = "Mudar layer atual para...";
		spacer;
		:toggle {
			label = "Textos Cadnorma (R50, R60,...)";
			key = "allay_text_cadnorma";
		}
		:toggle {
			label = "Textos Customizados (T1, T2,...)";
			key = "allay_text_custom";
		}
		:toggle {
			label = "Cotas Cadnorma";
			key = "allay_dim_cadnorma";
		}
		:toggle {
			label = "Cotas Customizadas";
			key = "allay_dim_custom";
		}
		spacer;
	}
	ok_cancel;
}

cn7_layins :dialog {
	label = "Cadnorma";
	:boxed_column{
		label = "Inserir Layers";
	:list_box {
		key = "allayer_modelos";
		allow_accept = true;
		width = 20;
		height = 10;
	}
	spacer;
	}
	spacer;
	ok_cancel;
}

cn_cfg_layt :dialog{
	       	label = "Layer de Trabalho";
	        :text {
	       		label = "";
	       		key = "layt_text";
	       	}
	       :list_box {
	                key = "cn_cfg_project";
	                multiple_select = false;
	      }
	       ok_cancel;
}



cn_new_dwg :dialog {
	label = "Cadnorma - Desenho novo...";
	spacer;
	:text {
		alignment = centered;
		label = "O CADNorma identificou que seu desenho não está configurado..." ;
	}
	spacer;
	:text {
		alignment = centered;
		label = "Deseja configurá-lo agora?" ;
	}
	spacer;
	ok_cancel;
}

      



cn7_red_descript : dialog {
	label = "Cadnorma - Descrição do Bloco";
	:boxed_column{
		label = "Digite a nova Descrição";
		:edit_box {
			key = "cn7_chg_descript";
			width = 65;
			is_default = true;
			allow_accept = true;
		}
		spacer;
		spacer;
	}
	ok_cancel;
}


lib_amplify : dialog {
	label = "Cadnorma - Ampliação de Slide";
	:boxed_column{
		label = "Imagem Ampliada do Slide ";
	: icon_image {
		key = "sld_amplify";
		fixed_width = true;
		fixed_height = true;
		width = 80;
	}
	spacer;
	}
	:boxed_column {
		label = "Descrição";
		:edit_box {
			key = "lib_amplify_descript";
		}
		spacer;
		spacer;
	}
	spacer;
	:row{
		:button{
			key = "lib_amplify_insert";
			label = "Inserir";
			fixed_width = true;
			width = 13;
		}
		ok_cancel;
	}
}




////////////////////////////////////////////

////////////////////////////////////////////
cn7_msg_ok : dialog {
	label = "Cadnorma Professional";
	: boxed_column {
		label = "Mensagem";
		: text {
			key = "msg_text1";
			label = "";
			alignment = centered;
			width = 60;
			fixed_width = true;
	       	}
		: text {
			key = "msg_text2";
			label = "";
			alignment = centered;
			width = 60;
			fixed_width = true;
	       	}
		: text {
			key = "msg_text3";
			label = "";
			alignment = centered;
			width = 60;
			fixed_width = true;
	       	}
	       	spacer;
	}
   	: row {
		:spacer{
			fixed_height = true;
			height = 3;
		}
		: button {
			label = "OK";
			key = "accept";
			width = 12;
			fixed_width = true;
			mnemonic = "O";
			is_default = true;
			alignment = centered;
		}
		: spacer { width = 1;}
	}
}

/////////////////////////////////////////////////
cn7_msg_ok_cancel : dialog {
	label = "Cadnorma Professional";
	: boxed_column {
		label = "Mensagem";
		: text {
			key = "msg_text1";
			label = "";
			alignment = centered;
	        }
		: text {
			key = "msg_text2";
			label = "";
			alignment = centered;
	        }
		: text {
			key = "msg_text3";
			label = "";
			alignment = centered;
	        }
	        spacer;
	}
   	: row {
		:spacer{
			fixed_height = true;
			height = 3;
		}
		: button {
			label = "OK";
			key = "accept";
			width = 12;
			fixed_width = true;
			mnemonic = "O";
			is_default = true;
		}
		: button {
			label = "Cancelar";
			key = "cancel";
			width = 12;
			fixed_width = true;
			mnemonic = "C";
			is_cancel = true;
  		}
		: spacer { width = 1;}
	}

}


////////////////////////////////////////////////
cn7_msg_yes_no : dialog {
	label = "Cadnorma Professional";
	: boxed_column {
		label = "Mensagem";
		: text {
			key = "msg_text1";
			label = "";
			alignment = centered;
			width = 55;
	        }
		: text {
			key = "msg_text2";
			label = "";
			alignment = centered;
			width = 55;
	       	}
		: text {
			key = "msg_text3";
			label = "";
			alignment = centered;
			width = 55;
	       	}
	       	spacer;
	}
	spacer;
   	: row {
		: button {
			label = "Sim";
			key = "yes";
			width = 12;
			mnemonic = "S";
			is_default = true;
		}
		: button {
			label = "Não";
			key = "no";
			width = 12;
//			fixed_width = true;
			mnemonic = "N";
			is_cancel = true;
  		}
	}
	spacer;
}


////////////////////////////////////////////////
cn7_msg_yes_no_cancel : dialog {
	label = "Cadnorma Professional";
	: boxed_column {
		label = "Mensagem";
		: text {
			key = "msg_text1";
			label = "";
			alignment = centered;
	       	}
		: text {
			key = "msg_text2";
			label = "";
			alignment = centered;
	       	}
		: text {
			key = "msg_text3";
			label = "";
			alignment = centered;
	       	}
	       	spacer;
	}
   	: row {
		:spacer{
			fixed_height = true;
			height = 3;
		}
		: button {
			label = "Sim";
			key = "yes";
			width = 12;
			fixed_width = true;
			mnemonic = "S";
			is_default = true;
		}
		: button {
			label = "Não";
			key = "no";
			width = 12;
			fixed_width = true;
			mnemonic = "N";
  		}
		: button {
			label = "Cancelar";
			key = "cancel";
			width = 12;
			fixed_width = true;
			mnemonic = "C";
			is_cancel = true;
  		}
		: spacer { width = 1;}
	}
}


cn7_msg_cfg : dialog {
	label = "Configurações de seu Desenho";
	: column {
		: text {
			key = "msg_text3";
			label = "";
			alignment = left;
	       	}
	       	: text {
			key = "msg_text4";
			label = "";
			alignment = left;
	       	}
	       	: text {
			key = "msg_text5";
			label = "";
			alignment = left;
	       	}
	}
   	: row {
		:spacer{
			fixed_height = true;
			height = 3;
		}
		: button {
			label = "OK";
			key = "accept";
			width = 12;
			fixed_width = true;
			mnemonic = "O";
			is_default = true;
			alignment = centered;
		}
		: spacer { width = 1;}
	}
}



lib_blk_update :dialog {
  label = "Cadnorma - Conflitos de blocos...";
  spacer;
  :radio_column {
    label = "Biblioteca e Desenho com blocos diferentes, de mesmo nome...";
    key = "blk_updt_radio";
    :radio_button {
      label = "Atualizar blocos desse desenho, de acordo com a biblioteca.";
      key = "blk_updt_update";
    }
    :radio_button {
      label = "Renomear os blocos nesse desenho para inserir o da biblioteca.";
      key = "blk_updt_rename";
    }
  }
  spacer;
  ok_cancel;
}


cn7_blist : dialog {
  label = "Cadnorma - Descrição de bloco";
  :text {
    label = "";
    key = "cn7_label";
  }  
    :boxed_column {
      :text {
        label = "";
        key = "cn7_blist_grp";
      }
      :text {
        label = "";
        key = "cn7_blist_type";
      }
      :text {
        label = "";
        key = "cn7_blist_unit";
      }
      :text {
        label = "";
        key = "cn7_blist_layer";
      }
      :text {
        label = "";
        key = "cn7_blist_color";
      }
    }
  :boxed_row {
    label = "Descrição do Bloco";
    :edit_box{
      key = "cn7_blist_descr";
    }
  }
  spacer;
  ok_cancel;
}




cn7_upscale :dialog{
  label = "Cadnorma - Conversão de Escalas";
  :boxed_column {
//  	label = "Escala de Conversão";
  	:text {
  		label = "";
  		key = "cn7_cve_newscl";
  		alignment = centered;
  	}
  	spacer;
  	spacer;
  }
  :boxed_column {
    label = "Elementos a serem convertidos...";
    :toggle{
    	label = "Textos (R60, R80, R100, etc.)";
    	key = "cn7_upscale_txt";
    	}
    :toggle{
    	label = "Cotas";
    	key = "cn7_upscale_dim";
    }
    :toggle{
    	label = "Blocos Gráficos";
    	key = "cn7_upscale_blk";
    }
  }
  spacer;
  ok_cancel;
}


cn7_cfg_pref : dialog {
	label = "Cadnorma - Carregamento";
	:boxed_radio_column{
		label = "Carregar Cadnorma... ";
		key = "cn7_pref_loadask";
		:radio_button {
			label = "...automaticamente, em todos os desenhos.";
			key = "cn7_pref_load_yes";
		}
		:radio_button {
			label = "...perguntar em todos os desenhos.";
			key = "cn7_pref_load_ask";
		}
		:radio_button {
			label = "...manualmente, em cada desenho.";
			key = "cn7_pref_load_no";
		}
	}
	:boxed_column {
		label = "Atalhos de Teclado: ";
		:radio_column{
			key = "cn7_pref_shortcut";
			:radio_button {
				label = "Carregar sempre.";
				key = "cn7_pref_short0";
			}
			:radio_button {
				label = "Perguntar antes de carregar.";
				key = "cn7_pref_short1";
			}
			:radio_button {
				label = "Não perguntar, nem carregar.";
				key = "cn7_pref_short2";
			}
		}
//		spacer;
		:row{
			:button {
				label = "Editar Atalhos";
				key = "cn7_pref_editshort";
				fixed_width = true;
				width = 25;
			}
			:button {
				label = "Restaurar Atalhos";
				key = "cn7_pref_resetshort";
				fixed_width = true;
				width = 25;
			}
		}
		spacer;
	}
	spacer;
	ok_cancel;
}



//solicita nova Escala do Model
cn7_defesc : dialog {
	label = "Cadnorma - Escala do Model...";
	:boxed_column {
		:text {
			label = "";
			key = "cn7_defesc_esc_atual";
		}
		spacer;
		:edit_box {
			label = "Escala do Model: ";
			key = "cn7_defesc_esc_nova";
			is_default = true;
			allow_accept = true;
		}
		spacer;
	}
	ok_cancel;
}


//solicita nova Escala do Model
cn7_dimlfac : dialog {
	label = "Cadnorma - Escala da Cota...";
	:boxed_column {
		:text {
			label = "";
			key = "cn7_dimlfac_esc_atual";
		}
		spacer;
		:edit_box {
			label = "Escala das Cotas: ";
			key = "cn7_dimlfac_esc_nova";
			is_default = true;
			allow_accept = true;
		}
		spacer;
	}
	ok_cancel;
}


//solicita nova Escala do Model
cn7_vwpesc : dialog {
	label = "Cadnorma - Escala da Viewport...";
	:boxed_column {
		:text {
			label = "";
			key = "cn7_vwpesc_esc_atual";
		}
		spacer;
		:edit_box {
			label = "Escala para Viewport: ";
			key = "cn7_vwpesc_esc";
			allow_accept = true;
		}
		spacer;
		spacer;
	}
	ok_cancel;
}


cn7_txt_espec :dialog{
	label = "Caracteres Especiais";
	:icon_image {
		key = "cn7_txt_espec_image";
		width = 120;
		height = 25;
		fixed_width = true;
		fixed_height = true;
	}
	spacer;
	ok_cancel;
}


cn7_regscale :dialog {
	label = "Cadnorma";
	:boxed_column{
		label = "Escalas Regulares";
	:list_box {
		key = "cn7_rscale_list";
		width = 20;
		height = 10;
	}
		:button {
			label = "Adicionar";
			key = "cn7_rscale_add";
		}
		:button {
			label = "Remover";
			key = "cn7_rscale_remove";
		}
		:button {
			label = "Reset";
			key = "cn7_rscale_reset";
		}
		spacer;
	}
	spacer;
	ok_cancel;
}

cn7_regscale_add :dialog{
	label = "Cadnorma - Escalas Regulares";
	:boxed_column {
		:text {
			label = "Adicionar escala como regular";
		}
		spacer;
		:edit_box {
			label = "Escala: ";
			key = "rscale_newscale";
			is_default = true;
			allow_accept = true;
		}
		spacer;
	}
	ok_cancel;
}

cn7_cfg_txarea :dialog {
	label = "Textos para Áreas";
	:boxed_column {
		label = "Texto da Área";
		:row{
			:text{
				label = "Estilo";
			}
			:popup_list {
				key = "txarea_style";
				fixed_width = true;
				width = 18;
			}
		}
		:row{
			:text{
				label = "Decimais";
			}
			:popup_list {
				key = "txarea_decimals";
				fixed_width = true;
				width = 18;
			}
		}
		:row{
			:text{
				label = "Unidade";
			}
			:popup_list {
				key = "txarea_unit";
				fixed_width = true;
				width = 18;
			}
		}
		spacer;
		:row {
	        		:text {
					label = "Cor do Texto:";
				}
				: icon_image {
	                       		key = "txarea_color";
	                        	width = 18;
	                        	height = 1.7;
	                	}
	                }
		spacer;
		:toggle {
			label = "Escrever unidade";
			key = "txarea_write";
		}
		:toggle {
			label = "Espaço entre o valor e unidade";
			key = "txarea_space";
		}

	}
	:boxed_column {
		label = "Texto do Ambiente";
		:row{
			:text{
				label = "Estilo";
			}
			:popup_list {
				key = "txamb_style";
				fixed_width = true;
				width = 18;
			}
		}
		spacer;
		:row {
	        		:text {
					label = "Cor do Texto:";
				}
				: icon_image {
	                       		key = "txamb_color";
	                        	width = 18;
	                        	height = 1.7;
	                	}
	                }
		spacer;
	}
	spacer;
	ok_cancel;
}

cn9_getplace : dialog {
	label = "Identificação";
	:boxed_column {
		label = "Nome do Ambiente";
		:edit_box {
			key = "area_getplace";
			allow_accept = true;
			fixed_width = true;
			width = 35;
		}
		spacer;
		spacer;
		spacer;
	}
	spacer;
	ok_cancel;
}





cn7_cfg_txdist :dialog {
	label = "Textos para Distâncias";
	:boxed_column {
		label = "Formatação";
		:row{
			:text{
				label = "Estilo";
			}
			:popup_list {
				key = "txdist_style";
				fixed_width = true;
				width = 18;
			}
		}
		:row{
			:text{
				label = "Decimais";
			}
			:popup_list {
				key = "txdist_decimals";
				fixed_width = true;
				width = 18;
			}
		}
		:row{
			:text{
				label = "Unidade";
			}
			:popup_list {
				key = "txdist_unit";
				fixed_width = true;
				width = 18;
			}
		}
		spacer;
		:row {
	        		:text {
					label = "Cor do Texto:";
				}
				: icon_image {
	                       		key = "txdist_color";
	                        	width = 18;
	                        	height = 1.7;
	                	}
	                }
		spacer;
	}
	:boxed_column{
		label = "Unidade";
		:toggle {
			label = "Escrever unidade";
			key = "txdist_write";
		}
		:toggle {
			label = "Espaço entre o valor e unidade";
			key = "txdist_space";
		}
	}
	spacer;
	ok_cancel;
}

txseq : dialog {
	label = "Seqüência Especial";
	:boxed_column {
		label = "Formatação do Texto";
		:row{
			:text{
				label = "Estilo";
			}
			:popup_list {
				key = "txseq_style";
				fixed_width = true;
				width = 18;
			}
		}
		:row {
			:text{
				label = "Incremento";
			}
			:edit_box {
				key = "txseq_increm";
				fixed_width = true;
				width = 18;
			}
		}
		:row {
			:text{
				label = "Prefixo";
			}
			:edit_box {
				key = "txseq_prefix";
				fixed_width = true;
				width = 18;
			}
		}
		:row {
			:text{
				label = "Sufixo";
			}
			:edit_box {
				key = "txseq_sufix";
				fixed_width = true;
				width = 18;
			}
		}
		spacer;
		:row {
			:text {
				label = "Cor do Texto:";
			}
			: icon_image {
	                	key = "txseq_color";
	                        width = 18;
	                        height = 1.7;
	                }
	        }
		spacer;
		spacer;
	}
	spacer;
	:toggle{
		label = "Rotacionar texto na direção.";
		key = "txseq_rotate";
	}
	spacer;
	ok_cancel;
}

chamada : dialog {
	label = "Cadnorma";
	:boxed_column{
		:edit_box {
			label = "Código:";
			key = "chamada_id";
			allow_accept = true;
			is_default = true;
		}
		spacer;
		spacer;
	}
	ok_cancel;
}


apontador : dialog {
	label = "Cadnorma";
	:row{
		:boxed_radio_column {
			label = "Apontador";
			key = "apo_radiokey";
			:radio_button {
				key = "apo_closed";
				label = "Closed";
			}
			:radio_button {
				key = "apo_open";
				label = "Open";
			}
			:radio_button {
				key = "apo_dot";
				label = "Dot";
			}
			:radio_button {
				key = "apo_elipse";
				label = "Elipse";
			}
			:radio_button {
				key = "apo_none";
				label = "Nenhum";
			}
		}
		:boxed_column{
			label = "Imagem";
			spacer;
		:icon_image{
			key = "apo_imagem";
			width = 18;
			height = 6;
		}
		spacer;
		}
	}
	spacer;
	ok_cancel;
}


new_library4 : dialog {
  label = "Cadnorma - Biblioteca Eletrônica";
  :row{
    :boxed_column{
    	:popup_list {
  		key = "newlib_label";
  		is_bold = true;
    	}
      	:list_box {
      	  label = "Grupos";
          width               = 25;
          height              = 8;
          fixed_height        = true;
          key                 = "lib_grplist";
          allow_accept        = true;
       	}
	:list_box {
	  label = "Subgrupos";
          width               = 25;
          height              = 8;
          fixed_height        = true;
          key                 = "lib_sublist";
          allow_accept        = true;
       	}
       	:list_box {
       	  label = "Blocos";
          width               = 25;
          height              = 10;
          fixed_height        = true;
          key                 = "lib_paglist";
          allow_accept        = true;
       	}
    	:button{
    		label = "Gerenciar";
      		key = "lib_grpmng";
	}
       	:button{
       		label = "Alterar &Descrição";
       		key = "lib_descr_altera";
       	}
       	:button{
       		label = "In&serir Descrição";
       		key = "lib_descr_insere";
       	}
       	spacer;
     }
     :column {
      :boxed_column{
                : row {
                    : icon_image {
                        key         = "icon11";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon12";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon13";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon14";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon21";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon22";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon23";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon24";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon31";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon32";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon33";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon34";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon41";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon42";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon43";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon44";
                        width = 18;
                        height = 5;
                    }
                }
                spacer;
                :row {
                	:button {
                		label = "< &Anterior";
                		key = "lib_blkprev";
                		fixed_width = true;
                		width = 20;
                	}
			:text{
				label = "";
				key = "lib_current_page";
				alignment = centered;
			}
                	:button {
                		label = "&Próxima >";
                		key = "lib_blknext";
                		fixed_width = true;
                		width = 20;
                	}
 		}
		spacer;
            }      
     :row {
    	:boxed_column {
         	label = "Propriedades";
          	key = "lib_blkppd";
            :text{
              label = "";
              key = "lib_blktype";
            }
            :text{
              label = "";
              key = "lib_blklayer";
            }
            :row{
            :text{
            	label = "Cor do Layer :";
            }
            :icon_image {
              fixed_width = true;
              width = 5;
              fixed_height = true;
              height = 2;
              key = "lib_blklaycol";
            }
            }
      		:toggle {
      			label = "Layer atual (current)";
        		key = "lib_insert_curlay";
        	}
        	:row {
          	:toggle {
          		label = "Fator de Escala";
          		key = "lib_sclblk_toggle";
          	}
          	:edit_box {
          		key = "lib_sclblk_factor";
          		fixed_width = true;
          		width = 4;
          		alignment = centered;
          	}
          	spacer;
          	}
          }
    :boxed_column{
    	label = "Modificar";
        :button{
          label = "&Redefinir";
          key = "lib_blkredef";
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "&Slide";
          key = "lib_blkslide";
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "&Limpar";
          key = "lib_blkclear";
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "S&ubstituir";
          key = "lib_blkexchange";
          fixed_width = true;
          width = 21;
        }
        spacer;
      }
      :boxed_column{
      	label = "Utilizar";
        :button{
          label = "A&mpliar";
          key = "lib_blkamplify";
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "&Conflitos";
          key = "lib_blkupdate";
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "&Inserir";
          key = "lib_blkinsert";
          is_default = true;
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "&Fechar";
          key = "lib_blkclose";
          fixed_width = true;
          width = 21;
          is_cancel = true;
        }
        spacer;
      }
    }
   }
  }
}


new_library2 : dialog {
  label = "Cadnorma - Biblioteca Eletrônica";
  :text {
  	label = "";
  	key = "newlib_label";
  	is_bold = true;
  }
  :row{
    :boxed_column{
    	:button{
    		label = "Gerenciar";
      		key = "lib_grpmng";
	}
      	:list_box {
      	  label = "Grupos";
          width               = 25;
          height              = 9;
          fixed_height        = true;
          key                 = "lib_grplist";
          allow_accept        = true;
       	}
	:list_box {
	  label = "Subgrupos";
          width               = 25;
          height              = 9;
          fixed_height        = true;
          key                 = "lib_sublist";
          allow_accept        = true;
       	}
       	:list_box {
       	  label = "Blocos";
          width               = 25;
          height              = 14;
          fixed_height        = true;
          key                 = "lib_paglist";
          allow_accept        = true;
       	}
       	:button{
       		label = "Alterar &Descrição";
       		key = "lib_descr_altera";
       	}
       	:button{
       		label = "In&serir Descrição";
       		key = "lib_descr_insere";
       	}
       	spacer;
     }
     :column {
      :boxed_column{
                : row {
                    : icon_image {
                        key         = "icon11";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon12";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon13";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon14";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon21";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon22";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon23";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon24";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon31";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon32";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon33";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon34";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon41";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon42";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon43";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon44";
                        width = 18;
                        height = 5;
                    }
                }
                spacer;
                :row {
                	:button {
                		label = "< &Anterior";
                		key = "lib_blkprev";
                		fixed_width = true;
                		width = 20;
                	}
			:text{
				label = "";
				key = "lib_current_page";
				alignment = centered;
			}
                	:button {
                		label = "&Próxima >";
                		key = "lib_blknext";
                		fixed_width = true;
                		width = 20;
                	}
 		}
		spacer;
            }      
     :row {
    	:boxed_column {
         	label = "Propriedades";
          	key = "lib_blkppd";
            :text{
              label = "";
              key = "lib_blktype";
            }
            :text{
              label = "";
              key = "lib_blklayer";
            }
            :row{
            :text{
            	label = "Cor do Layer :";
            }
            :icon_image {
              fixed_width = true;
              width = 5;
              fixed_height = true;
              height = 2;
              key = "lib_blklaycol";
            }
            }
//            spacer;
      		:toggle {
      			label = "Layer atual (current)";
        		key = "lib_insert_curlay";
        	}
        	:row {
          	:toggle {
          		label = "Fator de Escala";
          		key = "lib_sclblk_toggle";
          	}
          	:edit_box {
          		key = "lib_sclblk_factor";
          		fixed_width = true;
          		width = 4;
          		alignment = centered;
          	}
          	spacer;
          	}
          }
    :boxed_column{
    	label = "Modificar";
        :button{
          label = "&Redefinir";
          key = "lib_blkredef";
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "&Slide";
          key = "lib_blkslide";
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "&Limpar";
          key = "lib_blkclear";
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "S&ubstituir";
          key = "lib_blkexchange";
          fixed_width = true;
          width = 21;
        }
        spacer;
      }
      :boxed_column{
      	label = "Utilizar";
        :button{
          label = "A&mpliar";
          key = "lib_blkamplify";
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "&Conflitos";
          key = "lib_blkupdate";
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "&Inserir";
          key = "lib_blkinsert";
          is_default = true;
          fixed_width = true;
          width = 21;
        }
        :button{
          label = "&Fechar";
          key = "lib_blkclose";
          fixed_width = true;
          width = 21;
          is_cancel = true;
        }
        spacer;
      }
    }
   }
  }
}
				

lib_grpmanager : dialog {
	label = "Cadnorma - Gerenciador de Grupos";
	:text {
  		label = "";
	  	key = "newlib_label";
//	  	alignment = centered;
	  	is_bold = true;
  	}
	:row {
		:boxed_column {
			label = "Grupos";
			:list_box {
				key = "lib_grplist";
				width               = 25;
				height              = 17;
				fixed_height        = true;
				allow_accept        = true;
			}
			spacer;
			:button{
				label = "Renomear";
				key = "grp_grprename";
			}
			:button{
				label = "Novo";
				key = "grp_grpnew";
			}
			spacer;
		}
		:column {
			:row {
				:boxed_column{
				label = "Subgrupos";
				
				:list_box {
					key = "lib_sublist";
					width               = 25;
					height              = 22;
					fixed_height        = true;
					allow_accept        = true;
				}
				}
				:column {
					
					:boxed_column{
					label = "Propriedades";
					key = "lib_sub_propbox";
					:row {
					:text{
						label = "";
						key = "lib_blktype";
						alignment = left;
					}
					:button{
						label = ">";
						key = "sub_chtype";
						fixed_width = true;
						width = 2;
					}
					}
					:row {
					:text{
						label = "";
						key = "lib_blkunit";
					}
					:button{
						label = ">";
						key = "sub_chunit";
						fixed_width = true;
						width = 2;
					}
					}
					spacer;
					}
					:boxed_column {
					label = "Layer";
					key = "lib_sub_laybox";
					:row {
					:text{
						label = "";
						key = "lib_blklayer";
					}
					:button{
						label = ">";
						key = "sub_chlayn";
						fixed_width = true;
						width = 2;
					}
					}
					spacer;
					:icon_image {
						width = 25;
						fixed_height = true;
						height = 1.5;
						key = "lib_blklaycol";
					}
					spacer;
				}
			:boxed_column{
				label = "Subgrupo";
				:button{
					label = "Renomear";
					key = "grp_sub_rename";
					width = 25;
				}
				:button{
					label = "Aumentar";
					key = "grp_sub_page";
				}
				:button{
					label = "Criar Novo";
					key = "grp_sub_new";
				}
				spacer;
			}
		}
		}
		}
	}
	spacer;
	ok_cancel;
}


grp_grprename_dcl :dialog {
	label = "Nome do Grupo";
	:boxed_column{
	:edit_box{
		label = "Novo nome";
		width = 40;
		fixed_width = true;
		key = "grp_grprename_edit";
		allow_accept = true;
	}
	spacer;
	spacer;
	}
	spacer;
	ok_cancel;
}


grp_sub_change_type : dialog{
	label = "Cadnorma";
	:boxed_radio_column {
		label = "Tipo de Blocos:";
		key = "sgp_chtype_radio";
		:radio_button{
			label = "Reais (móveis, veículos,...)";
			key = "sub_chtype_1";
		}
		:radio_button{
			label = "Gráficos (setas, carimbos,...)";
			key = "sub_chtype_2";
		}
	}
	spacer;
	ok_cancel;
}

grp_sub_change_unit : dialog{
	label = "Cadnorma";
	:boxed_radio_column {
		label = "Unidade dos Blocos:";
		key = "sgp_chunit_radio";
		:radio_button{
			label = "Metros";
			key = "sub_chunit_0";
		}
		:radio_button{
			label = "Centímetros";
			key = "sub_chunit_1";
		}
		:radio_button{
			label = "Milímetros";
			key = "sub_chunit_2";
		}
		spacer;
	}
	spacer;
	ok_cancel;
}


grp_sub_change_layer : dialog{
	label = "Cadnorma";
	spacer;
	:boxed_column{
		label = "Layer de Inserção";
		:edit_box{
			key = "sub_chlayer_edit";
			allow_accept = true;
			width = 35;
		}
		spacer;
		spacer;
	}
	spacer;
	ok_cancel;
}

grp_sub_rename : dialog{
	label = "Cadnorma";
	spacer;
	:boxed_column{
		label = "Renomear Subgrupo para...";
		:edit_box{
			key = "sub_chsubname_edit";
			allow_accept = true;
			width = 35;
		}
		spacer;
		spacer;
	}
	spacer;
	ok_cancel;
}

grp_sub_newsub : dialog{
	label = "Cadnorma";
	spacer;
	:boxed_column{
		label = "Nome do Novo Subgrupo";
		:edit_box{
			key = "sub_newsub_edit";
			allow_accept = true;
			width = 35;
		}
		spacer;
		spacer;
	}
	spacer;
	ok_cancel;
}


new_library3 : dialog {
  label = "Cadnorma - Biblioteca Eletrônica";
  :row{
    :boxed_column{
        :popup_list {
  		key = "newlib_label";
  		is_bold = true;
    	}
      	:list_box {
      	  label = "Grupos";
          width               = 25;
          key                 = "lib_grplist";
          allow_accept        = true;
       	}
	:list_box {
	  label = "Subgrupos";
          width               = 25;
          key                 = "lib_sublist";
          allow_accept        = true;
       	}
     }
     :column {
      :boxed_column{
                : row {
                    : icon_image {
                        key         = "icon11";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon12";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon13";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon14";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon21";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon22";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon23";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon24";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon31";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon32";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon33";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon34";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon41";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon42";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon43";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon44";
                        width = 18;
                        height = 5;
                    }
                }
                spacer;
                :row {
                	:button {
                		label = "< &Anterior";
                		key = "lib_blkprev";
                		fixed_width = true;
                		width = 20;
                	}
			:text{
				label = "";
				key = "lib_current_page";
				alignment = centered;
			}
                	:button {
                		label = "&Próxima >";
                		key = "lib_blknext";
                		fixed_width = true;
                		width = 20;
                	}
 		}
		spacer;
            }
     }
     }
     :row {
     	:boxed_column {
     		label = "Blocos";
     		:list_box {
	          width = 50;
	          key = "lib_paglist";
	          height = 12;
	          allow_accept = true;
       		}
       		:row{
       		:button{
       			label = "Alterar &Descrição";
       			key = "lib_descr_altera";
       		}
       		:button{
       			label = "Inserir De&scrição";
       			key = "lib_descr_insere";
       		}
       		}
       	}
       	:column{
    	:boxed_column{
         	label = "Propriedades do Grupo";
          	key = "lib_blkppd";
//            :text{
//              label = "";
//              key = "lib_blktype";
//            }
            :row{
            :text{
              label = "";
              key = "lib_blktype";
            }
            	:text{
              	label = "";
              	key = "lib_blklayer";
            	}
            	:button{
	            	label = " > ";
	            	key = "sub_chlayn";
	            	fixed_width = true;
	            	width = 5;
	          }
            }
            :row{
            :text{
            	label = "Cor do Layer :";
            }
            :icon_image {
              fixed_width = true;
              width = 5;
              fixed_height = true;
              height = 2;
              key = "lib_blklaycol";
            }
            :button{
            	label = " > ";
            	width = 5;
            	height = 2;
            	fixed_width = true;
            	fixed_height = true;
            	key = "lib_blklaycol2";
            }
        }
        :row {
      		:toggle {
      			label = "Layer atual (current)";
        		key = "lib_insert_curlay";
        	}
        	}
        	:row {
          	:toggle {
          		label = "Fator de Escala";
          		key = "lib_sclblk_toggle";
          	}
          	:edit_box {
          		key = "lib_sclblk_factor";
          		fixed_width = true;
          		width = 15;
          		alignment = centered;
          	}
          	}
          	spacer;
          }

      :boxed_row{
       	label = "Utilizar";
        :column{
        	:row{
        		:button{
          			label = "A&mpliar";
          			key = "lib_blkamplify";
          			width = 16;
        		}
	        	:button{
	          		label = "&Conflitos";
	          		key = "lib_blkupdate";
	          		width = 16;
	        	}
	        	:button{
	          		label = "S&ubstituir";
	          		key = "lib_blkexchange";
	          		fixed_width = true;
	          		width = 21;
	        	}
	        }
        	:row{
        		:button{
          			label = "&Inserir";
          			key = "lib_blkinsert";
          			is_default = true;
          			width = 16;
        		}
        		:button{
          			label = "&Fechar";
          			key = "lib_blkclose";
          			width = 16;
          			is_cancel = true;
        		}
        	}
       	}
      }
    }
  }
}

new_library5 : dialog {
  label = "Cadnorma - Biblioteca Eletrônica";
  :row{
    :boxed_column{
      	:list_box {
      	  label = "Grupos";
          width               = 25;
          key                 = "lib_grplist";
          allow_accept        = true;
       	}
	:list_box {
	  label = "Subgrupos";
          width               = 25;
          key                 = "lib_sublist";
          allow_accept        = true;
       	}
     }
     :column {
      :boxed_column{
                : row {
                    : icon_image {
                        key         = "icon11";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon12";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon13";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon14";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon21";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon22";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon23";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon24";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon31";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon32";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon33";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon34";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon41";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon42";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon43";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon44";
                        width = 18;
                        height = 5;
                    }
                }
                spacer;
                :row {
                	:button {
                		label = "< &Anterior";
                		key = "lib_blkprev";
                		fixed_width = true;
                		width = 20;
                	}
			:text{
				label = "";
				key = "lib_current_page";
				alignment = centered;
			}
                	:button {
                		label = "&Próxima >";
                		key = "lib_blknext";
                		fixed_width = true;
                		width = 20;
                	}
 		}
		spacer;
            }
     }
     }
     :row {
     	:boxed_column {
     		label = "Blocos";
     		:list_box {
	          width = 50;
	          key = "lib_paglist";
	          height = 12;
	          allow_accept = true;
       		}
       		:row{
       		:button{
       			label = "Alterar &Descrição";
       			key = "lib_descr_altera";
       		}
       		:button{
       			label = "Inserir De&scrição";
       			key = "lib_descr_insere";
       		}
       		}
       	}
       	:column{
    	:boxed_column{
         	label = "Propriedades do Grupo";
          	key = "lib_blkppd";
//            :text{
//              label = "";
//              key = "lib_blktype";
//            }
            :row{
            :text{
              label = "";
              key = "lib_blktype";
            }
            	:text{
              	label = "";
              	key = "lib_blklayer";
            	}
            	:button{
	            	label = " > ";
	            	key = "sub_chlayn";
	            	fixed_width = true;
	            	width = 5;
	          }
            }
            :row{
            :text{
            	label = "Cor do Layer :";
            }
            :icon_image {
              fixed_width = true;
              width = 5;
              fixed_height = true;
              height = 2;
              key = "lib_blklaycol";
            }
            :button{
            	label = " > ";
            	width = 5;
            	height = 2;
            	fixed_width = true;
            	fixed_height = true;
            	key = "lib_blklaycol2";
            }
        }
//      }
//      :boxed_column {
//      		label = "Controle de Inserção";
      		:row {
      		:toggle {
      			label = "Layer atual (current)";
        		key = "lib_insert_curlay";
        	}
        	}
        	:row {
          	:toggle {
          		label = "Fator de Escala";
          		key = "lib_sclblk_toggle";
          	}
          	:edit_box {
          		key = "lib_sclblk_factor";
          		fixed_width = true;
          		width = 15;
          		alignment = centered;
          	}
          	}
          	spacer;
          }

      :boxed_row{
       	label = "Utilizar";
        :column{
        	:row{
        		:button{
          			label = "A&mpliar";
          			key = "lib_blkamplify";
          			width = 16;
        		}
	        	:button{
	          		label = "&Conflitos";
	          		key = "lib_blkupdate";
	          		width = 16;
	        	}
	        	:button{
	          		label = "S&ubstituir";
	          		key = "lib_blkexchange";
	          		fixed_width = true;
	          		width = 21;
	        	}
	        }
        	:row{
        		:button{
          			label = "&Inserir";
          			key = "lib_blkinsert";
          			is_default = true;
          			width = 16;
        		}
        		:button{
          			label = "&Fechar";
          			key = "lib_blkclose";
          			width = 16;
          			is_cancel = true;
        		}
        	}
       	}
      }
    }
  }
}


new_library : dialog {
  label = "Cadnorma - Biblioteca Eletrônica";
  :text {
  	label = "";
  	key = "newlib_label";
  	is_bold = true;
  }
  :row{
    :boxed_column{
      	:list_box {
      	  label = "Grupos";
          width               = 25;
          key                 = "lib_grplist";
          allow_accept        = true;
       	}
	:list_box {
	  label = "Subgrupos";
          width               = 25;
          key                 = "lib_sublist";
          allow_accept        = true;
       	}
     }
     :column {
      :boxed_column{
                : row {
                    : icon_image {
                        key         = "icon11";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon12";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon13";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon14";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon21";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon22";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon23";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon24";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon31";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon32";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon33";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon34";
                        width = 18;
                        height = 5;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon41";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon42";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon43";
                        width = 18;
                        height = 5;
                    }
                    : icon_image {
                        key         = "icon44";
                        width = 18;
                        height = 5;
                    }
                }
                spacer;
                :row {
                	:button {
                		label = "< &Anterior";
                		key = "lib_blkprev";
                		fixed_width = true;
                		width = 20;
                	}
			:text{
				label = "";
				key = "lib_current_page";
				alignment = centered;
			}
                	:button {
                		label = "&Próxima >";
                		key = "lib_blknext";
                		fixed_width = true;
                		width = 20;
                	}
 		}
		spacer;
            }
     }
     }
     :row {
     	:boxed_column {
     		label = "Blocos";
     		:list_box {
	          width               = 50;
	          key                 = "lib_paglist";
	          height = 17;
	          allow_accept        = true;
       		}
       		:row{
       		:button{
       			label = "Alterar &Descrição";
       			key = "lib_descr_altera";
       		}
       		:button{
       			label = "Inserir De&scrição";
       			key = "lib_descr_insere";
       		}
       		}
       	}
       	:column{
    	:boxed_column{
         	label = "Propriedades do Grupo";
          	key = "lib_blkppd";
            :text{
              label = "";
              key = "lib_blktype";
            }
            :row{
            	:text{
              	label = "";
              	key = "lib_blklayer";
            	}
            	:button{
	            	label = "   >   ";
	            	key = "sub_chlayn";
	            	fixed_width = true;
	            	width = 5;
	          }
            }
            :row{
            :text{
            	label = "Cor do Layer :";
            }
            :icon_image {
              fixed_width = true;
              width = 5;
              fixed_height = true;
              height = 2;
              key = "lib_blklaycol";
            }
            :button{
            	label = "   >   ";
            	width = 5;
            	height = 2;
            	fixed_width = true;
            	fixed_height = true;
            	key = "lib_blklaycol2";
            }
        }
      }
      :boxed_column {
      		label = "Controle de Inserção";
      		:row {
      		:toggle {
      			label = "Layer atual (current)";
        		key = "lib_insert_curlay";
        	}
        	}
        	:row {
          	:toggle {
          		label = "Fator de Escala";
          		key = "lib_sclblk_toggle";
          	}
          	:edit_box {
          		key = "lib_sclblk_factor";
          		fixed_width = true;
          		width = 15;
          		alignment = centered;
          	}
          	spacer;
          	}
          }

      :boxed_row{
       	label = "Utilizar";
        :column{
        	:row{
        		:button{
          			label = "A&mpliar";
          			key = "lib_blkamplify";
          			width = 16;
        		}
	        	:button{
	          		label = "&Conflitos";
	          		key = "lib_blkupdate";
	          		width = 16;
	        	}
	        	:button{
	          		label = "S&ubstituir";
	          		key = "lib_blkexchange";
	          		fixed_width = true;
	          		width = 21;
	        	}
	        }
        	:row{
        		:button{
          			label = "&Inserir";
          			key = "lib_blkinsert";
          			is_default = true;
          			width = 16;
        		}
        		:button{
          			label = "&Fechar";
          			key = "lib_blkclose";
          			width = 16;
          			is_cancel = true;
        		}
        	}
       	}
      }
    }
  }
}


leg:dialog {
      label = "Cadnorma - Convenções Gráficas";
      :row{
      :boxed_column{
  	      label = "Funções";
  	      :list_box {
  	      	width = 20;
          	key   = "cvg_funlist";
          	allow_accept = true;
          	key = "cvg_list";	
              }
      }
      :boxed_column{
		label = "Slides";
                : row {
                    : icon_image {
                        key         = "icon11";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon12";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon13";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon14";
                        width = 14;
                        height = 4;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon21";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon22";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon23";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon24";
                        width = 14;
                        height = 4;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon31";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon32";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon33";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon34";
                        width = 14;
                        height = 4;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon41";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon42";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon43";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon44";
                        width = 14;
                        height = 4;
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon51";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon52";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon53";
                        width = 14;
                        height = 4;
                    }
                    : icon_image {
                        key         = "icon54";
                        width = 14;
                        height = 4;
                    }
                }
            }      
    }
    spacer;
    ok_cancel;
    spacer;
}


cn8_lib : dialog {
	label = "Biblioteca de Fabricantes";
	:boxed_row {
		label = "Bibliotecas Instaladas";
		:list_box{
//			label = "Instaladas";
			key = "lib_grupos";
			fixed_width =true;
			width = 25;
			allow_accept = true;
		}
		:column {
//			label = "Informações";
			fixed_width = true;
			width = 40;
			:text{
				key = "fablib_txt1";
			}
			:text{
				key = "fablib_txt2";
			}
			:text{
				key = "fablib_txt3";
			}
			:text{
				key = "fablib_txt4";
			}
			:text{
				key = "fablib_txt5";
			}
			:text{
				key = "fablib_txt6";
			}
			spacer;
			:text{
				key = "fablib_txt7";
			}
		}
	}
	:boxed_column{
		:row{
//			:button{
//				label = "Executar >";
//				key = "cn8_lib_btn_use";
//				is_default = true;
//			}
			:button{
				label = "Adicionar >";
				key = "cn8_lib_btn_add";
			}
			:button{
				label = "Acessar Site >";
				key = "cn8_lib_btn_www";
			}
		}
		spacer;
	}
	ok_cancel;
}

cn9_trcolor :dialog {
	label = "Troca cor";
	:row {
		:boxed_column {
			label = "Cor Original";
			:image_button {
				key = "trcolor_from_col";
				width = 22;
				height = 2;
				fixed_width = true;
				fixed_height = true;
			}
			:text {
				label = "";
				key = "trcolor_txt_from";
			}
			:row{
				:button {
					key = "trcolor_from_sel";
					label = "Select";
					width = 10;
					height = 2;
					fixed_width = true;
					fixed_height = true;

				}
				:button {
					key = "trcolor_from_pick";
					label = "Pick";
					width = 10;
					height = 2;
					fixed_width = true;
					fixed_height = true;
				}
			}
			spacer;
		}
		spacer;
		:boxed_column {
			label = "Mudar para";
			:image_button {
				key = "trcolor_to_col";
				width = 22;
				height = 2;
				fixed_width = true;
				fixed_height = true;
			}
			:text {
				label = "";
				key = "trcolor_txt_to";
			}
			:row{
				:button {
					key = "trcolor_to_sel";
					label = "Select";
					width = 10;
					height = 2;
					fixed_width = true;
					fixed_height = true;
				}
				:button {
					key = "trcolor_to_pick";
					label = "Pick";
					width = 10;
					height = 2;
					fixed_width = true;
					fixed_height = true;
				}
			}
			spacer;
		}
	}
	ok_cancel;
}

cn9_descr_sty : dialog {
	label = "Textos para Descrições";
	:boxed_column {
		label = "Formato do Texto";
		:row{
			:text{
				label = "Estilo";
			}
			:popup_list {
				key = "cn9_descr_style";
				fixed_width = true;
				width = 18;
			}
		}
		spacer;
		:row {
			:text {
				label = "Cor do Texto:";
			}
			: icon_image {
				key = "cn9_descr_color";
				width = 18;
				height = 1.7;
			}
	        }
		spacer;
		:edit_box {
			label = "Layer ";
			key = "cn9_descr_layer";
		}
		spacer;
		spacer;
		:toggle {
			label = "Escrever com letra maiúscula";
			key = "cn9_descr_cxa";
		}
		spacer;
	}
	spacer;
	ok_cancel;
}



cn9_quant : dialog {
	label = "Cadnorma - Quantitativos";
	spacer;
	:boxed_column {
		label = "Tipo de Projeto";
		:popup_list {
			label = "";
			key = "cnqt_familia";
		}
		spacer;
		spacer;
	}
	:row {
		:boxed_column {
			label = "Grupos";
			:list_box {
				key = "cnqt_group";
				width = 25;
				height = 18;
				fixed_height = true;
			}
			:button {
				label = "Novo";
				key = "cnqt_grp_new";
			}
			:button {
				label = "Renomear";
				key = "cnqt_grp_rename";
			}
			spacer;
		}
		:boxed_column {
			label = "Subgrupos";
			:list_box {
				key = "cnqt_subgroup";
				width = 25;
				height = 18;
				fixed_height = true;
			}
			:button {
				label = "Novo";
				key = "cnqt_sub_new";
			}
			:button {
				label = "Renomear";
				key = "cnqt_sub_rename";
			}
			spacer;
		}
		:boxed_column {
			label = "Itens";
			:list_box{
				key = "cnqt_list";
				width = 50;
				height = 18;
				fixed_height = true;
				allow_accept = true;
			}
			:row {
			:column{
				:button {
					label = "Novo";
					key = "cnqt_button_new";
				}
				:button {
					label = "Substituir";
					key = "cnqt_change";
				}
			}
			:column {
				:button {
					label = "&Editar";
					key = "cnqt_button_edit";
				}
				:button {
					label = "Codificar";
					key = "cnqt_codify";
					is_default = true;
				}
			}
			}
		}
	}
	spacer;
	:boxed_column {
		label = "Item Selecionado";
		:text {
			label = "";
			key = "cnqt_show_type";
		}
		:text {
			label = "";
			key = "cnqt_show_custo";
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}


//DCL para renomear grupo ou subgrupo
cnqt_edit : dialog {
	label = "Cadnorma - Quantitativos";
	:boxed_column {
		:text {
			label = "";
			key = "cnqt_edit_label";
		}
		:edit_box {
			label = "Nome:";
			key = "cnqt_edit_newtext";
			width = 40;
			fixed_width = true;
			allow_accept = true;
		}
		spacer;
	}
	spacer;
	ok_cancel;
}

//DCL para editar item
cnqt_edit_item : dialog {
	label = "Cadnorma - Quantitativos";
	:text {
		label = "";
		key = "cnqt_edit_label";
	}
	spacer;
	:column {
		:boxed_column {
			label = "Descrição:";
			:edit_box {
				key = "cnqt_edit_newtext";
				width = 60;
//				fixed_width = true;
			}
			spacer;
			spacer;
		}
		spacer;
		:boxed_column {
			label = "Custo:";
			:edit_box {
				label = "Custo Unitário:";
				key = "cnqt_edit_newcusto";
				width = 30;
				fixed_width = true;
			}
			spacer;
		}
		spacer;
		:boxed_radio_column {
			label = "Tipo de Elemento";
			key = "cnqt_edit_type";
			:radio_button {
				label = "Unitário";
				key = "1";
			}
			:radio_button {
				label = "Linear";
				key = "2";
			}
			:radio_button {
				label = "Área";
				key = "3";
			}
			:radio_button {
				label = "Volume";
				key = "4";
			}
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}

//DCL para coletar altura
cnqt_geth : dialog {
	label = "Definição de altura";
	spacer;
	:boxed_column {
		:edit_box {
			label = "Altura: ";
			width = 30;
			allow_accept = true;
			key = "cnqt_geth_h";
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}

//DCL para coletar repetição
cnqt_get_repet : dialog {
	label = "Definição de Repetições";
	spacer;
	:boxed_column {
		:edit_box {
			label = "Repetições: ";
			width = 30;
			allow_accept = true;
			key = "cnqt_getrep_repet";
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}


//DCL para coletar área
cnqt_getarea : dialog {
	label = "Inserção Manual de Área";
	spacer;
	:boxed_column {
		:edit_box {
			label = "Área: ";
			width = 30;
			allow_accept = true;
			key = "cnqt_get_area";
		}
		spacer;
	}
	spacer;
	ok_cancel;
}


//DCL para coletar volume
cnqt_getvolume : dialog {
	label = "Inserção Manual de Volume";
	spacer;
	:boxed_column {
		:edit_box {
			label = "Volume: ";
			width = 30;
			allow_accept = true;
			key = "cnqt_get_volume";
		}
		spacer;
	}
	spacer;
	ok_cancel;
}

//DCL para coletar volume
cnqt_get_harea : dialog {
	label = "Dimensões do Volume";
	spacer;
	:boxed_row {
		:column {
			:text {
				label = "Altura: ";
			}
			spacer;
			:text {
				label = "Largura:  ";
			}
			spacer;
		}
		:column {
			:edit_box {
				width = 15;
				allow_accept = true;
				key = "cnqt_geth_h";
			}
			spacer;
			:edit_box {
				width = 15;
				allow_accept = true;
				key = "cnqt_get_esp";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
}




//DCL para identificador de código
cnqt_show : dialog {
	label = "Identificador de Códigos";
	:boxed_row {
		label = "Propriedades";
		:column {
			:text {
				label = "Código:";
			}
			:text {
				label = "Especialidade:";
			}
			:text {
				label = "Grupo:";
			}
			:text {
				label = "Subgrupo:";
			}
			:text {
				label = "Descrição:";
			}
			:text {
				label = "Tipo de Dimensão:";
			}
			:text {
				label = "Quantidade:";
			}
			:text {
				label = "Preço:";
			}
		}
		:column {
			:text {
				label = "";
				key = "cnqt_show_code";
			}
			:text {
				label = "";
				key = "cnqt_show_family";
			}
			:text {
				label = "";
				key = "cnqt_show_grupo";
			}
			:text {
				label = "";
				key = "cnqt_show_subgrupo";
			}
			:text {
				label = "";
				key = "cnqt_show_item";
				width = 50;
			}
			:text {
				label = "";
				key = "cnqt_show_type";
				width = 50;
			}
			:row {
				:text {
					label = "";
					key = "cnqt_show_quant1";
				}
				:text {
					label = "";
					key = "cnqt_show_unit1";
				}
			}
			:row {
				:text {
					label = "";
					key = "cnqt_show_quant2";
				}
				:text {
					label = "";
					key = "cnqt_show_unit2";
				}
			}
		}
	}
	spacer;
	ok_cancel;
}

//DCL para escolher o tipo de seleção
cnqt_codify_select : dialog {
	label = "Cadnorma - Quantitativos";
	:boxed_column {
	 	label = "Escolha o método de seleção";
		:list_box {
			key = "cnqt_codify_selist";
			width = 60;
			fixed_width = true;
			height = 15;
			fixed_height = true;
			is_default = true;
			allow_accept = true;
		}
		spacer;
	}
	spacer;
	ok_cancel;
}

//formatação de tabela

cnqt_rel_formtable : dialog {
	label = "Fomatação de Dados";
	:boxed_radio_column {
		label = "Tipo de Tabela";
		key = "q_rel_tabletype";
		:radio_button {
			label = "Quantitativos";
			key = "q_rel_table1";
		}
		:radio_button {
			label = "Quantitativos e Custos";
			key = "q_rel_table2";
		}
		spacer;
	}
	spacer;
	ok_cancel;
}


//Escolhe o estilo de cota para não-padronizados
cn10_dumup_sty : dialog {
	label = "Cadnorma - Dim Update";
	spacer;
	:boxed_radio_column {
		label = "Mudar Cotas não Padronizadas para...";
		key = "dimup_sty_radio";
		:radio_button {
			label = "Estilo de Cota do Cadnorma";
			key = "dimup_sty_radio1";
		}
		:radio_button {
			label = "Estilo de Cota do Usuário (Custom)";
			key = "dimup_sty_radio2";
		}
		:radio_button {
			label = "Não alterar";
			key = "dimup_sty_radio3";
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}

cn10_cfg_eixp :dialog {
	label = "Eixos de Projeto";
	:boxed_column {
		label = "Texto";
		:row{
			:text{
				label = "Estilo";
			}
			:popup_list {
				key = "eixp_text_style";
				fixed_width = true;
				width = 18;
			}
		}
		spacer;
		:row{
			:text{
				label = "Cor";
			}
			: icon_image {
	                       	key = "eixp_text_color";
	                        width = 18;
	                       	height = 1.7;
	                }
		}
		spacer;
	}
	:boxed_column {
		label = "Círculo";
		:row{
			:text{
				label = "Cor";
			}
			: icon_image {
	                       	key = "eixp_circ_color";
	                        width = 18;
	                       	height = 1.7;
	                }
		}
		spacer;
	}
	:boxed_column {
		label = "Eixo";
		:row{
			:text{
				label = "Linetype";
			}
			:popup_list {
				key = "eixp_eixo_ltype";
				fixed_width = true;
				width = 18;
			}
		}
		spacer;
		:row{
			:text{
				label = "Cor";
			}
			: icon_image {
	                       	key = "eixp_eixo_color";
	                        width = 18;
	                       	height = 1.7;
	                }
		}
		spacer;
	}
	spacer;
	ok_cancel;
}

//formatação do contador K3
k3 : dialog {
	label = "Contador K3";
	:boxed_column {
		label = "Formatação do Texto";
		:row{
			:text{
				label = "Estilo";
			}
			:popup_list {
				key = "k3_style";
				fixed_width = true;
				width = 18;
			}
		}
		:row{
			:text{
				label = "Alinhamento";
			}
			:popup_list {
				key = "k3_align";
				fixed_width = true;
				width = 18;
			}
		}
		:row {
			:text{
				label = "Prefixo";
			}
			:edit_box {
				key = "k3_prefix";
				fixed_width = true;
				width = 18;
			}
		}
		:row {
			:text{
				label = "Sufixo";
			}
			:edit_box {
				key = "k3_sufix";
				fixed_width = true;
				width = 18;
			}
		}
		:row{
			:text{
				label = "Formato";
			}
			:popup_list {
				key = "k3_format";
				fixed_width = true;
				width = 18;
			}
		}
		spacer;
		:row {
			:text {
				label = "Cor do Texto:";
			}
			: icon_image {
	                	key = "k3_color";
	                        width = 18;
	                        height = 1.7;
	                }
	        }
		spacer;
	}
	spacer;
	ok_cancel;
}

//define a formatação dos gráficos
def_graf : dialog {
	label = "Formatação de Gráficos";
	:boxed_row {
		label = "Linhas";
		:column {
			:text {
				label = "Cor dos Eixos:";
			}
			:text {
				label = "Cor dos Marcadores";
			}
			:text {
				label = "Cor da Grade";
			}
			:text {
				label = "Linetype da Grade";
			}
			spacer;
		}
		:column {
			: icon_image {
	                	key = "grf_eix_color";
	                        width = 18;
	                        height = 1.6;
	                }
	                : icon_image {
	                	key = "grf_tik_color";
	                        width = 18;
	                        height = 1.6;
	                }
	                : icon_image {
	                	key = "grf_grd_color";
	                        width = 18;
	                        height = 1.6;
	                }
	                :popup_list {
				key = "grf_grd_ltype";
				fixed_width = true;
				width = 18;
			}
	                spacer;
	        }
	 }
	 spacer;
	 :boxed_row {
	 	label = "Textos";
	 	:column {
	 		:text {
				label = "Cor do Texto:";
			}
			spacer;
			spacer;
			:text {
				label = "Estilo do Texto:      ";

			}
			spacer;
		}
		:column {
			: icon_image {
	                	key = "grf_txt_color";
	                        width = 18;
	                        height = 1.6;
	                }
	                :popup_list {
				key = "grf_txt_style";
				fixed_width = true;
				width = 18;
			}
			spacer;
		}
	}
	 ok_cancel;
}



//caixa de diálogo de gráficos
graf_eixos : dialog {
  label = "Cadnorma - Desenho de Eixos";
  spacer;
  :boxed_column {
    label = "Atenção!!!";
    :text{
      label = "O Eixo Horizontal estará sempre em Verdadeira Grandeza!";
      alignment = centered;
    }
    :text{
      label = "Sua Escala determina os tamanhos dos Elementos Gráficos e";
      alignment = centered;
    }
    :text{
      label = "é definida pela Escala Atual do Model ou da Viewport.";
      alignment = centered;
    }
    spacer;
  }
  spacer;
  :row{
    :boxed_row {
      label = "Eixo Horizontal";
      :column {
      	:text {
      		label = "Escala = 1 :";
      	}
      	:text {
      		label = "X Mínimo:";
      	}
      	:text {
      		label = "X Máximo:";
      	}
      	:text {
      		label = "Numerar a cada:";
      	}
      	spacer;
      }
      :column {
        :edit_box {
		key = "hz_scale";
          	width = 15;
        }
        :edit_box {
          	key = "hz_xmin";
          	width = 15;
        }
        :edit_box {
          key = "hz_xmax";
          width = 15;
        }
        :edit_box {
          key = "hz_xgap";
          width = 15;
        }
        spacer;
      }
      }
      :boxed_row {
      	label = "Eixo Vertical";
      	:column {
      		:text {
	      		label = "Escala = 1:";
	      	}
	      	:text {
	      		label = "Y Mínimo:";
	      	}
	      	:text {
	      		label = "Y Máximo:";
	      	}
	      	:text {
	      		label = "Numerar a cada:";
	      	}
	      	spacer;
      	}
      	:column {
      		:popup_list {
      		          key = "vt_scale";
      		          width = 15;
		}
		:edit_box {
			key = "vt_ymin";
        	}
        	:edit_box {
        		key = "vt_ymax";
        	}
        	:edit_box {
			key = "vt_ygap";
        	}
        	spacer;
      	}
      }
    }
    spacer;
  ok_cancel;
}


graf_draw : dialog {
	label = "Desenha gráficos a partir de um arquivo...";
	:boxed_column {
		label = "Atenção!";
		:text {
			label = "Os dados devem estar nesta ordem : ";
			alignment = centered;
		}
		:text {
			label = "Abscissa (X) ; Ordenada (Y)";
			alignment = centered;
		}
		:text {
			label = "Separados por ponto-e-vírgula (;)";
			alignment = centered;
		}
		spacer;
	}
	spacer;
	:boxed_column {
		label = "O que fazer ?";
		:radio_row{
			key = "drwgraf_radio";
			:radio_button {
				key = "drwgraf_radio1";
				label = "Marcar Pontos";
			}
			:radio_button {
				key = "drwgraf_radio2";
				label = "Desenhar o Gráfico";
			}
		}
		spacer;
	}
	spacer;
	:boxed_radio_column {
		label = "Definição de cor...";
		:row {
			:text {
				label = "";
				key = "drwgraf_txt";
			}
			:icon_image {
		                key = "drwgraf_col";
//		                width = 10;
		                height = 1.6;
		        }
		 }
		 spacer;
	}
	spacer;
	ok_cancel;
}


graf_capt :dialog {
	label = "Capturando Dados de Eixos...";
	:boxed_column {
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
		label = "Clique OK e selecione esse traço";
		alignment = centered;
	}
	:text {
		label = "para capturar os dados desse Gráfico.";
		alignment = centered;
	}
	spacer;
	}
	spacer;
	ok_cancel;
}


nog :dialog {
	label = "Notas Gerais";
	:row {
		:boxed_column {
			label = "Área de Projeto";
			:popup_list {
				label = "Especialidade";
				key = "nog_pop";
			}
			spacer;
		}
		:boxed_column {
			label = "Título";
			fixed_width = true;
			:button {
				label = "Inserir";
				key = "nog_tit";
				fixed_width = true;
				width = 20;
			}
			spacer;
		}
	}
	:column {
		:boxed_column {
			label = "Nota:";
			:row {
				:edit_box {
					label = "Linha 1:";
					key = "nog_linha1";
					width = 90;
				}
				:button {
					label = ">";
					key = "nog_pick1";
				}
			}
			:row {
				:edit_box {
					label = "Linha 2:";
					key = "nog_linha2";
					width = 90;
				}
				:button {
					label = ">";
					key = "nog_pick2";
				}
			}
			:row {
				:edit_box {
					label = "Linha 3:";
					key = "nog_linha3";
					width = 90;
				}
				:button {
					label = ">";
					key = "nog_pick3";
				}
			}
			:row {
				:edit_box {
					label = "Linha 4:";
					key = "nog_linha4";
					width = 90;
				}
				:button {
					label = ">";
					key = "nog_pick4";
				}
			}
			:row {
				:edit_box {
					label = "Linha 5:";
					key = "nog_linha5";
					width = 90;
				}
				:button {
					label = ">";
					key = "nog_pick5";
				}
			}
			spacer;
			:row {
				:button {
					label = " < Anterior";
					key = "nog_prev";
					fixed_width = true;
					width = 25;
				}
				spacer;
				:text {
					label = "Registro: ";
					alignment = centered;
				}
				:text {
					label = "";
					alignment = centered;
					key = "nog_current_note";
				}
				:text {
					label = " / ";
					alignment = centered;
				}
				:text {
					label = "";
					alignment = centered;
					key = "nog_total_notes";
				}
				spacer;
				:button {
					label = "Próxima > ";
					key = "nog_next";
					fixed_width = true;
					width = 25;
				}
			}
			spacer;
		}
		spacer;
	}
	spacer;
	:boxed_column {
		label = "Oções de Nota";
		:row {
			:button {
				label = "Inserir";
				width = 15;
				key = "nog_insert";
			}
			:button {
				label = "Nova";
				width = 15;
				key = "nog_new";
			}
			:button {
				label = "Configurações";
				width = 15;
				key = "nog_config";
			}
		}
		spacer;
	}
	spacer;
	spacer;
	ok_cancel;
}

//configurações de notas gerais
nog_config : dialog {
	label = "Notas Gerais";
	:boxed_column{
		label = "Layer:";
		:edit_box {
			width = 18;
			key = "nog_cfg_alllay";
		}
		spacer;
	}
	:boxed_row {
		label = "Título";
		:column {
			:text {
				label = "Texto:";
			}
			spacer;
			:text {
				label = "Estilo:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
				key = "nog_cfg_tittxt";
				width = 18;
			}
			:popup_list {
				key = "nog_cfg_titsty";
				width = 18;
			}
			spacer;
			: icon_image {
				key = "nog_cfg_titcol";
	                        width = 18;
	                        height = 1.6;
	                }
	                spacer;
		}
	}
	spacer;
	:boxed_row {
		label = "Notas";
		:column {
			spacer;
			:text {
				label = "Estilo:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:popup_list {
				width = 18;
				key = "nog_cfg_notsty";
			}
			spacer;
			: icon_image {
	                        width = 18;
	                        height = 1.6;
	                        key = "nog_cfg_notcol";
	                }
	                spacer;
		}
	}
	ok_cancel;
}

//***********************************************************
//*********  FREE - PORTAS  *********************************
//***********************************************************


portas : dialog{
  label = "Cadnorma - Portas";
  :boxed_column{
      label = "Escolha o Tipo de Porta";
        : row {
          : icon_image {
            key         = "icon11";
            width = 18;
            height = 4;
          }
          : icon_image {
            key         = "icon12";
            width = 18;
            height = 4;
          }
          : icon_image {
            key         = "icon13";
            width = 18;
            height = 4;
          }
        }
        : row {
          : icon_image {
            key         = "icon21";
            width = 18;
            height = 4;
          }
          : icon_image {
            key         = "icon22";
            width = 18;
            height = 4;
          }
          : icon_image {
            key         = "icon23";
            width = 18;
            height = 4;
          }
        }
        : row {
          : icon_image {
            key         = "icon31";
            width = 18;
            height = 4;
          }
          : icon_image {
            key         = "icon32";
            width = 18;
            height = 4;
          }
          : icon_image {
            key         = "icon33";
            width = 18;
            height = 4;
          }
      }
      spacer;
  }
  :row{
    :boxed_column{
      label = "Vão Livre (cm)";
      :list_box{
        key = "cn7_prtfree";
      }
    }
    :column{
    	:row {
    		:boxed_radio_column{
    			label = "Posicionamento";
    			key = "cn7_radio_doll";
    			:radio_button{
    				label = "Centralizada na Parede";
    				key = "cn7_prtcenter";
    			}
    			:radio_button{
    				label = "Definir Posicionamento";
    				key = "cn7_prtdoll";
    			}
    		}
    		:boxed_column {
    			:text{
    				label = "Tipo Atual:";
    				alignment = centered;
    			}
    			:text{
    				key = "prt_tipoatual";
    				alignment = centered;
    				is_bold = true;
    			}
    			spacer;
//    			:toggle{
//    				label = "Codificar";
//    				key = "prt_codify";
//    			}
    		}
    	}
    :boxed_column{
    	label = "Dimensões";
    	:row {
    		:text {
    			label = "Afastamento - Boneca (cm)";
    		}
    		:edit_box{
    			key = "cn7_prtdoll_size";
    		}
    	}
    	:row {
    		:text {
        		label = "Espessura da Parede (cm)";
        	}
    		:edit_box{
        		key = "cn7_prtwall";
        	}
        }
        :row {
        	:text {
        		label = "Espessura do Marco  (cm)";
        	}
        	:edit_box{
        		key = "cn7_prtmarco";
        	}
        }
     spacer;
    }
   }
  }   
  ok_cancel;
}


//***********************************************************
//*********  PROFESSIONAL - PORTAS  *************************
//***********************************************************

porta : dialog{
  label = "Cadnorma - Portas";
  :row {
  :boxed_column{
      label = "Escolha o Tipo de Porta";
        : row {
          : icon_image {
            key         = "icon11";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon12";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon13";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon14";
            width = 14;
            height = 4;
          }
        }
        : row {
          : icon_image {
            key         = "icon21";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon22";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon23";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon24";
            width = 14;
            height = 4;
          }
        }
        : row {
          : icon_image {
            key         = "icon31";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon32";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon33";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon34";
            width = 14;
            height = 4;
          }
      }
      :row {
          : icon_image {
            key         = "icon41";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon42";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon43";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon44";
            width = 14;
            height = 4;
          }
      }
      spacer;
  }
  :column {
  	:boxed_column {
  		label = "Largura (cm):";
  		:radio_button {
  			label = "Folha";
  			key = "prt_larg_radio1";
  		}
  		:popup_list {
  			key = "prt_dcl_larg";
  			height = 7;
  			fixed_height = true;
  		}
  		spacer;
  		:button {
  			label = "Editar";
  			key = "prt_larg_edit";
  		}
  		spacer;
  		:radio_button {
  			label = "Vão Livre (cm)";
  			key = "prt_larg_radio2";
  		}
  		:row {
  		:edit_box {
	  		key = "prt_getlvao_edit";
	  	}
	  	:button {
	  		label = ">";
	  		key = "prt_getlarg_pick";
	  	}
	  	}
  		spacer;
  	}
  	:boxed_column {
  		label = "Altura (cm)";
    		:popup_list {
  			key = "prt_dcl_halt";
  			height = 7;
  			fixed_height = true;
  		}
  		spacer;
  		:button {
  			label = "Editar";
  			key = "prt_halt_edit";
  		}
  		spacer;
  	}
  }
  }
  :row {
	:boxed_column {
		label = "Tipo Atual";
		: icon_image {
			width = 18;
			height = 6;
			key = "prt_slide_type";
		}
	}
	:boxed_column {
    		label = "Posicionamento";
    		:radio_column {
    			key = "prt_posi";
    			spacer;
    			:radio_button{
	    			label = "Centralizada";
	    			key = "prt_center";
	    		}
    			:radio_button{
    				label = "Posicionada";
	    			key = "prt_posic";
	    		}
	    	}
    		spacer;
    	}
    	:boxed_row {
    		label = "Parâmetros de Construção";
    	    	:column {
    	    		:text {
        			label = "Afastamento (cm):";
        		}
        		:text {
	        		label = "Parede (cm):";
	        	}
	        	:text {
	        		label = "Caixilho (cm):";
	        	}
        		spacer;
	        	
	        }
	        :column {
	        	:edit_box{
    				key = "prt_afas_edit";
    				fixed_width = true;
	        		width = 10;
    			}
    			:edit_box{
	        		key = "prt_wall_edit";
	        		fixed_width = true;
	        		width = 10;
	        	}
	        	:edit_box{
	        		key = "prt_caix_edit";
	        		fixed_width = true;
	        		width = 10;
	        	}
	        	spacer;
	        }
	        :column {
	        	:button {
	        		label = ">";
	        		key = "prt_get_afas";
	        	}
	        	:button {
	        		label = ">";
	        		key = "prt_get_wall";
	        	}
	        	:button {
	        		label = ">";
	        		key = "prt_get_caix";
	        	}
	        	spacer;
		}
	}
	}
	:row {
		:boxed_column {
			label = "Identificação";
			:row {
			:toggle {
				label = "Inserir";
				key = "prt_iden_toggle";
			}
			:button {
				label = "Configurar";
				key = "prt_iden_button";
			}
			}
			spacer;
		}
		:boxed_column {
			label = "Configurações";
			:row {
			:button {
				label = "Cores e Layers";
				key = "prt_cfg_laycol";
			}
			:button {
				label = "Detalhes do Tipo";
				key = "prt_cfg_detype";
			}
			}
			spacer;
		}
	}
    	ok_cancel;
}

prt_edit_larg : dialog {
	label = "Edição de Larguras";
	:boxed_column {
		label = "Larguras Disponíveis";
		:list_box{
  			key = "prt_cfglarg_list";
  			height = 15;
  			fixed_height = true;
  		}
  		spacer;
  		:button {
  			label = "Mover para Cima";
  			key = "prt_cfglarg_up";
  		}
		:button {
  			label = "Mover para Baixo";
  			key = "prt_cfglarg_down";
  		}
  		:button {
  			label = "Adicionar Largura";
  			key = "prt_cfglarg_add";
  		}
  		:button {
  			label = "Excluir Selecionada";
  			key = "prt_cfglarg_del";
  		}
  		spacer;
  	}
  	spacer;
  	ok_cancel;
  	spacer;
  }

  prt_larg_getnew : dialog {
	label = "Adicionar Largura";
	spacer;
	:boxed_column {
		label = "Nota";
		:text {
			label = "Especifique o comprimento de cada Folha, em centímetros.";
			alignment = centered;
		}
		:text {
			label = "Ex. Porta Dupla (2 x 80cm) -> Folha = 80cm";
			alignment = centered;
		}
		spacer;
	}
	:boxed_column {
		label = "Nova Largura";
		:edit_box {
			label = "Largura da Folha (cm): ";
			width = 30;
			allow_accept = true;
			key = "prt_larg_getnew_edit";
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}

prt_edit_halt : dialog {
	label = "Edição de Alturas";
	:boxed_column {
		label = "Alturas Disponíveis";
		:list_box{
  			key = "prt_cfghalt_list";
  			height = 15;
  			fixed_height = true;
  		}
  		spacer;
  		:button {
  			label = "Mover para Cima";
  			key = "prt_cfghalt_up";
  		}
		:button {
  			label = "Mover para Baixo";
  			key = "prt_cfghalt_down";
  		}
  		:button {
  			label = "Adicionar Altura";
  			key = "prt_cfghalt_add";
  		}
  		:button {
  			label = "Excluir Selecionada";
  			key = "prt_cfghalt_del";
  		}
  		spacer;
  	}
  	spacer;
  	ok_cancel;
  	spacer;
  }

prt_halt_getnew : dialog {
	label = "Adicionar Altura";
	spacer;
	:boxed_column {
		label = "Nota";
		:text {
			label = "Especifique uma nova Altura,";
			alignment = centered;
		}
		:text {
			label = "em centímetros.";
			alignment = centered;
		}
		spacer;
	}
	:boxed_column {
		label = "Nova Altura";
		:edit_box {
			label = "Altura da Porta (cm): ";
			width = 30;
			allow_accept = true;
			key = "prt_halt_getnew_edit";
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}

//configuração de identificação para portas
prt_cfgiden :dialog {
	label = "Identificação de Esquadrias";
	:boxed_column {
		label = "Tipos de Identificação";
		:row {
          		: icon_image {
          			key         = "iden11";
            			width = 14;
            			height = 4;
          		}
          		: icon_image {
            			key         = "iden12";
            			width = 14;
            			height = 4;
          		}
          		: icon_image {
            			key         = "iden13";
            			width = 14;
            			height = 4;
          		}
        	}
        	:row {
          		: icon_image {
          			key         = "iden21";
            			width = 14;
            			height = 4;
          		}
          		: icon_image {
            			key         = "iden22";
            			width = 14;
            			height = 4;
          		}
          		: icon_image {
            			key         = "iden23";
            			width = 14;
            			height = 4;
          		}
        	}
        	spacer;
        }
        :row {
        	:boxed_column {
        		key = "prt_cfgiden_tipo";
        		label = "Tipo Selecionado";
        		: icon_image {
        			key = "prt_cfgiden_typ";
        			width = 17;
        			height = 6;
          		}
          	}
          	:boxed_row {
          		label = "Configurações";
          		:column {
          			:text {
          				label = "Estilo:";
          			}
          			spacer;
          			:text {
          				label = "Cor";
          			}
          			spacer;
          			:text {
          				label = "Layer";
          			}
          			spacer;
          		}
          		:column {
          			:popup_list {
          				key = "prt_cfgiden_sty";
          			}
          			spacer;
          			:icon_image {
	                		key = "prt_cfgiden_col";
		                        width = 18;
		                        height = 1.7;
		                }
		                spacer;
		                :edit_box {
		                	key = "prt_cfgiden_lay";
		                }
		                spacer;
		        }
		}
	}
        spacer;
        ok_cancel;
}

//Portas - Configuração de layes e cores
prt_cfglayc :dialog {
	label = "Portas: Cores e Layers";
	:row {
	:boxed_row {
		label = "Porta";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "prt_layc_pol";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "prt_layc_poc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Caixilho";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "prt_layc_cxl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "prt_layc_cxc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Maçaneta";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "prt_layc_mal";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "prt_layc_mac";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	:row {
	:boxed_row {
		label = "Soleira";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "prt_layc_sol";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "prt_layc_soc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Alisares";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "prt_layc_all";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "prt_layc_alc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Arcos";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "prt_layc_arl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "prt_layc_arc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	spacer;
	ok_cancel;
	spacer;
}


//Configuração de porta tipo 11
prt_cfg_p11 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_11_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_11_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_11_poe_pick";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_11_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_11_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_11_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_11_aliext";
			}
			spacer;
		}
	}
	:row {
	:boxed_row {
		label = "Tipo de Fechamento:";
		spacer;
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_11_arcsld_01";
		        }
		        :radio_button {
		        	label = "Arco";
		        	alignment = centered;
		        	key = "prt_11_arc_01";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_11_arcsld_02";
		        }
		        :radio_button {
		        	label = "Reto";
		        	alignment = centered;
		        	key = "prt_11_arc_02";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_11_arcsld_03";
		        }
		        :radio_button {
		        	label = "Nenhum";
		        	alignment = centered;
		        	key = "prt_11_arc_03";
		        }
		}
		spacer;
	}
	:boxed_row {
		label = "Tipo de Caixilho";
		spacer;
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_11_cxisld_01";
		        }
		        :radio_button {
		        	label = "Simples";
		        	alignment = centered;
		        	key = "prt_11_cxi_01";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_11_cxisld_02";
		        }
		        :radio_button {
		        	label = "Detalhado";
		        	alignment = centered;
		        	key = "prt_11_cxi_02";
		        }
		}
		spacer;
	}
	}
	:boxed_row {
		label = "Tipo de Maçaneta:";
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_11_macsld_01";
		        }
		        :radio_button {
		        	label = "Tipo 01";
		        	alignment = centered;
		        	key = "prt_11_mac_01";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_11_macsld_02";
		        }
		        :radio_button {
		        	label = "Tipo 02";
		        	alignment = centered;
		        	key = "prt_11_mac_02";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_11_macsld_03";
		        }
		        :radio_button {
		        	label = "Tipo 03";
		        	alignment = centered;
		        	key = "prt_11_mac_03";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_11_macsld_04";
		        }
		        :radio_button {
		        	label = "Tipo 04";
		        	alignment = centered;
		        	key = "prt_11_mac_04";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_11_macsld_05";
		        }
		        :radio_button {
		        	label = "Nenhum";
		        	alignment = centered;
		        	key = "prt_11_mac_05";
		        }
		}
	}
	spacer;
	ok_cancel;
	spacer;
}

//Configuração de porta tipo 12
prt_cfg_p12 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_12_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_12_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_12_poe_pick";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_12_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_12_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_12_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_12_aliext";
			}
			spacer;
		}
	}
	:row {
	:boxed_row {
		label = "Tipo de Fechamento:";
		spacer;
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_12_arcsld_01";
		        }
		        :radio_button {
		        	label = "Arco";
		        	alignment = centered;
		        	key = "prt_12_arc_01";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_12_arcsld_02";
		        }
		        :radio_button {
		        	label = "Reto";
		        	alignment = centered;
		        	key = "prt_12_arc_02";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_12_arcsld_03";
		        }
		        :radio_button {
		        	label = "Nenhum";
		        	alignment = centered;
		        	key = "prt_12_arc_03";
		        }
		}
		spacer;
	}
	:boxed_row {
		label = "Tipo de Caixilho";
		spacer;
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_12_cxisld_01";
		        }
		        :radio_button {
		        	label = "Simples";
		        	alignment = centered;
		        	key = "prt_12_cxi_01";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_12_cxisld_02";
		        }
		        :radio_button {
		        	label = "Detalhado";
		        	alignment = centered;
		        	key = "prt_12_cxi_02";
		        }
		}
		spacer;
	}
	}
	:boxed_row {
		label = "Tipo de Maçaneta:";
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_12_macsld_01";
		        }
		        :radio_button {
		        	label = "Tipo 01";
		        	alignment = centered;
		        	key = "prt_12_mac_01";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_12_macsld_02";
		        }
		        :radio_button {
		        	label = "Tipo 02";
		        	alignment = centered;
		        	key = "prt_12_mac_02";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_12_macsld_03";
		        }
		        :radio_button {
		        	label = "Tipo 03";
		        	alignment = centered;
		        	key = "prt_12_mac_03";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_12_macsld_04";
		        }
		        :radio_button {
		        	label = "Tipo 04";
		        	alignment = centered;
		        	key = "prt_12_mac_04";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_12_macsld_05";
		        }
		        :radio_button {
		        	label = "Nenhum";
		        	alignment = centered;
		        	key = "prt_12_mac_05";
		        }
		}
	}
	spacer;
	ok_cancel;
	spacer;
}

//Configuração de porta tipo 13
prt_cfg_p13 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_13_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_13_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_13_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_13_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_13_aliext";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}



//Configuração de porta tipo 14
prt_cfg_p14 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_14_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_14_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_14_poe_pick";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Externa";
				key = "prt_14_solext";
			}
			spacer;
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_14_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_14_aliext";
			}
			spacer;
		}
	}
	:row {
	:boxed_row {
		label = "Tipo de Caixilho";
		spacer;
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_14_cxisld_01";
		        }
		        :radio_button {
		        	label = "Simples";
		        	alignment = centered;
		        	key = "prt_14_cxi_01";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_14_cxisld_02";
		        }
		        :radio_button {
		        	label = "Detalhado";
		        	alignment = centered;
		        	key = "prt_14_cxi_02";
		        }
		}
	}
	}
	:boxed_row {
		label = "Tipo de Maçaneta:";
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_14_macsld_01";
		        }
		        :radio_button {
		        	label = "Tipo 01";
		        	alignment = centered;
		        	key = "prt_14_mac_01";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_14_macsld_02";
		        }
		        :radio_button {
		        	label = "Tipo 02";
		        	alignment = centered;
		        	key = "prt_14_mac_02";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_14_macsld_03";
		        }
		        :radio_button {
		        	label = "Tipo 03";
		        	alignment = centered;
		        	key = "prt_14_mac_03";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_14_macsld_04";
		        }
		        :radio_button {
		        	label = "Tipo 04";
		        	alignment = centered;
		        	key = "prt_14_mac_04";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_14_macsld_05";
		        }
		        :radio_button {
		        	label = "Nenhum";
		        	alignment = centered;
		        	key = "prt_14_mac_05";
		        }
		}
	}
	spacer;
	ok_cancel;
	spacer;
}


//Configuração de porta tipo 21
prt_cfg_p21 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_21_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_21_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_21_poe_pick";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_21_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_21_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_21_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_21_aliext";
			}
			spacer;
		}
	}
	:row {
	:boxed_row {
		label = "Tipo de Posicionamento";
		spacer;
		:column {
			:icon_image {
		                width = 18;
		                height = 5;
		                key = "prt_21_possld_01";
		        }
		        :radio_button {
		        	label = "Externa";
		        	alignment = centered;
		        	key = "prt_21_pos_01";
		        }
		}
		:column {
			:icon_image {
		                width = 18;
		                height = 5;
		                key = "prt_21_possld_02";
		        }
		        :radio_button {
		        	label = "Interna";
		        	alignment = centered;
		        	key = "prt_21_pos_02";
		        }
		}
	}
	:boxed_row {
		label = "Tipo de Caixilho";
		spacer;
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_21_cxisld_01";
		        }
		        :radio_button {
		        	label = "Simples";
		        	alignment = centered;
		        	key = "prt_21_cxi_01";
		        }
		}
		:column {
			:icon_image {
		                width = 14;
		                height = 5;
		                key = "prt_21_cxisld_02";
		        }
		        :radio_button {
		        	label = "Detalhado";
		        	alignment = centered;
		        	key = "prt_21_cxi_02";
		        }
		}
		spacer;
	}
	}
	spacer;
	ok_cancel;
	spacer;
}



//Configuração de porta tipo 22
prt_cfg_p22 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_22_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_22_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_22_poe_pick";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_22_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_22_solext";
			}
			spacer;
		}
		
	}
	:row {
	:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_22_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_22_aliext";
			}
			spacer;
		}
	:boxed_row {
		label = "Tipo de Posicionamento";
		spacer;
		:column {
			:icon_image {
		                width = 18;
		                height = 4;
		                key = "prt_22_possld_01";
		        }
		        :radio_button {
		        	label = "Externa";
		        	alignment = centered;
		        	key = "prt_22_pos_01";
		        }
		}
		:column {
			:icon_image {
		                width = 18;
		                height = 4;
		                key = "prt_22_possld_02";
		        }
		        :radio_button {
		        	label = "Interna";
		        	alignment = centered;
		        	key = "prt_22_pos_02";
		        }
		}
	}
	}
	spacer;
	ok_cancel;
	spacer;
}


//Configuração de porta tipo 23
prt_cfg_p23 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_23_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_23_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_23_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_23_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_23_aliext";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}

prt_cfg_p24 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_24_slide";
		                width = 21;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_radio_column {
			label = "Tipo de Porta";
			key = "prt_24_ptype";
			:radio_button {
				label = "De Enrolar (Loja)";
				key = "prt_24_typ1";
			}
			:radio_button {
				label = "Pivotante (Garagem)";
				key = "prt_24_typ2";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_24_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_24_solext";
			}
			spacer;
		}
	}
	:row {
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_24_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_24_poe_pick";
			}
			spacer;
		}
		:boxed_column {
			label = "Projeção";
			:toggle {
				label = "Desenhar";
				key = "prt_24_prjtog";
			}
			:edit_box {
				label = "Larg. (cm):";
				key = "prt_24_prjwid";
			}
			spacer;
		}
		:boxed_column {
			label = "Definições";
			:edit_box {
				label = "Quant. Portas:";
				key = "prt_24_qtd_edit";
				
			}
			:toggle {
				label = "Desenhar Fechadura";
				key = "prt_24_fch_tog";
			}
			spacer;
		}
	}
	ok_cancel;
	spacer;
}

//Configuração de porta tipo 31
prt_cfg_p31 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_31_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_31_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_31_poe_pick";
			}
			spacer;
		}
	}
	:row {
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_31_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_31_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_31_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_31_aliext";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}

//Configuração de porta tipo 32
prt_cfg_p32 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_32_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_32_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_32_poe_pick";
			}
			spacer;
		}
	}
	:row {
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_32_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_32_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_32_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_32_aliext";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}

//Configuração de porta tipo 33
prt_cfg_p33 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_33_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_33_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_33_poe_pick";
			}
			spacer;
		}
	}
	:row {
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_33_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_33_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_33_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_33_aliext";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}


//Configuração de porta tipo 34
prt_cfg_p34 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_34_slide";
		                width = 18;
		                height = 7;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Definições de Porta:";
			:edit_box {
				label = "Quantid. Portas:";
				key = "prt_34_qtd_edit";
			}
			spacer;
			:edit_box {
				label = "Espessura (cm):";
				key = "prt_34_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_34_poe_pick";
			}
			spacer;
		}
	}
	:row {
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_34_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_34_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_34_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_34_aliext";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}


//Configuração de porta tipo 41
prt_cfg_p41 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_41_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_41_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_41_poe_pick";
			}
			spacer;
		}
	}
	:row {
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_41_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_41_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_41_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_41_aliext";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}


//Configuração de porta tipo 42
prt_cfg_p42 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_42_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_42_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_42_poe_pick";
			}
			spacer;
		}
	}
	:row {
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_42_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_42_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_42_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_42_aliext";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}


//Configuração de porta tipo 43
prt_cfg_p43 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_43_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_43_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_43_poe_pick";
			}
			spacer;
		}
	}
	:row {
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_43_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_43_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_43_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_43_aliext";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}



//Configuração de porta tipo 44
prt_cfg_p44 :dialog {
	label = "Configurações de Tipo";
	:boxed_column {
		label = "Descrição:";
		:text {
			key = "prt_descr";
		}
		spacer;
	}
	:row {
		:boxed_column {
			label = "Tipo de Porta:";
			:icon_image {
	                	key = "prt_44_slide";
		                width = 14;
		                height = 5;
		        }
		        spacer;
		}
		:boxed_column {
			label = "Espessura da Porta:";
			:edit_box {
				label = "Esp. (cm):";
				key = "prt_44_poe_edit";
			}
			spacer;
			:button {
				label = "Pick Points > ";
				key = "prt_44_poe_pick";
			}
			spacer;
		}
	}
	:row {
		:boxed_column {
			label = "Desenhar Soleira";
			spacer;
			:toggle {
				label = "Interna";
				key = "prt_44_solint";
			}
			:toggle {
				label = "Externa";
				key = "prt_44_solext";
			}
			spacer;
		}
		:boxed_column {
			label = "Desenhar Alisar";
			spacer;
			:toggle {
				label = "Interno";
				key = "prt_44_aliint";
			}
			:toggle {
				label = "Externo";
				key = "prt_44_aliext";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}


//DCL para coletar código das portas
prt_iden_gcode : dialog {
	label = "Código da Porta";
	spacer;
	:boxed_column {
		:edit_box {
			label = "Código: ";
			width = 20;
			allow_accept = true;
			key = "prt_gcode_code";
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}


//***********************************************************
//********* FREE - JANELAS **********************************
//***********************************************************
janelas :dialog{
  label = "Cadnorma - Janelas";
  :boxed_column{
      label = "Escolha o Tipo de Janela";
        : row {
          : icon_image {
            key         = "icon11";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon12";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon13";
            width = 14;
            height = 4;
          }
        }
        : row {
          : icon_image {
            key         = "icon21";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon22";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon23";
            width = 14;
            height = 4;
          }
        }
        : row {
          : icon_image {
            key         = "icon31";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon32";
            width = 14;
            height = 4;
          }
          : icon_image {
            key         = "icon33";
            width = 14;
            height = 4;
          }
      }
      spacer;
  }
  :row{
  	:boxed_radio_column{
      		label = "Posicionamento";
      		key = "cn7_radio_doll";
      		:radio_button{
	        	label = "Centralizada na Parede";
	        	key = "cn7_jnlcenter";
      		}
      		:radio_button{
		        label = "Definir Posicionamento";
		        key = "cn7_jnldoll";
	      	}
    	}
    	:boxed_column {
    		:text{
    			label = "Tipo Atual:";
    			alignment = centered;
    		}
    		:text{
    			label = "";
    			key = "jnl_tipoatual";
    			alignment = centered;
    			is_bold = true;
    		}
    		spacer;
//    		:toggle{
//    			label = "Codificar";
//    			key = "jnl_codify";
//    		}
    	}
    }
    :boxed_column{
    	label = "Dimensões";
    	:row {
    		:text {
    			label = "Comprimento (cm)";
    		}
    		:edit_box{
    			key = "jnl_compr";
    			width = 15;
    			fixed_width = true;
    			allow_accept = true;
    		}
    	}
    	:row {
    		:text {
    			label = "Afastamento - Boneca (cm)";
    		}
    		:edit_box{
    			key = "jnl_afast";
    			width = 15;
    			fixed_width = true;
    		}
    	}
    	:row {
    		:text {
        		label = "Espessura da Parede (cm)";
        	}
    		:edit_box{
        		key = "jnl_parede";
    			width = 15;
    			fixed_width = true;
        	}
        }
        :row {
        	:text {
        		label = "Espessura do Marco  (cm)";
        	}
        	:edit_box{
        		key = "jnl_marco";
    			width = 15;
    			fixed_width = true;
        	}
        }
     spacer;
    }
  ok_cancel;
}



//***********************************************************
//*********  PROFESSIONAL - JANELAS *************************
//***********************************************************

janela : dialog{
  label = "Cadnorma - Portas";
  :row {
  :boxed_column{
      label = "Escolha o Tipo de Janela";
        : row {
          : icon_image {
            key         = "icon11";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon12";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon13";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon14";
            width = 16;
            height = 4;
          }
        }
        spacer;
        : row {
          : icon_image {
            key         = "icon21";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon22";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon23";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon24";
            width = 16;
            height = 4;
          }
        }
        spacer;
        : row {
          : icon_image {
            key         = "icon31";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon32";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon33";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon34";
            width = 16;
            height = 4;
          }
      }
      spacer;
      : row {
          : icon_image {
            key         = "icon41";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon42";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon43";
            width = 16;
            height = 4;
          }
          : icon_image {
            key         = "icon44";
            width = 16;
            height = 4;
          }
      }
  }
  :column {
  	:boxed_column {
  		:radio_button {
  			label = "Retangular";
  			key = "jnl_larg_radio1";
  		}
		:edit_box {
			label = "Larg (cm)";
  			key = "jnl_getlarg_edit";
  		}
  		:button {
  			label = "Pick Point";
  			key = "jnl_getlarg_pick";
  		}
  		spacer;
	  	:popup_list {
	  		label = "Alt (cm):";
  			key = "jnl_dcl_halt";
  			height = 7;
  			fixed_height = true;
  		}
  		:button {
  			label = "Editar";
  			key = "jnl_halt_edit";
  		}
  		spacer;
  	}
  	:boxed_column {
  		:radio_button {
  			label = "Circular";
  			key = "jnl_larg_radio2";
  		}
		:edit_box {
			label = "Diam (cm)";
  			key = "jnl_getdiam_edit";
  		}
  		:button {
  			label = "Pick Point";
  			key = "jnl_getdiam_pick";
  		}
	  	spacer;
	}
	  
  	
  }
  }
  :row {
	:boxed_column {
		label = "Tipo Atual";
		: icon_image {
			width = 25;
			height = 6;
			key = "jnl_slide_type";
		}
	}
	:boxed_column {
    		label = "Posicionamento";
    		:radio_column {
    			key = "jnl_posi";
    			spacer;
    			:radio_button{
	    			label = "Centralizada";
	    			key = "jnl_center";
	    		}
    			:radio_button{
    				label = "Posicionada";
	    			key = "jnl_posic";
	    		}
	    	}
    		spacer;
    	}
    	:boxed_row {
    		label = "Parâmetros de Construção";
    	    	:column {
    	    		:text {
        			label = "Afastamento (cm):";
        		}
        		:text {
	        		label = "Parede (cm):";
	        	}
	        	:text {
	        		label = "Caixilho (cm):";
	        	}
        		spacer;
	        	
	        }
	        :column {
	        	:edit_box{
    				key = "jnl_afas_edit";
    				fixed_width = true;
	        		width = 10;
    			}
    			:edit_box{
	        		key = "jnl_wall_edit";
	        		fixed_width = true;
	        		width = 10;
	        	}
	        	:edit_box{
	        		key = "jnl_caix_edit";
	        		fixed_width = true;
	        		width = 10;
	        	}
	        	spacer;
	        }
	        :column {
	        	:button {
	        		label = ">";
	        		key = "jnl_get_afas";
	        	}
	        	:button {
	        		label = ">";
	        		key = "jnl_get_wall";
	        	}
	        	:button {
	        		label = ">";
	        		key = "jnl_get_caix";
	        	}
	        	spacer;
		}
	}
	}
	:row {
		:boxed_column {
			label = "Identificação";
			:row {
			:toggle {
				label = "Inserir Dimensões";
				key = "jnl_iden_toggle";
			}
			:button {
				label = "Configurar";
				key = "jnl_iden_button";
			}
			}
			spacer;
		}
		:boxed_column {
			label = "Configurações";
			:row {
			:button {
				label = "Cores e Layers";
				key = "jnl_cfg_laycol";
			}
			}
			spacer;
		}
	}
    	ok_cancel;
}



jnl_edit_halt : dialog {
	label = "Edição de Alturas";
	:boxed_column {
		label = "Alturas Disponíveis";
		:list_box{
  			key = "jnl_cfghalt_list";
  			height = 15;
  			fixed_height = true;
  		}
  		spacer;
  		:button {
  			label = "Mover para Cima";
  			key = "jnl_cfghalt_up";
  		}
		:button {
  			label = "Mover para Baixo";
  			key = "jnl_cfghalt_down";
  		}
  		:button {
  			label = "Adicionar Altura";
  			key = "jnl_cfghalt_add";
  		}
  		:button {
  			label = "Excluir Selecionada";
  			key = "jnl_cfghalt_del";
  		}
  		spacer;
  	}
  	spacer;
  	ok_cancel;
  	spacer;
  }

jnl_halt_getnew : dialog {
	label = "Adicionar Altura";
	spacer;
	:boxed_column {
		label = "Nota";
		:text {
			label = "Especifique uma nova Altura,";
			alignment = centered;
		}
		:text {
			label = "em centímetros.";
			alignment = centered;
		}
		spacer;
	}
	:boxed_column {
		label = "Nova Altura";
		:edit_box {
			label = "Altura da Porta (cm): ";
			width = 30;
			allow_accept = true;
			key = "jnl_halt_getnew_edit";
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}

//configuração de identificação para Janelas
jnl_cfgiden :dialog {
	label = "Identificação de Esquadrias";
	:boxed_column {
		label = "Tipos de Identificação";
		:row {
          		: icon_image {
          			key         = "iden11";
            			width = 14;
            			height = 4;
          		}
          		: icon_image {
            			key         = "iden12";
            			width = 14;
            			height = 4;
          		}
          		: icon_image {
            			key         = "iden13";
            			width = 14;
            			height = 4;
          		}
        	}
        	:row {
          		: icon_image {
          			key         = "iden21";
            			width = 14;
            			height = 4;
          		}
          		: icon_image {
            			key         = "iden22";
            			width = 14;
            			height = 4;
          		}
          		: icon_image {
            			key         = "iden23";
            			width = 14;
            			height = 4;
          		}
        	}
        	spacer;
        }
        :row {
        	:boxed_column {
        		key = "jnl_cfgiden_tipo";
        		label = "Tipo Selecionado";
        		: icon_image {
        			key = "jnl_cfgiden_typ";
        			width = 17;
        			height = 6;
          		}
          	}
          	:boxed_row {
          		label = "Configurações";
          		:column {
          			:text {
          				label = "Estilo:";
          			}
          			spacer;
          			:text {
          				label = "Cor";
          			}
          			spacer;
          			:text {
          				label = "Layer";
          			}
          			spacer;
          		}
          		:column {
          			:popup_list {
          				key = "jnl_cfgiden_sty";
          			}
          			spacer;
          			:icon_image {
	                		key = "jnl_cfgiden_col";
		                        width = 18;
		                        height = 1.7;
		                }
		                spacer;
		                :edit_box {
		                	key = "jnl_cfgiden_lay";
		                }
		                spacer;
		        }
		}
	}
        spacer;
        ok_cancel;
}

//Janelas- Configuração de layes e cores
jnl_cfglayc :dialog {
	label = "Janelas - Cores e Layers";
	:row {
	:boxed_row {
		label = "Caixilho";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "jnl_layc_cxl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "jnl_layc_cxc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Vidro";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "jnl_layc_vil";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "jnl_layc_vic";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	:row {
	:boxed_row {
		label = "Projeções";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "jnl_layc_prl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "jnl_layc_prc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Parapeito";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "jnl_layc_ppl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "jnl_layc_ppc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	spacer;
	ok_cancel;
	spacer;
}


//DCL para coletar altura
jnl_getqtd : dialog {
	label = "Cadnorma - Janelas";
	spacer;
	:boxed_column {
		label = "Vãos";
		:edit_box {
			label = "Quantidade ";
			width = 10;
			allow_accept = true;
			key = "jnl_getqtd_edit";
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}

jnl_cobo : dialog {
	label = "Cadnorma - Cobogó";
	:boxed_column {
		label = "Ventilação";
		:row {
		:edit_box {
			label = "Abertura (cm)";
			key = "jnl_cobo_vao";
		}
		:button {
			label = ">";
			key = "jnl_cobo_pick";
		}
		}
		spacer;
	}
	spacer;
	:boxed_row {
		label = "Definições";
		:radio_column {
			key = "jnl_cobo_radio";
			:radio_button {
				label = "Quant. Aberturas:";
				key = "jnl_cobo_radio1";
			}
			:radio_button {
				label = "% Livre:";
				key = "jnl_cobo_radio2";
			}
			spacer;
		}
		:column {
			:edit_box {
				key = "jnl_cobo_qtd";
			}
			:edit_box {
				key = "jnl_cobo_pct";
			}
			spacer;
		}
	}
	spacer;
	:boxed_row {
		label = "Resultados";
		:column {
			:text {
				label = "Espessura (cm)";
				key = "jnl_cobo_tx1";
			}
			:text {
				label = "";
				key = "jnl_cobo_tx2";
			}
			spacer;
		}
		:column {
			:text {
				label = "";
				key = "jnl_cobo_tx3";
			}
			:text {
				label = "";
				key = "jnl_cobo_tx4";
			}
			spacer;
		}
	}
	spacer;
	:boxed_radio_column {
		label = "Visibilidade";
		key = "jnl_cobo_visib";
		:radio_button {
			label = "em Vista";
			key = "jnl_cobo_vista";
		}
		:radio_button {
			label = "em Projeção";
			key = "jnl_cobo_proj";
		}
	}
	spacer;
	ok_cancel;
}


//DCL para coletar código das portas
jnl_iden_gcode : dialog {
	label = "Código da Porta";
	spacer;
	:boxed_column {
		:edit_box {
			label = "Código: ";
			width = 20;
			allow_accept = true;
			key = "jnl_gcode_code";
		}
		spacer;
	}
	spacer;
	ok_cancel;
	spacer;
}

//escadas
scd11 : dialog {
	label = "Cadnorma - Escadas";
	:boxed_radio_row {
		label = "Visibilidade";
		key = "scd11_vis_radio";
		:radio_button {
			label =	"em Vista";
			key = "scd11_vis_01";
		}
		:radio_button {
			label = "Interrompida";
			key = "scd11_vis_02";
		}
		:radio_button {
			label = "em Projeção";
			key = "scd11_vis_03";
		}
	}
	spacer;
	:boxed_column {
		label = "Imagem";
		:icon_image {
			key = "scd_11_slide";
			width = 47;
			height = 12;
		}
		spacer;
	}
	:boxed_column {
		label = "Dados de Construção";
		:row {
			:column {
				:text {
					label = "(A) Largura da Escada (cm):";
				}
				:text {
					label = "(B) Quantidade de Degraus:";
				}
				:text {
					label = "(C) Largura do Degrau (cm):";
				}
				spacer;
			}
			:column {
				:row {
				:edit_box {
					key = "scd11_getlarg";
				}
				:button {
					label = ">";
					key = "scd11_piklarg";
				}
				}
				:edit_box {
					key = "scd11_getndeg";
					width = 5;
					fixed_width = true;
				}
				:row {
					:edit_box {
						key = "scd11_getldeg";
					}
					:button {
						label = ">";
						key = "scd11_pikldeg";
					}
				}
			}
		}
		spacer;
	}
	spacer;
	:boxed_column {
		label = "Definições";
		:row {
			:column {
				:toggle {
					label = "Linha Direita";
					key = "scd11_getlind";
				}
				:toggle {
					label = "Linha Esquerda";
					key = "scd11_getline";
				}
			}
			:column {
				:toggle {
					label = "Corrimão Direito";
					key = "scd11_getcord";
				}
				:toggle {
					label = "Corrimão Esquerdo";
					key = "scd11_getcore";
				}
			}
		}
		spacer;
		:button {
			label = "Cores e Layers";
			key = "scd11_cfglayc";
		}
		spacer;
	}
	spacer;
	ok_cancel;
}


//Escada- Configuração de layes e cores
scd11_cfglayc :dialog {
	label = "Escadas - Cores e Layers";
	:row {
	:boxed_row {
		label = "Degraus em vista";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd11_layc_dvl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd11_layc_dvc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Degraus em Projeção";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd11_layc_dpl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd11_layc_dpc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	:row {
	:boxed_row {
		label = "Corrimão";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd11_layc_crl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd11_layc_crc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Interrupção";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd11_layc_itl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd11_layc_itc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	spacer;
	ok_cancel;
	spacer;
}


scd12 :dialog {
	label = "Cadnorma - Escadas Circulares";
	:boxed_radio_row {
		label = "Visibilidade";
		key = "scd12_vis_radio";
		:radio_button {
			label =	"Descendo";
			key = "scd12_vis_01";
		}
		:radio_button {
			label = "Subindo";
			key = "scd12_vis_02";
		}
		:radio_button {
			label = "Projeção";
			key = "scd12_vis_03";
		}
	}
	spacer;
	:boxed_column {
		label = "Imagem";
		:icon_image {
			key = "scd_12_slide";
			width = 43;
			height = 12;
		}
		spacer;
	}
	:boxed_column {
		label = "Dados de Construção";
		:row {
			:column {
				spacer;
				:text {
					label = "(A) Diâm. Externo (cm):";
				}
				spacer;
				:text {
					label = "(B) Diâm. Interno (cm):";
				}
				spacer;
			}
			:column {
				:row {
					:edit_box {
						key = "scd12_getdiae";
					}
					:button {
						label = ">";
						key = "scd12_pikdiae";
					}
				}
				:row {
					:edit_box {
						key = "scd12_getdiai";
					}
					:button {
						label = ">";
						key = "scd12_pikdiai";
					}
				}
				spacer;
			}
		}
		spacer;
	}
	spacer;
	:boxed_column {
		label = "Definições";
		:row {
			:toggle {
				label = "Corrimão Externo";
				key = "scd12_getcore";
			}
			:toggle {
				label = "Corrimão Interno";
				key = "scd12_getcori";
			}
		}
		spacer;
		:button {
			label = "Cores e Layers";
			key = "scd12_cfglayc";
		}
		spacer;
	}
	spacer;
	ok_cancel;
}

//Escada- Configuração de layes e cores
scd12_cfglayc :dialog {
	label = "Escadas - Cores e Layers";
	:row {
	:boxed_row {
		label = "Degraus em vista";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd12_layc_dvl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd12_layc_dvc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Degraus em Projeção";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd12_layc_dpl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd12_layc_dpc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	:row {
	:boxed_row {
		label = "Corrimão";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd12_layc_crl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd12_layc_crc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Contorno";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd12_layc_itl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd12_layc_itc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	spacer;
	ok_cancel;
	spacer;
}


scd13 :dialog {
	label = "Cadnorma - Escadas Circulares";
	:boxed_radio_row {
		label = "Visibilidade";
		key = "scd13_vis_radio";
		:radio_button {
			label =	"em Vista";
			key = "scd13_vis_01";
		}
		:radio_button {
			label = "em Projeção";
			key = "scd13_vis_02";
		}
	}
	:boxed_column {
		label = "Imagem";
		:icon_image {
			key = "scd_13_slide";
			width = 43;
			height = 10;
		}
		spacer;
	}
	:boxed_column {
		label = "Dados de Construção";
		:row {
			:column {
				spacer;
				:text {
					label = "(A) Larg. Degrau (cm):";
				}
				spacer;
				:text {
					label = "(B) Alt. Degrau (cm):";
				}
				spacer;
				:text {
					label = "(C) Quant. Degraus:";
				}
				spacer;
				:text {
					label = "(D) Esp. Laje (cm):";
				}
				spacer;
			}
			:column {
				:row {
					:edit_box {
						key = "scd13_getldeg";
					}
					:button {
						label = ">";
						key = "scd13_pikldeg";
					}
				}
				:row {
					:edit_box {
						key = "scd13_gethdeg";
					}
					:button {
						label = ">";
						key = "scd13_pikhdeg";
					}
				}
				:edit_box {
					key = "scd13_getndeg";
					width = 10;
					fixed_width = true;
				}
				:row {
					:edit_box {
						key = "scd13_getllaj";
					}
					:button {
						label = ">";
						key = "scd13_pikllaj";
					}
				}
				spacer;
			}
		}
		spacer;
	}
	:boxed_column {
		label = "Definições";
		:row {
			:column {
			spacer;
			:toggle {
				label = "Corrimão";
				key = "scd13_tog_core";
			}
			}
			:edit_box {
				label = "Altura (cm):";
				key = "scd13_gethcor";
			}
			:button {
				label = " > ";
				key = "scd13_pikhcor";
			}
		}
		spacer;
		:button {
			label = "Cores e Layers";
			key = "scd13_cfglayc";
		}
		spacer;
	}
	spacer;
	ok_cancel;
}

//Escada- Configuração de layes e cores
scd13_cfglayc :dialog {
	label = "Escadas - Cores e Layers";
	:row {
	:boxed_row {
		label = "Degraus em vista";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd13_layc_dvl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd13_layc_dvc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Degraus em Projeção";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd13_layc_dpl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd13_layc_dpc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Corrimão";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "scd13_layc_crl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "scd13_layc_crc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	spacer;
	ok_cancel;
	spacer;
}

scd :dialog {
	label = "Cadnorma - Escadas";
	:boxed_column {
		label = "Escolha o tipo de Escada";
		:row {
			:icon_image {
				key = "scd_slide1";
				width = 22;
				height = 6;
			}
			:icon_image {
				key = "scd_slide2";
				width = 22;
				height = 6;
			}
			:icon_image {
				key = "scd_slide3";
				width = 22;
				height = 6;
			}
		}
		spacer;
	}
	:boxed_column {
		label = "Tipo Selecionado";
		:text {
			label = "";
			key = "scd_text";
		}
		spacer;
	}
	spacer;
	ok_cancel;
}

//cobertura : dialog {
//	label = "Cadnorma - Coberturas";

coberturas : dialog {
	label =  "Cadnorma - Coberturas";
	:boxed_column {
		label = "Tipos de Coberturas";
		:row {
          		: icon_image {
            			key = "icon11";
            			width = 20;
            			height = 5;
         	 	}
         	 	: icon_image {
     		 		key = "icon12";
     		 		width = 20;
     		 		height = 5;
     		 	}
     		 	: icon_image {
     		 		key = "icon13";
     		 		width = 20;
     		 		height = 5;
     		 	}
     		 }
     		 :row {
          		: icon_image {
            			key = "icon21";
            			width = 20;
            			height = 5;
         	 	}
         	 	: icon_image {
     		 		key = "icon22";
     		 		width = 20;
     		 		height = 5;
     		 	}
     		 	: icon_image {
     		 		key = "icon23";
     		 		width = 20;
     		 		height = 5;
     		 	}
     		 }
     		 spacer;
     	}
     	:boxed_column {
     		:text {
     			key = "cbt_text_type";
     		}
     		spacer;
     	}
     	:row {
     	:boxed_column {
     		label = "Hachuras de Telhado";
     		:toggle {
     			label = "Hachurar";
     			key = "cbt_tog_hch";
     		}
     		:row {
     			:list_box {
     				key = "cbt_lst_hch";
     				width = 14;
     				height = 9;
     			}
     			:icon_image {
     				key = "cbt_img_hch";
     				width = 22;
     				height = 8;
     			}
     		}
     		:edit_box {
     			label = "Fator de Escala: ";
     			key = "cbt_fat_hch";
     		}
     		spacer;
     	}
     	:boxed_column {
     		label = "Seta de Caimento";
     		:toggle {
     			label = "Inserir";
     			key = "cbt_tog_set";
     		}
     		:row {
     			:list_box {
     				key = "cbt_lst_set";
     				width = 10;
     				height = 6;
     			}
     			:icon_image {
     				key = "cbt_img_set";
     				width = 15;
     				height = 7;
     			}
     		}
     		spacer;
     		:edit_box {
     			label = "Fator de Escala: ";
     			key = "cbt_fat_set";
     		}
     		spacer;
     	}
     	}
     	spacer;
     	:button {
     		label = "Cores e Layers";
     		key = "cbt_cfg_laycol";
     	}
     	spacer;
     	ok_cancel;
}

//Coberturas - Configuração de layes e cores
cbt_cfglayc :dialog {
	label = "Janelas - Cores e Layers";
	:row {
	:boxed_row {
		label = "Contorno da Cobertura";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "cbt_layc_cbl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "cbt_layc_cbc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Projeção da Edificação";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "cbt_layc_edl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "cbt_layc_edc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	:row {
	:boxed_row {
		label = "Hachura";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "cbt_layc_hcl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "cbt_layc_hcc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	:boxed_row {
		label = "Seta";
		:column {
			:text {
				label = "Layer:";
			}
			spacer;
			:text {
				label = "Cor:";
			}
			spacer;
		}
		:column {
			:edit_box {
		        	key = "cbt_layc_stl";
		        	width = 15;
		        }
		        spacer;
			:icon_image {
	                	key = "cbt_layc_stc";
		                width = 15;
		                height = 1.7;
		        }
			spacer;
		}
	}
	}
	spacer;
	ok_cancel;
	spacer;
}


//escadas
cbt_draw : dialog {
	label = "Cadnorma - Escadas";
	:boxed_column {
		label = "Imagem";
		:icon_image {
			key = "cbt_draw_img";
			width = 47;
			height = 12;
		}
		spacer;
	}
	:boxed_column {
		:row {
			:edit_box {
				label = "Beiral do Telhado (cm): ";
				key = "cbt_draw_getp";
			}
			:button {
				label = " > ";
				key = "cbt_draw_pikp";
			}
		}
		spacer;
	}
	:boxed_row {
		label = "Dimensões (cm)";
		:column {
			:row {
				:edit_box {
					label = "A=";
					key = "cbt_draw_geta";
				}
				:button {
					label = " > ";
					key = "cbt_draw_pika";
				}
			}
			:row {
				:edit_box {
					label = "B=";
					key = "cbt_draw_getb";
				}
				:button {
					label = " > ";
					key = "cbt_draw_pikb";
				}
			}
			:row {
				:edit_box {
					label = "C=";
					key = "cbt_draw_getc";
				}
				:button {
					label = " > ";
					key = "cbt_draw_pikc";
				}
			}
			spacer;
		}
		spacer;
		:column {
			:row {
				:edit_box {
					label = "D=";
					key = "cbt_draw_getd";
				}
				:button {
					label = " > ";
					key = "cbt_draw_pikd";
				}
			}
			:row {
				:edit_box {
					label = "E=";
					key = "cbt_draw_gete";
				}
				:button {
					label = " > ";
					key = "cbt_draw_pike";
				}
			}
			:row {
				:edit_box {
					label = "F=";
					key = "cbt_draw_getf";
				}
				:button {
					label = " > ";
					key = "cbt_draw_pikf";
				}
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
}

tqs_somaferro : dialog {
	label = "Cadnorma - TQS - Resumo de Ferros";
	:boxed_row {
		label = "Resumo de Ferragens";
		:list_box {
			label = "Aço        Diâm. (mm)       Compr(m)       Peso(kg)" ;
			tabs = "0 10 20 30";
			key = "tqs_ferro_list";
			width = 40;
		}
		spacer;
		:column {
			:column {
				label = "Compr. (m)";
				:text {
					key = "tqs_ferro_txtcomp";
					label = "";
				}
				:button {
					label = "Transportar";
					key = "tqs_ferro_btncomp";
				}
				spacer;
			}
			:column {
				label = "Peso (kg)";
				:text {
					label = "";
					key = "tqs_ferro_txtpeso";
				}
				:button {
					label = "Transportar";
					key = "tqs_ferro_btnpeso";
				}
				spacer;
			}
			spacer;
		}
	}
	:boxed_row {
		label = "Peso por tipo de Aço (kg)";
		:column {
			:text {
				label = "Aço 60B";
			}
			:text {
				label = "Aço 50A:";
			}
			spacer;
		}
		:column {
			:text {
				label = "";
				key = "tqs_ferro_60txt";
			}
			:text {
				label = "";
				key = "tqs_ferro_50txt";
			}
			spacer;
		}
		:column {
			:button {
				label = "Transportar";
				key = "tqs_ferro_60btn";
			}
			:button {
				label = "Transportar";
				key = "tqs_ferro_50btn";
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}

topdef_cfg_vars : dialog {
	label = "Cadnorma - Topografia";
	:boxed_column {
		label = "Atenção!";
		:text {label = "Os aplicativos de topografia";alignment = centered;}
		:text {label = "são aplicáveis somente para";alignment = centered;}
		:text {label = "desenhos em metros";alignment = centered;}
		spacer;
	}
	spacer;
	:boxed_row {
		label = "Parâmetros";
		:column {
			:text {
				label = "Decimais em Coordenadas";
			}
			spacer;
			:text {
				label = "Decimais em Medidas";
			}
			spacer;
			:text {
				label = "Precisão de Curvas de Nível (m)";
			}
			spacer;
			:text {
				label = "Kr - Coeficiente Geodésico";
			}
			spacer;
		}
		:column {
			:popup_list {
				key = "topdef_dcl_nedec";
				width = 15;
			}
			:popup_list {
				key = "topdef_dcl_didec";
				width = 15;
			}
			:edit_box {
				key = "topdef_dcl_zcurv";
				width = 15;
			}
			:edit_box {
				key = "topdef_dcl_kpaer";
				width = 15;
			}
			spacer;
		}
	}
	spacer;
	ok_cancel;
	spacer;
}
			