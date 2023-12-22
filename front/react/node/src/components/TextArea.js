import "./textArea.scss";

const TextArea = ({ setTitle, setContent, setNickname, title, content, nickname }) => {
  return (
    <div className="textArea-wrapper">
      <input
        onChange={(e) => {
          setTitle(e.target.value);
        }}
        className="title"
        placeholder="제목을 입력하세요"
        value={title}
      />
      <textarea
        onChange={(e) => {
          setContent(e.target.value);
        }}
        className="text"
        placeholder="내용을 입력하세요"
        value={content}
      />
      <input
        onChange={(e) => {
          setNickname(e.target.value);
        }}
        className="nickname"
        placeholder="작성자 ID를 입력하세요"
        value={nickname}
      />
    </div>
  );
};
export default TextArea;