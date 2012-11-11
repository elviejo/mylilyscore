%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%
%%%%%	Fonction BGCOLOR permettant de mettre un fond de couleur
%%%%%		sur une portée pour en faciliter la lecture
%%%%%
%%%%%	Cette façon de faire viens de la page
%%%%%		http://lsr.dsi.unimi.it/LSR/Snippet?id=726
%%%%%	Merci Valentin d'avoir partagé son code,
%%%%%		rendons à César ce qui lui appartient
%%%%%
bgcolor =
	#(define-music-function (parser location color) (string?)
		#{\override Staff.StaffSymbol $'stencil =
			 $(lambda (grob)
				(let*
					(
						(staff
							(ly:staff-symbol::print grob)
						)
						(X-ext
							(ly:stencil-extent staff X)
						)
						(Y-ext
							(ly:stencil-extent staff Y)
						)
					)
					(set! Y-ext 
						(cons
							(- (car Y-ext) 3)
							(+ (cdr Y-ext) 3)
						)
					)
					(ly:grob-set-property! grob 'layer -10)
					(ly:stencil-add
						(ly:make-stencil
							(list 'color (eval-string color)
								(ly:stencil-expr
									(ly:round-filled-box X-ext Y-ext 0)
								)
								X-ext Y-ext
							)
						)
						staff
					)
				)
			)
		#}
	)
