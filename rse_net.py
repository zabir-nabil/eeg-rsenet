from keras.models import Sequential
from keras.models import Model, Input
from keras.layers import Dense, Activation, Dropout, BatchNormalization, Average
from keras.optimizers import SGD
from keras.callbacks import EarlyStopping
import numpy as np
import random
random.seed(1997)

# @author: zabiralnazi@yahoo.com

def classifier(n_features, nb_class = 3):
    #inputs
    inputs = Input(shape=(n_features,), dtype='float32')
    #intermediate layers
    l3 = Dense(32, activation='relu')(inputs)
    l3d = Dropout(0.35, seed = 1997)(l3)
    l4 = Dense(64, activation='relu')(l3d)
    l4d = Dropout(0.45, seed = 1997)(l4)
    l5 = Dense(128, activation='relu')(l4d)
    l5d = Dropout(0.45, seed = 1997)(l5)
    #predictions
    outputs = Dense(nb_class, activation='softmax')(l5d)
    #classifier
    classifier_model = Model(inputs=inputs, outputs=outputs)
    return classifier_model, inputs

def ensemble(models, input_ls): # pass an model array, array of input layers of the models
    
    outputs = [model.outputs[0] for model in models]
    final_output = Average()(outputs)
    
    model = Model(input_ls, final_output, name='Ensemble')
    
    return model

def rs_features(f_set, n_classifier, f_lb, f_ub):
    '''
    n_classifier: number of classifiers used in ensemble model
    f_ub: maximum number of features used in a single classifier block
    f_lb: minimum number of features used in a single classifier block
    f_set: input feature set, expected shape (n_samples, n_features)
    /
    returns random subspace feature sets
    /
    '''
    rs_f = []
    if len(f_set.shape) != 2:
        print('Feature Shape Not Recognized.')
        return None
    f_idx = list(range(f_set.shape[1]))
    while(n_classifier):
        n_features = random.randint(f_lb, f_ub) #uniform distribution
        features_idx = random.sample(f_idx, n_features)
        rs_f.append(f_set[:,features_idx])
        n_classifier -= 1
        
    return rs_f 
	
	
def cross_validation(rand_subspc_f, y, k = 10, nb_class = 3, optim = None):
    from sklearn.cross_validation import StratifiedKFold
    from keras.optimizers import Adam
    
    v_acc = []
    
    models = []
    input_layers = []
    for i in range(len(rand_subspc_f)):
        md_n, il_n = classifier(rand_subspc_f[i].shape[1], nb_class) # . for reminder
        models.append(md_n)
        input_layers.append(il_n)
    model_rse = ensemble(models, input_layers) # . for reminder
    adam = Adam(lr=0.02, beta_1=0.9, beta_2=0.999, epsilon=None, decay=0.0, amsgrad=False)
    if optim == None:
        optim = adam
        
    
    skf = StratifiedKFold(y[:,0], n_folds=k, shuffle=True)
    for i, (trn_idx, tst_idx) in enumerate(skf):
        X_trn_fold = []
        y_trn_fold = y[trn_idx,:]
        
        X_tst_fold = []
        y_tst_fold = y[tst_idx,:]
        
        for fch in range(len(rand_subspc_f)):
            X_trn_fold.append(rand_subspc_f[fch][trn_idx,:])
            X_tst_fold.append(rand_subspc_f[fch][tst_idx,:])
        
        model_rse.compile(optimizer=optim,
          loss='categorical_crossentropy',
          metrics=['accuracy'])
        mhist = model_rse.fit(X_trn_fold, y_trn_fold, batch_size = 512, 
                      validation_data = (X_tst_fold, y_tst_fold),
                      epochs=100, verbose = 0)
        
        v_acc.append(np.max(mhist.history['val_acc']))
    return v_acc