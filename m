Return-Path: <linux-leds+bounces-225-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A4800820
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 11:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE912812B7
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 10:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8379320B0F;
	Fri,  1 Dec 2023 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlkRYP3l"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B941A8;
	Fri,  1 Dec 2023 02:23:25 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54b89582efeso2374348a12.0;
        Fri, 01 Dec 2023 02:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701426203; x=1702031003; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqQ6zXJH2s0PrFji/JM4FqKLRLLrtrEbwu+z70t3lsI=;
        b=NlkRYP3ldhXx6gwEsf+X4jKUkcpZEuafHIxtXxaKvU58H21pBlA0iDR1BnG+0Fz6vB
         iASS1RTt/h4mZwLubR7j/7WQeGPjZn/H0pjujR11kNIusDhCFEzjvDdl9kqK2qgZYrK3
         H6yNlDdhFlWajEuous1j5LfMLt+qVYVIFQeVEs0RfVV3WClbpfeTbXtAnqSrRrWFxWfg
         9B97t6K596gd+x393m9kdhm4SI+AmtPZstGQoodDurvCAXzuQ+KFO43UN2HI510aP4JY
         MIVRlB/aNnkEbCaZ6MjzmM5oy/3Zef8Dl5X9xojj897GH/3AGg0xBw5w+VZ6PDJqg7aE
         kPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426203; x=1702031003;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqQ6zXJH2s0PrFji/JM4FqKLRLLrtrEbwu+z70t3lsI=;
        b=IAecIXOXsfPE4U+VeCiu9KNosY9v8lcUzzDZSFC3saDBEG3SdqN7ygtJTf+hK6y4AM
         Wf4m9qwvMeDaYFyPIRwMBOqdiu9B8VieSZMCjyJw/86lVcNVIWmK3ieXxM/rERN/iOj3
         WDrjyXYvCcZGzQS3816WEZMdPvM9NTIDiyvMvfH27OeIaODk/LOo+sTLmF4LLmJSfwmQ
         02EnpLukUPIZqEePK6yV8qkJX99GSF3ch5jh5w12SdTES5Mjl9ykdBl3hYbcRwYx1/8O
         r1HIc4uSq7VcPphh4+8Zh+r2srDO0XDSBPkh/ZjWe9WQeMcdGVfmN2h6dC4C101IEGLX
         ZSgA==
X-Gm-Message-State: AOJu0YywYpxaumGCCXpxTo6nXCxVDBINCTzdd6UYjiv1AARNMIqGkpc6
	Li2ELXDr8WGMbifsek3gHVs=
X-Google-Smtp-Source: AGHT+IFrW6mTyC9n9hTN3K28LWABgbfM1k7EYZRoPSV80udxMJdJaIWRLJeUw52Uy8v3ieYOvzo2Nw==
X-Received: by 2002:aa7:d992:0:b0:54a:f085:68a0 with SMTP id u18-20020aa7d992000000b0054af08568a0mr431829eds.11.1701426203295;
        Fri, 01 Dec 2023 02:23:23 -0800 (PST)
Received: from ?IPV6:2a01:c22:7a3c:af00:1d31:481d:ebee:6e1c? (dynamic-2a01-0c22-7a3c-af00-1d31-481d-ebee-6e1c.c22.pool.telefonica.de. [2a01:c22:7a3c:af00:1d31:481d:ebee:6e1c])
        by smtp.googlemail.com with ESMTPSA id x33-20020a50baa4000000b0054c5d3486e9sm396397ede.76.2023.12.01.02.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 02:23:22 -0800 (PST)
Message-ID: <fb5c8294-2a10-4bf5-8f10-3d2b77d2757e@gmail.com>
Date: Fri, 1 Dec 2023 11:23:22 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Simon Horman <horms@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] leds: trigger: netdev: fix RTNL handling to prevent
 potential deadlock
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When working on LED support for r8169 I got the following lockdep
warning. Easiest way to prevent this scenario seems to be to take
the RTNL lock before the trigger_data lock in set_device_name().

======================================================
WARNING: possible circular locking dependency detected
6.7.0-rc2-next-20231124+ #2 Not tainted
------------------------------------------------------
bash/383 is trying to acquire lock:
ffff888103aa1c68 (&trigger_data->lock){+.+.}-{3:3}, at: netdev_trig_notify+0xec/0x190 [ledtrig_netdev]

but task is already holding lock:
ffffffff8cddf808 (rtnl_mutex){+.+.}-{3:3}, at: rtnl_lock+0x12/0x20

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (rtnl_mutex){+.+.}-{3:3}:
       __mutex_lock+0x9b/0xb50
       mutex_lock_nested+0x16/0x20
       rtnl_lock+0x12/0x20
       set_device_name+0xa9/0x120 [ledtrig_netdev]
       netdev_trig_activate+0x1a1/0x230 [ledtrig_netdev]
       led_trigger_set+0x172/0x2c0
       led_trigger_write+0xf1/0x140
       sysfs_kf_bin_write+0x5d/0x80
       kernfs_fop_write_iter+0x15d/0x210
       vfs_write+0x1f0/0x510
       ksys_write+0x6c/0xf0
       __x64_sys_write+0x14/0x20
       do_syscall_64+0x3f/0xf0
       entry_SYSCALL_64_after_hwframe+0x6c/0x74

