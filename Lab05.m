% Author: John Vogel
function Lab05
win_check_x=zeros(3);
win_check_o=zeros(3);
counter=0;
persistent xscore;
persistent oscore;
persistent tiescore;

xscore=0;
oscore=0;
tiescore=0;

handle(1) = uicontrol('callback',{@func,1,3},'position',[330 310 80 80],'FontSize',40);
handle(2) = uicontrol('callback',{@func,1,2},'position',[330 230 80 80],'FontSize',40);
handle(3) = uicontrol('callback',{@func,1,1},'position',[330 150 80 80],'FontSize',40);
handle(4) = uicontrol('callback',{@func,2,3},'position',[250 310 80 80],'FontSize',40);
handle(5) = uicontrol('callback',{@func,2,2},'position',[250 230 80 80],'FontSize',40);
handle(6) = uicontrol('callback',{@func,2,1},'position',[250 150 80 80],'FontSize',40);
handle(7) = uicontrol('callback',{@func,3,3},'position',[170 310 80 80],'FontSize',40);
handle(8) = uicontrol('callback',{@func,3,2},'position',[170 230 80 80],'FontSize',40);
handle(9) = uicontrol('callback',{@func,3,1},'position',[170 150 80 80],'FontSize',40);


score_x = uicontrol('style','text','string',num2str(xscore),'position',[190 15 40 40]);
score_o = uicontrol('style','text','string',num2str(oscore),'position',[270 15 40 40]);
score_tie = uicontrol('style','text','string',num2str(tiescore),'position',[350 15 40 40]);

text_x = uicontrol('style','text','string','X','position',[203 70 15 16],'FontSize',12,'FontWeight','bold','FontName','Arial');
text_o = uicontrol('style','text','string','O','position',[283 70 15 16],'FontSize',12,'FontWeight','bold','FontName','Arial');
text_tie = uicontrol('style','text','string','Tie','position',[358 70 25 16],'FontSize',12,'FontWeight','bold','FontName','Arial');

quit_btn = uicontrol('callback','clear counter;close','position',[250 100 80 40],'string','Quit');
reset_btn = uicontrol('callback',@reset,'position',[100 70 70 30],'string','Reset');
next_btn = uicontrol('callback',@next,'position',[430 70 70 30],'string','Next Game');

comp_btn = uicontrol('callback',@comp,'position',[425 150 80 40],'string','Computer');
comph_btn = uicontrol('callback',@comp,'position',[485 150 80 40],'string','Computer Hard');
comp_btn.Enable='off';
comph_btn.Enable='off';
    function func(handlein,~,ROW,COL)
        counter=counter+1;
        counter
        win_check_x(ROW,COL)
        win_check_o(ROW,COL)
        if(win_check_x(ROW,COL)~=0 || win_check_o(ROW,COL)~=0)
            counter=counter-1;
            counter
            return
        else
            if(mod(counter,2)==0)
                set(handlein,'string','o','FontName','Times New Roman')
                set(handlein,'style','text')
                set(handlein,'BackgroundColor','Red')
                win_check_o(ROW,COL)=-1;
                comp_btn.Enable='off';
                comph_btn.Enable='off';

            else
                set(handlein,'string','x','FontName','Times New Roman')
                set(handlein,'style','text')
                set(handlein,'BackgroundColor','Green')
                win_check_x(ROW,COL)=1;
                comp_btn.Enable='on';  
                comph_btn.Enable='on';

            end
        end
        
        if(     sum(win_check_o(1,:))==-3 || ...
                sum(win_check_o(2,:))==-3 || ...
                sum(win_check_o(3,:))==-3 || ...
                sum(win_check_o(:,1))==-3 || ...
                sum(win_check_o(:,2))==-3 || ...
                sum(win_check_o(:,3))==-3 || ...
                (win_check_o(3,1)+win_check_o(2,2)+win_check_o(1,3))==-3 || ...
                (win_check_o(1,1)+win_check_o(2,2)+win_check_o(3,3))==-3)
            oscore=oscore+1;
            score_o.String=num2str(oscore);
            for a=1:9
                handle(a).Style='text';
            end
            comp_btn.Enable='off';
            comph_btn.Enable='off';
        elseif( sum(win_check_x(1,:))==3 || ...
                sum(win_check_x(2,:))==3 || ...
                sum(win_check_x(3,:))==3 || ...
                sum(win_check_x(:,1))==3 || ...
                sum(win_check_x(:,2))==3 || ...
                sum(win_check_x(:,3))==3 || ...
                (win_check_x(3,1)+win_check_x(2,2)+win_check_x(1,3))==3 || ...
                (win_check_x(1,1)+win_check_x(2,2)+win_check_x(3,3))==3)
            xscore=xscore+1;
            score_x.String=num2str(xscore);
            for a=1:9
                handle(a).Style='text';
            end
            comp_btn.Enable='off';
            comph_btn.Enable='off';
        
        elseif(sum(win_check_x,'all')==5 && sum(win_check_o,'all')==-4)
            tiescore=tiescore+1;
            score_tie.String=num2str(tiescore);
            for a=1:9
                handle(a).Style='text';
            end
            comp_btn.Enable='off';
            comph_btn.Enable='off';
        end
        
        
    end

