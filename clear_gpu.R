library(reticulate)
py_run_string('from keras import backend as K')
py_run_string('from keras.backend import set_session;')
py_run_string('from keras.backend import clear_session;')
py_run_string('from keras.backend import get_session;')

clear_gpu <- function() {
  py_run_string('cfg = K.config_pb2.ConfigProto()')
  py_run_string('cfg.gpu_options.allow_growth = True')
  py_run_string('K.set_session(K.tf.compat.v1.Session(config=cfg))')
  k_clear_session()
}

clear_gpu()