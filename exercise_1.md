    if a == 0
        if b==0 
            //constant
            print c
            abort
        endif
        //linear
        print -c/b
        abort
    else
        set discriminant tp b*b-4*a*c
        if discriminant < 0
            print 'Not solvable';
        endif
        if discriminant == 0
            print -b / (2*a)
        endif
        if discriminant > 0
            print -b + discriminant / (2*a)
            print -b - discriminant / (2*a)
        endif
    endif
    abort