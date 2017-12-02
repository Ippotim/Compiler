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
  Variable1 dd 0
  Variable0 dd 0
  Variable4 dd 0
  Variable3 dd 0
  Variable2 dd 0
section .text
global _start
_start:
Address0:
  call In
  mov [Variable1],eax
Address1:
  push eax
  push ebx
  push ecx
  push edx
Address2:
  push eax
  push ebx
  push ecx
  push edx
Address3:
  push eax
  push ebx
  push ecx
  push edx
Address4:
  push eax
  push ebx
  push ecx
  push edx
Address5:
  push eax
  push ebx
  push ecx
  push edx
Address6:
  push eax
  push ebx
  push ecx
  push edx
Address7:
  push eax
  push ebx
  push ecx
  push edx
Address8:
  push eax
  push ebx
  push ecx
  push edx
Address9:
  push eax
  push ebx
  push ecx
  push edx
Address10:
  mov eax,1
Address11:
  mov [exp],eax
Address12:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address13:
  mov eax,[exp]
Address14:
  mov [exp],eax
Address15:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address16:
  mov eax,[exp]
Address17:
  mov [exp],eax
Address18:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address19:
  mov eax,[exp]
Address20:
  mov [exp],eax
Address21:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address22:
  mov eax,[exp]
Address23:
  mov [exp],eax
Address24:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address25:
  mov eax,[exp]
Address26:
  mov [exp],eax
Address27:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address28:
  mov eax,[exp]
Address29:
  mov [exp],eax
Address30:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address31:
  mov eax,[exp]
Address32:
  mov [exp],eax
Address33:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address34:
  mov eax,[exp]
Address35:
  mov [exp],eax
Address36:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address37:
  mov eax,[exp]
Address38:
  mov ebx,eax
Address39:
  mov ecx,ebx
Address40:
  push eax
  push ebx
  push ecx
  push edx
Address41:
  push eax
  push ebx
  push ecx
  push edx
Address42:
  mov eax,1
Address43:
  mov ebx,eax
Address44:
  mov ecx,ebx
Address45:
  push eax
  push ebx
  push ecx
  push edx
Address46:
  push eax
  push ebx
  push ecx
  push edx
Address47:
  mov eax,1
Address48:
  mov ebx,eax
Address49:
  mov ecx,ebx
Address50:
  push eax
  push ebx
  push ecx
  push edx
Address51:
  mov eax,1
Address52:
  mov ebx,eax
Address53:
  push eax
  push ebx
  push ecx
  push edx
Address54:
  mov eax,1
Address55:
  mov ebx,eax
Address56:
  push eax
  push ebx
  push ecx
  push edx
Address57:
  mov eax,1
Address58:
  mov ebx,eax
Address59:
  push eax
  push ebx
  push ecx
  push edx
Address60:
  mov eax,1
Address61:
  mov [exp],eax
Address62:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address63:
  Compute 3,ebx,[exp]
Address64:
  mov [exp],ebx
Address65:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address66:
  Compute 2,ebx,[exp]
Address67:
  mov [exp],ebx
Address68:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address69:
  Compute 2,ebx,[exp]
Address70:
  mov ecx,ebx
Address71:
  push eax
  push ebx
  push ecx
  push edx
Address72:
  mov eax,1
Address73:
  mov ebx,eax
Address74:
  push eax
  push ebx
  push ecx
  push edx
Address75:
  mov eax,1
Address76:
  mov ebx,eax
Address77:
  push eax
  push ebx
  push ecx
  push edx
Address78:
  mov eax,1
Address79:
  mov [exp],eax
Address80:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address81:
  Compute 3,ebx,[exp]
Address82:
  mov [exp],ebx
Address83:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address84:
  Compute 3,ebx,[exp]
Address85:
  mov [exp],ebx
Address86:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address87:
  Compute 1,ecx,[exp]
Address88:
  mov [exp],ecx
Address89:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address90:
  Compute 0,ecx,[exp]
Address91:
  mov [exp],ecx
Address92:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address93:
  mov eax,[exp]
Address94:
  mov ebx,eax
Address95:
  push eax
  push ebx
  push ecx
  push edx
Address96:
  push eax
  push ebx
  push ecx
  push edx
