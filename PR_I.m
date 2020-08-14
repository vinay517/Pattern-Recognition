BankNoteData;
FirstFeature=BankNoteData(:,1);
SecondFeature=BankNoteData(:,2);
ThirdFeature=BankNoteData(:,3);
FourthFeature=BankNoteData(:,4);
Diff1=FirstFeature-(mean(FirstFeature));
Diff2=SecondFeature-(mean(SecondFeature));
Diff3=ThirdFeature-(mean(ThirdFeature));
Diff4=FourthFeature-(mean(FourthFeature));
Variance1=sqrt((sum(Diff1.^2))/1372);
Variance2=sqrt((sum(Diff2.^2))/1372);
Variance3=sqrt((sum(Diff3.^2))/1372);
Variance4=sqrt((sum(Diff4.^2))/1372);
Norm1=Diff1/Variance1;
Norm2=Diff2/Variance2;
Norm3=Diff3/Variance3;
Norm4=Diff4/Variance4;
Normalization = [Norm1 Norm2 Norm3 Norm4 Class]; %to combine into one DataSet
Newmatrix = Normalization(:,1)>3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,2)>3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,3)>3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,4)>3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,1)<-3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,2)<-3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,3)<-3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,4)<-3;
Normalization(Newmatrix,:) = [];
y=size(Normalization);
one=Normalization(:,1);
two=Normalization(:,2);
three=Normalization(:,3);
four=Normalization(:,4);
Classes = Normalization(:,5);
prompt = 'What is the X axis (1 or 2 or 3)? ';
x_axis = input(prompt)
prompt = 'What is the Y axis (2 or 3 or 4)? ';
y_axis = input(prompt)
if x_axis == 1
    if y_axis == 2
            % for 1 and 2
            scatter(one(Classes == 1), two(Classes == 1), 120, 'r', '*')
            hold on
            scatter(one(Classes == 0), two(Classes == 0), 150, 'b', '*')
            title('Graph for First and Second Feature')
            xlabel('First Feature')
            ylabel('Second Feature')
            legend('Class 1','Class 0')
    elseif y_axis == 3
            % for 1 and 3
            scatter(one(Classes == 1), three(Classes == 1), 120, 'r', '*')
            hold on
            scatter(one(Classes == 0), three(Classes == 0), 150, 'b', '*')
            title('Graph for First and Third Feature')
            xlabel('First Feature')
            ylabel('Third Feature')
            legend('Class 1','Class 0')
     else 
            % for 1 and 4
            scatter(one(Classes == 1), four(Classes == 1), 120, 'r', '*')
            hold on
            scatter(one(Classes == 0), four(Classes == 0), 150, 'b', '*')
            title('Graph for First and Fourth Feature')
            xlabel('First Feature')
            ylabel('Fourth Feature')
            legend('Class 1','Class 0')
    end
elseif x_axis == 2
        if y_axis == 3
            % for 2 and 3
            scatter(two(Classes == 1), three(Classes == 1), 120, 'r', '*')
            hold on
            scatter(two(Classes == 0), three(Classes == 0), 150, 'b', '*')
            title('Graph for Second and Third Feature')
            xlabel('Second Feature')
            ylabel('Third Feature')
            legend('Class 1','Class 0')
        else
         % for 2 and 4
            
            scatter(two(Classes == 1), four(Classes == 1), 120, 'r', '*')
            hold on
            scatter(two(Classes == 0), four(Classes == 0), 150, 'b', '*')
            title('Graph for Second and Fourth Feature')
            xlabel('Second Feature')
            ylabel('Fourth Feature')
            legend('Class 1','Class 0')
        end
else 
        % for 3 and 4
            
            scatter(three(Classes == 1), four(Classes == 1), 120, 'r', '*')
            hold on
            scatter(three(Classes == 0), four(Classes == 0), 150, 'b', '*')
            title('Graph for Third and Fourth Feature')
            xlabel('Third Feature')
            ylabel('Fourth Feature')
            legend('Class 1','Class 0')
end
