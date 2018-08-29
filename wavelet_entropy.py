# not enough variance to choose
# wavelet entropy python
def WE(y, level = 4, wavelet = 'coif2'):
    from math import log
    n = len(y)
    
    sig = y
    
    ap = {}
    
    for lev in range(0,level):
        (y, cD) = pywt.dwt(y, wavelet)
        ap[lev] = y
        
    # Energy
    
    Enr = np.zeros(level)
    for lev in range(0,level):
        Enr[lev] = np.sum(np.power(ap[lev],2))/n
        
    Et = np.sum(Enr)
    
    Pi = np.zeros(level)
    for lev in range(0,level):
        Pi[lev] = Enr[lev]/Et
        
    we = - np.sum(np.dot(Pi,np.log(Pi)))

    
    return we
	
# Reference: https://github.com/ArunAniyan/Wavelet-Entropy/blob/master/wventrpy.m
