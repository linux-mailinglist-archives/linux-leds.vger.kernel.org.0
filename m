Return-Path: <linux-leds+bounces-3473-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA99E4220
	for <lists+linux-leds@lfdr.de>; Wed,  4 Dec 2024 18:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED123BA1F76
	for <lists+linux-leds@lfdr.de>; Wed,  4 Dec 2024 17:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CE722851C;
	Wed,  4 Dec 2024 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQ5Z7bgk"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB5C228517;
	Wed,  4 Dec 2024 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331803; cv=none; b=XlwbO7dRY3H++VSazwn7dJ7DZkyV7+wmA7IEDMHbISI+dXLvQrLaoUcd+92RYA6p2rki3RiNmX5uikiva+g9+EKUMxGqE8ElIT0Pj7R9gvdW2QI836Fr1e2ueAKN3KH1Bdz/nZstOeHQxWhyupXSv8BGeIIKeql0ESJtY6Q086k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331803; c=relaxed/simple;
	bh=MLIuVDVLkoFmWvdF2ZyrYhHC8VlRE573NvdlazlaVb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgD590csPunCXTkJOkj855QYOtNTIIi94HPP+E8supjnYu47h1z68enxJdhuQFzia+yk4VwDZqQ5ahUAtpx6LpZ8jityLXCWbgC6zRwTKhyIDUfufeItkAFxpGLCvSgSchAJ/W/3nsOGfxQucuIHytUYTyST/s7B74djMXNtwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQ5Z7bgk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DB8C4CED6;
	Wed,  4 Dec 2024 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331803;
	bh=MLIuVDVLkoFmWvdF2ZyrYhHC8VlRE573NvdlazlaVb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQ5Z7bgkcd5BqDwmvaZ66qGc5BrfG/LpqP1k0Otxq4SJJYAAW7hhhVBh1mEs0DhYB
	 lWcvhzkMADlk6/dnObBNMj0VfPU6umE+p32ZdO4BbmmcHICbx4g28jSxfqG1e9wcFB
	 aGjSHW+e2gBhMpZkfUp0ZWzInklSQp3ajdTL+fZifRWpxLfkPVbUI6ipAHjnS1rIIb
	 qU0zEAbCeAa+IBGxvdIs5EAEF0uChcslSs0IvwDHJiZW37GbZf3z/kFqx12vxOd2rC
	 Y/Rx0mqrKYPIzm+dlSyKUgx/fMvgwP6CNLryS/J3Cz1uqWvzOVbMTbmfJhBayRn+yd
	 m8u2WppIOsnbg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mukesh Ojha <quic_mojha@quicinc.com>,
	Anish Kumar <yesanishhere@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pavel@ucw.cz,
	linux-leds@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 5/9] leds: class: Protect brightness_show() with led_cdev->led_access mutex
Date: Wed,  4 Dec 2024 10:51:51 -0500
Message-ID: <20241204155157.2214959-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204155157.2214959-1-sashal@kernel.org>
References: <20241204155157.2214959-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.230
Content-Transfer-Encoding: 8bit

From: Mukesh Ojha <quic_mojha@quicinc.com>

[ Upstream commit 4ca7cd938725a4050dcd62ae9472e931d603118d ]

There is NULL pointer issue observed if from Process A where hid device
being added which results in adding a led_cdev addition and later a
another call to access of led_cdev attribute from Process B can result
in NULL pointer issue.

Use mutex led_cdev->led_access to protect access to led->cdev and its
attribute inside brightness_show() and max_brightness_show() and also
update the comment for mutex that it should be used to protect the led
class device fields.

	Process A 				Process B

 kthread+0x114
 worker_thread+0x244
 process_scheduled_works+0x248
 uhid_device_add_worker+0x24
 hid_add_device+0x120
 device_add+0x268
 bus_probe_device+0x94
 device_initial_probe+0x14
 __device_attach+0xfc
 bus_for_each_drv+0x10c
 __device_attach_driver+0x14c
 driver_probe_device+0x3c
 __driver_probe_device+0xa0
 really_probe+0x190
 hid_device_probe+0x130
 ps_probe+0x990
 ps_led_register+0x94
 devm_led_classdev_register_ext+0x58
 led_classdev_register_ext+0x1f8
 device_create_with_groups+0x48
 device_create_groups_vargs+0xc8
 device_add+0x244
 kobject_uevent+0x14
 kobject_uevent_env[jt]+0x224
 mutex_unlock[jt]+0xc4
 __mutex_unlock_slowpath+0xd4
 wake_up_q+0x70
 try_to_wake_up[jt]+0x48c
 preempt_schedule_common+0x28
 __schedule+0x628
 __switch_to+0x174
						el0t_64_sync+0x1a8/0x1ac
						el0t_64_sync_handler+0x68/0xbc
						el0_svc+0x38/0x68
						do_el0_svc+0x1c/0x28
						el0_svc_common+0x80/0xe0
						invoke_syscall+0x58/0x114
						__arm64_sys_read+0x1c/0x2c
						ksys_read+0x78/0xe8
						vfs_read+0x1e0/0x2c8
						kernfs_fop_read_iter+0x68/0x1b4
						seq_read_iter+0x158/0x4ec
						kernfs_seq_show+0x44/0x54
						sysfs_kf_seq_show+0xb4/0x130
						dev_attr_show+0x38/0x74
						brightness_show+0x20/0x4c
						dualshock4_led_get_brightness+0xc/0x74

