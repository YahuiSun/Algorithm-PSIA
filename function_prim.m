% input: rough PO result maybe with disconnected part. output: absolutely connected PO result

function [set]=function_prim(set,foodpoint,N)

% change all the vertices in the core network to terminals
change=1;
while change==1
    old_T=sum(foodpoint);
    for i=1:N
        for j=i:N
            if set(i,j)==1 & foodpoint(i)+foodpoint(j)==1
                foodpoint(i)=1; foodpoint(j)=1;
            end
        end
    end
    new_T=sum(foodpoint);
    if old_T==new_T
        change=0;
    end
end
%

% prim
for i=1:N
    for j=1:N
        if set(i,j)==1 & foodpoint(i)+foodpoint(j)<2
            set(i,j)=0;
        end
    end
end
%