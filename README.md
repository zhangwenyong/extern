

# extern 用法

## 利用extern引用同一个文件中的变量
```
void print()
{

//引用同一个文件中的变量。引用同一个文件中的变量 引用同一个文件中的变量
extern int num;
printf("%d\n",num);

}


int main(int argc, const char * argv[]) {
@autoreleasepool {



print();


}
return 0;
}

//全局变量
int num  = 0;



```
如果按照这个顺序 num在main函数之后 声明和初始化的时候 编译器应该 找不到num这个变量 但是我们使用了 extern这个关键字 告诉编译器这个变量是存在的  但不是之前声明的地方你去其他地方找找吧


## 引用另一个文件中的变量
如果extern 就这点能力 那么这个关键字就显得多余了  extern  这个关键字真正的作用是饮用另一文件中的变量和函数
```
ZWY_a.c

int  a = 5;

void print_a()
{

printf("我们在ZWY_a文件中");

}


main.c

int main()
{


extern int a;


printf("%d\n",a);


}
```
就像上面这样的这里ZWY_a.c中定义了一个变量a。如果main.c
中想引用这个变量a 直接用关键字extern 声明一下就可以了 。 注意这里能成功引用的原因是a 在ZWY_a.c中是一个全局变量也就是说当一个变量是全局变量时才会起作用 。当变量不是全局变量时 时不会起作用的。 <font color = "#dddd">另外extern关键字只需声明类型和变量名就可以了 不能在重新赋值
```
extern int a;

```
如果想赋值 用下面这种方法
```
extern int a;
a =10;
```
如果不进行初始化的话。全局变量会被编译器初始化为0；
如果想这个全局变量不想被修改 可以使用const关键字<font/>
```
extern const int a;

```
使用include 包含一个文件的话 会把另一个文件中的所有变量和函数都包含进去 就可以引用另外一个文件的所有变量和函数  虽然可以使用了 但是这样不安全 如果只希望一个文件使用另外一个文件中的某个变量还是使用extern跟好

##  extern 引用另外一个文件中的函数


```

ZWY_a.c

void print_a()
{

printf("我们在ZWY_a文件中");

}





main.c
int main()
{

extern void print_a(void);


print_a();


return 0;
}
或者main.c是这样的
main.c

extern void print_a(void);
int main()
{



print_a();


return 0;
}
说了这个extern函数很费可以简化成这样
void print_a(void);
int main()
{



print_a();


return 0;
}
```
就像上面的ZWY_a.c中的函数 如果想 print_a()能被main.c 文件调用，那么这个函数 就必须是外部函数 那么 这个函数 完整的定义 必须在加上关键字extern
```
ZWY_a.c

extern void print_a()
{

printf("我们在ZWY_a文件中");

}

为了项目的模块化  会把 这个模块的所有 外部函数都集合一个
.h 的头文件中  这样  每次只需要包含这个 头文件 就可以了  所有的都可以屌用了
```
不过这个关键字很费 可以忽略 函数 默认就是外部函数


而且 static 就是内部函数（静态函数）

总结
```
1.static

* 在定义函数时，在函数的最左边加上static可以把该函数声明为内部函数(又叫静态函数)，这样该函数就只能在其定义所在的文件中使用。如果在不同的文件中有同名的内部函数，则互不干扰。
* static也可以用来声明一个内部函数
2.extern

* 在定义函数时，如果在函数的最左边加上关键字extern，则表示此函数是外部函数，可供其他文件调用。C语言规定，如果在定义函数时省略extern，则隐含为外部函数。

* 在一个文件中要调用其他文件中的外部函数，则需要在当前文件中用extern声明该外部函数，然后就可以使用，这里的extern也可以省略。
```

```
1.extern可以用来声明一个全局变量，但是不能用来定义变量

2.默认情况下，一个全局变量是可以供多个源文件共享的，也就说，多个源文件中同名的全局变量都代表着同一个变量

3.如果在定义全局变量的时候加上static关键字，此时static的作用在于限制该全局变量的作用域，只能在定义该全局变量的文件中才能使用，跟其他源文件中的同名变量互不干扰
```



