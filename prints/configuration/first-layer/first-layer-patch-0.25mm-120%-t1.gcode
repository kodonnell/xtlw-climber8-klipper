;FLAVOR:Marlin
M73 P0
M73 R2
;TIME:97
;Filament used: 0.0841938m, 0m
;Layer height: 0.2
;MINX:85.8
;MINY:93.3
;MINZ:0.25
;MAXX:119.2
;MAXY:126.7
;MAXZ:2.25
;POSTPROCESSED
; KO: customer Search and Replace post-processing plugin in Cura removed Cura's auto-setting of extruder
M82 ;absolute extrusion mode
; START GCODE
START_PRINT BED_TEMP=60.0 EXTRUDER_TEMP=210.0 EXTRUDER=1
G92 E0
T1
G92 E0
G1 F2400 E-3
;LAYER_COUNT:1
;LAYER:0
M107
M204 S750
M205 X10 Y10
M73 P1
G1 F300 Z2.25
G0 F2400 X87.211 Y94.377 Z2.25
M204 S500
M205 X5 Y5
M73 P2
;TYPE:SKIRT
G1 F300 Z0.25
G1 F2400 E0
G1 F1200 X87.669 Y94.021 E0.02894
M73 P3
G1 X88.171 Y93.733 E0.05781
G1 X88.708 Y93.516 E0.08671
G1 X89.27 Y93.375 E0.11562
M73 P4
G1 X89.891 Y93.311 E0.14676
G1 X90.33 Y93.3 E0.16867
G1 X114.353 Y93.3 E1.36718
G1 X115.051 Y93.31 E1.40201
M73 P5
G1 X115.628 Y93.359 E1.4309
G1 X116.194 Y93.486 E1.45984
G1 X116.736 Y93.69 E1.48873
G1 X117.245 Y93.966 E1.51762
M73 P6
G1 X117.711 Y94.31 E1.54652
G1 X118.126 Y94.715 E1.57545
G1 X118.481 Y95.173 E1.60436
G1 X118.769 Y95.675 E1.63323
M73 P7
G1 X118.986 Y96.212 E1.66213
G1 X119.126 Y96.774 E1.69102
G1 X119.189 Y97.392 E1.72201
M73 P8
G1 X119.2 Y97.83 E1.74387
G1 X119.2 Y121.816 E2.94054
G1 X119.191 Y122.543 E2.97681
G1 X119.144 Y123.12 E3.0057
M73 P9
G1 X119.017 Y123.686 E3.03464
G1 X118.815 Y124.228 E3.06349
G1 X118.539 Y124.738 E3.09242
G1 X118.196 Y125.205 E3.12133
M73 P10
G1 X117.792 Y125.62 E3.15023
G1 X117.335 Y125.976 E3.17913
G1 X116.833 Y126.265 E3.20803
M73 P11
G1 X116.296 Y126.483 E3.23694
G1 X115.735 Y126.625 E3.26581
G1 X115.109 Y126.689 E3.29721
G1 X114.67 Y126.7 E3.31911
M73 P12
G1 X90.653 Y126.7 E4.51733
G1 X89.955 Y126.691 E4.55215
G1 X89.377 Y126.643 E4.58109
G1 X88.812 Y126.517 E4.60997
M73 P13
G1 X88.27 Y126.314 E4.63884
G1 X87.76 Y126.038 E4.66778
G1 X87.293 Y125.695 E4.69668
G1 X86.878 Y125.291 E4.72558
M73 P14
G1 X86.523 Y124.833 E4.75449
G1 X86.234 Y124.331 E4.78339
G1 X86.016 Y123.794 E4.8123
M73 P15
G1 X85.875 Y123.233 E4.84116
G1 X85.811 Y122.604 E4.8727
M73 R1
G1 X85.8 Y122.158 E4.89496
M73 P16
G1 X85.8 Y98.117 E6.09437
G1 X85.809 Y97.452 E6.12755
G1 X85.857 Y96.875 E6.15644
G1 X85.984 Y96.31 E6.18533
M73 P17
G1 X86.187 Y95.767 E6.21425
G1 X86.463 Y95.258 E6.24314
G1 X86.807 Y94.791 E6.27208
M73 P18
G1 X87.211 Y94.377 E6.30093
M204 S750
M205 X10 Y10
G0 F2400 X87.678 Y94.61
M73 P19
M204 S500
M205 X5 Y5
G1 F1200 X88.127 Y94.3 E6.32816
G1 X88.616 Y94.06 E6.35533
M73 P20
G1 X89.135 Y93.893 E6.38253
G1 X89.905 Y93.79 E6.42129
G1 X90.33 Y93.78 E6.4425
G1 X114.346 Y93.78 E7.64066
M73 P21
G1 X115.044 Y93.79 E7.67549
G1 X115.587 Y93.838 E7.70269
G1 X116.118 Y93.965 E7.72992
M73 P22
G1 X116.624 Y94.167 E7.75711
G1 X117.095 Y94.442 E7.78432
G1 X117.52 Y94.782 E7.81147
G1 X117.892 Y95.181 E7.83869
M73 P23
G1 X118.201 Y95.63 E7.86588
G1 X118.441 Y96.12 E7.8931
G1 X118.608 Y96.639 E7.9203
G1 X118.71 Y97.405 E7.95885
M73 P24
G1 X118.72 Y97.83 E7.98006
G1 X118.72 Y121.81 E9.17643
G1 X118.711 Y122.537 E9.2127
G1 X118.664 Y123.08 E9.23989
M73 P25
G1 X118.538 Y123.611 E9.26712
G1 X118.337 Y124.117 E9.29428
G1 X118.063 Y124.589 E9.32151
M73 P26
G1 X117.724 Y125.015 E9.34867
G1 X117.325 Y125.387 E9.37589
G1 X116.877 Y125.698 E9.4031
G1 X116.388 Y125.939 E9.4303
M73 P27
G1 X115.869 Y126.106 E9.4575
G1 X115.095 Y126.21 E9.49646
G1 X114.67 Y126.22 E9.51767
G1 X90.659 Y126.22 E10.71558
M73 P28
G1 X89.961 Y126.211 E10.75041
G1 X89.418 Y126.164 E10.7776
G1 X88.887 Y126.038 E10.80483
M73 P29
G1 X88.381 Y125.836 E10.83201
G1 X87.91 Y125.562 E10.85919
G1 X87.483 Y125.222 E10.88643
G1 X87.111 Y124.824 E10.91361
M73 P30
G1 X86.802 Y124.375 E10.9408
G1 X86.561 Y123.886 E10.968
G1 X86.394 Y123.367 E10.9952
G1 X86.29 Y122.592 E11.03421
M73 P31
G1 X86.28 Y122.158 E11.05587
M73 R1
G1 X86.28 Y98.124 E12.25493
G1 X86.289 Y97.459 E12.28811
M73 P32
G1 X86.337 Y96.916 E12.3153
G1 X86.463 Y96.385 E12.34253
G1 X86.665 Y95.879 E12.36971
M73 P33
G1 X86.939 Y95.408 E12.3969
G1 X87.279 Y94.982 E12.42409
G1 X87.678 Y94.61 E12.45131
M204 S750
M73 P34
M205 X10 Y10
G0 F2400 X87.75 Y95.186
M204 S500
M205 X5 Y5
M73 P35
G1 F1200 X88.142 Y94.861 E12.47671
G1 X88.579 Y94.602 E12.50205
G1 X89.052 Y94.414 E12.52745
M73 P36
G1 X89.548 Y94.302 E12.55282
G1 X90.239 Y94.261 E12.58735
G1 X114.339 Y94.26 E13.7897
G1 X115.037 Y94.27 E13.82453
M73 P37
G1 X115.544 Y94.318 E13.84994
G1 X116.037 Y94.443 E13.87531
G1 X116.504 Y94.645 E13.9007
G1 X116.934 Y94.917 E13.92608
M73 P38
G1 X117.316 Y95.253 E13.95146
G1 X117.64 Y95.645 E13.97684
G1 X117.9 Y96.083 E14.00225
G1 X118.087 Y96.555 E14.02758
M73 P39
G1 X118.198 Y97.052 E14.05298
G1 X118.239 Y97.739 E14.08732
G1 X118.24 Y121.804 E15.28793
M73 P40
G1 X118.231 Y122.531 E15.3242
G1 X118.185 Y123.038 E15.3496
G1 X118.06 Y123.531 E15.37497
G1 X117.859 Y123.998 E15.40034
M73 P41
G1 X117.588 Y124.429 E15.42574
G1 X117.252 Y124.811 E15.45112
G1 X116.861 Y125.137 E15.47652
G1 X116.424 Y125.397 E15.50189
M73 P42
G1 X115.952 Y125.585 E15.52723
G1 X115.455 Y125.698 E15.55266
G1 X114.761 Y125.739 E15.58735
M73 P43
G1 X90.665 Y125.74 E16.7895
G1 X89.967 Y125.731 E16.82433
G1 X89.461 Y125.684 E16.84968
G1 X88.968 Y125.559 E16.87505
M73 P44
G1 X88.5 Y125.358 E16.90046
G1 X88.07 Y125.087 E16.92582
G1 X87.688 Y124.751 E16.9512
G1 X87.362 Y124.36 E16.9766
M73 P45
G1 X87.102 Y123.923 E17.00197
G1 X86.914 Y123.45 E17.02736
G1 X86.802 Y122.954 E17.05273
G1 X86.761 Y122.246 E17.08811
M73 P46
G1 X86.76 Y98.13 E18.29127
G1 X86.769 Y97.465 E18.32445
G1 X86.816 Y96.959 E18.3498
M73 P47
M73 R1
G1 X86.942 Y96.466 E18.37519
G1 X87.143 Y95.998 E18.4006
G1 X87.415 Y95.568 E18.42598
M73 P48
G1 X87.75 Y95.186 E18.45133
M204 S750
M205 X10 Y10
G1 F2400 E15.45133
M73 P49
;MESH:First_Layer_Patch-0.25mm.stl
G0 X90.454 Y97.954
G0 X113.618 Y98.882
G0 X113.8 Y121.3
M73 P50
M204 S500
M205 X5 Y5
;TYPE:WALL-INNER
M73 P51
G1 F2400 E18.45133
G1 F1200 X91.2 Y121.3 E19.57885
G1 X91.2 Y98.7 E20.70637
G1 X113.8 Y98.7 E21.83388
M73 P52
G1 X113.8 Y121.3 E22.9614
M204 S750
M205 X10 Y10
G0 F2400 X114.28 Y121.78
M73 P53
M204 S500
M205 X5 Y5
G1 F1200 X90.72 Y121.78 E24.13682
M73 P54
G1 X90.72 Y98.22 E25.31223
G1 X114.28 Y98.22 E26.48764
G1 X114.28 Y121.78 E27.66306
M204 S750
M73 P55
M205 X10 Y10
G0 F2400 X114.76 Y122.26
M204 S500
M205 X5 Y5
M73 P56
;TYPE:WALL-OUTER
G1 F1200 X90.24 Y122.26 E28.88636
G1 X90.24 Y97.74 E30.10967
G1 X114.76 Y97.74 E31.33298
M73 P57
G1 X114.76 Y122.26 E32.55629
M204 S750
M205 X10 Y10
M73 P58
G0 F2400 X114.56 Y122.26
G0 X114.232 Y121.732
G0 X113.69 Y120.83
G0 X113.33 Y120.83
M73 P59
M204 S500
M205 X5 Y5
;TYPE:SKIN
G1 F1200 X91.67 Y120.83 E33.63691
M73 P60
G1 X91.67 Y99.17 E34.71753
G1 X113.33 Y99.17 E35.79815
G1 X113.33 Y120.83 E36.87877
M73 P61
M204 S750
M205 X10 Y10
G0 F2400 X113.69 Y120.83
G0 X113.618 Y98.882
M73 P62
G0 X112.468 Y98.81
G0 X112.468 Y99.57
M204 S500
M73 R1
M73 P63
M205 X5 Y5
G1 F1200 X111.789 Y99.57 E36.91265
G1 X112.929 Y100.711 E36.99312
G1 X112.929 Y101.389 E37.02694
M73 P64
G1 X111.11 Y99.57 E37.15528
G1 X110.431 Y99.57 E37.18916
G1 X112.929 Y102.068 E37.36541
M73 P65
G1 X112.929 Y102.747 E37.39928
G1 X109.752 Y99.57 E37.62344
G1 X109.074 Y99.57 E37.65726
G1 X112.929 Y103.426 E37.92929
M73 P66
G1 X112.929 Y104.105 E37.96316
G1 X108.395 Y99.57 E38.2831
G1 X107.716 Y99.57 E38.31697
G1 X112.929 Y104.784 E38.68481
M73 P67
G1 X112.929 Y105.462 E38.71864
G1 X107.037 Y99.57 E39.13435
G1 X106.358 Y99.57 E39.16823
M73 P68
G1 X112.929 Y106.141 E39.63185
G1 X112.929 Y106.82 E39.66572
G1 X105.679 Y99.57 E40.17725
G1 X105.001 Y99.57 E40.21107
M73 P69
G1 X112.929 Y107.499 E40.77047
G1 X112.929 Y108.178 E40.80435
G1 X104.322 Y99.57 E41.41165
G1 X103.643 Y99.57 E41.44553
M73 P70
G1 X112.929 Y108.856 E42.10071
G1 X112.929 Y109.535 E42.13458
G1 X102.964 Y99.57 E42.83767
G1 X102.285 Y99.569 E42.87154
M73 P71
G1 X112.929 Y110.214 E43.62257
G1 X112.929 Y110.893 E43.65644
G1 X101.606 Y99.569 E44.45538
M73 P72
G1 X100.927 Y99.569 E44.48925
G1 X112.929 Y111.572 E45.3361
G1 X112.929 Y112.251 E45.36997
G1 X100.248 Y99.569 E46.26472
M73 P73
G1 X99.569 Y99.569 E46.29859
G1 X112.929 Y112.929 E47.24121
G1 X112.929 Y113.608 E47.27509
G1 X98.891 Y99.569 E48.26558
M73 P74
G1 X98.212 Y99.569 E48.29946
G1 X112.929 Y114.287 E49.33786
G1 X112.929 Y114.966 E49.37173
G1 X97.533 Y99.569 E50.45804
M73 P75
G1 X96.854 Y99.569 E50.49191
G1 X112.929 Y115.645 E51.62613
G1 X112.929 Y116.324 E51.66
M73 P76
G1 X96.175 Y99.569 E52.84212
G1 X95.496 Y99.569 E52.876
G1 X112.929 Y117.002 E54.10599
G1 X112.929 Y117.681 E54.13987
M73 P77
G1 X94.818 Y99.569 E55.41773
G1 X94.139 Y99.569 E55.45161
G1 X112.929 Y118.36 E56.77738
G1 X112.929 Y119.039 E56.81125
M73 P78
G1 X93.46 Y99.569 E58.18493
M73 R0
G1 X92.781 Y99.569 E58.21881
M73 P79
G1 X112.929 Y119.718 E59.64039
G1 X112.929 Y120.396 E59.67422
G1 X92.102 Y99.569 E61.14368
G1 X92.069 Y99.569 E61.14532
M73 P80
G1 X92.069 Y100.215 E61.17755
G1 X112.283 Y120.429 E62.60376
G1 X111.604 Y120.429 E62.63763
G1 X92.069 Y100.894 E64.01593
M73 P81
G1 X92.069 Y101.573 E64.04981
G1 X110.925 Y120.429 E65.3802
G1 X110.247 Y120.429 E65.41403
G1 X92.069 Y102.251 E66.69658
M73 P82
G1 X92.069 Y102.93 E66.73046
G1 X109.568 Y120.429 E67.96511
G1 X108.889 Y120.429 E67.99898
M73 P83
G1 X92.069 Y103.609 E69.18572
G1 X92.069 Y104.288 E69.2196
G1 X108.21 Y120.429 E70.35843
G1 X107.531 Y120.429 E70.39231
M73 P84
G1 X92.069 Y104.967 E71.48324
G1 X92.069 Y105.645 E71.51706
G1 X106.853 Y120.429 E72.56015
G1 X106.174 Y120.429 E72.59403
M73 P85
G1 X92.069 Y106.324 E73.58921
G1 X92.069 Y107.003 E73.62309
G1 X105.495 Y120.429 E74.57037
M73 P86
G1 X104.816 Y120.429 E74.60424
G1 X92.069 Y107.682 E75.50361
G1 X92.069 Y108.361 E75.53749
G1 X104.137 Y120.429 E76.38895
M73 P87
G1 X103.458 Y120.429 E76.42282
G1 X92.069 Y109.04 E77.22638
G1 X92.069 Y109.718 E77.26021
G1 X102.78 Y120.429 E78.01592
M73 P88
G1 X102.101 Y120.429 E78.0498
G1 X92.069 Y110.397 E78.75761
G1 X92.069 Y111.076 E78.79149
G1 X101.422 Y120.429 E79.45139
M73 P89
G1 X100.743 Y120.429 E79.48527
G1 X92.069 Y111.755 E80.09726
G1 X92.069 Y112.434 E80.13114
M73 P90
G1 X100.064 Y120.429 E80.69523
G1 X99.385 Y120.429 E80.72911
G1 X92.069 Y113.113 E81.24529
G1 X92.069 Y113.791 E81.27911
M73 P91
G1 X98.707 Y120.429 E81.74746
G1 X98.028 Y120.429 E81.78134
G1 X92.069 Y114.47 E82.20178
G1 X92.069 Y115.149 E82.23565
M73 P92
G1 X97.349 Y120.429 E82.60818
G1 X96.67 Y120.429 E82.64206
G1 X92.069 Y115.828 E82.96669
M73 P93
G1 X92.069 Y116.507 E83.00056
G1 X95.991 Y120.429 E83.27728
G1 X95.313 Y120.429 E83.3111
G1 X92.069 Y117.185 E83.53999
M73 P94
G1 X92.069 Y117.864 E83.57386
M73 R0
G1 X94.634 Y120.429 E83.75484
G1 X93.955 Y120.429 E83.78871
M73 P95
G1 X92.069 Y118.543 E83.92178
G1 X92.069 Y119.222 E83.95565
G1 X93.276 Y120.429 E84.04082
G1 X92.597 Y120.429 E84.07469
M73 P96
G1 X92.069 Y119.901 E84.11194
M204 S750
M205 X10 Y10
M73 P97
G0 F2400 X92.07 Y120.429
M204 S500
M205 X5 Y5
G1 F1200 X92.597 Y120.429 E84.13824
M73 P98
M204 S750
M205 X10 Y10
G0 F2400 X92.597 Y121.19
G0 X113.618 Y121.118
M73 P99
G0 X113.69 Y100.032
G0 X112.929 Y100.032
M204 S500
M205 X5 Y5
M73 P100
G1 F1200 X112.468 Y99.57 E84.1708
G1 X112.929 Y99.57 E84.1938
M204 S750
M205 X10 Y10
G0 F2400 X112.929 Y98.43
;TIME_ELAPSED:97.698455
M73 R0
G1 F2400 E81.1938
M204 S1000
M205 X15 Y15
END_PRINT
M82 ;absolute extrusion mode
;End of Gcode
;SETTING_3 {"global_quality": "[general]\\nversion = 4\\nname = Fast #2\\ndefini
;SETTING_3 tion = XTLW3D_Climber_8\\n\\n[metadata]\\ntype = quality_changes\\nqu
;SETTING_3 ality_type = draft\\nsetting_version = 19\\n\\n[values]\\nadhesion_ty
;SETTING_3 pe = skirt\\nlayer_height_0 = 0.25\\n\\n", "extruder_quality": ["[gen
;SETTING_3 eral]\\nversion = 4\\nname = Fast #2\\ndefinition = XTLW3D_Climber_8\
;SETTING_3 \n\\n[metadata]\\ntype = quality_changes\\nquality_type = draft\\nset
;SETTING_3 ting_version = 19\\nposition = 0\\n\\n[values]\\ninitial_layer_line_w
;SETTING_3 idth_factor = 120.0\\n\\n", "[general]\\nversion = 4\\nname = Fast #2
;SETTING_3 \\ndefinition = XTLW3Dprinter\\n\\n[metadata]\\ntype = quality_change
;SETTING_3 s\\nquality_type = draft\\nsetting_version = 19\\nposition = 1\\n\\n[
;SETTING_3 values]\\n\\n"]}
