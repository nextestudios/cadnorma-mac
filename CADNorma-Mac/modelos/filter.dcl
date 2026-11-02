// Next available MSG number is    40 
// MODULE_ID FILTER_DCL_
/* Next available MSG number is  57 */

//----------------------------------------------------------------------------
//
//   FILTER.DCL   Version 1.0
//
//     Copyright 1991-1994,1996-1997 by Autodesk, Inc.
//
//     Permission to use, copy, modify, and distribute this software
//     for any purpose and without fee is hereby granted, provided
//     that the above copyright notice appears in all copies and
//     that both that copyright notice and the limited warranty and
//     restricted rights notice below appear in all supporting
//     documentation.
//
//     AUTODESK PROVIDES THIS PROGRAM "AS IS" AND WITH ALL FAULTS.
//     AUTODESK SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF
//     MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.  AUTODESK, INC.
//     DOES NOT WARRANT THAT THE OPERATION OF THE PROGRAM WILL BE
//     UNINTERRUPTED OR ERROR FREE.
//
//     Use, duplication, or disclosure by the U.S. Government is subject to
//     restrictions set forth in FAR 52.227-19 (Commercial Computer
//     Software - Restricted Rights) and DFAR 252.227-7013(c)(1)(ii)
//     (Rights in Technical Data and Computer Software), as applicable.
//
//.
//----------------------------------------------------------------------------
//
//  Filter.dcl - uses ssget to make filtered selection sets via dialogues.
//
//----------------------------------------------------------------------------


//dcl_settings : default_dcl_settings { audit_level = 3; }

filter : dialog {
    aspect_ratio = 0;
    label = "Object Selection Filters";
    : list_box {
	key = "filter_str_list";
	width = 67;
	height = 6;
	tabs = "20 22 25 35 37 40 50 52 55";
        tab_truncate = true;
    }
    : row {
	: boxed_column {
	    label = "Select Filter";
	    fixed_width = true;
	    : row {
		: popup_list {
		    key = "filter_by";
		    width = 22;
		}
		: button {
		    label = "Select...";
		    key = "select";
		    mnemonic = "e";
		    vertical_alignment = top;
		}

	    }
	    : row {
		: text {
		    label = "X:";
		    mnemonic = "X";
		    key = "x_text";
		}
		: popup_list {
		    key = "x_op";
		    edit_width = 5;
		    fixed_width = true;
		}
		: edit_box {
		    label = "";
		    key = "x_value";
		    width = 20;
		}
	    }
	    : row {
		: text {
		    label = "Y:";
		    mnemonic = "Y";
		    key = "y_text";
		}
		: popup_list {
		    key = "y_op";
		    edit_width = 5;
		    fixed_width = true;
		}
		: edit_box {
		    label = "";
		    key = "y_value";
		    width = 20;
		}
	    }
	    : row {
		: text {
		    label = "Z:";
		    mnemonic = "Z";
		    key = "z_text";
		}
		: popup_list {
		    key = "z_op";
		    edit_width = 5;
		    fixed_width = true;
		}
		: edit_box {
		    label = "";
		    key = "z_value";
		    width = 20;
		}
	    }

	    : row {
		: button {
		    label = "Add to List";
		    key = "add_to_list";
		    mnemonic = "L";
		}
		: button {
		    label = "Substitute";
		    key = "substitute";
		    mnemonic = "S";
		}
	    }
	    : button {
		label = "Add Selected Object <";
		key = "select_entity";
		mnemonic = "E";
	    }
	}
	: column {
	    : row {
		: button {
		    label = "Edit Item";
		    key = "edit";
		    mnemonic = "I";
		    fixed_width = true;
		}
		: button {
		    label = "Delete";
		    key = "remove";
		    fixed_width = true;
		    mnemonic = "D";
		}
		: button {
		    label = "Clear List";
		    key = "clear_list";
		    fixed_width = true;
		    mnemonic = "C";
		}
	    }
	    : boxed_column {
		label = "Named Filters";
		: popup_list{
		    label = "Current:";
		    mnemonic = "u";
		    key = "named_lists";
		    width = 14;
		}
		: row {
		    : button {
			label = "Save As:";
			key = "save_as";
			fixed_width = true;
			mnemonic = "v";
		    }
		    : edit_box {
			label = "";
			key = "new_name";
			edit_width = 20;
			edit_limit = 18;
		    }
		}
		: row {
		    : button {
			label = "Delete Current Filter List";
			key = "delete_list";
			mnemonic = "F";
		    }
		}
	    }
	    : row {
		fixed_width = true;
		alignment = centered;
		: button {
		    label = " Apply ";
		    key = "apply";
		    mnemonic = "A";
		    fixed_width = true;
		    width = 8;
		    alignment = centered;
		}
		: spacer {
		    width = 2;
		}
		cancel_button;
		: spacer {
		    width = 2;
		}
		help_button;
	    }
	}
    }
    : errtile { width = 60; }
}


single_table : dialog {
    key = "title";
    width = 30;
    : edit_box {
	label = "Pattern:";
	key = "pattern";
	edit_width = 15;
    }
    : list_box {
	key = "table_match";
	width = 45;
	multiple_select = true;
    }
    spacer;
    ok_cancel;
    errtile;
}

already_exists : dialog {
    label = "Warning";
    : paragraph {
	: text_part {
	    label = "A Filter List with this name already exists.";
	}
	: text_part {
	    label = "Do you want to redefine it?";
	}
    }
    spacer_1;
    : row {
	fixed_width = true;
	alignment = centered;
	: button {
	    label = "Redefine";
	    mnemonic = "R";
	    key = "redefine";
	    width = 8;
	}
	: spacer {
	    width = 2;
	}
	: default_button {
	    label = "Cancel";
	    mnemonic = "C";
	    key = "cancel";
	    width = 8;
	}
    }
}

