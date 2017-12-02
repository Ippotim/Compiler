%macro OutKernel 3 ;这里的3是参数个数而不是参数表中参数的代号，这个困扰了己一阵子。另外貌似不能用macro设置零参宏，define或许可以，那这样的零参宏就相当于子程序了吧
  push eax   ;必须把用到的寄存器压栈或作类似处理
  mov eax,4
  mov ebx,1
  mov ecx,%1
  mov edx,%2
  int 80h
  %if %3
  mov eax,4
  mov ebx,1
  mov ecx,_z
  mov edx,1
  int 80h
  %endif
  pop eax
%endmacro

%macro Compute 3
  mov eax,%2
  mov ebx,%3
  %if %1=0
  add eax,ebx
  %elif %1=1
  sub eax,ebx
  %elif %1=2
  imul eax,ebx
  %elif %1=3
  cdq
  idiv ebx
  %elif %1=4 ;<之比较操作
  cmp eax,ebx
  jb .b
  mov eax,0
  jmp .nb
.b:
  mov eax,1
.nb:
  %elif %1=5 ;=之比较操作
  cmp eax,ebx
  je .e
  mov eax,0
  jmp .ne
.e:
  mov eax,1
.ne:
  %endif
  mov %2,eax ;之前没有这一句则相当于该宏过程做了无用功。之前用//来注释导致莫名其妙的语法错误，让己紧张了一阵子
%endmacro

section .data
  x db 0
  ;else_if dd 0 ;确定是否掠过else_if之标志位
  minus db '-'
  base dd +1 ;保存+1和-1之输入负数由此实现
  z times 12 dd 0
  _z db 09h ;实际还可以把这两个存入z，之之所以times后面不能再单独定义数据也是因为没必要
  end db 0ah ;回车键
  exp dd 0 ;暂存exp的值
  Variable5 dd 0
  Variable2 dd 0
  Variable0 dd 0
  Variable3 dd 0
  Variable4 dd 0
  Variable1 dd 0
section .text
global _start
_start:
Address0:
  call In
  mov [Variable-1],eax
Address1:
  call In
  mov [Variable-1],eax
Address2:
  call In
  mov [Variable-1],eax
Address3:
  call In
  mov [Variable-1],eax
Address6:
  mov eax,[Variable-1]
Address7:
  mov ebx,eax
Address8:
  mov ecx,ebx
Address9:
  mov edx,ecx
Address10:
  push eax
  push ebx
  push ecx
  push edx
Address11:
  mov eax,0
Address12:
  mov [exp],eax
Address13:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address14:
  Compute 5,edx,[exp]
Address15:
  cmp edx,0
  jz Address4
Address18:
  mov eax,[Variable-1]
Address19:
  mov ebx,eax
Address20:
  mov ecx,ebx
Address21:
  mov edx,ecx
Address22:
  push eax
  push ebx
  push ecx
  push edx
Address23:
  mov eax,0
Address24:
  mov [exp],eax
Address25:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address26:
  Compute 5,edx,[exp]
Address27:
  cmp edx,0
  jz Address16
Address30:
  mov eax,[Variable-1]
Address31:
  mov ebx,eax
Address32:
  mov ecx,ebx
Address33:
  mov edx,ecx
Address34:
  push eax
  push ebx
  push ecx
  push edx
Address35:
  mov eax,0
Address36:
  mov [exp],eax
Address37:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address38:
  Compute 5,edx,[exp]
Address39:
  cmp edx,0
  jz Address28
Address42:
  mov eax,[Variable-1]
Address43:
  mov ebx,eax
Address44:
  mov ecx,ebx
Address45:
  mov edx,ecx
Address46:
  push eax
  push ebx
  push ecx
  push edx
Address47:
  mov eax,0
Address48:
  mov [exp],eax
Address49:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address50:
  Compute 5,edx,[exp]
Address51:
  cmp edx,0
  jz Address40
Address52:
  mov eax,0
Address53:
  call Out
Address54:
  jmp Address40
Address40:
  push edx
Address55:
  jmp Address41
Address41:
  nop
Address58:
  pop eax
Address59:
  cmp eax,0
  jz Address56
Address60:
  jmp Address57
Address56:
  nop
Address61:
  mov eax,1
Address62:
  call Out
Address57:
  jmp Address63
