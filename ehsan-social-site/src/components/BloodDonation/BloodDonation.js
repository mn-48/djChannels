import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import React, { useState } from 'react';
import { Accordion, Button, Modal } from 'react-bootstrap';
import Navigation from '../shared/Navigation/Navigation';
import pic1 from '../../images/med.jpg'
import pic2 from '../../images/medi4.jpg'
import pic3 from '../../images/medi3.jpg'
import topimg from '../../images/HospitalLogo/b-2.webp'
import nextimg from '../../images/HospitalLogo/b-1.jpeg'
import rightimg from '../../images/HospitalLogo/blood.webp'
import './blooddonate.css'

const BloodDonation = () => {
      const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
    return (
        <>
            <Navigation />

            <div className="row mt-5">
                <div className="col-md-3  mt-3  border border-muted bg-light py-2 shadow ">
                    

                    <h1 className='blood-donate-header '>Blood Donations</h1>
                    <div className="go-to-home">
                        <FontAwesomeIcon icon={["fas", "fire"]}  style={{
                            color:'var(--ehsan-color)',
                            fontSize:'30px',
                        }}/>

                        <h5>Home</h5>
                    </div>

                    <div className="blood-serch-desc">
                        <div className="blood-map">
                           <h5>Donate blood near you</h5>
                            <FontAwesomeIcon icon={["fas", "map"]}  style={{
                            color:'var(--ehsan-color)',
                            backgroundColor:'#E2E2E2',
                            height:'40px',
                            width:'40px',
                            padding:'10px',
                           borderRadius:'50%'
                         }}
                        onClick={handleShow}
                        />
                        </div>
                       
                        <p>Call a blood bank to make an appointment or set a reminder for later.</p>
                    </div>

                    {/* medical area selected list */}

                    <div className="row mt-4">
                        <div className="col-md-3">
                            <img src={pic1} alt="" />
                        </div>
                        <div className="col-md-9">
                            <h4 style={{fontSize:'17px'}}>Saic General Hospital, Bogra</h4>
                            <p>Bogura</p>
                            <div className="distance-cal" style={{color:'#8a8d91',display:'flex',justifyContent:'space-between',
                            width:'161px'
                        }}>
                                <p>2.3 km</p>
                                <p>open now</p>
                            </div>
                        </div>
                    </div>

                 {/* <hr /> */}

                    {/* hospital 2  */}

                    <div className="row mt-4">
                        <div className="col-md-3">
                            <img src={pic2} alt="" />
                        </div>
                        <div className="col-md-9">
                            <h4 style={{fontSize:'17px'}}>Saic General Hospital, Bogra</h4>
                            <p>Bogura</p>
                            <div className="distance-cal" style={{color:'#8a8d91',display:'flex',justifyContent:'space-between',
                            width:'161px'
                        }}>
                                <p>2.3 km</p>
                                <p>open now</p>
                            </div>
                        </div>
                    </div>

                {/* <hr /> */}

               {/* hospital 3  */}

                    <div className="row mt-4">
                        <div className="col-md-3">
                            <img src={pic3} alt="" />
                        </div>
                        <div className="col-md-9">
                            <h4 style={{fontSize:'17px'}}>Ariful Hospital, Kurigram</h4>
                            <p>Bogura</p>
                            <div className="distance-cal" style={{color:'#8a8d91',display:'flex',justifyContent:'space-between',
                            width:'161px'
                        }}>
                                <p>2.3 km</p>
                                <p>open now</p>
                            </div>
                        </div>
                    </div>

                <hr />
                <div className='d-grid'>
                <button className='btn px-5 ' style={{
                    backgroundColor:'#CCCCCC'
                }}>See More</button>
               </div>
                {/* subtitle is here  */}

                <h5 style={{fontWeight:'bold'}} className="my-3">Blood donation events</h5>

                <div className="py-3 my-3">  
                   <FontAwesomeIcon icon={["fab", "microblog"]}  style={{
                            color:'red',
                            fontSize:'35px',
                            textAlign:'center',
                            margin:'0 auto',
                            // border:'1px solid red',
                            width:'80%'
                    }}/>
                    <p className='p-2 text-center'>You'll see blood donation events here when they're scheduled nearby.</p>
                    <hr/>
                </div>
              
                </div>
                <div className="col-md-5 mt-3">
                    {/* top images sections  */}
                    <div className="card p-3"> 

                       <img src={topimg} alt="" style={{
                        overflow:'hidden',
                        width:'100%',
                        height:'200px'
                       }}/>
                       <h3 className='py-3'
                       style={{
                        fontSize:'26px',
                        fontWeight:'bold',
                        wordSpacing:'2px',
                        marginLeft:'10px'
                       }}>Get updates about donating blood</h3> 

                       <p style={{fontSize:'18px',marginLeft:'5px'}}>We can let you know when blood banks near you need help.</p>

                        <div className="notification-section mt-3 d-flex">
                            <FontAwesomeIcon icon={["fas", "bell"]}  style={{
                              marginTop:'2px',
                              fontSize:'18px',
                           }}/>

                           <p className='ms-2'>Get notifications on Facebook when nearby blood banks need your help.</p>
                        </div>

                        <div className="notification-section my-4 d-flex">
                            <FontAwesomeIcon icon={["fas", "table"]}  style={{
                              marginTop:'2px',
                              fontSize:'18px',
                           }}/>

                           <p className='ms-2'>Plan your blood donations and set reminders.</p>
                        </div>

                       <div className="notification-section d-flex">
                            <FontAwesomeIcon icon={["fas", "heart"]}  style={{
                              marginTop:'2px',
                              fontSize:'18px',
                           }}/>

                           <p className='ms-2'>Inspire friends to donate blood so they can help save lives too.</p>
                        </div>

                        <button className='btn btn-primary mt-3'>
                            Get Updates
                        </button>

                        <p style={{fontSize:'12px',color:'#65676b',padding:'5px'}}>By tapping Get updates, you agree to our Program terms.</p>

                       </div>  

                       <div className='card mt-3 p-3'>
                         <img src={nextimg} alt="" />
                         <h5 style={{fontSize:'20px',fontWeight:'bold',padding:'5px 0px',marginTop:'5px'}}>Learn more about donating blood</h5>
                      </div> 

                       {/* frequently asked questions  */}
                    <Accordion defaultActiveKey="0" flush>
                        <Accordion.Item eventKey="0">
                            <Accordion.Header>Donating blood during COVID-19</Accordion.Header>
                            <Accordion.Body>
                            Even if you live in a city that's encouraging you to stay home, most blood banks remain open because they provide an essential service.
                            Blood banks are taking extra precautions to help keep donors safe from coronavirus (COVID-19). Call your local blood bank to ask what steps they're taking, and schedule an appointment.

                            </Accordion.Body>
                        </Accordion.Item>

                        <Accordion.Item eventKey="1">
                            <Accordion.Header>Who can donate blood?</Accordion.Header>
                            <Accordion.Body>
                            Some countries have special rules about donating blood, but this list of requirements from the World Health Organization (WHO) can help you learn if you can donate blood.

                            </Accordion.Body>
                        </Accordion.Item>

                        <Accordion.Item eventKey="2">
                            <Accordion.Header>What if I can't donate?</Accordion.Header>
                            <Accordion.Body>
                           Not everyone can give blood, but donating blood isn't the only way to support the blood shortage. Spreading awareness is important. Share the Blood Donations tool with your friends and let them know why it's important to you.

                            </Accordion.Body>
                        </Accordion.Item>

                        <Accordion.Item eventKey="3">
                            <Accordion.Header> Plan ahead to donate ?</Accordion.Header>
                            <Accordion.Body>
                            We'll let you know when you're needed
                            When you sign up to get updates on Facebook about donating blood, you'll receive notifications when blood is needed near you. We'll notify you no more than every two weeks.
                            <br/>
                            <br/>
                            Donate when it's convenient for you
                            Most appointments take around an hour. Depending on the blood bank, you can call or schedule an appointment online, or set a reminder to walk in during the blood bank's open hours.

                            </Accordion.Body>
                           
                        </Accordion.Item>


                    </Accordion>

                </div>
                <div className="col-md-4 mt-3">
                    <div className="card p-3"> 
                    <img src={rightimg} alt="" height="200" style={{
                        width:'100%'
                    }}/>
                   
                    <h3 className='py-3'
                       style={{
                        fontSize:'20px',
                        fontWeight:'bold',
                        marginLeft:'10px'
                       }}>Inspiring others is an important way to support the cause</h3> 
                   <p>Donating blood isn't the only way to help. You can also spread the word to inspire your friends to take action.</p>
                    <div className='d-grid'>
                        <button className='btn px-5 mt-4' style={{
                            backgroundColor:'#CCCCCC'
                        }}>
                                  <FontAwesomeIcon icon={["fas", "share"]}  style={{
                              marginTop:'2px',
                              fontSize:'18px',
                              marginRight:'6px'
                           }}/>
                            Share</button>
                       </div>
                     </div>

                     <div className="card mt-4 px-3">

                    <div className="row mt-4">
                        <div className="col-md-3">
                            <img src={pic2} alt="" />
                        </div>
                        <div className="col-md-9">
                            <h4 style={{fontSize:'17px',color:'#000',fontWeight:'bold'}}>Ehsan Blood Center General Hospital, Bogra</h4>
                           
                            <div className="distance-cal mt-2" style={{color:'#8a8d91'
                        }}>
                           <div className='d-grid'>
                        <button className='btn px-4 d-block' style={{
                            backgroundColor:'#CCCCCC',
                              fontWeight:'bold'
                        }}>
                            <FontAwesomeIcon icon={["fas", "plus"]}  style={{
                              marginTop:'2px',
                              fontSize:'18px',
                              marginRight:'6px',
                              color:'#000',
                            
                           }}/>
                            Follow</button>
                       </div>
                            </div>
                        </div>
                    </div>

                    <div className="row mt-4">
                        <div className="col-md-3">
                            <img src={pic3} alt="" />
                        </div>
                        <div className="col-md-9">
                            <h4 style={{fontSize:'17px',color:'#000',fontWeight:'bold',lineHeight:"20px"}}>Shahid Jiaur Rahman Medical college Hospital, Bogra</h4>
                           
                            <div className="distance-cal mt-2" style={{color:'#8a8d91'
                        }}>
                           <div className='d-grid'>
                        <button className='btn px-4 d-block' style={{
                            backgroundColor:'#CCCCCC',
                              fontWeight:'bold'

                        }}>
                            <FontAwesomeIcon icon={["fas", "plus"]}  style={{
                              marginTop:'2px',
                              fontSize:'18px',
                              marginRight:'6px'
                           }}/>
                            Follow</button>
                       </div>
                            </div>
                        </div>
                    </div>

                     <div className="row mt-4">
                        <div className="col-md-3">
                            <img src={pic1} alt="" />
                        </div>
                        <div className="col-md-9">
                            <h4 style={{fontSize:'17px',color:'#000',fontWeight:'bold'}}>Hakkani Model General Hospital, Rajshahi</h4>
                           
                            <div className="distance-cal mt-2" style={{color:'#8a8d91'
                        }}>
                           <div className='d-grid'>
                        <button className='btn px-4 d-block' style={{
                            backgroundColor:'#CCCCCC',
                            fontWeight:'bold'

                        }}>
                            <FontAwesomeIcon icon={["fas", "plus"]}  style={{
                              marginTop:'2px',
                              fontSize:'18px',
                              marginRight:'6px'
                           }}/>
                            Follow</button>
                       </div>
                            </div>
                        </div>
                    </div>



                     </div>

                </div>


            </div>




      <Modal show={show} onHide={handleClose} animation={false}>
        <Modal.Header closeButton>
          <Modal.Title>Blood Location Area</Modal.Title>
        </Modal.Header>
        <Modal.Body>
            <iframe src="https://www.google.com/maps/embed?pb=!1m12!1m8!1m3!1d790864.4471168693!2d90.766146583996!3d22.956322075539124!3m2!1i1024!2i768!4f13.1!2m1!1sblood!5e0!3m2!1sen!2sbd!4v1656744587244!5m2!1sen!2sbd" width="450" height="450" style={{border:'0'}} allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" title="aa"></iframe>

        </Modal.Body>

      </Modal>

        </>
    );
};

export default BloodDonation;