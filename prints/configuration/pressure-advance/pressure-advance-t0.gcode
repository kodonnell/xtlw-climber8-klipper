; ### Marlin K-Factor Calibration Pattern ###
; -------------------------------------------
;
; Printer: printer name
; Filament: filament name
; Created: Fri Dec 31 2021 15:16:49 GMT+1300 (New Zealand Daylight Time)
;
; Settings Printer:
; Filament Diameter = 1.75 mm
; Nozzle Diameter = 0.4 mm
; Nozzle Temperature = 205 °C
; Bed Temperature = 60 °C
; Retraction Distance = 6.5 mm
; Layer Height = 0.25 mm
; Extruder = 0
; Fan Speed = 0 %
; Z-axis Offset = 0 mm
;
; Settings Print Bed:
; Bed Shape = Rect
; Bed Size X = 200 mm
; Bed Size Y = 200 mm
; Origin Bed Center = false
;
; Settings Speed:
; Slow Printing Speed = 600 mm/min
; Fast Printing Speed = 3600 mm/min
; Movement Speed = 7200 mm/min
; Retract Speed = 1800 mm/min
; Unretract Speed = 1800 mm/min
; Printing Acceleration = 500 mm/s^2
; Jerk X-axis =  firmware default
; Jerk Y-axis =  firmware default
; Jerk Z-axis =  firmware default
; Jerk Extruder =  firmware default
;
; Settings Pattern:
; Linear Advance Version = 1.5
; Starting Value Factor = 0
; Ending Value Factor = 1.5
; Factor Stepping = 0.05
; Test Line Spacing = 4 mm
; Test Line Length Slow = 20 mm
; Test Line Length Fast = 40 mm
; Print Pattern = Standard
; Print Frame = true
; Number Lines = true
; Print Size X = 98 mm
; Print Size Y = 145 mm
; Print Rotation = 0 degree
;
; Settings Advance:
; Nozzle / Line Ratio = 1.2
; Bed leveling = 0
; Use FWRETRACT = false
; Extrusion Multiplier = 1
; Prime Nozzle = true
; Prime Extrusion Multiplier = 2.5
; Prime Speed = 1800
; Dwell Time = 0 s
;
; prepare printing
;
START_PRINT BED_TEMP=60 EXTRUDER_TEMP=190 EXTRUDER0=1 EXTRUDER1=0 INITIAL_EXTRUDER=0

; Disable pressure advance and input shaping
SET_PRESSURE_ADVANCE EXTRUDER=extruder ADVANCE=0
SET_INPUT_SHAPER SHAPER_FREQ_X=0 SHAPER_FREQ_Y=0

