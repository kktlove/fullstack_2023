import "./home.scss";

const Home = () => {
  return (
    <div className="home-wrapper">
      <div className="home-title">
        <span>EduTech</span>에 오신걸 환영합니다
      </div>
      <div className="home-contents">
        기본 게시판의 기능을📝<br/>
        제공하는 샘플 게시판입니다.✏️
      </div>
      <div className="about-project">
        이 프로젝트는 Restful API 를 활용하여<br/>
        <span>React 로 만들었습니다.</span>
      </div>
      <div className="my-website">
        <div className="my-website-title">Reference Website</div>
        <a href="https://github.com/kktlove" target="_blank">
          🏴GitHub
        </a>
        <a href="https://blog.naver.com/kkt09072" target="_blank">
          📖 Blog
        </a>
      </div>
    </div>
  )
}
export default Home;