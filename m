Return-Path: <linux-leds+bounces-1432-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FABE89CC59
	for <lists+linux-leds@lfdr.de>; Mon,  8 Apr 2024 21:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47BFB1C2170C
	for <lists+linux-leds@lfdr.de>; Mon,  8 Apr 2024 19:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A38614533A;
	Mon,  8 Apr 2024 19:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="K7UWHmpJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="swqlnenr"
X-Original-To: linux-leds@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C7F143C59;
	Mon,  8 Apr 2024 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712604132; cv=none; b=m0xNvZcpdbe3ljAMmaclGS/WlzmbVMjWziSMvB3y8i3ivxTql/LEYdaLSPQxBJSarCXyE94t3JGrGomvllBO5ZBbMkN3rl5rVoxgLXvzXpQh4XrHOzsmoDBFCVEL588/jrIpzRbhKWYmJH+AmlvpyTboOMYLJgW+vqBeBj4/1CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712604132; c=relaxed/simple;
	bh=Rw9IFOnEBCicwaGlH8ecRN2r1NxESmq9TD7t3kCONrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPKtI7n0d0Kvb17J1cPz8FsezjVTrggClOyyDF0lxBJ6nUYbRV3RpAHkFUYBgCoTd0nvlbG1l/u9fhszHm9pFNTbkJaDNv9oTvoo2Mvt5dsyly4F3OOlnefu3PTasiyf7ikOQo/wi8dohWRYr3ISrF54UfSb2+AGzqMv8wOXZ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com; spf=none smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=K7UWHmpJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=swqlnenr; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=invisiblethingslab.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 15EDF13800E7;
	Mon,  8 Apr 2024 15:22:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 08 Apr 2024 15:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1712604129; x=1712690529; bh=OM
	rRvq4Iqu/zIvPT1p/NI6auBHl3fwxbb+lwjrIxmN4=; b=K7UWHmpJz0ZoEq0GYY
	H6PJOX9+K6EWlZIHP0E0zEKmMUBfzEvFw9qy2hVmR5zVp/9vGxgJW9eiY5EZG2C5
	AXBkfrClRpM9v8/C19HQJJOz9TlrhRUSZ38J4tyBjnHkzXD1P3dSo1ZE3CXUjHAA
	VHXlOIP5trfqg1QzEc30E5oNl5NQQrcmti2DisNepBspaTAoYNAUYRb2Lt7jMfM4
	JwQs65F6IEbGUR9/rVOd4md6X0QFbfw60reg6PkUAMBSrWsXaU4KR3gAObV83bU9
	oDZ4LHslDLduFbfuAdIj9ck8S3Xs4TKq7MUF8mgVGI31KzbnWCUm+nFytNvH7k7t
	xMAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1712604129; x=1712690529; bh=OMrRvq4Iqu/zIvPT1p/NI6auBHl3fwxbb+l
	wjrIxmN4=; b=swqlnenrgZgF8YtQojw1CHK2jMRsxz0hwwVmqjFjKAxBMCK6VBk
	R74c2770NM1DOXEm5EXjnXrw+d4bFrlehLurVt/GtAxxUiuoe0dgPrKh6m3V4twT
	4nX+zbgnS0m2vOo2YsLk+GRJUgI7YqYJWJ8CQLEjzW7ymz1oYVelcCxQqcmfu2+t
	5YbZZYzvLsTyLBulbaV9wlj3PJuDW925xzGjysLX3cyCtBqXTU8FSOKyVIt0ftHL
	XOt8ZqnDJnWeGT8TiRZ0Wo/ljm3qVLYeZil8uAz8wPAQHeDtyFyNmIM27vuOWt0H
	K8DdM0LjFSwmdqHY7j6jzvABS/chZkhrmag==
X-ME-Sender: <xms:4EMUZmw65ClnQrCF37cKHbctwGyMuHGqI69faH6P2CgO3hkt4F2XYA>
    <xme:4EMUZiQEMK4SyVnLKKb6kEgETEdH-UvUKJ3ZAuIgFQYSQ_UpmAhjCC0WuCZRm55zl
    o-rzo9RvF4m3Q>
