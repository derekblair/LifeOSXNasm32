
global _update

segment .data

blast db 255

segment .text

_update:
  push ebx
  push edi
  push esi
  push ebp
  mov ebp,ecx
  mov ebx,eax
  mov ecx,784382
  ulp:
  xor eax,eax
  mov eax,[ebx+ecx]
  add eax,[ebx+ecx+1024]
  add eax,[ebx+ecx+2048] 
  add ah,al
  shr eax,8
  add al,ah
  cmp al,3
  setz byte [edx+ecx+1025]
  cmp al,4
  setz al
  and al,[ebx+ecx+1025] 
  or [edx+ecx+1025],al
  mov al,[edx+ecx+1025]
  mul byte [blast]
  mov [ebp+ecx+1025],al
  loop ulp  
  mov ecx,030000h
  mov edi,ebx
  mov esi,edx
  cld
  rep movsd
  pop ebp 
  pop esi
  pop edi
  pop ebx
  ret 