Address63:
  nop
Address64:
  jmp Address28
Address28:
  push edx
Address65:
  jmp Address29
Address29:
  nop
Address68:
  pop eax
Address69:
  cmp eax,0
  jz Address66
Address70:
  jmp Address67
Address66:
  nop
Address73:
  mov eax,[Variable-1]
Address74:
  mov ebx,eax
Address75:
  mov ecx,ebx
Address76:
  mov edx,ecx
Address77:
  push eax
  push ebx
  push ecx
  push edx
Address78:
  mov eax,0
Address79:
  mov [exp],eax
Address80:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address81:
  Compute 5,edx,[exp]
Address82:
  cmp edx,0
  jz Address71
Address83:
  mov eax,2
Address84:
  call Out
Address85:
  jmp Address71
Address71:
  push edx
Address86:
  jmp Address72
Address72:
  nop
Address89:
  pop eax
Address90:
  cmp eax,0
  jz Address87
Address91:
  jmp Address88
Address87:
  nop
Address92:
  mov eax,3
Address93:
  call Out
Address88:
  jmp Address94
Address94:
  nop
Address67:
  jmp Address95
Address95:
  nop
Address96:
  jmp Address16
Address16:
  push edx
Address97:
  jmp Address17
Address17:
  nop
Address100:
  pop eax
Address101:
  cmp eax,0
  jz Address98
Address102:
  jmp Address99
Address98:
  nop
Address105:
  mov eax,[Variable-1]
Address106:
  mov ebx,eax
Address107:
  mov ecx,ebx
Address108:
  mov edx,ecx
Address109:
  push eax
  push ebx
  push ecx
  push edx
Address110:
  mov eax,0
Address111:
  mov [exp],eax
Address112:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address113:
  Compute 5,edx,[exp]
Address114:
  cmp edx,0
  jz Address103
Address117:
  mov eax,[Variable-1]
Address118:
  mov ebx,eax
Address119:
  mov ecx,ebx
Address120:
  mov edx,ecx
Address121:
  push eax
  push ebx
  push ecx
  push edx
Address122:
  mov eax,0
Address123:
  mov [exp],eax
Address124:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address125:
  Compute 5,edx,[exp]
Address126:
  cmp edx,0
  jz Address115
Address127:
  mov eax,4
Address128:
  call Out
Address129:
  jmp Address115
Address115:
  push edx
Address130:
  jmp Address116
Address116:
  nop
Address133:
  pop eax
Address134:
  cmp eax,0
  jz Address131
Address135:
  jmp Address132
Address131:
  nop
Address136:
  mov eax,5
Address137:
  call Out
Address132:
  jmp Address138
Address138:
  nop
Address139:
  jmp Address103
Address103:
  push edx
Address140:
  jmp Address104
Address104:
  nop
Address143:
  pop eax
Address144:
  cmp eax,0
  jz Address141
Address145:
  jmp Address142
Address141:
  nop
Address148:
  mov eax,[Variable-1]
Address149:
  mov ebx,eax
Address150:
  mov ecx,ebx
Address151:
  mov edx,ecx
Address152:
  push eax
  push ebx
  push ecx
  push edx
Address153:
  mov eax,0
Address154:
  mov [exp],eax
Address155:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address156:
  Compute 5,edx,[exp]
Address157:
  cmp edx,0
  jz Address146
Address158:
  mov eax,6
Address159:
  call Out
Address160:
  jmp Address146
Address146:
  push edx
Address161:
  jmp Address147
Address147:
  nop
Address164:
  pop eax
Address165:
  cmp eax,0
  jz Address162
Address166:
  jmp Address163
Address162:
  nop
Address167:
  mov eax,7
Address168:
  call Out
Address163:
  jmp Address169
Address169:
  nop
Address142:
  jmp Address170
Address170:
  nop
Address99:
  jmp Address171
Address171:
  nop
Address172:
  jmp Address4
Address4:
  push edx
Address173:
  jmp Address5
Address5:
  nop
Address176:
  pop eax
Address177:
  cmp eax,0
  jz Address174
Address178:
  jmp Address175
Address174:
  nop
Address181:
  mov eax,[Variable-1]
Address182:
  mov ebx,eax
Address183:
  mov ecx,ebx
Address184:
  mov edx,ecx
