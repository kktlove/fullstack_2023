import "./card.scss";
import {useNavigate} from "react-router-dom";

export const Card = ({seq, title, content, nickname, date}) => {
  const navigate = useNavigate();
  return (
    <div className="card-wrapper" onClick={() => {
      navigate(`/board/${seq}`)
    }}>
      <div className="card-body-text">
        <div className="card-body-text-title">{title}</div>
        <div className="card-body-text-content">{content}</div>
      </div>
      <div className="card-footer">
        <div className="nickname">{nickname}</div>
        <div className="date">{date}</div>
      </div>
    </div>
  );
};