Address97:
  push eax
  push ebx
  push ecx
  push edx
Address98:
  push eax
  push ebx
  push ecx
  push edx
Address99:
  mov eax,0
Address100:
  mov [exp],eax
Address101:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address102:
  mov eax,[exp]
Address103:
  mov ebx,eax
Address104:
  push eax
  push ebx
  push ecx
  push edx
Address105:
  mov eax,1
Address106:
  mov [exp],eax
Address107:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address108:
  Compute 2,ebx,[exp]
Address109:
  mov [exp],ebx
Address110:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address111:
  mov eax,[exp]
Address112:
  mov ebx,eax
Address113:
  push eax
  push ebx
  push ecx
  push edx
Address114:
  push eax
  push ebx
  push ecx
  push edx
Address115:
  mov eax,0
Address116:
  mov ebx,eax
Address117:
  push eax
  push ebx
  push ecx
  push edx
Address118:
  push eax
  push ebx
  push ecx
  push edx
Address119:
  mov eax,1
Address120:
  mov ebx,eax
Address121:
  mov ecx,ebx
Address122:
  push eax
  push ebx
  push ecx
  push edx
Address123:
  mov eax,1
Address124:
  mov [exp],eax
Address125:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address126:
  Compute 0,ecx,[exp]
Address127:
  mov [exp],ecx
Address128:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address129:
  mov eax,[exp]
Address130:
  mov [exp],eax
Address131:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address132:
  Compute 2,ebx,[exp]
Address133:
  mov [exp],ebx
Address134:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address135:
  mov eax,[exp]
Address136:
  mov [exp],eax
Address137:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address138:
  Compute 2,ebx,[exp]
Address139:
  mov ecx,ebx
Address140:
  push eax
  push ebx
  push ecx
  push edx
Address141:
  mov eax,1
Address142:
  mov [exp],eax
Address143:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address144:
  Compute 0,ecx,[exp]
Address145:
  mov [exp],ecx
Address146:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address147:
  mov eax,[exp]
Address148:
  mov [exp],eax
Address149:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address150:
  Compute 2,ebx,[exp]
Address151:
  mov ecx,ebx
Address152:
  push eax
  push ebx
  push ecx
  push edx
Address153:
  mov eax,1
Address154:
  mov ebx,eax
Address155:
  mov ecx,ebx
Address156:
  push eax
  push ebx
  push ecx
  push edx
Address157:
  mov eax,1
Address158:
  mov [exp],eax
Address159:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address160:
  Compute 1,ecx,[exp]
Address161:
  mov [exp],ecx
Address162:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address163:
  Compute 0,ecx,[exp]
Address164:
  mov [exp],ecx
Address165:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address166:
  Compute 0,ecx,[exp]
Address167:
  mov [exp],ecx
Address168:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address169:
  mov eax,[exp]
Address170:
  mov ebx,eax
Address171:
  push eax
  push ebx
  push ecx
  push edx
Address172:
  mov eax,1
Address173:
  mov ebx,eax
Address174:
  push eax
  push ebx
  push ecx
  push edx
Address175:
  mov eax,1
Address176:
  mov ebx,eax
Address177:
  push eax
  push ebx
  push ecx
  push edx
Address178:
  mov eax,1
Address179:
  mov ebx,eax
Address180:
  push eax
  push ebx
  push ecx
  push edx
Address181:
  mov eax,1
Address182:
  mov ebx,eax
Address183:
  push eax
  push ebx
  push ecx
  push edx
Address184:
  mov eax,1
Address185:
  mov [exp],eax
Address186:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address187:
  Compute 3,ebx,[exp]
Address188:
  mov [exp],ebx
Address189:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address190:
  Compute 3,ebx,[exp]
Address191:
  mov [exp],ebx
Address192:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address193:
  Compute 3,ebx,[exp]
Address194:
  mov [exp],ebx
Address195:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address196:
  Compute 3,ebx,[exp]
Address197:
  mov [exp],ebx
Address198:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address199:
  Compute 2,ebx,[exp]
Address200:
  mov ecx,ebx
Address201:
  push eax
  push ebx
  push ecx
  push edx
Address202:
  push eax
  push ebx
  push ecx
  push edx