X-ME-Received: <xmr:4EMUZoVzuk5oAWfmN11qlbIYodd_Wr6h6An6igjSfiZYWrXVxKl159lRYny4xoG7wLZBb3cvArHbBzdF3zjfSaBL1GpnRZvg1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudegiedgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkgggtugesghdtre
    ertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhephfetuefhiefgtddtlefggffggeevhedtvdefffeugfei
    ieeiheefteefgefggeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:4EMUZsgZrCKl4hoqoE-DrKYnvga5VU86z7pY_RQnP58ui9P9lfENCw>
    <xmx:4EMUZoBuFNPovYmB01h_zOhzlZEXQ7cRwZyG7qMW17vTYpql3YIgNA>
    <xmx:4EMUZtKo4Jnmnomv6LIPm4hiJBIZ7PObe_43z25WsejdNp23FooFTA>
    <xmx:4EMUZvAeiozwSITluWk_RS-FU5eJA6Ee4ulpz6yPyNXUufeRRQiHqw>
    <xmx:4UMUZrPLjhtvIsx82tJpZypKgtOgv0UW-qduAPn_bFxpCAPWv3fqn2Wr>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Apr 2024 15:22:08 -0400 (EDT)
Date: Mon, 8 Apr 2024 21:22:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: netdev@vger.kernel.org, linux-leds@vger.kernel.org
Cc: regressions@lists.linux.dev
Subject: 6.9-rc2: Deadlock on unbinding network device from a driver
 (regression)
Message-ID: <ZhRD3cOtz5i-61PB@mail-itl>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rb0skLUNgwT7nFvb"
Content-Disposition: inline


--rb0skLUNgwT7nFvb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 8 Apr 2024 21:22:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: netdev@vger.kernel.org, linux-leds@vger.kernel.org
Cc: regressions@lists.linux.dev
Subject: 6.9-rc2: Deadlock on unbinding network device from a driver
 (regression)

Hi,

After updating to 6.9-rc2 I can no longer unbind device from the igc
driver. "echo" into "unbind" file hangs, and via sysrq "w" I get this
call trace:

    [   84.553112] Call Trace:
    [   84.553118]  <TASK>
    [   84.553123]  __schedule+0x23b/0x5c0
    [   84.553134]  schedule+0x27/0xa0
    [   84.553142]  schedule_preempt_disabled+0x15/0x30
    [   84.553152]  __mutex_lock.constprop.0+0x34c/0x6a0
    [   84.553165]  unregister_netdevice_notifier+0x25/0xc0
    [   84.553178]  netdev_trig_deactivate+0x1e/0x60 [ledtrig_netdev]
    [   84.553195]  led_trigger_set+0x105/0x340
    [   84.553206]  led_classdev_unregister+0x4a/0x110
    [   84.553219]  release_nodes+0x3d/0xb0
    [   84.553229]  devres_release_all+0x8c/0xc0
    [   84.553238]  device_del+0x27a/0x3f0
    [   84.553248]  unregister_netdevice_many_notify+0x46a/0x6a0
    [   84.553260]  unregister_netdevice_queue+0xf0/0x130
    [   84.553271]  unregister_netdev+0x1c/0x30
    [   84.553280]  igc_remove+0xe3/0x1d0 [igc]
    [   84.553298]  pci_device_remove+0x3f/0xb0
    [   84.553308]  device_release_driver_internal+0x19f/0x200
    [   84.553320]  unbind_store+0xa1/0xb0
    [   84.553329]  kernfs_fop_write_iter+0x11f/0x200
    [   84.553341]  vfs_write+0x293/0x460
    [   84.553351]  ksys_write+0x6f/0xf0
    [   84.553360]  do_syscall_64+0x87/0x170
    [   84.553368]  ? syscall_exit_work+0xf3/0x120
    [   84.553378]  ? syscall_exit_to_user_mode+0x69/0x220
    [   84.553389]  ? do_syscall_64+0x96/0x170
    [   84.553397]  ? do_syscall_64+0x96/0x170
    [   84.553404]  ? do_syscall_64+0x96/0x170
    [   84.553412]  ? do_syscall_64+0x96/0x170
    [   84.553420]  ? __irq_exit_rcu+0x4b/0xb0
    [   84.553429]  entry_SYSCALL_64_after_hwframe+0x71/0x79
    [   84.553439] RIP: 0033:0x7b46ae7c5ee4
    [   84.553446] RSP: 002b:00007ffe580c2dd8 EFLAGS: 00000202 ORIG_RAX: 00=
00000000000001
    [   84.553460] RAX: ffffffffffffffda RBX: 000000000000000d RCX: 00007b4=
6ae7c5ee4
    [   84.553474] RDX: 000000000000000d RSI: 00006458ac50b4b0 RDI: 0000000=
000000001
    [   84.553487] RBP: 00007ffe580c2e00 R08: 0000000000000073 R09: 0000000=
000000001
    [   84.553500] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000=
00000000d
    [   84.553514] R13: 00006458ac50b4b0 R14: 00007b46ae8965c0 R15: 00007b4=
6ae893f20
    [   84.553528]  </TASK>

It worked fine on 6.8.4.

