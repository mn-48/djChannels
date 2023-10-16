import React from 'react'
import Tippy from "@tippyjs/react";
import photoUpload from '../../../../images/photo_upload.svg';
import feeling from '../../../../images/feeling.svg';
import gifUpload from '../../../../images/gif_upload.svg';
import questionAnswer from '../../../../images/comment.svg';
import tag from '../../../../images/tag.svg';
import checkin from '../../../../images/checkin.svg';
import live from '../../../../images/live.svg';
import { useSelector } from "react-redux";

function CreateNewPostOptions() {
    const user = useSelector((state) => state.auth.user);
    return (
        <>
            <div className="create-new-post-avatar">
                <img src={`http://127.0.0.1:8000${user&&user.consumer.photo}`} alt={user&&user.consumer.first_name}/>
            </div>
            <div className="post-create-icons-group">
                <Tippy
                    content={<span>Instant Photo Upload</span>}
                    interactive={true}
                    animation={"shift-toward"}
                    placement={"bottom"}
                >
                    <div className="icon-div">
                        <img src={photoUpload} alt=" Upload" />
                    </div>
                </Tippy>

                <Tippy
                    content={<span>Your Feelings/Activity</span>}
                    interactive={true}
                    animation={"shift-toward"}
                    placement={"bottom"}
                >
                    <div className="icon-div">
                        <img src={feeling} alt="Feeling" />
                    </div>
                </Tippy>

                <Tippy
                    content={<span>Browse from GIF Library</span>}
                    interactive={true}
                    animation={"shift-toward"}
                    placement={"bottom"}
                >
                    <div className="icon-div">
                        <img src={gifUpload} alt="Add Gif" />
                    </div>
                </Tippy>

                <Tippy
                    content={<span>Ask a Question</span>}
                    interactive={true}
                    animation={"shift-toward"}
                    placement={"bottom"}
                >
                    <div className="icon-div">
                        <img src={questionAnswer} alt="Question Answer" />
                    </div>
                </Tippy>
                <Tippy
                    content={<span>Tag a Friend who Follows you</span>}
                    interactive={true}
                    animation={"shift-toward"}
                    placement={"bottom"}
                >
                    <div className="icon-div">
                        <img src={tag} alt="Tag Someone" />
                    </div>
                </Tippy>

                <Tippy
                    content={<span>Check In</span>}
                    interactive={true}
                    animation={"shift-toward"}
                    placement={"bottom"}
                >
                    <div className="icon-div">
                        <img src={checkin} alt="Check In" />
                    </div>
                </Tippy>

                <Tippy
                    content={<span>Start a Live</span>}
                    interactive={true}
                    animation={"shift-toward"}
                    placement={"bottom"}
                >
                    <div className="icon-div">
                        <img src={live} alt="live" />
                    </div>
                </Tippy>
            </div>
        </>
    )
}

export default CreateNewPostOptions
