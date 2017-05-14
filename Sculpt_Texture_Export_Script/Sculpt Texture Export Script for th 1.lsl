// :CATEGORY:Sculpt
// :NAME:Sculpt_Texture_Export_Script
// :AUTHOR:anonymous
// :CREATED:2011-01-22 12:23:17.240
// :EDITED:2013-09-18 15:39:01
// :ID:728
// :NUM:996
// :REV:1.0
// :WORLD:Second Life
// :DESCRIPTION:
// Restart the GIMP after creating the file (or refresh the scripts with Xtns->Script-Fu->Refresh Scripts from the Tools window). A new menu item will appear in the Image window (Script-Fu->SecondLife->Export Sculptie). The script will prompt the user for a filename, and then will export the image as a mesh which can be uploaded into a 3D modelling tool.// // Note that the script does not close off the top and bottom seams of the model the way SL does. Other than that the model will look very similar in a 3D tool as it does in SL. 
// :CODE:
(define (script-fu-exp-sculptie inImage inDrawable inFilename)
  (define (putv x y z f) 
      (let* ((buf (string-append "v " 
                                 (number->string x) " " 
                                 (number->string y) " " 
                                 (number->string z) "\n")))
      (puts buf f)
      )
  )
  (define (v-num-str row col width) (number->string (+ (* row width) col 1)))
  (define (decode x) (if (>= x 0) x (+ 256 x)))
  (let*
    (
    (obj-file (fopen inFilename "w+"))
    (iwidth (car (gimp-drawable-width inDrawable)))
    (iheight (car (gimp-drawable-height inDrawable)))
    (row 0)
    )
    (verbose 2)
    (while (< row iheight)
        (let* ((col 0))
           (while (< col iwidth)
             (let* 
               (
                 (pixel (cadr (gimp-drawable-get-pixel inDrawable col row)))
                 (x (/ (decode (aref pixel 0)) 255.0))
                 (y (/ (decode (aref pixel 1)) 255.0))
                 (z (/ (decode (aref pixel 2)) 255.0))
               )
               (putv x y z obj-file)
             )
             (set! col (+ col 1))
           ) 
        )
        (set! row (+ row 1))
    )
    (set! row 0)
    (while (< row (- iheight 1))
        (let* ((col 0))
           (while (< col iwidth)
             (writes obj-file (string-append "f " 
                   (v-num-str row col iwidth) " " 
                   (v-num-str row  (fmod (+ col 1) iwidth) iwidth) " "
                   (v-num-str (+ row 1) (fmod (+ col 1) iwidth)  iwidth) " "
                   (v-num-str (+ row 1) col iwidth) "\n"))
             (set! col (+ col 1))
           ) 
        )
        (set! row (+ row 1))
    )
    (verbose 0)
    (fclose obj-file)
  )
)

        (script-fu-register
          "script-fu-exp-sculptie"                  ;func name
          "Export Sculptie"                         ;menu label
          "Exports the current image layer as a wavefront\
            obj file."              ;description
          "Kris Kovacs"                             ;author
          "copyright 2007, Kris Kovacs"             ;copyright notice
          "May 17, 2007"                            ;date created
          "RGB*"
          SF-IMAGE "Input Image" 0                  ;image type that the script works on
          SF-DRAWABLE "Input Drawable" 0              ;
          SF-FILENAME      "Output File:"        "tmp.obj" ;a string variable
        )
(script-fu-menu-register "script-fu-exp-sculptie" _"<Image>/Script-Fu/SecondLife")