Similar issue happens on few other systems, including one with Realtek
RTL8111/8168/8411 device, so it may be not specific to the igc driver
but some common API (LED trigger?). The issue does not affect a system
with e1000e driver.=20

Lockdep says:

    [   18.589322] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    [   18.589329] WARNING: possible circular locking dependency detected
    [   18.589335] 6.9.0-rc2-1.qubes.fc32.x86_64 #378 Not tainted
    [   18.589340] ------------------------------------------------------
    [   18.589347] prepare-suspend/1145 is trying to acquire lock:
    [   18.589352] ffff897494bc37b8 (&led_cdev->trigger_lock){+.+.}-{3:3}, =
at: led_classdev_unregister+0x32/0x110
    [   18.589367]
    [   18.589367] but task is already holding lock:
    [   18.589373] ffffffffb034dfa8 (rtnl_mutex){+.+.}-{3:3}, at: unregiste=
r_netdev+0xe/0x20
    [   18.589384]
    [   18.589384] which lock already depends on the new lock.
    [   18.589384]
    [   18.589391]
    [   18.589391] the existing dependency chain (in reverse order) is:
    [   18.589399]
    [   18.589399] -> #1 (rtnl_mutex){+.+.}-{3:3}:
    [   18.589407]        __mutex_lock+0xb2/0xbd0
    [   18.589413]        set_device_name+0x2d/0x140 [ledtrig_netdev]
    [   18.589423]        netdev_trig_activate+0x1a6/0x220 [ledtrig_netdev]
    [   18.589432]        led_trigger_set+0x20f/0x340
    [   18.589438]        led_trigger_register+0x16d/0x1a0
    [   18.589443]        do_one_initcall+0x6f/0x3d0
    [   18.589451]        do_init_module+0x60/0x240
    [   18.589459]        init_module_from_file+0x86/0xc0
    [   18.589465]        idempotent_init_module+0x126/0x2c0
    [   18.589471]        __x64_sys_finit_module+0x5a/0xb0
    [   18.589477]        do_syscall_64+0x96/0x190
    [   18.589482]        entry_SYSCALL_64_after_hwframe+0x71/0x79
    [   18.589490]
    [   18.589490] -> #0 (&led_cdev->trigger_lock){+.+.}-{3:3}:
    [   18.589498]        __lock_acquire+0x13e7/0x2180
    [   18.589505]        lock_acquire+0xd5/0x2f0
    [   18.589510]        down_write+0x2a/0xc0
    [   18.589515]        led_classdev_unregister+0x32/0x110
    [   18.589522]        devres_release_all+0xb5/0x110
    [   18.589530]        device_del+0x275/0x3f0
    [   18.589535]        unregister_netdevice_many_notify+0x5ba/0x870
    [   18.589543]        unregister_netdevice_queue+0xf3/0x130
    [   18.589549]        unregister_netdev+0x18/0x20
    [   18.589555]        igc_remove+0xe1/0x1c0 [igc]
    [   18.589566]        pci_device_remove+0x3b/0xb0
    [   18.589574]        device_release_driver_internal+0x1a5/0x210
    [   18.589581]        unbind_store+0x9d/0xb0
    [   18.589587]        kernfs_fop_write_iter+0x15b/0x210
    [   18.589595]        vfs_write+0x2bd/0x560
    [   18.589601]        ksys_write+0x71/0xf0
    [   18.589608]        do_syscall_64+0x96/0x190
    [   18.589614]        entry_SYSCALL_64_after_hwframe+0x71/0x79
    [   18.589620]
    [   18.589620] other info that might help us debug this:
    [   18.589620]
    [   18.589628]  Possible unsafe locking scenario:
    [   18.589628]
    [   18.589635]        CPU0                    CPU1
    [   18.589640]        ----                    ----
    [   18.589645]   lock(rtnl_mutex);
    [   18.589650]                                lock(&led_cdev->trigger_l=
ock);
    [   18.589657]                                lock(rtnl_mutex);
    [   18.589664]   lock(&led_cdev->trigger_lock);
    [   18.589670]
    [   18.589670]  *** DEADLOCK ***
    [   18.589670]
    [   18.589676] 4 locks held by prepare-suspend/1145:
    [   18.589682]  #0: ffff8974873a7420 (sb_writers#3){.+.+}-{0:0}, at: ks=
ys_write+0x71/0xf0
    [   18.589693]  #1: ffff897495886288 (&of->mutex){+.+.}-{3:3}, at: kern=
fs_fop_write_iter+0x114/0x210[   18.589704]  #2: ffff8974820991b0 (&dev->mu=
tex){....}-{3:3}, at: device_release_driver_internal+0x39/0x210
    [   18.589715]  #3: ffffffffb034dfa8 (rtnl_mutex){+.+.}-{3:3}, at: unre=