Address185:
  push eax
  push ebx
  push ecx
  push edx
Address186:
  mov eax,0
Address187:
  mov [exp],eax
Address188:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address189:
  Compute 5,edx,[exp]
Address190:
  cmp edx,0
  jz Address179
Address193:
  mov eax,[Variable-1]
Address194:
  mov ebx,eax
Address195:
  mov ecx,ebx
Address196:
  mov edx,ecx
Address197:
  push eax
  push ebx
  push ecx
  push edx
Address198:
  mov eax,0
Address199:
  mov [exp],eax
Address200:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address201:
  Compute 5,edx,[exp]
Address202:
  cmp edx,0
  jz Address191
Address205:
  mov eax,[Variable-1]
Address206:
  mov ebx,eax
Address207:
  mov ecx,ebx
Address208:
  mov edx,ecx
Address209:
  push eax
  push ebx
  push ecx
  push edx
Address210:
  mov eax,0
Address211:
  mov [exp],eax
Address212:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address213:
  Compute 5,edx,[exp]
Address214:
  cmp edx,0
  jz Address203
Address215:
  mov eax,8
Address216:
  call Out
Address217:
  jmp Address203
Address203:
  push edx
Address218:
  jmp Address204
Address204:
  nop
Address221:
  pop eax
Address222:
  cmp eax,0
  jz Address219
Address223:
  jmp Address220
Address219:
  nop
Address224:
  mov eax,9
Address225:
  call Out
Address220:
  jmp Address226
Address226:
  nop
Address227:
  jmp Address191
Address191:
  push edx
Address228:
  jmp Address192
Address192:
  nop
Address231:
  pop eax
Address232:
  cmp eax,0
  jz Address229
Address233:
  jmp Address230
Address229:
  nop
Address236:
  mov eax,[Variable-1]
Address237:
  mov ebx,eax
Address238:
  mov ecx,ebx
Address239:
  mov edx,ecx
Address240:
  push eax
  push ebx
  push ecx
  push edx
Address241:
  mov eax,0
Address242:
  mov [exp],eax
Address243:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address244:
  Compute 5,edx,[exp]
Address245:
  cmp edx,0
  jz Address234
Address246:
  mov eax,10
Address247:
  call Out
Address248:
  jmp Address234
Address234:
  push edx
Address249:
  jmp Address235
Address235:
  nop
Address252:
  pop eax
Address253:
  cmp eax,0
  jz Address250
Address254:
  jmp Address251
Address250:
  nop
Address255:
  mov eax,11
Address256:
  call Out
Address251:
  jmp Address257
Address257:
  nop
Address230:
  jmp Address258
Address258:
  nop
Address259:
  jmp Address179
Address179:
  push edx
Address260:
  jmp Address180
Address180:
  nop
Address263:
  pop eax
Address264:
  cmp eax,0
  jz Address261
Address265:
  jmp Address262
Address261:
  nop
Address268:
  mov eax,[Variable-1]
Address269:
  mov ebx,eax
Address270:
  mov ecx,ebx
Address271:
  mov edx,ecx
Address272:
  push eax
  push ebx
  push ecx
  push edx
Address273:
  mov eax,0
Address274:
  mov [exp],eax
Address275:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address276:
  Compute 5,edx,[exp]
Address277:
  cmp edx,0
  jz Address266
Address280:
  mov eax,[Variable-1]
Address281:
  mov ebx,eax
Address282:
  mov ecx,ebx
Address283:
  mov edx,ecx
Address284:
  push eax
  push ebx
  push ecx
  push edx
Address285:
  mov eax,0
Address286:
  mov [exp],eax
Address287:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address288:
  Compute 5,edx,[exp]
Address289:
  cmp edx,0
  jz Address278
Address290:
  mov eax,12
Address291:
  call Out
Address292:
  jmp Address278
Address278:
  push edx
Address293:
  jmp Address279
Address279:
  nop
Address296:
  pop eax
Address297:
  cmp eax,0
  jz Address294
Address298:
  jmp Address295
Address294:
  nop
Address299:
  mov eax,13
Address300:
  call Out
Address295:
  jmp Address301
Address301:
  nop
Address302:
  jmp Address266
Address266:
  push edx
Address303:
  jmp Address267
Address267:
  nop
Address306:
  pop eax