Address203:
  mov eax,1
Address204:
  mov ebx,eax
Address205:
  mov ecx,ebx
Address206:
  push eax
  push ebx
  push ecx
  push edx
Address207:
  push eax
  push ebx
  push ecx
  push edx
Address208:
  mov eax,1
Address209:
  mov ebx,eax
Address210:
  mov ecx,ebx
Address211:
  push eax
  push ebx
  push ecx
  push edx
Address212:
  mov eax,1
Address213:
  mov ebx,eax
Address214:
  push eax
  push ebx
  push ecx
  push edx
Address215:
  mov eax,1
Address216:
  mov ebx,eax
Address217:
  push eax
  push ebx
  push ecx
  push edx
Address218:
  mov eax,1
Address219:
  mov ebx,eax
Address220:
  push eax
  push ebx
  push ecx
  push edx
Address221:
  mov eax,1
Address222:
  mov [exp],eax
Address223:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address224:
  Compute 3,ebx,[exp]
Address225:
  mov [exp],ebx
Address226:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address227:
  Compute 2,ebx,[exp]
Address228:
  mov [exp],ebx
Address229:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address230:
  Compute 2,ebx,[exp]
Address231:
  mov ecx,ebx
Address232:
  push eax
  push ebx
  push ecx
  push edx
Address233:
  mov eax,1
Address234:
  mov ebx,eax
Address235:
  push eax
  push ebx
  push ecx
  push edx
Address236:
  mov eax,1
Address237:
  mov ebx,eax
Address238:
  push eax
  push ebx
  push ecx
  push edx
Address239:
  mov eax,1
Address240:
  mov [exp],eax
Address241:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address242:
  Compute 3,ebx,[exp]
Address243:
  mov [exp],ebx
Address244:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address245:
  Compute 3,ebx,[exp]
Address246:
  mov [exp],ebx
Address247:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address248:
  Compute 1,ecx,[exp]
Address249:
  mov [exp],ecx
Address250:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address251:
  Compute 0,ecx,[exp]
Address252:
  mov [exp],ecx
Address253:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address254:
  mov eax,[exp]
Address255:
  mov ebx,eax
Address256:
  push eax
  push ebx
  push ecx
  push edx
Address257:
  push eax
  push ebx
  push ecx
  push edx
Address258:
  push eax
  push ebx
  push ecx
  push edx
Address259:
  push eax
  push ebx
  push ecx
  push edx
Address260:
  mov eax,0
Address261:
  mov [exp],eax
Address262:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address263:
  mov eax,[exp]
Address264:
  mov ebx,eax
Address265:
  push eax
  push ebx
  push ecx
  push edx
Address266:
  mov eax,1
Address267:
  mov [exp],eax
Address268:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address269:
  Compute 2,ebx,[exp]
Address270:
  mov [exp],ebx
Address271:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address272:
  mov eax,[exp]
Address273:
  mov ebx,eax
Address274:
  push eax
  push ebx
  push ecx
  push edx
Address275:
  push eax
  push ebx
  push ecx
  push edx
Address276:
  mov eax,0
Address277:
  mov ebx,eax
Address278:
  push eax
  push ebx
  push ecx
  push edx
Address279:
  push eax
  push ebx
  push ecx
  push edx
Address280:
  mov eax,1
Address281:
  mov ebx,eax
Address282:
  mov ecx,ebx
Address283:
  push eax
  push ebx
  push ecx
  push edx
Address284:
  mov eax,1
Address285:
  mov [exp],eax
Address286:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address287:
  Compute 0,ecx,[exp]
Address288:
  mov [exp],ecx
Address289:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address290:
  mov eax,[exp]
Address291:
  mov [exp],eax
Address292:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address293:
  Compute 2,ebx,[exp]
Address294:
  mov [exp],ebx
Address295:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address296:
  mov eax,[exp]
Address297:
  mov [exp],eax
Address298:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address299:
  Compute 2,ebx,[exp]
Address300:
  mov ecx,ebx
Address301:
  push eax
  push ebx
  push ecx
  push edx
Address302:
  mov eax,1
Address303:
  mov [exp],eax
Address304:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address305:
  Compute 0,ecx,[exp]
