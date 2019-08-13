Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11CF78B5FE
	for <lists+linux-leds@lfdr.de>; Tue, 13 Aug 2019 12:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbfHMK4O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Aug 2019 06:56:14 -0400
Received: from mail-ot1-f70.google.com ([209.85.210.70]:44598 "EHLO
        mail-ot1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbfHMK4H (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Aug 2019 06:56:07 -0400
Received: by mail-ot1-f70.google.com with SMTP id q16so90268581otn.11
        for <linux-leds@vger.kernel.org>; Tue, 13 Aug 2019 03:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=hJ/lbGld6yzhFWLAY2oWQqeNefhcbdHYepSPmXFME9w=;
        b=NgrhnjLzLMgBolz1toEL6QI0+QzkaRpgar0be50WIXpacxvm12/csADq+oKJx432rl
         ZMPHHv7O+MmHbWtOVTAIWp1ROmmD1xQQ/An4WiEUdFnWutDmZebyrKfsdTcMjRzGDOE1
         huxn8CNG20nMZqwIvTgdSgGiaI8PUlMhriplYZd0aDAg8Xfgf4lpGi0h0nM+HfxLxVCO
         lFGjOIMmVz4mQ0vdHl7V5j9s0LH2Yzdz4ZhTXb3eBRk6hJhQQueE0OG9XALg3LuRKLqh
         q0GTVPYDJi3JWMMOoV4aqSuFiVEe0lviRmBgFOj4WLygh1Q3RFwa6PxVrqxXWAkkcT3H
         Xk0w==
X-Gm-Message-State: APjAAAUq9G5LttIp6+WAZ2C57mIdjbRz8xD55kdIk3/usuFaXDNvj+zq
        vrLtVW5eqEyLsCmQo1FiWvyiAGvv7DlRE02UQfGNIveJv8pe
X-Google-Smtp-Source: APXvYqxfPuAh04kBalAPA9dtHjzdZG5h10cSz0+J8ZAkKO2wh5ZqVoLdQd1f4nALJu1Qib5ALFsqQwTzogewDx0y2k3n1hpeSmXS
MIME-Version: 1.0
X-Received: by 2002:a6b:e013:: with SMTP id z19mr12867094iog.141.1565693766259;
 Tue, 13 Aug 2019 03:56:06 -0700 (PDT)
Date:   Tue, 13 Aug 2019 03:56:06 -0700
In-Reply-To: <000000000000f70a0e0571ad8ffb@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c3fe1b058ffd7c99@google.com>
Subject: Re: WARNING in untrack_pfn
From:   syzbot <syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com>
To:     Julia.Lawall@lip6.fr, bp@alien8.de, dan.j.williams@intel.com,
        dave.hansen@linux.intel.com, dave.jiang@intel.com,
        dvyukov@google.com, haozhong.zhang@intel.com, hpa@zytor.com,
        jacek.anaszewski@gmail.com, julia.lawall@lip6.fr,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        luto@kernel.org, mingo@redhat.com, pavel@ucw.cz,
        pbonzini@redhat.com, peterz@infradead.org, rkrcmar@redhat.com,
        rpurdie@rpsys.net, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    d45331b0 Linux 5.3-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16130d4a600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3d7eaed8496da4da
dashboard link: https://syzkaller.appspot.com/bug?extid=e1a4f80c370d2381e49f
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131f8e0e600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10e1a1ee600000

The bug was bisected to:

commit c68729119f4d2993bec3c9cb999ad76de5aeddba
Author: Julia Lawall <Julia.Lawall@lip6.fr>
Date:   Sat Jul 15 09:58:19 2017 +0000

     leds: tlc591xx: add missing of_node_put

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12cda0f3200000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11cda0f3200000
console output: https://syzkaller.appspot.com/x/log.txt?x=16cda0f3200000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com
Fixes: c68729119f4d ("leds: tlc591xx: add missing of_node_put")

RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000004432d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffffffffffffff R08: 0000000000000000 R09: 00000000004aa942
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
R13: 00007ffc1519c410 R14: 0000000000000000 R15: 0000000000000000
WARNING: CPU: 1 PID: 9558 at arch/x86/mm/pat.c:1065 untrack_pfn+0x222/0x370  
arch/x86/mm/pat.c:1064
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 9558 Comm: syz-executor347 Not tainted 5.3.0-rc4 #73
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x1d8/0x2f8 lib/dump_stack.c:113
  panic+0x25c/0x799 kernel/panic.c:219
  __warn+0x22f/0x230 kernel/panic.c:576
  report_bug+0x190/0x290 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  do_error_trap+0xd7/0x440 arch/x86/kernel/traps.c:272
  do_invalid_op+0x36/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:untrack_pfn+0x222/0x370 arch/x86/mm/pat.c:1064
Code: 4d b0 4c 8d 45 b8 4c 89 ff 31 d2 e8 98 1d 69 00 41 89 c6 31 ff 89 c6  
e8 8c 59 3d 00 45 85 f6 0f 84 af 00 00 00 e8 de 55 3d 00 <0f> 0b eb 63 e8  
d5 55 3d 00 48 b8 00 00 00 00 00 fc ff df 48 89 c1
RSP: 0018:ffff88808dabf9e0 EFLAGS: 00010293
RAX: ffffffff81362ea2 RBX: 1ffff11011b57f3f RCX: ffff8880959ae100
RDX: 0000000000000000 RSI: 00000000ffffffea RDI: 0000000000000000
RBP: ffff88808dabfa40 R08: ffffffff81362e94 R09: ffffed1012bd7598
R10: ffffed1012bd7598 R11: 0000000000000000 R12: 1ffff11012e3dc29
R13: 0000000000000000 R14: 00000000ffffffea R15: ffff8880971ee148
  unmap_single_vma+0x1f4/0x2e0 mm/memory.c:1256
  unmap_vmas+0x1b4/0x2b0 mm/memory.c:1309
  exit_mmap+0x27b/0x530 mm/mmap.c:3145
  __mmput+0x120/0x3a0 kernel/fork.c:1064
  mmput kernel/fork.c:1085 [inline]
  dup_mm+0x31b/0x340 kernel/fork.c:1362
  copy_mm kernel/fork.c:1402 [inline]
  copy_process+0x2563/0x5ac0 kernel/fork.c:2017
  _do_fork+0x13f/0x5b0 kernel/fork.c:2369
  __do_sys_clone kernel/fork.c:2524 [inline]
  __se_sys_clone kernel/fork.c:2505 [inline]
  __x64_sys_clone+0x1ec/0x230 kernel/fork.c:2505
  do_syscall_64+0xfe/0x140 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4432d9
Code: e8 1c 0d 03 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 5b 07 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffc1519c3b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000004432d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffffffffffffff R08: 0000000000000000 R09: 00000000004aa942
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
R13: 00007ffc1519c410 R14: 0000000000000000 R15: 0000000000000000
Kernel Offset: disabled
Rebooting in 86400 seconds..