[ 3313.874295][ T4013] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000060
[ 3313.874301][ T4013] Mem abort info:
[ 3313.874303][ T4013]   ESR = 0x0000000096000006
[ 3313.874305][ T4013]   EC = 0x25: DABT (current EL), IL = 32 bits
[ 3313.874307][ T4013]   SET = 0, FnV = 0
[ 3313.874309][ T4013]   EA = 0, S1PTW = 0
[ 3313.874311][ T4013]   FSC = 0x06: level 2 translation fault
[ 3313.874313][ T4013] Data abort info:
[ 3313.874314][ T4013]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
[ 3313.874316][ T4013]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[ 3313.874318][ T4013]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[ 3313.874320][ T4013] user pgtable: 4k pages, 39-bit VAs, pgdp=00000008f2b0a000
..

[ 3313.874332][ T4013] Dumping ftrace buffer:
[ 3313.874334][ T4013]    (ftrace buffer empty)
..
..
[ dd3313.874639][ T4013] CPU: 6 PID: 4013 Comm: InputReader
[ 3313.874648][ T4013] pc : dualshock4_led_get_brightness+0xc/0x74
[ 3313.874653][ T4013] lr : led_update_brightness+0x38/0x60
[ 3313.874656][ T4013] sp : ffffffc0b910bbd0
..
..
[ 3313.874685][ T4013] Call trace:
[ 3313.874687][ T4013]  dualshock4_led_get_brightness+0xc/0x74
[ 3313.874690][ T4013]  brightness_show+0x20/0x4c
[ 3313.874692][ T4013]  dev_attr_show+0x38/0x74
[ 3313.874696][ T4013]  sysfs_kf_seq_show+0xb4/0x130
[ 3313.874700][ T4013]  kernfs_seq_show+0x44/0x54
[ 3313.874703][ T4013]  seq_read_iter+0x158/0x4ec
[ 3313.874705][ T4013]  kernfs_fop_read_iter+0x68/0x1b4
[ 3313.874708][ T4013]  vfs_read+0x1e0/0x2c8
[ 3313.874711][ T4013]  ksys_read+0x78/0xe8
[ 3313.874714][ T4013]  __arm64_sys_read+0x1c/0x2c
[ 3313.874718][ T4013]  invoke_syscall+0x58/0x114
[ 3313.874721][ T4013]  el0_svc_common+0x80/0xe0
[ 3313.874724][ T4013]  do_el0_svc+0x1c/0x28
[ 3313.874727][ T4013]  el0_svc+0x38/0x68
[ 3313.874730][ T4013]  el0t_64_sync_handler+0x68/0xbc
[ 3313.874732][ T4013]  el0t_64_sync+0x1a8/0x1ac

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
Reviewed-by: Anish Kumar <yesanishhere@gmail.com>
Link: https://lore.kernel.org/r/20241103160527.82487-1-quic_mojha@quicinc.com
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/leds/led-class.c | 14 +++++++++++---
 include/linux/leds.h     |  2 +-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index e28a4bb716032..d7c1f2263a57a 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -28,11 +28,14 @@ static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	unsigned int brightness;
 
-	/* no lock needed for this */
+	mutex_lock(&led_cdev->led_access);
 	led_update_brightness(led_cdev);
+	brightness = led_cdev->brightness;
+	mutex_unlock(&led_cdev->led_access);
 
-	return sprintf(buf, "%u\n", led_cdev->brightness);
+	return sprintf(buf, "%u\n", brightness);
 }
 
 static ssize_t brightness_store(struct device *dev,
@@ -69,8 +72,13 @@ static ssize_t max_brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	unsigned int max_brightness;
+
+	mutex_lock(&led_cdev->led_access);
+	max_brightness = led_cdev->max_brightness;
+	mutex_unlock(&led_cdev->led_access);
 
-	return sprintf(buf, "%u\n", led_cdev->max_brightness);
+	return sprintf(buf, "%u\n", max_brightness);
 }
 static DEVICE_ATTR_RO(max_brightness);
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a8d6409c993e..d8b4a73454e96 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -155,7 +155,7 @@ struct led_classdev {
 	struct kernfs_node	*brightness_hw_changed_kn;
 #endif
 
-	/* Ensures consistent access to the LED Flash Class device */
+	/* Ensures consistent access to the LED class device */
 	struct mutex		led_access;
 };
 
-- 
2.43.0