G21 ; Millimeter units
G90 ; Absolute XYZ
M83 ; Relative E
G28 ; Home all axes
T0 ; Switch to tool 0
M104 S205 ; Set nozzle temperature (no wait)
M190 S60 ; Set bed temperature (wait)
G1 Z5 F100 ; Z raise
M109 S205 ; Wait for nozzle temp
M204 S500 ; Acceleration
G92 E0 ; Reset extruder distance
M106 P0 S0
G1 X100 Y100 F7200 ; move to start
G1 Z0.25 F600 ; Move to layer height
;
; prime nozzle
;
G1 X51 Y27.5 F7200 ; move to start
G1 X51 Y172.5 E18.0852 F1800 ; print line
G1 X51.72 Y172.5 F7200 ; move to start
G1 X51.72 Y27.5 E18.0852 F1800 ; print line
G1 E-6.5 F1800 ; retract
;
; print anchor frame
;
G1 X61 Y24.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X61 Y150.5 E6.9148 F600 ; print line
G1 X61.48 Y150.5 F7200 ; move to start
G1 X61.48 Y24.5 E6.9148 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X141 Y24.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X141 Y150.5 E6.9148 F600 ; print line
G1 X140.52 Y150.5 F7200 ; move to start
G1 X140.52 Y24.5 E6.9148 F600 ; print line
G1 E-6.5 F1800 ; retract
;
; start the Test pattern
;
G1 X61 Y27.5 F7200 ; move to start
M900 K0 ; set K-factor
M117 K0 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y27.5 E0.9978 F600 ; print line
G1 X121 Y27.5 E1.9956 F3600 ; print line
G1 X141 Y27.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y31.5 F7200 ; move to start
M900 K0.05 ; set K-factor
M117 K0.05 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y31.5 E0.9978 F600 ; print line
G1 X121 Y31.5 E1.9956 F3600 ; print line
G1 X141 Y31.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y35.5 F7200 ; move to start
M900 K0.1 ; set K-factor
M117 K0.1 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y35.5 E0.9978 F600 ; print line
G1 X121 Y35.5 E1.9956 F3600 ; print line
G1 X141 Y35.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y39.5 F7200 ; move to start
M900 K0.15 ; set K-factor
M117 K0.15 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y39.5 E0.9978 F600 ; print line
G1 X121 Y39.5 E1.9956 F3600 ; print line
G1 X141 Y39.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y43.5 F7200 ; move to start
M900 K0.2 ; set K-factor
M117 K0.2 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y43.5 E0.9978 F600 ; print line
G1 X121 Y43.5 E1.9956 F3600 ; print line
G1 X141 Y43.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y47.5 F7200 ; move to start
M900 K0.25 ; set K-factor
M117 K0.25 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y47.5 E0.9978 F600 ; print line
G1 X121 Y47.5 E1.9956 F3600 ; print line
G1 X141 Y47.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y51.5 F7200 ; move to start
M900 K0.3 ; set K-factor
M117 K0.3 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y51.5 E0.9978 F600 ; print line
G1 X121 Y51.5 E1.9956 F3600 ; print line
G1 X141 Y51.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y55.5 F7200 ; move to start
M900 K0.35 ; set K-factor
M117 K0.35 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y55.5 E0.9978 F600 ; print line
G1 X121 Y55.5 E1.9956 F3600 ; print line
G1 X141 Y55.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y59.5 F7200 ; move to start
M900 K0.4 ; set K-factor
M117 K0.4 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y59.5 E0.9978 F600 ; print line
G1 X121 Y59.5 E1.9956 F3600 ; print line
G1 X141 Y59.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y63.5 F7200 ; move to start
M900 K0.45 ; set K-factor
M117 K0.45 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y63.5 E0.9978 F600 ; print line
G1 X121 Y63.5 E1.9956 F3600 ; print line
G1 X141 Y63.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y67.5 F7200 ; move to start
M900 K0.5 ; set K-factor
M117 K0.5 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y67.5 E0.9978 F600 ; print line
G1 X121 Y67.5 E1.9956 F3600 ; print line
G1 X141 Y67.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y71.5 F7200 ; move to start
M900 K0.55 ; set K-factor
M117 K0.55 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y71.5 E0.9978 F600 ; print line
G1 X121 Y71.5 E1.9956 F3600 ; print line
G1 X141 Y71.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y75.5 F7200 ; move to start
M900 K0.6 ; set K-factor
M117 K0.6 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y75.5 E0.9978 F600 ; print line
G1 X121 Y75.5 E1.9956 F3600 ; print line
G1 X141 Y75.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y79.5 F7200 ; move to start
M900 K0.65 ; set K-factor
M117 K0.65 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y79.5 E0.9978 F600 ; print line
G1 X121 Y79.5 E1.9956 F3600 ; print line
G1 X141 Y79.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y83.5 F7200 ; move to start
M900 K0.7 ; set K-factor
M117 K0.7 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y83.5 E0.9978 F600 ; print line
G1 X121 Y83.5 E1.9956 F3600 ; print line
G1 X141 Y83.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y87.5 F7200 ; move to start
M900 K0.75 ; set K-factor
M117 K0.75 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y87.5 E0.9978 F600 ; print line
G1 X121 Y87.5 E1.9956 F3600 ; print line
G1 X141 Y87.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y91.5 F7200 ; move to start
M900 K0.8 ; set K-factor
M117 K0.8 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y91.5 E0.9978 F600 ; print line
G1 X121 Y91.5 E1.9956 F3600 ; print line
G1 X141 Y91.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y95.5 F7200 ; move to start
M900 K0.85 ; set K-factor
M117 K0.85 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y95.5 E0.9978 F600 ; print line
G1 X121 Y95.5 E1.9956 F3600 ; print line
G1 X141 Y95.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y99.5 F7200 ; move to start
M900 K0.9 ; set K-factor
M117 K0.9 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y99.5 E0.9978 F600 ; print line
G1 X121 Y99.5 E1.9956 F3600 ; print line
G1 X141 Y99.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y103.5 F7200 ; move to start
M900 K0.95 ; set K-factor
M117 K0.95 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y103.5 E0.9978 F600 ; print line
G1 X121 Y103.5 E1.9956 F3600 ; print line
G1 X141 Y103.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y107.5 F7200 ; move to start
M900 K1 ; set K-factor
M117 K1 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y107.5 E0.9978 F600 ; print line
G1 X121 Y107.5 E1.9956 F3600 ; print line
G1 X141 Y107.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y111.5 F7200 ; move to start
M900 K1.05 ; set K-factor
M117 K1.05 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y111.5 E0.9978 F600 ; print line
G1 X121 Y111.5 E1.9956 F3600 ; print line
G1 X141 Y111.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y115.5 F7200 ; move to start
M900 K1.1 ; set K-factor
M117 K1.1 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y115.5 E0.9978 F600 ; print line
G1 X121 Y115.5 E1.9956 F3600 ; print line
G1 X141 Y115.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y119.5 F7200 ; move to start
M900 K1.15 ; set K-factor
M117 K1.15 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y119.5 E0.9978 F600 ; print line
G1 X121 Y119.5 E1.9956 F3600 ; print line
G1 X141 Y119.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y123.5 F7200 ; move to start
M900 K1.2 ; set K-factor
M117 K1.2 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y123.5 E0.9978 F600 ; print line
G1 X121 Y123.5 E1.9956 F3600 ; print line
G1 X141 Y123.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y127.5 F7200 ; move to start
M900 K1.25 ; set K-factor
M117 K1.25 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y127.5 E0.9978 F600 ; print line
G1 X121 Y127.5 E1.9956 F3600 ; print line
G1 X141 Y127.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y131.5 F7200 ; move to start
M900 K1.3 ; set K-factor
M117 K1.3 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y131.5 E0.9978 F600 ; print line
G1 X121 Y131.5 E1.9956 F3600 ; print line
G1 X141 Y131.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y135.5 F7200 ; move to start
M900 K1.35 ; set K-factor
M117 K1.35 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y135.5 E0.9978 F600 ; print line
G1 X121 Y135.5 E1.9956 F3600 ; print line
G1 X141 Y135.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y139.5 F7200 ; move to start
M900 K1.4 ; set K-factor
M117 K1.4 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y139.5 E0.9978 F600 ; print line
G1 X121 Y139.5 E1.9956 F3600 ; print line
G1 X141 Y139.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y143.5 F7200 ; move to start
M900 K1.45 ; set K-factor
M117 K1.45 ;
G1 E6.5 F1800 ; un-retract
G1 X81 Y143.5 E0.9978 F600 ; print line
G1 X121 Y143.5 E1.9956 F3600 ; print line
G1 X141 Y143.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X61 Y147.5 F7200 ; move to start
;
; Mark the test area for reference
M117 K0
M900 K0 ; Set K-factor 0
G1 X81 Y152.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X81 Y172.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 X121 Y152.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X121 Y172.5 E0.9978 F600 ; print line
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
;
; print K-values
;
G1 X143 Y25.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X145 Y25.5 E0.0998 F600 ; 0
G1 X145 Y27.5 E0.0998 F600 ; 0
G1 X145 Y29.5 E0.0998 F600 ; 0
G1 X143 Y29.5 E0.0998 F600 ; 0
G1 X143 Y27.5 E0.0998 F600 ; 0
G1 X143 Y25.5 E0.0998 F600 ; 0
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y33.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X145 Y33.5 E0.0998 F600 ; 0
G1 X145 Y35.5 E0.0998 F600 ; 0
G1 X145 Y37.5 E0.0998 F600 ; 0
G1 X143 Y37.5 E0.0998 F600 ; 0
G1 X143 Y35.5 E0.0998 F600 ; 0
G1 X143 Y33.5 E0.0998 F600 ; 0
G1 E-6.5 F1800 ; retract
G1 X146 Y33.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X146 Y33.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X147 Y33.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X147 Y35.5 E0.0998 F600 ; 1
G1 X147 Y37.5 E0.0998 F600 ; 1
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y41.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X145 Y41.5 E0.0998 F600 ; 0
G1 X145 Y43.5 E0.0998 F600 ; 0
G1 X145 Y45.5 E0.0998 F600 ; 0
G1 X143 Y45.5 E0.0998 F600 ; 0
G1 X143 Y43.5 E0.0998 F600 ; 0
G1 X143 Y41.5 E0.0998 F600 ; 0
G1 E-6.5 F1800 ; retract
G1 X146 Y41.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X146 Y41.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X147 Y41.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X147 Y43.5 F7200 ; move to start
G1 X147 Y45.5 F7200 ; move to start
G1 X149 Y45.5 E0.0998 F600 ; 2
G1 X149 Y43.5 E0.0998 F600 ; 2
G1 X147 Y43.5 E0.0998 F600 ; 2
G1 X147 Y41.5 E0.0998 F600 ; 2
G1 X149 Y41.5 E0.0998 F600 ; 2
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y49.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X145 Y49.5 E0.0998 F600 ; 0
G1 X145 Y51.5 E0.0998 F600 ; 0
G1 X145 Y53.5 E0.0998 F600 ; 0
G1 X143 Y53.5 E0.0998 F600 ; 0
G1 X143 Y51.5 E0.0998 F600 ; 0
G1 X143 Y49.5 E0.0998 F600 ; 0
G1 E-6.5 F1800 ; retract
G1 X146 Y49.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X146 Y49.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X147 Y49.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X147 Y51.5 F7200 ; move to start
G1 X147 Y53.5 F7200 ; move to start
G1 X149 Y53.5 E0.0998 F600 ; 3
G1 X149 Y51.5 E0.0998 F600 ; 3
G1 X149 Y49.5 E0.0998 F600 ; 3
G1 X147 Y49.5 E0.0998 F600 ; 3
G1 X147 Y51.5 F7200 ; move to start
G1 X149 Y51.5 E0.0998 F600 ; 3
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y57.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X145 Y57.5 E0.0998 F600 ; 0
G1 X145 Y59.5 E0.0998 F600 ; 0
G1 X145 Y61.5 E0.0998 F600 ; 0
G1 X143 Y61.5 E0.0998 F600 ; 0
G1 X143 Y59.5 E0.0998 F600 ; 0
G1 X143 Y57.5 E0.0998 F600 ; 0
G1 E-6.5 F1800 ; retract
G1 X146 Y57.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X146 Y57.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X147 Y57.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X147 Y59.5 F7200 ; move to start
G1 X147 Y61.5 F7200 ; move to start
G1 X147 Y59.5 E0.0998 F600 ; 4
G1 X149 Y59.5 E0.0998 F600 ; 4
G1 X149 Y61.5 F7200 ; move to start
G1 X149 Y59.5 E0.0998 F600 ; 4
G1 X149 Y57.5 E0.0998 F600 ; 4
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y65.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X145 Y65.5 E0.0998 F600 ; 0
G1 X145 Y67.5 E0.0998 F600 ; 0
G1 X145 Y69.5 E0.0998 F600 ; 0
G1 X143 Y69.5 E0.0998 F600 ; 0
G1 X143 Y67.5 E0.0998 F600 ; 0
G1 X143 Y65.5 E0.0998 F600 ; 0
G1 E-6.5 F1800 ; retract
G1 X146 Y65.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X146 Y65.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X147 Y65.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X149 Y65.5 E0.0998 F600 ; 5
G1 X149 Y67.5 E0.0998 F600 ; 5
G1 X147 Y67.5 E0.0998 F600 ; 5
G1 X147 Y69.5 E0.0998 F600 ; 5
G1 X149 Y69.5 E0.0998 F600 ; 5
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y73.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X145 Y73.5 E0.0998 F600 ; 0
G1 X145 Y75.5 E0.0998 F600 ; 0
G1 X145 Y77.5 E0.0998 F600 ; 0
G1 X143 Y77.5 E0.0998 F600 ; 0
G1 X143 Y75.5 E0.0998 F600 ; 0
G1 X143 Y73.5 E0.0998 F600 ; 0
G1 E-6.5 F1800 ; retract
G1 X146 Y73.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X146 Y73.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X147 Y73.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X147 Y75.5 F7200 ; move to start
G1 X149 Y75.5 E0.0998 F600 ; 6
G1 X149 Y73.5 E0.0998 F600 ; 6
G1 X147 Y73.5 E0.0998 F600 ; 6
G1 X147 Y75.5 E0.0998 F600 ; 6
G1 X147 Y77.5 E0.0998 F600 ; 6
G1 X149 Y77.5 E0.0998 F600 ; 6
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y81.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X145 Y81.5 E0.0998 F600 ; 0
G1 X145 Y83.5 E0.0998 F600 ; 0
G1 X145 Y85.5 E0.0998 F600 ; 0
G1 X143 Y85.5 E0.0998 F600 ; 0
G1 X143 Y83.5 E0.0998 F600 ; 0
G1 X143 Y81.5 E0.0998 F600 ; 0
G1 E-6.5 F1800 ; retract
G1 X146 Y81.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X146 Y81.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X147 Y81.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X147 Y83.5 F7200 ; move to start
G1 X147 Y85.5 F7200 ; move to start
G1 X149 Y85.5 E0.0998 F600 ; 7
G1 X149 Y83.5 E0.0998 F600 ; 7
G1 X149 Y81.5 E0.0998 F600 ; 7
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y89.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X145 Y89.5 E0.0998 F600 ; 0
G1 X145 Y91.5 E0.0998 F600 ; 0
G1 X145 Y93.5 E0.0998 F600 ; 0
G1 X143 Y93.5 E0.0998 F600 ; 0
G1 X143 Y91.5 E0.0998 F600 ; 0
G1 X143 Y89.5 E0.0998 F600 ; 0
G1 E-6.5 F1800 ; retract
G1 X146 Y89.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X146 Y89.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X147 Y89.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X147 Y91.5 F7200 ; move to start
G1 X149 Y91.5 E0.0998 F600 ; 8
G1 X149 Y89.5 E0.0998 F600 ; 8
G1 X147 Y89.5 E0.0998 F600 ; 8
G1 X147 Y91.5 E0.0998 F600 ; 8
G1 X147 Y93.5 E0.0998 F600 ; 8
G1 X149 Y93.5 E0.0998 F600 ; 8
G1 X149 Y91.5 E0.0998 F600 ; 8
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y97.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X145 Y97.5 E0.0998 F600 ; 0
G1 X145 Y99.5 E0.0998 F600 ; 0
G1 X145 Y101.5 E0.0998 F600 ; 0
G1 X143 Y101.5 E0.0998 F600 ; 0
G1 X143 Y99.5 E0.0998 F600 ; 0
G1 X143 Y97.5 E0.0998 F600 ; 0
G1 E-6.5 F1800 ; retract
G1 X146 Y97.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X146 Y97.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X147 Y97.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X149 Y97.5 E0.0998 F600 ; 9
G1 X149 Y99.5 E0.0998 F600 ; 9
G1 X147 Y99.5 E0.0998 F600 ; 9
G1 X147 Y101.5 E0.0998 F600 ; 9
G1 X149 Y101.5 E0.0998 F600 ; 9
G1 X149 Y99.5 E0.0998 F600 ; 9
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y105.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X143 Y107.5 E0.0998 F600 ; 1
G1 X143 Y109.5 E0.0998 F600 ; 1
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y113.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X143 Y115.5 E0.0998 F600 ; 1
G1 X143 Y117.5 E0.0998 F600 ; 1
G1 E-6.5 F1800 ; retract
G1 X144 Y113.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X144 Y113.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X145 Y113.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X145 Y115.5 E0.0998 F600 ; 1
G1 X145 Y117.5 E0.0998 F600 ; 1
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y121.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X143 Y123.5 E0.0998 F600 ; 1
G1 X143 Y125.5 E0.0998 F600 ; 1
G1 E-6.5 F1800 ; retract
G1 X144 Y121.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X144 Y121.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X145 Y121.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X145 Y123.5 F7200 ; move to start
G1 X145 Y125.5 F7200 ; move to start
G1 X147 Y125.5 E0.0998 F600 ; 2
G1 X147 Y123.5 E0.0998 F600 ; 2
G1 X145 Y123.5 E0.0998 F600 ; 2
G1 X145 Y121.5 E0.0998 F600 ; 2
G1 X147 Y121.5 E0.0998 F600 ; 2
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y129.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X143 Y131.5 E0.0998 F600 ; 1
G1 X143 Y133.5 E0.0998 F600 ; 1
G1 E-6.5 F1800 ; retract
G1 X144 Y129.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X144 Y129.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X145 Y129.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X145 Y131.5 F7200 ; move to start
G1 X145 Y133.5 F7200 ; move to start
G1 X147 Y133.5 E0.0998 F600 ; 3
G1 X147 Y131.5 E0.0998 F600 ; 3
G1 X147 Y129.5 E0.0998 F600 ; 3
G1 X145 Y129.5 E0.0998 F600 ; 3
G1 X145 Y131.5 F7200 ; move to start
G1 X147 Y131.5 E0.0998 F600 ; 3
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
G1 X143 Y137.5 F7200 ; move to start
G1 Z0.25 F600 ; zHop
G1 E6.5 F1800 ; un-retract
G1 X143 Y139.5 E0.0998 F600 ; 1
G1 X143 Y141.5 E0.0998 F600 ; 1
G1 E-6.5 F1800 ; retract
G1 X144 Y137.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X144 Y137.9 E0.02 F600 ; dot
G1 E-6.5 F1800 ; retract
G1 X145 Y137.5 F7200 ; move to start
G1 E6.5 F1800 ; un-retract
G1 X145 Y139.5 F7200 ; move to start
G1 X145 Y141.5 F7200 ; move to start
G1 X145 Y139.5 E0.0998 F600 ; 4
G1 X147 Y139.5 E0.0998 F600 ; 4
G1 X147 Y141.5 F7200 ; move to start
G1 X147 Y139.5 E0.0998 F600 ; 4
G1 X147 Y137.5 E0.0998 F600 ; 4
G1 E-6.5 F1800 ; retract
G1 Z0.35 F600 ; zHop
;
; FINISH
;
M107 ; Turn off fan
M400 ; Finish moving
M104 S0 ; Turn off hotend
M140 S0 ; Turn off bed
G1 Z30 X200 Y200 F7200 ; Move away from the print
M84 ; Disable motors
;M501 ; Load settings from EEPROM
;

; Restart - this ensures our disabling of pressure advance / input shaping don't persist:
RESPOND MSG="Restarting to reset after disabling pressure advance / input shaping"
RESTART