Return-Path: <linux-leds+bounces-3244-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6933A9BA686
	for <lists+linux-leds@lfdr.de>; Sun,  3 Nov 2024 17:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1112A281141
	for <lists+linux-leds@lfdr.de>; Sun,  3 Nov 2024 16:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D8B17DFE4;
	Sun,  3 Nov 2024 16:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CDNu1dBs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806B517C225;
	Sun,  3 Nov 2024 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730649973; cv=none; b=DvVnrG5JyZ5rv1EANe5gfXrqla3wXWDyBW5zyWJl4HCYwn+TITt9LZMqDWo0nd8TAnfeqfq3XbZikXvvlq95ncYEpsaILXjQqoa1NE6Aqgq+Ek1QRwJqt4hG6U76qLEqDk47P75yJ82S0GQsswd/vsiRq/CbINIlEim3Yzxr5GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730649973; c=relaxed/simple;
	bh=a1CL7nZDwxH2JJ+sVL+MznUaUioo4sCtbj+JOdKvfJU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yb/71FMqv5HfewZhiaefTqYZS//gNAD0wZeE9TVfOoQaGmprINkFjUs7exlEt1DsdP8h1pp0obT2s1YpsMJ3m8odMO6K1QJf2S4ucxIL0ZPF1rQWwZYVTT14nPp1RMJz25cF5V8s9SDxdTM6T1aoYTVEUbV+/R7CNeZge4AZWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CDNu1dBs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3FnO4B010920;
	Sun, 3 Nov 2024 16:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vySMAgNa6I+8OJZVe/9XBT
	orqwJ2DVPTOUBP8+qMTMw=; b=CDNu1dBsEk1cnkzeJ+2FgEWdyyWtvX3G43Tlll
	R9HKaRXz4GC9O/ngDcg4PcwJhX5lNyOpp28niQe5CZK6AosfLuQVPOgQaTCZaVyC
	WPni2vQ9q3ZNO95+hDKkr5aKoEqkbQHfJCC8GR00U2RAgetkzIbt195R9kSIynj/
	MCRthn5S13IW3mizFZieNIYnWgIQ6lUM/mYDjOmW9C9V5FGYUSPIVcQFSJW3GG7R
	lt3XQBcMLQ/7IjVL8KI4ysp1gIU823RfqKhYKHacUwsA6uy+zGxfasul4Uj1YV3Z
	tBbuJds337XfB6BDnI1p+pADN/bNErshutt8GRmRbhS/i5BQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd5cj810-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Nov 2024 16:05:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A3G5pfp004231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 3 Nov 2024 16:05:51 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 3 Nov 2024 08:05:49 -0800
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mukesh Ojha
	<quic_mojha@quicinc.com>
Subject: [PATCH v3] leds: class: Protect brightness_show() with led_cdev->led_access mutex
Date: Sun, 3 Nov 2024 21:35:27 +0530
Message-ID: <20241103160527.82487-1-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: e7lh0d3YgPegGp3l9aEVxEWqnA7njukx
X-Proofpoint-GUID: e7lh0d3YgPegGp3l9aEVxEWqnA7njukx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 mlxlogscore=705 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411030145

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
---
Changes in v3:
 - s/Class/class in comment for variable led_access.

Changes in v2:
 - Updated the comment for led_access mutex lock.
 - Also added mutex protection for max_brightness_show().

 drivers/leds/led-class.c | 14 +++++++++++---
 include/linux/leds.h     |  2 +-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 06b97fd49ad9..f69f4e928d61 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -29,11 +29,14 @@ static ssize_t brightness_show(struct device *dev,
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
@@ -70,8 +73,13 @@ static ssize_t max_brightness_show(struct device *dev,
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
index e5968c3ed4ae..2337f516fa7c 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -238,7 +238,7 @@ struct led_classdev {
 	struct kernfs_node	*brightness_hw_changed_kn;
 #endif
 
-	/* Ensures consistent access to the LED Flash Class device */
+	/* Ensures consistent access to the LED class device */
 	struct mutex		led_access;
 };
 
-- 
2.34.1