gister_netdev+0xe/0x20
    [   18.589726]
    [   18.589726] stack backtrace:
    [   18.589731] CPU: 1 PID: 1145 Comm: prepare-suspend Not tainted 6.9.0=
-rc2-1.qubes.fc32.x86_64 #378
    [   18.589741] Hardware name: Xen HVM domU, BIOS 4.17.3 03/12/2024
    [   18.589748] Call Trace:
    [   18.589752]  <TASK>
    [   18.589755]  dump_stack_lvl+0x73/0xb0
    [   18.589761]  check_noncircular+0x148/0x160
    [   18.589766]  ? stack_trace_save+0x4a/0x70
    [   18.589773]  __lock_acquire+0x13e7/0x2180
    [   18.589780]  lock_acquire+0xd5/0x2f0
    [   18.589786]  ? led_classdev_unregister+0x32/0x110
    [   18.589793]  down_write+0x2a/0xc0
    [   18.589798]  ? led_classdev_unregister+0x32/0x110
    [   18.589804]  led_classdev_unregister+0x32/0x110
    [   18.589811]  devres_release_all+0xb5/0x110
    [   18.589816]  device_del+0x275/0x3f0
    [   18.589821]  unregister_netdevice_many_notify+0x5ba/0x870
    [   18.589829]  unregister_netdevice_queue+0xf3/0x130
    [   18.589835]  unregister_netdev+0x18/0x20
    [   18.589840]  igc_remove+0xe1/0x1c0 [igc]
    [   18.589850]  pci_device_remove+0x3b/0xb0
    [   18.589855]  device_release_driver_internal+0x1a5/0x210
    [   18.589861]  unbind_store+0x9d/0xb0
    [   18.589867]  kernfs_fop_write_iter+0x15b/0x210
    [   18.589874]  vfs_write+0x2bd/0x560
    [   18.589880]  ksys_write+0x71/0xf0
    [   18.589886]  do_syscall_64+0x96/0x190
    [   18.589891]  ? find_held_lock+0x2b/0x80
    [   18.589896]  ? lock_release+0x143/0x2c0
    [   18.589902]  ? do_user_addr_fault+0x354/0x8a0
    [   18.589909]  ? exc_page_fault+0x126/0x260
    [   18.589916]  entry_SYSCALL_64_after_hwframe+0x71/0x79
    [   18.589922] RIP: 0033:0x76426194fee4
    [   18.589927] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84=
 00 00 00 00 00 f3 0f 1e fa 80 3d 85 74 0d 00 00 74 13 b8 01 00 00 00 0f 05=
 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
    [   18.589946] RSP: 002b:00007ffe69a0ca98 EFLAGS: 00000202 ORIG_RAX: 00=
00000000000001
    [   18.589955] RAX: ffffffffffffffda RBX: 000000000000000d RCX: 0000764=
26194fee4
    [   18.589963] RDX: 000000000000000d RSI: 000058ae60024480 RDI: 0000000=
000000001
    [   18.589971] RBP: 00007ffe69a0cac0 R08: 0000000000000000 R09: 0000000=
000000001
    [   18.589979] R10: 0000000000000004 R11: 0000000000000202 R12: 0000000=
00000000d
    [   18.589987] R13: 000058ae60024480 R14: 0000764261a205c0 R15: 0000764=
261a1df20
    [   18.589997]  </TASK>


This is happening in a HVM domain on Xen, with PCI passthrough of
relevant devices, but I don't think it's related to the issue.

There is some more details on
https://github.com/QubesOS/qubes-issues/issues/9096.


#regzbot introduced: v6.8.4..v6.9-rc2

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--rb0skLUNgwT7nFvb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYUQ90ACgkQ24/THMrX
1yxJKAf+LVhXJPQx78YTODCpBT0iZVgwkDbzVf688nGAYjWmYPzQRvvKzeoVyzjh
wQ4/I6oQuon0LP8FIFEenIHqtwJ4SF4bleT0c+qdsdGttbwxqT2u11HbDHNC48fz
lEu3gDObtkDEyaqG4/D3RTz9L2jG3rqQVaCgBo6TSJ9YlTT6b5nKkwPvWzyx/qyy
CaEY2OM1O+DEq5S+wwok45w7+PcdB7L5tMBZqDkxXAys7K+7lpw4lkzm+R+vV+lP
Kyk1tAIwyqV9cJ1oMrVseyEKEokrLa5T06TLbeQXwPFE5jmC3PrDPu44NXSQ/Of6
tdjYTRTAdcFooz97pBkFQr3wAr5g9Q==
=/H5P
-----END PGP SIGNATURE-----

--rb0skLUNgwT7nFvb--

