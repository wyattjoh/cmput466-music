composers = {'Bach','Beethoven', ...
        'Brahms', 'Chopin', 'Dvorak', 'Handel', ...
        'Mendelssohn', 'Mozart', 'Schubert', 'Vivaldi'};

for i = 1:size(composers,2)
    folderName = strcat('/local/scratch/C466_Music_Project_Fall_2013/', ...
       composers{1,i},'/');
   
   %disp(folderName);
   folderContent = dir(fullfile(folderName, '/*.wav'));
   
   for j = 1:max(size(folderContent))
       
       % has form: ../Bach/Bach (24).wav
       fileName = strcat(folderName,composers{1,i},' (', int2str(j), ')');
       disp(fileName);
      
       [d,sr] = audioread(strcat(fileName,'.wav'));
      
      % call feature extraction
      %[feature] = melcepst(Y,FS);
      %disp(size(feature));
      
      [mm,aspc] = melfcc(d*3.3752, sr, 'maxfreq', 8000, 'numcep', 20, 'nbands', 22, 'fbtype', 'fcmel', 'dcttype', 1, 'usecmp', 1, 'wintime', 0.032, 'hoptime', 0.016, 'preemph', 0, 'dither', 1);
      %[im,ispc] = invmelfcc(mm, sr, 'maxfreq', 8000, 'numcep', 20, 'nbands', 22, 'fbtype', 'fcmel', 'dcttype', 1, 'usecmp', 1, 'wintime', 0.032, 'hoptime', 0.016, 'preemph', 0, 'dither', 1);
      
      % save in form: ../Bach/Bach (24).mat
      %disp(strcat(fileName,'.mat'));
      
      save(strcat(fileName,'.mat'),'mm'); %% works
   end
end


