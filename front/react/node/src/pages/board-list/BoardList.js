import {Card} from "../../components/Card";
import {useEffect, useState} from "react";
import axios from "axios";
import "./boardList.scss";
import moment from "moment";

const BoardList = () => {
  const [boardList, setBoardList] = useState([]);

  // 렌더링 되고 한번만 전체 게시물 갯수 가져와서 페이지 카운트 구하기
  // 렌더링 되고 한번만 페이지에 해당하는 게시물 가져오기
  useEffect(() => {
    // 페이지에 해당하는 게시물 가져오기
    const getBoardList = async () => {
      const {data} = await axios.get(`http://localhost:4000/board/list`);
      return data;
    }
    // 현재 페이지에 해당하는 게시물로 상태 변경하기
    getBoardList().then(result => setBoardList(result));
    // 게시물 전체 갯수 구하기
    
  }, [])

  return (
    <div className="boardList-wrapper">
      <div className="boardList-header">
        전체 게시물 📝
      </div>
      <div className="boardList-body">
        {boardList.map((item, index) => (
          <Card key={item.seq} 
                date={moment(item.regdate).add(9, "hour").format('YYYY-MM-DD')}
                title={item.title} content={item.content} nickname={item.nickname}
                seq={item.seq}
          />
        ))}
      </div>
    </div>

  )
}
export default BoardList;