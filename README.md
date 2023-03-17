# [Flutter] 흔드는 랜덤 주사위 앱 만들기


### **완성된 **

![https://blog.kakaocdn.net/dn/n5zRs/btr4ylFjNq8/GYt5rmdCANyRH8exC3aNm1/img.gif](https://blog.kakaocdn.net/dn/n5zRs/btr4ylFjNq8/GYt5rmdCANyRH8exC3aNm1/img.gif)


### **TabBarView 위젯**

**TabBarView**는 PageView와 유사한 기능을 제공하며, Tab 위젯들과 연동할 수 있는 UI를 제공한다.

보여주고자 하는 화면을 children 매개변수에 각 Tab에 넣고자 하는 화면을 List로 넣으면 된다.

### **TabController 정의 및 초기화**

TabBarView를 사용하기 위해서는 **TabController**를 필수적으로 정의를 해줘야 한다.

TabController를 초기화 히기 위해서는 vsync를 사용해야 하는데 이는 **TickerProviderMixin**을 **믹스인(mixin)**으로 제공해줘야 사용이 가능하다.

TabController는 위젯이 생성될 때 한번 초기화가 되어야 하는데, 이는 StatefullWidget의 initState()에서 진행을 해준다.

위의 내용을 코드로 나타내면 아래와 같다.

```dart
// ignore_for_file: prefer_const_constructorsimport 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);//컨트롤러 초기화 length: 탭 개수
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,//컨트롤러 등록, TabBarView 조작 가능
        children: renderTabScreen(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }
}

List<Widget> renderTabScreen() {
  return [];
}
```

**TabController(length : 2, vsync: this);** 를 사용해 TabController를 초기화와 함께 선언을 해준다. 여기서 length는 사용할 탭의 개수를 의미하며, int값을 넣어준다.

**vsync**에는 TickerProviderStateMixin을 사용하는 State 클래스를 **this**의 형태로 넣어준다.

### **TickerProviderStateMixin과 vsync란?**

TickerProviderStateMixin는 플러터 기기가 60FPS(초당 60프레임) ~ 120FPS를 지원하는데 TickerProviderStateMixin를 사용하면 정확히 1FPS마다 애니메이션을 실행하게 된다.

TickerProviderStateMixin를 사용하지 않으면 1FPS보다 더 자주 렌더링을 실행하게 되는데, 자원의 비효율적인 사용을 TickerProviderStateMixin가 막아주는 것이다.

말그대로 TickerProviderStateMixin는 애니메이션 렌더링의 효율성을 부여한다.

마찬가지로 vsync에 TickerProviderStateMixin를 제공함으로써 렌더링에 효율성을 부여한다.

---

### **BottomNavigationBar 위젯**

BottomNavigationBar 위젯은 각 탭을 Nav의 형태로 클릭으로 이동할 수 있도록 해준다.

itmes 매개변수로 탭 Nav로 사용할 아이콘과 레이블을 전달하면 된다.

### **BottomNavigationBarItem**

BottomNavigationBarItem 클래스를 사용해 탭으로 사용할 부분의 icon과 label을 정의해줘야 한다.

icon 매개변수에 아이콘을 지정하고 label 매개변수에 이름을 지정한다.

탭의 개수에 맞게 BottomNavigationBarItem를 선언한다.

```dart
BottomNavigationBar renderBottomNavigation() {
  return BottomNavigationBar(items: [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_handball_sharp,
      ),
      label: 'Dice',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Setting',
    ),
  ]);
}
```

![https://blog.kakaocdn.net/dn/c43sfm/btr4ki906F2/KkzhCug5udH7Ej1DFktsY1/img.png](https://blog.kakaocdn.net/dn/c43sfm/btr4ki906F2/KkzhCug5udH7Ej1DFktsY1/img.png)

현재까지의 코드

```dart
// ignore_for_file: prefer_const_constructorsimport 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);//컨트롤러 초기화 length: 탭 개수
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,//컨트롤러 등록, TabBarView 조작 가능
        children: renderTabScreen(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderTabScreen() {
//탭마다의 스크린 구현return [
      Container(
        child: Center(
          child: Text('Tab1,'),
        ),
      ),
      Container(
        child: Center(
          child: Text('Tab2'),
        ),
      ),
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
//하단 Nav바 구현return BottomNavigationBar(items: [
      BottomNavigationBarItem(
//주사위 스크린 구현
        icon: Icon(
          Icons.sports_handball_sharp,
        ),
        label: 'Dice',
      ),
      BottomNavigationBarItem(
//설정 스크린 구현
        icon: Icon(
          Icons.settings,
        ),
        label: 'Setting',
      ),
    ]);
  }
}
```

위에서 renderTabScreen 함수 부분에 Container 2개는 탭을 클릭했을 때 이동이 되는지 확인하기 위해 임의로 넣어놓은 컨테이너이다.

---

### **TabController 연동으로 TabNav를 통한 화면 전환**

위의 코드까지 작성했을 때 탭을 누르면 화면 전환이 되지 않는다.

BottomNavigationBar를 누를 때마다 TabBarView가 작동되도록 연동을 해야 하기 때문이다.

여기에서 이전에 초기화를 한 **TabController**에 **Listner**를 추가해 사용한다.

### **controller!.addListener()**

하단의 Nav바에서 탭을 번갈아 클릭했을 때, 보여지는 TabBarView를 다시 그려줘야 하기 때문에 addListener() 함수를 사용해 controller 속성이 변할 때마다 특정 함수를 실행할 수 있도록 콜백함수로 등록한다.

Listener의 등록은 위젯이 생성될 때 한번만 이루어지면 되니 initState()에서 실행한다.

```dart
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);//컨트롤러 초기화 length: 탭 개수
    controller!.addListener(tabListener());//컨트롤러 호출될 때 실행할 함수 선언
  }
```

### **콜백함수에서 setState()**

위에서 언급한 콜백함수를 아래에 tabListener()라는 함수로 선언하는데, 해당 함수에서 setState()를 실행해 controller 속성이 변경될 때마다 build()를 재실행하도록 한다.

```dart
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);//컨트롤러 초기화 length: 탭 개수
    controller!.addListener(tabListener());//컨트롤러 호출될 때 실행할 함수 선언
  }

  tabListener() {
//리스너로 사용할 함수 선언
    setState(() {});
  }
```

### **dispose()를 사용한 리스너 함께 삭제**

dispose() 함수를 오버라이드해서 controller에 붙은 리스너를 위젯이 삭제할 때 함께 삭제가 되도록 한다.

```dart
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);//컨트롤러 초기화 length: 탭 개수
    controller!.addListener(tabListener());//컨트롤러 호출될 때 실행할 함수 선언
  }

  tabListener() {
//리스너로 사용할 함수 선언
    setState(() {});
  }

  @override
  void dispose() {//dispose로 리스너 함수 없애기
    controller!.removeListener(tabListener);
    super.dispose();
  }
```

### **initState(), dispose() 상태관리 라이프사이클**

위와 같이 initState(), dispose()와 같은 상태관리 오버라이드 함수를 알지 못 한다면 아래의 글을 참고해 Flutter 라이프사이클을 파악하도록 하자.

[[Flutter] 위젯 상태관리 라이프사이클](https://parkjh7764.tistory.com/185)

[[Flutter] 위젯 상태관리 라이프사이클 / StatelessWidget, StatefulWidget LifeCycle 함수 메서드 정리
목차 라이프사이클 (Life Cycle = 생명주기)란? Foreground/Background 상태에 있을 때, 시스템이 발생시키는 event에 의해 App의 상태가 전환되는 일련의 과정을 말한다. 쉽게 말하면 사용자가 앱을 실행하
parkjh7764.tistory.com](https://parkjh7764.tistory.com/185)

---

### **BottomNavigationBar의 currentIndex 매개변수**

currentIndex 매개변수는 현재 화면에 랜더링되는 탭의 인덱스를 의미하며 현재 상태로 표시해야 하는 **BottomNavigationBarItem의 인덱스(Index)**를 의미한다.

### **BottomNavigationBar의 onTap 매개변수**

onTap 매개변수에는 탭이 클릭될 때마다 실행되는 함수를 정의하며 BottomNavigationBarItem이 눌릴 때 눌린 탭의 인덱스(Indext)를 전달해준다.

탭을 눌렀을 때 animateTo() 함수를 사용해 자연스러운 애니메이션 효과가 들어가 자연스럽게 지정한 탭으로 TabBarView가 전환될 수 있도록 하며 괄호 안에 index 값을 넣어준다.

```dart
  BottomNavigationBar renderBottomNavigation() {
//하단 Nav바 구현return BottomNavigationBar(
      currentIndex: controller!.index,//현재 탭에 띄워진 화면의 인덱스
      onTap: (int index) {//탭 클릭할 때 실행될 함수
        setState(() {
          controller!.animateTo(index);
        });
      },
```

![https://blog.kakaocdn.net/dn/rcUBF/btr4gV2iQ2x/2H0mroTIcr1J9Gr9AsJuJ1/img.gif](https://blog.kakaocdn.net/dn/rcUBF/btr4gV2iQ2x/2H0mroTIcr1J9Gr9AsJuJ1/img.gif)

## **dice_screen.dart 전체 코드**

```dart
// ignore_for_file: prefer_const_constructorsimport 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);//컨트롤러 초기화 length: 탭 개수
    controller!.addListener(tabListener);//컨트롤러 호출될 때 실행할 함수 선언
  }

  tabListener() {
//리스너로 사용할 함수 선언
    setState(() {});
  }

  @override
  void dispose() {
//dispose로 리스너 함수 없애기
    controller!.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,//컨트롤러 등록, TabBarView 조작 가능
        children: renderTabScreen(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderTabScreen() {
//탭마다의 스크린 구현return [
      Container(
        child: Center(
          child: Text('Tab1,'),
        ),
      ),
      Container(
        child: Center(
          child: Text('Tab2'),
        ),
      ),
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
//하단 Nav바 구현return BottomNavigationBar(
      currentIndex: controller!.index,//현재 탭에 띄워진 화면의 인덱스
      onTap: (int index) {//탭 클릭할 때 실행될 함수
        setState(() {
          controller!.animateTo(index);
        });
      },
      items: [
        BottomNavigationBarItem(
//주사위 스크린 구현
          icon: Icon(
            Icons.sports_handball_sharp,
          ),
          label: 'Dice',
        ),
        BottomNavigationBarItem(
//설정 스크린 구현
          icon: Icon(
            Icons.settings,
          ),
          label: 'Setting',
        ),
      ],
    );
  }
}
```


### **Slider 매개변수와 값**

**min, max** : Slider의 왼쪽 끝과 오른쪽 끝으로 최대한 이동할 수 있는 값

**divisions** : min과 max에 설정한 값을 divisions에 설정한 수 만큼 구간으로 나눔, 이동할 때마다 해당 구간 한칸씩 이동

**value** : 현재의 값으로, 노브의 위치가 됨

**onChanged** : Slider의 콜백함수를 설정, 콜백함수에서 setState()를 실행시켜 매개변수로 받은 현재값을 계속적으로 갱신함.

**label : pickerValue.toString()** : Slider 움직일 때 label 형태로 상단에 표현

![https://blog.kakaocdn.net/dn/xmUr6/btr4tLy2KHF/AGu5BZHrxtfRiiB9RJwNeK/img.png](https://blog.kakaocdn.net/dn/xmUr6/btr4tLy2KHF/AGu5BZHrxtfRiiB9RJwNeK/img.png)

**label : pickerValue.toStringAsFixed(1)** : 소숫점 1번째 자릿수까지 label로 표현

![https://blog.kakaocdn.net/dn/tnmqd/btr4tNjjQIC/QxU6NBt9c8ZjBdKneXc761/img.png](https://blog.kakaocdn.net/dn/tnmqd/btr4tNjjQIC/QxU6NBt9c8ZjBdKneXc761/img.png)

---

### **Slider를 작동시키기 위한 dice_screen.dart에서 SettingScreen 작성**

### **변수와 함수 선언**

```
  double pickerValue = 1.0;//민감도 초기 값 설정//Slider 변경 시 실행되는 함수void onPickerChange(double val) {
    setState(() {
      pickerValue = val;
    });
  }
```

### **두 번째Tab 부분에 SettingScreen 추가**

```
  List<Widget> renderTabScreen() {
//탭마다의 스크린 구현return [
      HomeScreen(number: 1),
      SettingScreen(pickerValue: pickerValue, onPickerChange: onPickerChange)
    ];
  }
```

### **작동 화면**

![https://blog.kakaocdn.net/dn/LntmH/btr4vopy2AH/yMTN9QUoFoGi0yaMjAywA1/img.gif](https://blog.kakaocdn.net/dn/LntmH/btr4vopy2AH/yMTN9QUoFoGi0yaMjAywA1/img.gif)

---

## **흔들림을 감지하는 shake 플러그인 적용하기**

휴대폰이 흔들릴 때마다 새로운 주사위가 나타나야 하므로, 주사위 숫자에 해당하는 부분을 변수로 다뤄야 한다.

### **주사위 숫자 변수로 선언**

![https://blog.kakaocdn.net/dn/9OITZ/btr4wLqZaa5/hUWS9suSjfEPg6jKyYdoK0/img.png](https://blog.kakaocdn.net/dn/9OITZ/btr4wLqZaa5/hUWS9suSjfEPg6jKyYdoK0/img.png)

![https://blog.kakaocdn.net/dn/bGkQbl/btr4xKeanlv/vvkpnVKIwobZTaU1bAK8IK/img.png](https://blog.kakaocdn.net/dn/bGkQbl/btr4xKeanlv/vvkpnVKIwobZTaU1bAK8IK/img.png)

### **initState()로 상태관리 - Shake 플러그인 설정**

```
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);//컨트롤러 초기화 length: 탭 개수
    controller!.addListener(tabListener);//컨트롤러 호출될 때 실행할 함수 선언

    shakeDetector = ShakeDetector.autoStart(
      shakeSlopTimeMS: 100,//흔들기 감지 주기(Time)
      shakeThresholdGravity: pickerValue,//흔들기 감지 민감도 설정
      onPhoneShake: onPhoneShake,//흔들기 감지되었을 때 실행될 함수 설정
    );
  }
```

- **ShakeDetector.autoStart()** : autoStart 생성자는 코드가 실행되는 순간부터 흔들기를 감지하도록 함.
- **shakeSlopTimeMS** : 얼마나 자주 흔들기를 감지할 지 밀리초 단위를 입력한다. 한번 흔들림이 감지가 되면 설정한 시간이 지나기까지 흔들기를 감지하지 않는다.
- **shakeThresholdGravity** : 흔들기를 감지하는 민감도 설정, 밀감도 설정 값 변수인 'pickerValue'로 설정해준다.
- **onPhoneShake** : 휴대폰 흔들기를 감지했을 때 실행될 함수를 설정해준다.

### **onPhoneShake 함수 선언 - 흔들기 감지 시 실행될 함수**

- 휴대폰을 흔들 때 주사위가 무작위가 나와야 하므로 난수를 생성하는 **Random 클래스**를 사용한다.
- 이는 **dart:math 패키지**를 import 해야 한다.
- **Random** 클래스는 nextInt() 함수를 제공하는데, **최소 0**부터 매개변수로 **넣은 int 값을 최대**로 한다.
    - 주사위 숫자는 1부터 6사이니 5를 최대로 하고 1을 더해서 만들어준다.
- setState()를 통해 생성한 난수를 주사위 숫자에 해당하는 변수인 number에 넣어준다.

```
  void onPhoneShake() {
    final rand = new Random();//무작위 숫자

    setState(() {
      number = rand.nextInt(5) + 1;//0부터 5까지에서 +1 => 1~6까지로 변경
    });
  }
```

### **dispose()로 상태관리 - 흔들기 감지**

- 앱 실행 중지 및 삭제 시 흔들기 감지도 함께 중지가 되도록 설정한다.
- **stopListening()** 함수를 실행하면 리스너를 제거할 수 있다.

```
  @override
  void dispose() {
//dispose로 리스너 함수 없애기
    controller!.removeListener(tabListener);
    shakeDetector!.stopListening();//앱 삭제시 흔들기 감지도 함께 중지super.dispose();
  }
```

## **완성된 화면**

![https://blog.kakaocdn.net/dn/n5zRs/btr4ylFjNq8/GYt5rmdCANyRH8exC3aNm1/img.gif](https://blog.kakaocdn.net/dn/n5zRs/btr4ylFjNq8/GYt5rmdCANyRH8exC3aNm1/img.gif)
