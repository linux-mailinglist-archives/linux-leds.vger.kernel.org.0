Return-Path: <linux-leds+bounces-1614-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF208BD601
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 22:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EFD31F215F8
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 20:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C02715ADAE;
	Mon,  6 May 2024 20:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=heiner.kallweit@web.de header.b="BBzv2dVA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE33E156F46;
	Mon,  6 May 2024 20:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715025687; cv=none; b=KGH731rFNy8tpzWj2/82JIMGxRURlqa1Q/VrCoK8igDH7YBTzIH21FX73fMHyzAw5Vb7x+fDPqcppD63jSrcV3Bbze6Id0uMNp2oePKE5bdTBG/PIfW5HYyQX+JVvdsH8GBIRg8V4rRI/BVZpLVP2dRLQG4JhY5hcnm3ydYqW94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715025687; c=relaxed/simple;
	bh=Ktu/WWhNA/nQgbk2Teu4CABnBkQc1d0LVWdxo/68ah8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYhgsgJXhuDXoE6pLauhdUwUHiU2Ek80S/M3+KP/kJnChB0JnosN5ouEYveyO6A8F0rEh/lhUSd8vHnZ3p0wlJr2zn7HScWEm3fCKQtez9psWscbdJPd2TjZPmWDZGWwGqz1AaqI94ajk3sNEM7Y8zLTTbqomXP/kwtLYQAO+GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=heiner.kallweit@web.de header.b=BBzv2dVA; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715025658; x=1715630458; i=heiner.kallweit@web.de;
	bh=Ktu/WWhNA/nQgbk2Teu4CABnBkQc1d0LVWdxo/68ah8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BBzv2dVAdVtTLxz/pjA6IlORKmbWY6PhPS+oohjHaUvU46CZrrf6SIfgwMg0zouq
	 T98jj+9kcf7L+fyUKJvtBM4ZvGVLztZu1tYcMzI9ZztzPhIoky6F4H0WKolRecdwC
	 A5a845T/rd0hhtE3mQh4NnjUhBKucbqtXHPDUua8k5FIC/BOuHF07UwuaSf5XIk+Q
	 BudDx39c/XCdyfWlcnrL6+/1uj8VL5iuhnZhLtlccs/Vcxlf7vZgpG4TspKi5YcTN
	 7MmeWyB5/N631d9NQt67Wdut0R8ywOXsaf61xACrM9tHu43Cyxhpys6c4QhU5yyXV
	 QQgFr2/Bxkq5tvSX4Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.86] ([77.2.63.73]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MPaMS-1sHs0R3YSQ-00MclL; Mon, 06
 May 2024 22:00:57 +0200
Message-ID: <a248e142-36b3-472a-bd3e-6271a08f177f@web.de>
Date: Mon, 6 May 2024 22:00:59 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.9.0-rc2+ kernel hangs on boot (bisected, maybe LED related)
To: Ben Greear <greearb@candelatech.com>, LKML
 <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>
References: <30f757e3-73c5-5473-c1f8-328bab98fd7d@candelatech.com>
 <30819e01-43ce-638f-0cc6-067d6a8d03c7@candelatech.com>
 <89a9eec3-337f-3c9f-6bbe-00a26a15287c@candelatech.com>
Content-Language: en-US
From: Heiner Kallweit <heiner.kallweit@web.de>
In-Reply-To: <89a9eec3-337f-3c9f-6bbe-00a26a15287c@candelatech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RXebSZgcnm2o5eGw+jMwebtx9j/VtmNm3EbgZcn4wCXuXjq92Sw
 rDeVsBvmQtKDIYra9/WdqKjCOEo6iUHrgvgNeOZSBEET1MAHp6fXl8914CrIbmJdWFhHjjJ
 CJss73dXiJF4Az2LR98qdU3omUH/CiyfGTpE9AOWxtznHqIH3R78JXwunVeMkxS1jXoB/OV
 c9lsNg1+qxq4jw4sgJC7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dX82Py60H/U=;ZGPDHS1X/2T1cvNq17HNsPx4GhS
 g179yPMGir7UJqpwlqy/IuFoMYWnBPyKZ+zSq9ND+8X7Qd1+vO7ozc0UAjz8fqpeHn2UdVfWT
 D14C+xdaZSh7XbBQv2tJytad8N//IUa0fCw4o7SY33+rIg6/hgMlWy1LU5gxwivhJ4A6GRdgD
 meXWtyNDeuHwHJSI/plQ+KhbVVrJFoztjY64pkt2KCPmteN4WInnJkEV+Vh4ILSto+5wvSri7
 Js2T78m2g5G/AcZQKzpczJ9QbagjlQv2ZncJJnC36i25BkzifayuP4mYbhuFGWuda8eJeDDSs
 USTmPZFN+IIhe6/VFDjFP+ES5FlXzwGepRO+ZBtV6hT0R5QH3zu89r5xMSkE89zstNugdpaDd
 /Fp+hdd8A8LEW6m8+Pbe3gbrApmvx7ueNdKugTM+ZiBQzTiY2hF5R9mnQqgow6DrOMeySv8DJ
 lLBQQni5bxUwfWkXDUtHdtO+ExBdfrH2nPYNdSI0tnU9NbJeLchrWhzdHpEYzm7wPLlQfbOhb
 aSiMQfHHP19OyQafQ/Ydrq9+aOPRDgPUjb6qVZqqp1Qh0s5i8N/QlozUcbRhHXYy4QeDVB5G9
 YYd0cDyqw8mnnYLyVxCFL0jWat7jdVp3TBlasnHEcbG6zbI3Iq8bnnaLukcPBz/OcbutEmurw
 qIlMwzQk6YoVRh4Fi/64OHGzW4WzAsoSNFyUlhHj8FWK599MDbUEZ+MmXFhmr/XwUiiTOjPJx
 IIIifwKqBU++yZMY9gmJ+cnLziuEzDJdj9pibw9GeskIxwVcROpG/zv8hmhKviZ8rm0H/Lkaf
 pxpVi3LuXAdOnR5YTG2LLrk2o0mQDnjzl4E+sZLlrmdn4=

On 03.04.2024 21:35, Ben Greear wrote:
> On 4/2/24 10:38, Ben Greear wrote:
>> On 4/2/24 09:37, Ben Greear wrote:
>>> Hello,
>>>
>>> Sometime between rc1 and today's rc2, my system quit booting.
>>> I'm not seeing any splats, it just stops.=C2=A0 Evidently before
>>> sysrq is enabled.
>>>

For my understanding:
You say 6.9-rc1 was ok, but 6.9-rc2 is not?

If I look at the diff then I see no LED subsystem changes,
but iwlwifi changes. It's not clear to me why your bisect
points to something outside the diff.


>>> [=C2=A0 OK=C2=A0 ] Started Flush Journal to Persistent Storage.
>>> [=C2=A0 OK=C2=A0 ] Started udev Coldplug all Devices.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting udev W=
ait for Complete Device Initialization...
>>> [=C2=A0 OK=C2=A0 ] Listening on Load/Save RF =E2=80=A6itch Status /dev=
/rfkill Watch.
>>> [=C2=A0 OK=C2=A0 ] Created slice system-lvm2\x2dpvscan.slice.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting LVM2 P=
V scan on device 8:19...
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting LVM2 P=
V scan on device 8:3...
>>> [=C2=A0 OK=C2=A0 ] Started Device-mapper event daemon.
>>> iwlwifi 0000:04:00.0: WRT: Invalid buffer destination: 0
>>> sysrq: This sysrq operation is disabled.
>>>
>>> I can start a bisect, but in case anyone knows the answer already, ple=
ase let me know.
>>>
>>> Thanks,
>>> Ben
>>>
>>
>> So, deadlock I guess....
>>
>> =C2=A0=C2=A0INFO: task kworker/5:13:648 blocked for more than 180 secon=
ds.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 6.9.0-rc2+ #23
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>> task:kworker/5:13=C2=A0=C2=A0=C2=A0 state:D stack:0=C2=A0=C2=A0=C2=A0=
=C2=A0 pid:648=C2=A0=C2=A0 tgid:648=C2=A0=C2=A0 ppid:2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 flags:0x00004000
>> Workqueue: events deferred_probe_timeout_work_func
>> Call Trace:
>> =C2=A0=C2=A0<TASK>
>> =C2=A0=C2=A0__schedule+0x43d/0xe20
>> =C2=A0=C2=A0schedule+0x31/0x130
>> =C2=A0=C2=A0schedule_timeout+0x1b9/0x1d0
>> =C2=A0=C2=A0? mark_held_locks+0x49/0x70
>> =C2=A0=C2=A0? lockdep_hardirqs_on_prepare+0xd6/0x170
>> =C2=A0=C2=A0__wait_for_common+0xb9/0x1d0
>> =C2=A0=C2=A0? usleep_range_state+0xb0/0xb0
>> =C2=A0=C2=A0? __flush_work+0x1ff/0x460
>> =C2=A0=C2=A0__flush_work+0x287/0x460
>> =C2=A0=C2=A0? flush_workqueue_prep_pwqs+0x120/0x120
>> =C2=A0=C2=A0deferred_probe_timeout_work_func+0x2b/0xa0
>> =C2=A0=C2=A0process_one_work+0x212/0x710
>> =C2=A0=C2=A0? lock_is_held_type+0xa5/0x110
>> =C2=A0=C2=A0worker_thread+0x188/0x340
>> =C2=A0=C2=A0? rescuer_thread+0x380/0x380
>> =C2=A0=C2=A0kthread+0xd7/0x110
>> =C2=A0=C2=A0? kthread_complete_and_exit+0x20/0x20
>> =C2=A0=C2=A0ret_from_fork+0x28/0x40
>> =C2=A0=C2=A0? kthread_complete_and_exit+0x20/0x20
>> =C2=A0=C2=A0ret_from_fork_asm+0x11/0x20
>> =C2=A0=C2=A0</TASK>
>> INFO: task udevadm:763 blocked for more than 180 seconds.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 6.9.0-rc2+ #23
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>> task:udevadm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state:D st=
ack:0=C2=A0=C2=A0=C2=A0=C2=A0 pid:763=C2=A0=C2=A0 tgid:763=C2=A0=C2=A0 ppi=
d:1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags:0x00000000
>> Call Trace:
>> =C2=A0=C2=A0<TASK>
>> =C2=A0=C2=A0__schedule+0x43d/0xe20
>> =C2=A0=C2=A0schedule+0x31/0x130
>> =C2=A0=C2=A0schedule_timeout+0x1b9/0x1d0
>> =C2=A0=C2=A0? __wait_for_common+0xb0/0x1d0
>> =C2=A0=C2=A0? lock_release+0xc6/0x290
>> =C2=A0=C2=A0? lockdep_hardirqs_on_prepare+0xd6/0x170
>> =C2=A0=C2=A0__wait_for_common+0xb9/0x1d0
>> =C2=A0=C2=A0? usleep_range_state+0xb0/0xb0
>> =C2=A0=C2=A0? __flush_work+0x1ff/0x460
>> =C2=A0=C2=A0__flush_work+0x287/0x460
>> =C2=A0=C2=A0? flush_workqueue_prep_pwqs+0x120/0x120
>> =C2=A0=C2=A0fsnotify_destroy_group+0x66/0xf0
>> =C2=A0=C2=A0inotify_release+0x12/0x40
>> =C2=A0=C2=A0__fput+0xa6/0x2d0
>> =C2=A0=C2=A0__x64_sys_close+0x33/0x70
>> =C2=A0=C2=A0do_syscall_64+0x6c/0x170
>> =C2=A0=C2=A0entry_SYSCALL_64_after_hwframe+0x46/0x4e
>> RIP: 0033:0x7f744d5bc878
>> RSP: 002b:00007ffcef12f8d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
>> RAX: ffffffffffffffda RBX: 00007f744cd048c0 RCX: 00007f744d5bc878
>> RDX: ffffffffffffff80 RSI: 0000000000000000 RDI: 0000000000000003
>> RBP: 0000000000000003 R08: 000055f9ce349fb0 R09: 0000000000000000
>> R10: 00007ffcef12f8f0 R11: 0000000000000246 R12: 0000000000000002
>> R13: 0000000007270e00 R14: 000055f99670c9b8 R15: 0000000000000002
>> =C2=A0=C2=A0</TASK>
>> INFO: task modprobe:968 blocked for more than 180 seconds.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 6.9.0-rc2+ #23
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>> task:modprobe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state:D stack:0=
=C2=A0=C2=A0=C2=A0=C2=A0 pid:968=C2=A0=C2=A0 tgid:968=C2=A0=C2=A0 ppid:65=
=C2=A0=C2=A0=C2=A0=C2=A0 flags:0x00000000
>> Call Trace:
>> =C2=A0=C2=A0<TASK>
>> =C2=A0=C2=A0__schedule+0x43d/0xe20
>> =C2=A0=C2=A0schedule+0x31/0x130
>> =C2=A0=C2=A0schedule_timeout+0x1b9/0x1d0
>> =C2=A0=C2=A0? __wait_for_common+0xb0/0x1d0
>> =C2=A0=C2=A0? lock_release+0xc6/0x290
>> =C2=A0=C2=A0? lockdep_hardirqs_on_prepare+0xd6/0x170
>> =C2=A0=C2=A0__wait_for_common+0xb9/0x1d0
>> =C2=A0=C2=A0? usleep_range_state+0xb0/0xb0
>> =C2=A0=C2=A0idempotent_init_module+0x1ae/0x290
>> =C2=A0=C2=A0__x64_sys_finit_module+0x55/0xb0
>> =C2=A0=C2=A0do_syscall_64+0x6c/0x170
>> =C2=A0=C2=A0entry_SYSCALL_64_after_hwframe+0x46/0x4e
>> RIP: 0033:0x7fde25530ddd
>> RSP: 002b:00007fffac078518 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> RAX: ffffffffffffffda RBX: 0000558758e28ef0 RCX: 00007fde25530ddd
>> RDX: 0000000000000000 RSI: 000055873cebf358 RDI: 0000000000000001
>> RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000001 R11: 0000000000000246 R12: 000055873cebf358
>> R13: 0000000000000000 R14: 0000558758e29020 R15: 0000558758e28ef0
>> =C2=A0=C2=A0</TASK>
>> INFO: task modprobe:969 blocked for more than 180 seconds.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 6.9.0-rc2+ #23
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>> task:modprobe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state:D stack:0=
=C2=A0=C2=A0=C2=A0=C2=A0 pid:969=C2=A0=C2=A0 tgid:969=C2=A0=C2=A0 ppid:93=
=C2=A0=C2=A0=C2=A0=C2=A0 flags:0x00000000
>> Call Trace:
>> =C2=A0=C2=A0<TASK>
>> =C2=A0=C2=A0__schedule+0x43d/0xe20
>> =C2=A0=C2=A0schedule+0x31/0x130
>> =C2=A0=C2=A0schedule_timeout+0x1b9/0x1d0
>> =C2=A0=C2=A0? __wait_for_common+0xb0/0x1d0
>> =C2=A0=C2=A0? lock_release+0xc6/0x290
>> =C2=A0=C2=A0? lockdep_hardirqs_on_prepare+0xd6/0x170
>> =C2=A0=C2=A0__wait_for_common+0xb9/0x1d0
>> =C2=A0=C2=A0? usleep_range_state+0xb0/0xb0
>> =C2=A0=C2=A0idempotent_init_module+0x1ae/0x290
>> =C2=A0=C2=A0__x64_sys_finit_module+0x55/0xb0
>> =C2=A0=C2=A0do_syscall_64+0x6c/0x170
>> =C2=A0=C2=A0entry_SYSCALL_64_after_hwframe+0x46/0x4e
>> RIP: 0033:0x7f338d516ddd
>> RSP: 002b:00007ffd155cd1e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> RAX: ffffffffffffffda RBX: 000056092cb0def0 RCX: 00007f338d516ddd
>> RDX: 0000000000000000 RSI: 00005608ecb4a358 RDI: 0000000000000001
>> RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000001 R11: 0000000000000246 R12: 00005608ecb4a358
>> R13: 0000000000000000 R14: 000056092cb0e020 R15: 000056092cb0def0
>> =C2=A0=C2=A0</TASK>
>> INFO: task modprobe:1044 blocked for more than 180 seconds.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 6.9.0-rc2+ #23
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>> task:modprobe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state:D stack:0=
=C2=A0=C2=A0=C2=A0=C2=A0 pid:1044=C2=A0 tgid:1044=C2=A0 ppid:10=C2=A0=C2=
=A0=C2=A0=C2=A0 flags:0x00000000
>> Call Trace:
>> =C2=A0=C2=A0<TASK>
>> =C2=A0=C2=A0__schedule+0x43d/0xe20
>> =C2=A0=C2=A0schedule+0x31/0x130
>> =C2=A0=C2=A0schedule_timeout+0x1b9/0x1d0
>> =C2=A0=C2=A0? __wait_for_common+0xb0/0x1d0
>> =C2=A0=C2=A0? lock_release+0xc6/0x290
>> =C2=A0=C2=A0? lockdep_hardirqs_on_prepare+0xd6/0x170
>> =C2=A0=C2=A0__wait_for_common+0xb9/0x1d0
>> =C2=A0=C2=A0? usleep_range_state+0xb0/0xb0
>> =C2=A0=C2=A0idempotent_init_module+0x1ae/0x290
>> =C2=A0=C2=A0__x64_sys_finit_module+0x55/0xb0
>> =C2=A0=C2=A0do_syscall_64+0x6c/0x170
>> =C2=A0=C2=A0entry_SYSCALL_64_after_hwframe+0x46/0x4e
>> RIP: 0033:0x7f7637b30ddd
>> RSP: 002b:00007ffe6251da78 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> RAX: ffffffffffffffda RBX: 000055b889cb3ef0 RCX: 00007f7637b30ddd
>> RDX: 0000000000000000 RSI: 000055b854eea358 RDI: 0000000000000001
>> RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000001 R11: 0000000000000246 R12: 000055b854eea358
>> R13: 0000000000000000 R14: 000055b889cb4020 R15: 000055b889cb3ef0
>> =C2=A0=C2=A0</TASK>
>> INFO: task modprobe:1047 blocked for more than 180 seconds.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 6.9.0-rc2+ #23
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>> task:modprobe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state:D stack:0=
=C2=A0=C2=A0=C2=A0=C2=A0 pid:1047=C2=A0 tgid:1047=C2=A0 ppid:113=C2=A0=C2=
=A0=C2=A0 flags:0x00000000
>> Call Trace:
>> =C2=A0=C2=A0<TASK>
>> =C2=A0=C2=A0__schedule+0x43d/0xe20
>> =C2=A0=C2=A0schedule+0x31/0x130
>> =C2=A0=C2=A0schedule_timeout+0x1b9/0x1d0
>> =C2=A0=C2=A0? __wait_for_common+0xb0/0x1d0
>> =C2=A0=C2=A0? lock_release+0xc6/0x290
>> =C2=A0=C2=A0? lockdep_hardirqs_on_prepare+0xd6/0x170
>> =C2=A0=C2=A0__wait_for_common+0xb9/0x1d0
>> =C2=A0=C2=A0? usleep_range_state+0xb0/0xb0
>> =C2=A0=C2=A0idempotent_init_module+0x1ae/0x290
>> =C2=A0=C2=A0__x64_sys_finit_module+0x55/0xb0
>> =C2=A0=C2=A0do_syscall_64+0x6c/0x170
>> =C2=A0=C2=A0entry_SYSCALL_64_after_hwframe+0x46/0x4e
>> RIP: 0033:0x7f3907130ddd
>> RSP: 002b:00007ffc36e4eb08 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> RAX: ffffffffffffffda RBX: 000056100a856ef0 RCX: 00007f3907130ddd
>> RDX: 0000000000000000 RSI: 0000560fff0ec358 RDI: 0000000000000001
>> RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000001 R11: 0000000000000246 R12: 0000560fff0ec358
>> R13: 0000000000000000 R14: 000056100a857020 R15: 000056100a856ef0
>> =C2=A0=C2=A0</TASK>
>> INFO: task modprobe:1056 blocked for more than 180 seconds.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 6.9.0-rc2+ #23
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>> task:modprobe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state:D stack:0=
=C2=A0=C2=A0=C2=A0=C2=A0 pid:1056=C2=A0 tgid:1056=C2=A0 ppid:1045=C2=A0=C2=
=A0 flags:0x00000000
>> Call Trace:
>> =C2=A0=C2=A0<TASK>
>> =C2=A0=C2=A0__schedule+0x43d/0xe20
>> =C2=A0=C2=A0schedule+0x31/0x130
>> =C2=A0=C2=A0schedule_timeout+0x1b9/0x1d0
>> =C2=A0=C2=A0? __wait_for_common+0xb0/0x1d0
>> =C2=A0=C2=A0? lock_release+0xc6/0x290
>> =C2=A0=C2=A0? lockdep_hardirqs_on_prepare+0xd6/0x170
>> =C2=A0=C2=A0__wait_for_common+0xb9/0x1d0
>> =C2=A0=C2=A0? usleep_range_state+0xb0/0xb0
>> =C2=A0=C2=A0idempotent_init_module+0x1ae/0x290
>> =C2=A0=C2=A0__x64_sys_finit_module+0x55/0xb0
>> =C2=A0=C2=A0do_syscall_64+0x6c/0x170
>> =C2=A0=C2=A0entry_SYSCALL_64_after_hwframe+0x46/0x4e
>> RIP: 0033:0x7fcb1e730ddd
>> RSP: 002b:00007ffc692d0ad8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> RAX: ffffffffffffffda RBX: 000055f8d8828ef0 RCX: 00007fcb1e730ddd
>> RDX: 0000000000000000 RSI: 000055f8bff36358 RDI: 0000000000000001
>> RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000001 R11: 0000000000000246 R12: 000055f8bff36358
>> R13: 0000000000000000 R14: 000055f8d8829020 R15: 000055f8d8828ef0
>> =C2=A0=C2=A0</TASK>
>> INFO: task modprobe:1058 blocked for more than 180 seconds.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 6.9.0-rc2+ #23
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>> task:modprobe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state:D stack:0=
=C2=A0=C2=A0=C2=A0=C2=A0 pid:1058=C2=A0 tgid:1058=C2=A0 ppid:1051=C2=A0=C2=
=A0 flags:0x00000000
>> Call Trace:
>> =C2=A0=C2=A0<TASK>
>> =C2=A0=C2=A0__schedule+0x43d/0xe20
>> =C2=A0=C2=A0schedule+0x31/0x130
>> =C2=A0=C2=A0schedule_timeout+0x1b9/0x1d0
>> =C2=A0=C2=A0? __wait_for_common+0xb0/0x1d0
>> =C2=A0=C2=A0? lock_release+0xc6/0x290
>> =C2=A0=C2=A0? lockdep_hardirqs_on_prepare+0xd6/0x170
>> =C2=A0=C2=A0__wait_for_common+0xb9/0x1d0
>> =C2=A0=C2=A0? usleep_range_state+0xb0/0xb0
>> =C2=A0=C2=A0idempotent_init_module+0x1ae/0x290
>> =C2=A0=C2=A0__x64_sys_finit_module+0x55/0xb0
>> =C2=A0=C2=A0do_syscall_64+0x6c/0x170
>> =C2=A0=C2=A0entry_SYSCALL_64_after_hwframe+0x46/0x4e
>> RIP: 0033:0x7f0a17b30ddd
>> RSP: 002b:00007fff56d619e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> RAX: ffffffffffffffda RBX: 000055abd6741ef0 RCX: 00007f0a17b30ddd
>> RDX: 0000000000000000 RSI: 000055abc6586358 RDI: 0000000000000001
>> RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000001 R11: 0000000000000246 R12: 000055abc6586358
>> R13: 0000000000000000 R14: 000055abd6742020 R15: 000055abd6741ef0
>> =C2=A0=C2=A0</TASK>
>> INFO: task modprobe:1060 blocked for more than 181 seconds.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 6.9.0-rc2+ #23
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>> task:modprobe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state:D stack:0=
=C2=A0=C2=A0=C2=A0=C2=A0 pid:1060=C2=A0 tgid:1060=C2=A0 ppid:1057=C2=A0=C2=
=A0 flags:0x00000000
>> Call Trace:
>> =C2=A0=C2=A0<TASK>
>> =C2=A0=C2=A0__schedule+0x43d/0xe20
>> =C2=A0=C2=A0schedule+0x31/0x130
>> =C2=A0=C2=A0schedule_timeout+0x1b9/0x1d0
>> =C2=A0=C2=A0? __wait_for_common+0xb0/0x1d0
>> =C2=A0=C2=A0? lock_release+0xc6/0x290
>> =C2=A0=C2=A0? lockdep_hardirqs_on_prepare+0xd6/0x170
>> =C2=A0=C2=A0__wait_for_common+0xb9/0x1d0
>> =C2=A0=C2=A0? usleep_range_state+0xb0/0xb0
>> =C2=A0=C2=A0idempotent_init_module+0x1ae/0x290
>> =C2=A0=C2=A0__x64_sys_finit_module+0x55/0xb0
>> =C2=A0=C2=A0do_syscall_64+0x6c/0x170
>> =C2=A0=C2=A0entry_SYSCALL_64_after_hwframe+0x46/0x4e
>> RIP: 0033:0x7f12c0130ddd
>> RSP: 002b:00007ffccdef0488 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> RAX: ffffffffffffffda RBX: 000056249db40ef0 RCX: 00007f12c0130ddd
>> RDX: 0000000000000000 RSI: 0000562471e4d358 RDI: 0000000000000001
>> RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000001 R11: 0000000000000246 R12: 0000562471e4d358
>> R13: 0000000000000000 R14: 000056249db41020 R15: 000056249db40ef0
>> =C2=A0=C2=A0</TASK>
>>
>> Showing all locks held in the system:
>> 2 locks held by systemd/1:
>> =C2=A0=C2=A0#0: ffff88812a7a10a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty=
_ldisc_ref_wait+0x1f/0x50
>> =C2=A0=C2=A0#1: ffff88812a7a1130 (&tty->atomic_write_lock){+.+.}-{4:4},=
 at: file_tty_write.constprop.0+0xab/0x330
>> 2 locks held by kworker/0:1/9:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc900000afe50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/u32:0/10:
>> =C2=A0=C2=A0#0: ffff888120070948 ((wq_completion)events_unbound){+.+.}-=
{0:0}, at: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc900000b7e50 ((work_completion)(&sub_info->work)){+=
.+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/3:0/37:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc900001cbe50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/7:0/61:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc9000029be50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/u32:1/65:
>> =C2=A0=C2=A0#0: ffff888120070948 ((wq_completion)events_unbound){+.+.}-=
{0:0}, at: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc900002bfe50 ((work_completion)(&sub_info->work)){+=
.+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 1 lock held by khungtaskd/66:
>> =C2=A0=C2=A0#0: ffffffff8296e760 (rcu_read_lock){....}-{1:3}, at: debug=
_show_all_locks+0x32/0x1c0
>> 2 locks held by kworker/1:1/79:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc9000032fe50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/u32:2/93:
>> =C2=A0=C2=A0#0: ffff888120070948 ((wq_completion)events_unbound){+.+.}-=
{0:0}, at: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc900003d3e50 ((work_completion)(&sub_info->work)){+=
.+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/6:1/94:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc900003dbe50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/3:1/96:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc900003ebe50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/1:2/102:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90000eabe50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/u32:3/107:
>> =C2=A0=C2=A0#0: ffff888120070948 ((wq_completion)events_unbound){+.+.}-=
{0:0}, at: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90000ed3e50 ((work_completion)(&sub_info->work)){+=
.+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/u32:4/113:
>> =C2=A0=C2=A0#0: ffff888120070948 ((wq_completion)events_unbound){+.+.}-=
{0:0}, at: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90000f03e50 ((work_completion)(&sub_info->work)){+=
.+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/6:2/189:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90000e0fe50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/6:5/196:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90000f13e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/6:6/197:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90000f23e50 ((work_completion)(&(&hda->probe_work)=
->work)){+.+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/6:8/199:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90000f53e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/7:2/296:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc9000105be50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/7:3/297:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90001043e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/7:4/298:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90001063e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/7:5/320:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90001003e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/2:2/371:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc9000104be50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/5:13/648:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc9000198fe50 ((deferred_probe_timeout_work).work){+=
.+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/5:14/649:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90001997e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/5:15/650:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc9000199fe50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/5:16/651:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc900019a7e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/4:3/722:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90001a27e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/1:4/768:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc900010d7e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/1:5/769:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc900010dfe50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/0:2/849:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90001353e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by lvm/860:
>> =C2=A0=C2=A0#0: ffff8881323c19a8 (&md->type_lock){+.+.}-{4:4}, at: tabl=
e_load+0xc9/0x400
>> =C2=A0=C2=A0#1: ffff88813200c3b8 (&mddev->reconfig_mutex){+.+.}-{4:4}, =
at: raid_ctr+0x13b3/0x2860 [dm_raid]
>> 2 locks held by modprobe/1019:
>> =C2=A0=C2=A0#0: ffffffffa0ca7b68 (iwlwifi_opmode_table_mtx){+.+.}-{4:4}=
, at: iwl_opmode_register+0x27/0xd0 [iwlwifi]
>> =C2=A0=C2=A0#1: ffff888139f88270 (&led_cdev->led_access){+.+.}-{4:4}, a=
t: led_classdev_register_ext+0x195/0x450
>> 2 locks held by kworker/u32:5/1045:
>> =C2=A0=C2=A0#0: ffff888120070948 ((wq_completion)events_unbound){+.+.}-=
{0:0}, at: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90004367e50 ((work_completion)(&sub_info->work)){+=
.+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/u32:6/1051:
>> =C2=A0=C2=A0#0: ffff888120070948 ((wq_completion)events_unbound){+.+.}-=
{0:0}, at: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90004703e50 ((work_completion)(&sub_info->work)){+=
.+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/u32:7/1057:
>> =C2=A0=C2=A0#0: ffff888120070948 ((wq_completion)events_unbound){+.+.}-=
{0:0}, at: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90004a97e50 ((work_completion)(&sub_info->work)){+=
.+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/3:3/1111:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90005bafe50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>> 2 locks held by kworker/3:4/1132:
>> =C2=A0=C2=A0#0: ffff88812006c548 ((wq_completion)events){+.+.}-{0:0}, a=
t: process_one_work+0x41e/0x710
>> =C2=A0=C2=A0#1: ffffc90005e13e50 ((work_completion)(&fw_work->work)){+.=
+.}-{0:0}, at: process_one_work+0x1d1/0x710
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>
>
> I ran a bisect on this.=C2=A0 The tagged bad commit is a LED related mer=
ge, but commit
> shows no code changes when I look at it in git.=C2=A0 I double checked t=
hat the
> merge is bad by manually going to it again at the end of the bisect and
> indeed it fails.
>
> From looking at lockdep, this below may be interesting.=C2=A0 I do have =
24 intel be200 radios
> in this system, so maybe lots of iwlwifi radios help trigger the problem=
?
>
>> 2 locks held by modprobe/1019:
>>=C2=A0=C2=A0 #0: ffffffffa0ca7b68 (iwlwifi_opmode_table_mtx){+.+.}-{4:4}=
, at: iwl_opmode_register+0x27/0xd0 [iwlwifi]
>>=C2=A0=C2=A0 #1: ffff888139f88270 (&led_cdev->led_access){+.+.}-{4:4}, a=
t: led_classdev_register_ext+0x195/0x450
>
> Please let me know if you have any suggestions for how to debug this fur=
ther.
>
> [greearb@ben-dt5 linux-2.6]$ git bisect log
> git bisect start
> # status: waiting for both good and bad commits
> # good: [e8f897f4afef0031fe618a8e94127a0934896aba] Linux 6.8
> git bisect good e8f897f4afef0031fe618a8e94127a0934896aba
> # status: waiting for bad commit, 1 good commit known
> # bad: [4cece764965020c22cff7665b18a012006359095] Linux 6.9-rc1
> git bisect bad 4cece764965020c22cff7665b18a012006359095
> # good: [e5e038b7ae9da96b93974bf072ca1876899a01a3] Merge tag 'fs_for_v6.=
9-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs
> git bisect good e5e038b7ae9da96b93974bf072ca1876899a01a3
> # bad: [32a50540c3d26341698505998dfca5b0e8fb4fd4] Merge tag 'bcachefs-20=
24-03-13' of https://evilpiepirate.org/git/bcachefs
> git bisect bad 32a50540c3d26341698505998dfca5b0e8fb4fd4
> # good: [a3df5d5422b4edfcfe658d5057e7e059571e32ce] Merge tag 'pinctrl-v6=
.9-1' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l
> git bisect good a3df5d5422b4edfcfe658d5057e7e059571e32ce
> # bad: [c0a614e82ece41d15b7a66f43ee79f4dbdbc925a] Merge tag 'lsm-pr-2024=
0314' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
> git bisect bad c0a614e82ece41d15b7a66f43ee79f4dbdbc925a
> # bad: [705c1da8fa4816fb0159b5602fef1df5946a3ee2] Merge tag 'pci-v6.9-ch=
anges' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
> git bisect bad 705c1da8fa4816fb0159b5602fef1df5946a3ee2
> # bad: [f5c31bcf604db54470868f3118a60dc4a9ba8813] Merge tag 'leds-next-6=
.9' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds
> git bisect bad f5c31bcf604db54470868f3118a60dc4a9ba8813
> # good: [8403ce70be339d462892a2b935ae30ee52416f92] Merge tag 'mfd-next-6=
.9' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd
> git bisect good 8403ce70be339d462892a2b935ae30ee52416f92
> # good: [2cd0d1db31e78a63553876f8e6a4c9dcc1f9c061] leds: expresswire: Do=
n't depend on NEW_LEDS
> git bisect good 2cd0d1db31e78a63553876f8e6a4c9dcc1f9c061
> # good: [23749cf3dfff5dcd706183ade1d27198a37b3881] backlight: gpio: Simp=
lify with dev_err_probe()
> git bisect good 23749cf3dfff5dcd706183ade1d27198a37b3881
> # good: [2c7c70f54f791ece44541a9254c1a73790fd4595] dt-bindings: leds: Ad=
d NCP5623 multi-LED Controller
> git bisect good 2c7c70f54f791ece44541a9254c1a73790fd4595
> # good: [c9128ed7b9edeb2b6f1faec06d96b2fd5bc72cb8] backlight: lm3630a_bl=
: Simplify probe return on gpio request error
> git bisect good c9128ed7b9edeb2b6f1faec06d96b2fd5bc72cb8
> # good: [45066c4bbe8ca25f9f282245b84568116c783f1d] leds: ncp5623: Add MS=
 suffix to time defines
> git bisect good 45066c4bbe8ca25f9f282245b84568116c783f1d
> # good: [f3d8f29d1f59230b8c2a09e6dee7db7bd295e42c] Merge tag 'backlight-=
next-6.9' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight
> git bisect good f3d8f29d1f59230b8c2a09e6dee7db7bd295e42c
> # first bad commit: [f5c31bcf604db54470868f3118a60dc4a9ba8813] Merge tag=
 'leds-next-6.9' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds
> [greearb@ben-dt5 linux-2.6]$
>
> Thanks,
> Ben
>


