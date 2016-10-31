function [] = EW1C(nena,testMSE,trainingMSE,rMSE,R,IRGT,F,val,efec,SEP)
xlswrite(['Config1C_' F '_' val '.xlsx'], {'NAME'}, 'Hoja1', 'A1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'TestMSE'}, 'Hoja1', 'B1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'TrainingMSE'}, 'Hoja1', 'C1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'%SEP'}, 'Hoja1', 'D1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'rMSE'}, 'Hoja1', 'E1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'r2'}, 'Hoja1', 'F1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'Max Force'}, 'Hoja1', 'G1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'Min Force'}, 'Hoja1', 'H1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'Fill Time'}, 'Hoja1', 'I1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'BPM'}, 'Hoja1', 'J1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'Digoxin Volume'}, 'Hoja1', 'K1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'Weight'}, 'Hoja1', 'L1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'Volume'}, 'Hoja1', 'M1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'Length'}, 'Hoja1', 'N1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'Width'}, 'Hoja1', 'O1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'Accuracy 5%'}, 'Hoja1', 'P1');
xlswrite(['Config1C_' F '_' val '.xlsx'], {'Accuracy 1%'}, 'Hoja1', 'Q1');
xlswrite(['Config1C_' F '_' val '.xlsx'], nena', 'Hoja1', 'A2');
xlswrite(['Config1C_' F '_' val '.xlsx'], testMSE(:,1), 'Hoja1', 'B2');
xlswrite(['Config1C_' F '_' val '.xlsx'], trainingMSE(:,1), 'Hoja1', 'C2');
xlswrite(['Config1C_' F '_' val '.xlsx'], SEP(:,1), 'Hoja1', 'D2');
xlswrite(['Config1C_' F '_' val '.xlsx'], rMSE(:,1), 'Hoja1', 'E2');
xlswrite(['Config1C_' F '_' val '.xlsx'], R(:,1), 'Hoja1', 'F2');
xlswrite(['Config1C_' F '_' val '.xlsx'], IRGT(:,:), 'Hoja1', 'G2');
xlswrite(['Config1C_' F '_' val '.xlsx'], efec(:,:), 'Hoja1', 'P2');
end