Address306:
  mov [exp],ecx
Address307:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address308:
  mov eax,[exp]
Address309:
  mov [exp],eax
Address310:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address311:
  Compute 2,ebx,[exp]
Address312:
  mov ecx,ebx
Address313:
  push eax
  push ebx
  push ecx
  push edx
Address314:
  mov eax,1
Address315:
  mov ebx,eax
Address316:
  mov ecx,ebx
Address317:
  push eax
  push ebx
  push ecx
  push edx
Address318:
  mov eax,1
Address319:
  mov [exp],eax
Address320:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address321:
  Compute 1,ecx,[exp]
Address322:
  mov [exp],ecx
Address323:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address324:
  Compute 0,ecx,[exp]
Address325:
  mov [exp],ecx
Address326:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address327:
  Compute 0,ecx,[exp]
Address328:
  mov [exp],ecx
Address329:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address330:
  mov eax,[exp]
Address331:
  mov ebx,eax
Address332:
  push eax
  push ebx
  push ecx
  push edx
Address333:
  mov eax,1
Address334:
  mov ebx,eax
Address335:
  push eax
  push ebx
  push ecx
  push edx
Address336:
  mov eax,1
Address337:
  mov ebx,eax
Address338:
  push eax
  push ebx
  push ecx
  push edx
Address339:
  mov eax,1
Address340:
  mov ebx,eax
Address341:
  push eax
  push ebx
  push ecx
  push edx
Address342:
  mov eax,1
Address343:
  mov ebx,eax
Address344:
  push eax
  push ebx
  push ecx
  push edx
Address345:
  mov eax,1
Address346:
  mov [exp],eax
Address347:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address348:
  Compute 3,ebx,[exp]
Address349:
  mov [exp],ebx
Address350:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address351:
  Compute 3,ebx,[exp]
Address352:
  mov [exp],ebx
Address353:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address354:
  Compute 3,ebx,[exp]
Address355:
  mov [exp],ebx
Address356:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address357:
  Compute 3,ebx,[exp]
Address358:
  mov [exp],ebx
Address359:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address360:
  Compute 2,ebx,[exp]
Address361:
  mov [exp],ebx
Address362:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address363:
  Compute 1,ecx,[exp]
Address364:
  mov [exp],ecx
Address365:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address366:
  Compute 0,ecx,[exp]
Address367:
  mov [Variable-1],ecx
Address368:
  mov eax,[Variable-1]
Address369:
  call Out
Address370:
  mov eax,[Variable-1]
Address371:
  mov [Variable-1],eax
Address372:
  mov eax,[Variable-1]
Address373:
  call Out
Address374:
  jmp Address377
Address377:
  mov eax,[Variable-1]
Address378:
  mov [Variable-1],eax
Address379:
  mov eax,[Variable-1]
Address380:
  mov ebx,eax
Address381:
  mov ecx,ebx
Address382:
  push eax
  push ebx
  push ecx
  push edx
Address383:
  mov eax,[Variable-1]
Address384:
  mov [exp],eax
Address385:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address386:
  Compute 0,ecx,[exp]
Address387:
  mov [Variable-1],ecx
Address388:
  mov eax,[Variable-1]
Address389:
  mov [Variable-1],eax
Address390:
  mov eax,[Variable-1]
Address391:
  call Out
Address392:
  mov eax,[Variable1]
Address393:
  mov ebx,eax
Address394:
  mov ecx,ebx
Address395:
  push eax
  push ebx
  push ecx
  push edx
Address396:
  mov eax,1
Address397:
  mov [exp],eax
Address398:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address399:
  Compute 1,ecx,[exp]
Address400:
  mov [Variable1],ecx
Address401:
  mov eax,[Variable1]
Address402:
  mov ebx,eax
Address403:
  mov ecx,ebx
Address404:
  mov edx,ecx
Address405:
  push eax
  push ebx
  push ecx
  push edx
Address406:
  mov eax,0
Address407:
  mov [exp],eax
Address408:
  pop edx
  pop ecx
  pop ebx
  pop eax
Address409:
  Compute 5,edx,[exp]
Address375:
  cmp edx,0
  jnz Address410
Address376:
  jmp Address374
Address410:
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