function reset(~,~)
        score_x.String='0';
        score_o.String='0';
        score_tie.String='0';
        xscore=0;
        oscore=0;
        tiescore=0;
        win_check_x=zeros(3);
        win_check_o=zeros(3);
        counter=0;
        for a=1:9
            handle(a).String=[];
            handle(a).Style='pushbutton';
            set(handle(a),'BackgroundColor','default')
        end
        comp_btn.Enable='on';
        comp_btn.Enable='off';
        comph_btn.Enable='on';
        comph_btn.Enable='off';


        
end

function next(~,~)
        win_check_x=zeros(3);
        win_check_o=zeros(3);
        counter=0;
        
        for a=1:9
            handle(a).String=[];
            handle(a).Style='pushbutton';
            set(handle(a),'BackgroundColor','default')
        end
        comp_btn.Enable='on';
        comph_btn.Enable='on';
    end



function comp(~,~)
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      %%%%Computer Take Win
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      x=1;
    while(x==1)
        [x1 x2]=find(win_check_o(1,:)==0)
    if(numel(x1)>1 || numel(x2)>1)
        break
    elseif(x1==1 && x2==1)
        c=counter;
        func(handle(3),[],x1,x2)
        if(counter==c)
            break
        end
        return
    
    elseif(x1==1 && x2==2)
        c=counter;
        func(handle(2),[],x1,x2)
        if(counter==c)
            break
        end
        return
    elseif(x1==1 && x2==3)
        c=counter;
        func(handle(1),[],x1,x2)
        if(counter==c)
            break
        end
        return
    end
    end
    
    x=2;
    while(x==2)
        [r cc]=find(win_check_o(2,:)==0)
    if(numel(r)>1 || numel(cc)>1)
        break
    elseif(r==1 && cc==1)
        c=counter;
        func(handle(6),[],2,cc)
        if(counter==c)
            break
        end
        return
    elseif(r==1 && cc==2)
        c=counter;
        func(handle(5),[],2,cc)
        if(counter==c)
            break
        end
        return
    elseif(r==1 && cc==3)
        c=counter;
        func(handle(4),[],2,cc)
        if(counter==c)
            break
        end
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
        func(handle(1),[],r4,3)
        if(counter==c)
            break
        end
        return
    
    elseif(r4==2 && c4==1)
        c=counter;
        func(handle(4),[],r4,3)
        if(counter==c)
            break
        end
        return
    elseif(r4==3 && c4==1)
        c=counter;
        func(handle(7),[],r4,3)
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
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%Computer Random
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     x=1;
      while(x==1)
       R=randi([1 3]);
       C=randi([1 3]);
       if(R==1 && C==1)
           if(handle(3).Style=="pushbutton")
               func(handle(3),[],R,C)
               break
           end
       elseif(R==1 && C==2)
           if(handle(2).Style=="pushbutton")
               func(handle(2),[],R,C)
               break
           end
       elseif(R==1 && C==3)
           if(handle(1).Style=="pushbutton")
               func(handle(1),[],R,C)
               break
           end
       elseif(R==2 && C==1)
           if(handle(6).Style=="pushbutton")
               func(handle(6),[],R,C)
               break
           end
       elseif(R==2 && C==2)
           if(handle(5).Style=="pushbutton")
               func(handle(5),[],R,C)
               break
           end
       elseif(R==2 && C==3)
           if(handle(4).Style=="pushbutton")
               func(handle(4),[],R,C)
               break
           end
       elseif(R==3 && C==1)
           if(handle(9).Style=="pushbutton")
               func(handle(9),[],R,C)
               break
           end
       elseif(R==3 && C==2)
           if(handle(8).Style=="pushbutton")
               func(handle(8),[],R,C)
               break
           end
       elseif(R==3 && C==3)
           if(handle(7).Style=="pushbutton")
               func(handle(7),[],R,C)
               break
           end
       end
      end    
end
end


