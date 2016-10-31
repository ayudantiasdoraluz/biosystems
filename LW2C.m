% Ya quedó el código para 2 capas, favor de revisar detenidamente línea por
% línea.

[F,c,HOV,t1,t2] = deal(['SCG';'LMh';'BRh'],1,1,5,1);
NumNe = Neuronas2C();
for HOV = 1:2
    if HOV == 1
        val = 'T';
    else
        val = 'F';
    end
    for c = 1:3
        switch c
            case 1
                [v,SEP,testMSE,trainingMSE,R,rMSE,E,IRGT, efec, nena] = deal(1,zeros(1,780),zeros(1,780),zeros(1,780),zeros(1,780),zeros(1,780),zeros(1,780),zeros(780,9),zeros(780,2),cell(1,780));
                for l = 10:2:20
                    for j = 2:2:14
                        if j <= l
                            for i = 1:20
                                % Carga el workspace de la RNA.
                                if j <=8
                                    if i <= 9
                                        load(['N2_' F(c,1:3) num2str(NumNe(k,1)) '  0' num2str(NumNe(k,2)) '_' val '0' num2str(i)]);
                                    else
                                        load(['N2_' F(c,1:3) num2str(NumNe(k,1)) '  0' num2str(NumNe(k,2)) '_' val num2str(i)]);
                                    end
                                else
                                    if i <= 9
                                        load(['N2_' F(c,1:3) num2str(NumNe(k,1:2)) '_' val '0' num2str(i)]);
                                    else
                                        load(['N2_' F(c,1:3) num2str(NumNe(k,1:2)) '_' val num2str(i)]);
                                    end
                                end
                            
                                % Calcula los parámetros de validación.
                                testMSE(v,1) = testPerformance;
                                trainingMSE(v,1) = performance;
                                R(v,1) = r;
                                rMSE(v,1) = sqrt(testPerformance);
                                SEP(v,1) = (100 / mean(norm_data)) * rMSE(v,1);
                            
                                % Calcula las contribuciones relativas de las variables de entrada.
                                [IRG] = Garson2function(l,net);
                                for q = 1:9
                                    IRGT(v,q) = IRG(q);
                                end
                            
                                % Realiza las predicciones con el modelo.
                                pred(1,:)= sim(net,z);
                                for u = 1:length(norm_data)
                                    E(u) = abs((pred(u)-norm_data(u))/norm_data(u))*100;
                                end
                                temp1 = find(E>=t1);
                                temp2 = find(E>=t2);
                                efec(v,1) = (1 - (length(temp1)/length(E)))*100;
                                efec(v,2) = (1 - (length(temp2)/length(E)))*100;
                            
                                % Agrega ceros al nombre del archivo.
                                if j <=8
                                    if i <= 9
                                        nena{v} = ['N2_' F(c,1:3) num2str(NumNe(k,1)) '  0' num2str(NumNe(k,2)) '_' val '0' num2str(i)];
                                    else
                                        nena{v} = ['N2_' F(c,1:3) num2str(NumNe(k,1)) '  0' num2str(NumNe(k,2)) '_' val num2str(i)];
                                    end
                                else
                                    if i <= 9
                                        nena{v} = ['N2_' F(c,1:3) num2str(NumNe(k,1:2)) '_' val '0' num2str(i)];
                                    else
                                        nena{v} = ['N2_' F(c,1:3) num2str(NumNe(k,1:2)) '_' val num2str(i)];
                                    end
                                end
                                v = v+1;
                            end
                        else
                        end
                    end
                end
                
                % Crea el Excel con todos los parámetros.
                EW2C(nena,testMSE,trainingMSE,rMSE,R,IRGT,F(c,1:3),val,efec,SEP);
                clc;
            case 2
                [v,SEP,testMSE,trainingMSE,R,rMSE,E,IRGT, efec, nena] = deal(1,zeros(1,780),zeros(1,780),zeros(1,780),zeros(1,780),zeros(1,780),zeros(1,780),zeros(780,9),zeros(780,2),cell(1,780));
                for l = 10:2:20
                    for j = 2:2:14
                        if j <= l
                        for i = 1:20
                            % Carga el workspace de la RNA.
                                if j <=8
                                    if i <= 9
                                        load(['N2_' F(c,1:2) num2str(NumNe(k,1)) '0' num2str(NumNe(k,2)) '_' val '0' num2str(i)]);
                                    else
                                        load(['N2_' F(c,1:2) num2str(NumNe(k,1)) '0' num2str(NumNe(k,2)) '_' val num2str(i)]);
                                    end
                                else
                                    if i <= 9
                                        load(['N2_' F(c,1:2) num2str(NumNe(k,1:2)) '_' val '0' num2str(i)]);
                                    else
                                        load(['N2_' F(c,1:2) num2str(NumNe(k,1:2)) '_' val num2str(i)]);
                                    end
                                end
                            
                            % Calcula los parámetros de validación.
                            testMSE(v,1) = testPerformance;
                            trainingMSE(v,1) = performance;
                            R(v,1) = r;
                            rMSE(v,1) = sqrt(testPerformance);
                            SEP(v,1) = (100 / mean(norm_data)) * rMSE(v,1);
                            
                            % Calcula las contribuciones relativas de las variables de entrada.
                            [IRG] = Garson2function(l,net);
                            for q = 1:9
                                IRGT(v,q) = IRG(q);
                            end
                            
                            % Realiza las predicciones con el modelo.
                            pred(1,:)= sim(net,z);
                            for u = 1:length(norm_data)
                                E(u) = abs((pred(u)-norm_data(u))/norm_data(u))*100;
                            end
                            temp1 = find(E>=t1);
                            temp2 = find(E>=t2);
                            efec(v,1) = (1 - (length(temp1)/length(E)))*100;
                            efec(v,2) = (1 - (length(temp2)/length(E)))*100;
                            
                            % Agrega ceros al nombre del archivo.
                            if j <=8
                                if i <= 9
                                    nena{v} = ['N2_' F(c,1:2) num2str(NumNe(k,1)) '  0' num2str(NumNe(k,2)) '_' val '0' num2str(i)];
                                else
                                    nena{v} = ['N2_' F(c,1:2) num2str(NumNe(k,1)) '  0' num2str(NumNe(k,2)) '_' val num2str(i)];
                                end
                            else
                                if i <= 9
                                    nena{v} = ['N2_' F(c,1:2) num2str(NumNe(k,1:2)) '_' val '0' num2str(i)];
                                else
                                    nena{v} = ['N2_' F(c,1:2) num2str(NumNe(k,1:2)) '_' val num2str(i)];
                                end
                            end
                            v = v+1;
                        end
                        else
                        end
                    end
                end
                
                % Crea el Excel con todos los parámetros.
                EW2C(nena,testMSE,trainingMSE,rMSE,R,IRGT,F(c,1:2),val,efec,SEP);
                clc;
            case 3
                [v,SEP,testMSE,trainingMSE,R,rMSE,E,IRGT, efec, nena] = deal(1,zeros(1,780),zeros(1,780),zeros(1,780),zeros(1,780),zeros(1,780),zeros(1,780),zeros(780,9),zeros(780,2),cell(1,780));
                for l = 10:2:20
                    for j = 2:2:14
                        if j <= l
                        for i = 1:20
                            % Carga el workspace de la RNA.
                            if j <=8
                                if i <= 9
                                    load(['N2_' F(c,1:2) num2str(NumNe(k,1)) '0' num2str(NumNe(k,2)) '_' val '0' num2str(i)]);
                                else
                                    load(['N2_' F(c,1:2) num2str(NumNe(k,1)) '0' num2str(NumNe(k,2)) '_' val num2str(i)]);
                                end
                            else
                                if i <= 9
                                    load(['N2_' F(c,1:2) num2str(NumNe(k,1:2)) '_' val '0' num2str(i)]);
                                else
                                    load(['N2_' F(c,1:2) num2str(NumNe(k,1:2)) '_' val num2str(i)]);
                                end
                            end
                            
                            % Calcula los parámetros de validación.
                            testMSE(v,1) = testPerformance;
                            trainingMSE(v,1) = performance;
                            R(v,1) = r;
                            rMSE(v,1) = sqrt(testPerformance);
                            SEP(v,1) = (100 / mean(norm_data)) * rMSE(v,1);
                            
                            % Calcula las contribuciones relativas de las variables de entrada.
                            [IRG] = Garson2function(l,net);
                            for q = 1:9
                                IRGT(v,q) = IRG(q);
                            end
                            
                            % Realiza las predicciones con el modelo.
                            pred(1,:)= sim(net,z);
                            for u = 1:length(norm_data)
                                E(u) = abs((pred(u)-norm_data(u))/norm_data(u))*100;
                            end
                            temp1 = find(E>=t1);
                            temp2 = find(E>=t2);
                            efec(v,1) = (1 - (length(temp1)/length(E)))*100;
                            efec(v,2) = (1 - (length(temp2)/length(E)))*100;
                            
                            % Agrega ceros al nombre del archivo.
                            if j <=8
                                if i <= 9
                                    nena{v} = ['N2_' F(c,1:2) num2str(NumNe(k,1)) '  0' num2str(NumNe(k,2)) '_' val '0' num2str(i)];
                                else
                                    nena{v} = ['N2_' F(c,1:2) num2str(NumNe(k,1)) '  0' num2str(NumNe(k,2)) '_' val num2str(i)];
                                end
                            else
                                if i <= 9
                                    nena{v} = ['N2_' F(c,1:2) num2str(NumNe(k,1:2)) '_' val '0' num2str(i)];
                                else
                                    nena{v} = ['N2_' F(c,1:2) num2str(NumNe(k,1:2)) '_' val num2str(i)];
                                end
                            end
                            v = v+1;
                        end
                        else
                        end
                    end
                end
                
                % Crea el Excel con todos los parámetros.
                EW2C(nena,testMSE,trainingMSE,rMSE,R,IRGT,F(c,1:2),val,efec,SEP);
                clc;
            otherwise
                disp('other value')
        end
    end
end
