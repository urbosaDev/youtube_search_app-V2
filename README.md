## 🎯 YouTube Search Flutter App

### 🧾 요약

이 앱은 YouTube의 검색 API를 활용한 **영상 검색 앱**입니다. 사용자가 입력한 키워드를 기반으로 유튜브 영상 정보를 불러오고, **리스트 뷰 / 그리드 뷰**로 결과를 보여주는 구조를 가지고 있습니다.

⚠️ **본 앱은 테스트 및 학습 목적이며, 사용되었던 YouTube API 키는 현재 삭제되어 더 이상 유효하지 않습니다.**

## 앱 시연 영상


https://github.com/user-attachments/assets/ecd67d40-5de4-4e2f-89a4-343594d6b1bb


---

### 🧱 아키텍처 및 구조

#### 🔌 의존성 주입 (Dependency Injection)

* 앱 시작 시 `MultiProvider`를 통해 `ScreenViewModel`을 생성하면서, 내부적으로 `SnippetUseCase` → `SnippetRepository` → `SearchSnippetYoutubeService`의 인스턴스를 직접 주입함
* 이를 통해 각 계층 간 강한 결합도를 줄이고, 테스트와 재사용이 용이한 구조를 확보함

#### 🧠 UseCase의 역할

* 비즈니스 로직의 중심으로, 외부에서 데이터를 요청받고 상태를 판단하는 책임을 가짐

* 내부적으로 상태(`SearchState`)를 관리하며 Stream으로 상태를 전파

* 여러 ViewModel이 하나의 UseCase 인스턴스를 공유하여 **상태 일관성** 확보

* **MVVM 아키텍처** 기반

  * View (UI 위젯)
  * ViewModel (상태 관리 및 이벤트 처리)
  * UseCase (비즈니스 로직)
  * Repository (데이터 소스 추상화)
  * Service (API 통신 구현)

* **상태 관리**: `ChangeNotifier + Provider`

* **데이터 흐름**: ViewModel ↔ UseCase ↔ Repository ↔ Service

* **StreamController**로 API 호출 상태(`idle`, `loading`, `finished`, `error`)를 전달하며, 여러 ViewModel이 같은 UseCase의 상태를 공유함

---

### 🔄 주요 기능

| 기능           | 설명                                   |
| ------------ | ------------------------------------ |
| 🔍 검색바       | 사용자가 검색어 입력 후 YouTube API에 요청 전송     |
| 📺 리스트/그리드 뷰 | 버튼을 눌러 두 가지 뷰 방식 전환 가능 (동일 데이터 공유)   |
| 🎬 영상 카드     | 제목, 채널명, 썸네일, 설명, 게시일 등을 포함한 Card 위젯 |
| 📡 실시간 상태 전달 | 검색 로딩/완료/에러 상태를 Stream 기반으로 뷰에 전달    |

---

### 🗂️ 데이터 흐름 요약

```mermaid
flowchart TD
    UI -->|입력| SearchBarViewModel
    SearchBarViewModel -->|execute()| SnippetUseCase
    SnippetUseCase -->|getSnippet(query)| SnippetRepository
    SnippetRepository -->|API 호출| SearchSnippetYoutubeService
    SearchSnippetYoutubeService -->|응답| SnippetRepository --> SnippetUseCase
    SnippetUseCase -->|streamingState| GridViewModel & ListViewModel
    GridViewModel & ListViewModel -->|UI 반영| GridView & ListView
```

---

### 🧰 기술 스택 및 구현 요소

* Flutter 3+
* Provider 상태관리
* RESTful API (YouTube Data API v3)
* MVVM 아키텍처
* 실시간 상태 전파(StreamController)
* UI: GridView, ListView, TextField, AppBar, Card, Image.network

---

### 📛 API 키 처리

* 앱 내에 포함되어 있던 **YouTube API 키는 현재 삭제된 상태**입니다.


---

### 📌 기타 참고 사항

* ViewModel에서 각 뷰 상태와 데이터를 관리하며, 동일한 UseCase 인스턴스를 통해 상태를 공유하는 구조
* 리스트뷰와 그리드뷰 전환은 단순 토글로 구현되어 사용자가 동적으로 변경 가능
* 정교한 예외 처리 및 에러 메시지 출력은 향후 보완 가능

---

### 👨‍💻 개발자

* **임단 / urbosa.dev**