-> #0 (&trigger_data->lock){+.+.}-{3:3}:
       __lock_acquire+0x1459/0x25a0
       lock_acquire+0xc8/0x2d0
       __mutex_lock+0x9b/0xb50
       mutex_lock_nested+0x16/0x20
       netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
       call_netdevice_register_net_notifiers+0x5a/0x100
       register_netdevice_notifier+0x85/0x120
       netdev_trig_activate+0x1d4/0x230 [ledtrig_netdev]
       led_trigger_set+0x172/0x2c0
       led_trigger_write+0xf1/0x140
       sysfs_kf_bin_write+0x5d/0x80
       kernfs_fop_write_iter+0x15d/0x210
       vfs_write+0x1f0/0x510
       ksys_write+0x6c/0xf0
       __x64_sys_write+0x14/0x20
       do_syscall_64+0x3f/0xf0
       entry_SYSCALL_64_after_hwframe+0x6c/0x74

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(rtnl_mutex);
                               lock(&trigger_data->lock);
                               lock(rtnl_mutex);
  lock(&trigger_data->lock);

 *** DEADLOCK ***

8 locks held by bash/383:
 #0: ffff888103ff33f0 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x6c/0xf0
 #1: ffff888103aa1e88 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x114/0x210
 #2: ffff8881036f1890 (kn->active#82){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x11d/0x210
 #3: ffff888108e2c358 (&led_cdev->led_access){+.+.}-{3:3}, at: led_trigger_write+0x30/0x140
 #4: ffffffff8cdd9e10 (triggers_list_lock){++++}-{3:3}, at: led_trigger_write+0x75/0x140
 #5: ffff888108e2c270 (&led_cdev->trigger_lock){++++}-{3:3}, at: led_trigger_write+0xe3/0x140
 #6: ffffffff8cdde3d0 (pernet_ops_rwsem){++++}-{3:3}, at: register_netdevice_notifier+0x1c/0x120
 #7: ffffffff8cddf808 (rtnl_mutex){+.+.}-{3:3}, at: rtnl_lock+0x12/0x20

stack backtrace:
CPU: 0 PID: 383 Comm: bash Not tainted 6.7.0-rc2-next-20231124+ #2
Hardware name: Default string Default string/Default string, BIOS ADLN.M6.SODIMM.ZB.CY.015 08/08/2023
Call Trace:
 <TASK>
 dump_stack_lvl+0x5c/0xd0
 dump_stack+0x10/0x20
 print_circular_bug+0x2dd/0x410
 check_noncircular+0x131/0x150
 __lock_acquire+0x1459/0x25a0
 lock_acquire+0xc8/0x2d0
 ? netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
 __mutex_lock+0x9b/0xb50
 ? netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
 ? __this_cpu_preempt_check+0x13/0x20
 ? netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
 ? __cancel_work_timer+0x11c/0x1b0
 ? __mutex_lock+0x123/0xb50
 mutex_lock_nested+0x16/0x20
 ? mutex_lock_nested+0x16/0x20
 netdev_trig_notify+0xec/0x190 [ledtrig_netdev]
 call_netdevice_register_net_notifiers+0x5a/0x100
 register_netdevice_notifier+0x85/0x120
 netdev_trig_activate+0x1d4/0x230 [ledtrig_netdev]
 led_trigger_set+0x172/0x2c0
 ? preempt_count_add+0x49/0xc0
 led_trigger_write+0xf1/0x140
 sysfs_kf_bin_write+0x5d/0x80
 kernfs_fop_write_iter+0x15d/0x210
 vfs_write+0x1f0/0x510
 ksys_write+0x6c/0xf0
 __x64_sys_write+0x14/0x20
 do_syscall_64+0x3f/0xf0
 entry_SYSCALL_64_after_hwframe+0x6c/0x74
RIP: 0033:0x7f269055d034
Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d 35 c3 0d 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 48 83 ec 28 48 89 54 24 18 48
RSP: 002b:00007ffddb7ef748 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 00007f269055d034
RDX: 0000000000000007 RSI: 000055bf5f4af3c0 RDI: 0000000000000001
RBP: 000055bf5f4af3c0 R08: 0000000000000073 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000007
R13: 00007f26906325c0 R14: 00007f269062ff20 R15: 0000000000000000
 </TASK>

Fixes: d5e01266e7f5 ("leds: trigger: netdev: add additional specific link speed mode")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- fix commit hash in Fixes tag
---
 drivers/leds/trigger/ledtrig-netdev.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index e358e77e4..4dbcb2573 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -226,6 +226,11 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 
 	cancel_delayed_work_sync(&trigger_data->work);
 
+	/*
+	 * Take RTNL lock before trigger_data lock to prevent potential
+	 * deadlock with netdev notifier registration.
+	 */
+	rtnl_lock();
 	mutex_lock(&trigger_data->lock);
 
 	if (trigger_data->net_dev) {
@@ -245,16 +250,14 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 	trigger_data->carrier_link_up = false;
 	trigger_data->link_speed = SPEED_UNKNOWN;
 	trigger_data->duplex = DUPLEX_UNKNOWN;
-	if (trigger_data->net_dev != NULL) {
-		rtnl_lock();
+	if (trigger_data->net_dev)
 		get_device_state(trigger_data);
-		rtnl_unlock();
-	}
 
 	trigger_data->last_activity = 0;
 
 	set_baseline_state(trigger_data);
 	mutex_unlock(&trigger_data->lock);
+	rtnl_unlock();
 
 	return 0;
 }
-- 
2.43.0


