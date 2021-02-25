function comph(~,~)
    %columns
    x=1;
    while(x==1)
        [x1 x2]=find(win_check_o(1,:)==0)
    if(numel(x1)>1 || numel(x2)>1)
        break
    elseif(x1==1 && x2==1)
        func(handle(3),[],x1,x2)
        return
    
    elseif(x1==1 && x2==2)
        func(handle(2),[],x1,x2)
        return
    elseif(x1==1 && x2==3)
        func(handle(1),[],x1,x2)
        return
    end
    end
    
    x=2;
    while(x==2)
        [r c]=find(win_check_o(2,:)==0)
    if(numel(r)>1 || numel(c)>1)
        break
    elseif(r==1 && c==1)
        func(handle(6),[],2,c)
        return
    
    elseif(r==1 && c==2)
        func(handle(5),[],2,c)
        return
    elseif(r==1 && c==3)
        func(handle(4),[],2,c)
        return
    end
    end
    
    x=3;
    while(x==3)
        [r1 c1]=find(win_check_o(3,:)==0)
    if(numel(r1)>1 || numel(c1)>1)
        break
    elseif(r1==1 && c1==1)
        c=counter;
        func(handle(9),[],3,c1)
        if(counter==c)
            break
        end
        return
    
    elseif(r1==1 && c1==2)
        c=counter;
        func(handle(8),[],3,c1)
        if(counter==c)
            break
        end
        return
    elseif(r1==1 && c1==3)
        c=counter;
        func(handle(7),[],3,c1)
        if(counter==c)
            break
        end
        return
    end
    end
    %rows
    x=6;
    while(x==6)
        [r6 c6]=find(win_check_o(:,1)==0)
    if(numel(r6)>1 || numel(c6)>1)
        break
    elseif(r6==1 && c6==1)
        c=counter;
        func(handle(3),[],r6,1)
        if(counter==c)
            break
        end
        return
    
    elseif(r6==2 && c6==1)
        c=counter;
        func(handle(6),[],r6,1)
        if(counter==c)
            break
        end
        return
    elseif(r6==3 && c6==1)
        c=counter;
        func(handle(9),[],r6,1)
        if(counter==c)
            break
        end
        return
    end
    end
    
    x=5;
    while(x==5)
        [r5 c5]=find(win_check_o(:,2)==0)
    if(numel(r5)>1 || numel(c5)>1)
        break
    elseif(r5==1 && c5==1)
        c=counter;
        func(handle(2),[],r5,2)
        if(counter==c)
            break
        end
        return
    
    elseif(r5==2 && c5==1)
        c=counter;
        func(handle(5),[],r5,2)
        if(counter==c)
            break
        end
        return
    elseif(r5==3 && c5==1)
        c=counter;
        func(handle(8),[],r5,2)
        if(counter==c)
            break
        end
        return
    end
    end
    
    x=4;
    while(x==4)
        [r4 c4]=find(win_check_o(:,3)==0)
    if(numel(r4)>1 || numel(c4)>1)
        break
    elseif(r4==1 && c4==1)
        c=counter;
        func(handle(1),[],r4,2)
        if(counter==c)
            break
        end
        return
    
    elseif(r4==2 && c4==1)
        c=counter;
        func(handle(4),[],r4,2)
        if(counter==c)
            break
        end
        return
    elseif(r4==3 && c4==1)
        c=counter;
        func(handle(7),[],r4,2)
        if(counter==c)
            break
        end
        return
    end
    end
    %Diagonals
    
    x=7;
    while(x==7)
    [d4 d5]=find(win_check_o(1,3)==0)
    [d2 d3]=find(win_check_o(2,2)==0)
    [d d1]=find(win_check_o(3,1)==0)
    [x2 x3]=find(win_check_o(1,1)==0)
    [x x1]=find(win_check_o(3,3)==0)
    
    if(numel(d)>1 || numel(d1)>1 || numel(d2)>1 || ...
       numel(d3)>1 || numel(d4)>1 || numel(d5)>1 || ...
       numel(x)>1 || numel(x1)>1 || numel(x2)>1 || numel(x3)>1)
        break
    end
    isempty(d2)
    isempty(d3)
    if(~isempty(d) && ~isempty(d1) && isempty(d2) && isempty(d3) && isempty(d4) && isempty(d5))
        c=counter;
        func(handle(9),[],3,1)
        if(counter==c)
            break
        end
        return
    elseif(isempty(d) && isempty(d1) && isempty(d2) && isempty(d3) && ~isempty(d4) && ~isempty(d5))
        c=counter;
        func(handle(1),[],1,3)
        if(counter==c)
            break
        end
        return
    elseif(isempty(d) && isempty(d1) && ~isempty(d2) && ~isempty(d3) && isempty(d4) && isempty(d5))
        c=counter;
        func(handle(5),[],2,2)
        if(counter==c)
            break
        end
        return
    elseif(~isempty(x2) && ~isempty(x3) && isempty(d2) && isempty(d3) && isempty(x) && isempty(x1))
        c=counter;
        func(handle(3),[],1,1)
        if(counter==c)
            break
        end
        return
    elseif(isempty(x2) && isempty(x3) && isempty(d2) && isempty(d3) && ~isempty(x) && ~isempty(x1))
        c=counter;
        func(handle(7),[],3,3)
        if(counter==c)
            break
        end
        return
    elseif(isempty(x2) && isempty(x3) && ~isempty(d2) && ~isempty(d3) && isempty(x) && isempty(x1))
        c=counter;
        func(handle(5),[],2,2)
        if(counter==c)
            break
        end
        return
    end
    end
end