Address307:
  cmp eax,0
  jz Address304
Address308:
  jmp Address305
Address304:
  nop
Address311:
  mov eax,[Variable-1]
Address312:
  mov ebx,eax
Address313:
  mov ecx,ebx
Address314:
  mov edx,ecx
Address315:
  push eax
  push ebx
  push ecx
  push edx
Address316:
  mov eax,0
Address317:
  mov [exp],eax
Address318:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address319:
  Compute 5,edx,[exp]
Address320:
  cmp edx,0
  jz Address309
Address321:
  mov eax,14
Address322:
  call Out
Address323:
  jmp Address309
Address309:
  push edx
Address324:
  jmp Address310
Address310:
  nop
Address327:
  pop eax
Address328:
  cmp eax,0
  jz Address325
Address329:
  jmp Address326
Address325:
  nop
Address330:
  mov eax,15
Address331:
  call Out
Address326:
  jmp Address332
Address332:
  nop
Address305:
  jmp Address333
Address333:
  nop
Address262:
  jmp Address334
Address334:
  nop
Address175:
  jmp Address335
Address335:
  nop
  OutKernel end,1,0
  mov eax,1
  int 80h
  
In:
  mov ecx,10
  mov edx,0
input: ;应该跳转到_start也是可以的，毕竟前面没有指令的话的话_start跟input是等价的
  push ecx
  push edx
retry:
  mov eax,3
  mov ebx,0
  mov ecx,x
  mov edx,1
  int 80h
  
  mov al,[x] ;这里只能用al之说明寄存器的选择是跟数据片段截取相关的
  
  cmp al,0ah ;以回车结束输入
  je ok
  cmp al,'-'
  jne go_on1
  mov edx,-1 ;之前用al，但由于后面是要imul eax,[base]所以存储大小不一致的话-1就会变成255则结果错误，这里用edx当然是即兴的之也可以用其他寄存器
  mov [base],edx
  jmp retry
go_on1:
  cmp al,'+'
  jne go_on2
  jmp retry
go_on2:
  cmp al,'0' ;只允许输入0~9
  jb retry
  cmp al,'9'
  ja retry
  
  sub eax,30h 
  pop edx
  pop ecx
;.mul:
;  imul eax,10
;  loop .mul
  add edx,eax
  imul edx,10
  
  loop input
  push edx
ok:
  pop edx
  pop ecx ;之前是pop得到想要的寄存器备份在栈里的值后就不pop其他寄存器的了，但由于子程序地址也存在栈里，所以不pop完在这里就会把ecx的数据作为子程序返回地址自然段错误
  mov eax,edx
  imul eax,[base]
  
  mov edx,+1
  mov [base],edx
  
  cdq ;没有这个会：浮点数例外 (核心已转储)
  mov ebx,10
  idiv ebx
  ret
  
Out:
  cmp eax,0
  jge N
  OutKernel minus,1,0 ;不能Out "-"
N:
  call toString
  OutKernel z,12,1
  mov eax,0
  mov ebx,0
  mov ecx,12
.reset: ;输出后要将z清零，否则会污染之后的使用
  mov [z+ebx],eax
  inc ebx
  loop .reset
  ret
  
;参数ax
;输出ax的10进制
toString:
  ;mov eax,[base]
  
  ;mov eax,[a]
  ;mov ebx,[b]
  ;add eax,ebx
  
  mov ecx,0
  ;处理负数
  cmp eax,0
  jge K
  mov ebx,0
  sub ebx,eax
  mov eax,ebx
K:
  mov ebx,10 ;之前y定义为db类型而ebx是32位的所以这里用mov ebx,[y]会由于执行后ebx为0则除0错误，貌似也不会，可能当时是编译到了另一个文件吧，之存储大小不匹配在特殊情况下才会导致程序出错，总之就是有时会有时不会，所以与其这样不如直接这样
L:
  cdq ;这个很有必要放在循环之中处理eax
  idiv ebx
  ;除法
  
  add edx,48
  push edx ;堆栈系统是虚拟增加寄存器数降低技巧要求的一个实用模型
  add ecx,1 ;这里inc ecx也可以
  cmp eax,0
  jne L
  mov ebx,0
M:
  pop edx
  mov [z+ebx],edx
  add ebx,1
  loop M
  ;余数
  ret
