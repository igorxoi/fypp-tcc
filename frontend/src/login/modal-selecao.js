import React from 'react';
import { TiCamera } from "react-icons/ti";
import { AiOutlineUser } from "react-icons/ai";
import TransitionsModal from './testemodal'
import { makeStyles } from '@material-ui/core/styles';
import Modal from '@material-ui/core/Modal';
import Backdrop from '@material-ui/core/Backdrop';
import Fade from '@material-ui/core/Fade';
import FormLoginCliente from './formLoginCliente'

const useStyles = makeStyles(theme => ({
    modal: {
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
    },
    paper: {
      backgroundColor: theme.palette.background.paper,
    //   border: '1px solid #641682',
    //   boxShadow: theme.shadows[5],
      padding: theme.spacing(2, 2, 2),
    },
  }));

function ModalSelecaoLogin(){
    const classes = useStyles();
  const [open, setOpen] = React.useState(false);

  const handleOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };
    return(
        <div className="container center">
            <div className="row">
                <div className="col s4 offset-s4">
                    <div className="card z-depth-3">
                        <div className=" card-content dark-text">
                            <span className="card-title">Bem-vindo</span>
                            <p className="grey-text">Como deseja fazer login ?</p>
                            <ul className="center no-line">
                                <a className="" onClick={handleOpen}>
                                    <li className="center">
                                        <div className="valign-wrapper collapsible-header border-purple hoverable" > 
                                            <div className="col"></div>
                                            <i class="material-icons margin-top">
                                                <TiCamera />
                                            </i>
                                            <h6 className="valign-wrapper">Fotografo</h6>
                                        </div>                                    
                                    </li>
                                </a>
                            </ul>
                            <ul className="center no-line">
                                <a className="" href="#">
                                    <li>
                                        <div className=" valign-wrapper collapsible-header border-purple hoverable ">
                                            <div className="col"></div>
                                            <i class="material-icons margin-top">
                                                <AiOutlineUser className="flow-text" />
                                            </i>
                                            <h6 className="valign-wrapper">Cliente</h6>
                                        </div>                                    
                                    </li>
                                </a>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div>      
                <Modal
                    aria-labelledby="transition-modal-title"
                    aria-describedby="transition-modal-description"
                    className={classes.modal}
                    open={open}
                    onClose={handleClose}
                    closeAfterTransition
                    BackdropComponent={Backdrop}
                    BackdropProps={{
                    timeout: 500,
                    }}
                >
                    <Fade in={open}>
                        <div className="container">
                            <div className="row">
                                <div className="col s6 offset-s3">
                                    <div className={classes.paper}>
                                        <div className="modal-content center"> 
                                            <div class="modal-content al">
                                                <h4>Login</h4>
                                                < FormLoginCliente/>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </Fade>
                </Modal>
            </div>
        </div>
        
    );
}

export default ModalSelecaoLogin;