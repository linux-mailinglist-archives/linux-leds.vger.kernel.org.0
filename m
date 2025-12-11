Return-Path: <linux-leds+bounces-6408-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5ACB67A1
	for <lists+linux-leds@lfdr.de>; Thu, 11 Dec 2025 17:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EF0D301143A
	for <lists+linux-leds@lfdr.de>; Thu, 11 Dec 2025 16:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9162028688D;
	Thu, 11 Dec 2025 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+NwtgGw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrrYMaf7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57D1248F57
	for <linux-leds@vger.kernel.org>; Thu, 11 Dec 2025 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471054; cv=none; b=fkD0dRp7crtcgagS7o6s+WclDmUAtMuSVICrrPlw6gKGg6XpQw6pWuVaMYhOVis0nb8y2255UnYpto3gYqSniU9618PNc4YAwIDBTHoCEJCRt4qh4lRpTV6siR6J28cLk0o4NCQ+bHPOgY3gUczstB0hVB9UsnFoTAC16mN/kqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471054; c=relaxed/simple;
	bh=1KKCNWalvP4XERNjZqQGDlfxLtbCqfhyXNgD5+uHboU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sX6OpkLL1srUWsXzjJs5CaPRv0i+Sjhzr1zc3KGLHS/uTKlFssgHnrO5l6wXu/Z5XfEQaZeXQfX4PnF6D9rmWBN80dXOOOB8kDobt8a40EYvqmZzWAenOD+9IcUoVbe1H/K5CkOJqlN93hQonXS5CRnzljdUm+3GNW40TRKaSSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+NwtgGw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrrYMaf7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBEPN5B1173716
	for <linux-leds@vger.kernel.org>; Thu, 11 Dec 2025 16:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oj/4VBhEnuyy+rxbF2Z9gRHv86wmVq1FW4d
	SlNKTFCw=; b=f+NwtgGwgCRSnEGV1JTwYEux2qumiKWLMUpxAgPm5o6H49wvcd3
	sp3dXzUDfN6jxMn73i39purBp2Vg2uMvoyMaV6V3q7sH4DVuicVi1Xu3v0zVYfwZ
	X6Key46ODHD1k3Fz6MAGEhddbZZ36t0CcQX6B0BGiZVp8w+N6wdD20vkI0T5s0cH
	m3ERX+gyZQ9046Hsky1jL0WYv7KbRRO9Ot4lSwaEe8/fBm56CnCtDyWOvZ4aGY5S
	RLR//iWr26G/nt4J7hVrsraSkTldsNK6FyG8yXixD2x5/SE0XqTvz3upShtDeWcW
	ONnWWw+5cKQ+HYL+O0oR6foEdeU3LgokMpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aytwj9h8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 11 Dec 2025 16:37:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6855557aso5169631cf.1
        for <linux-leds@vger.kernel.org>; Thu, 11 Dec 2025 08:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765471051; x=1766075851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oj/4VBhEnuyy+rxbF2Z9gRHv86wmVq1FW4dSlNKTFCw=;
        b=XrrYMaf7F8PRuCNL8JVuz8Md0tAk+la16ouiwEP5TWnKKgmakkP2aKw1TJ5dp8LfaA
         5E6A1t4X+eF1E7+5N1i+7FWvaxq3+s83eA5vL9Rv2MlWfBjfOuARI8eoM53Cq4dvaf4X
         +VVIq1ivFnpYHN6GaBGQkneDXMFwUyLlbxFsbWLonr3/PYzQYwERYBGYkmE3uHUxxdyW
         mrUCi/gYb0NZWvEmCotk4BU1Xb+2vTpWOjEfwiqXzz3hlW5euvR8NakFA6q+GlJhX7Lc
         ZXWAJ6LCNO3C7fHOuLJkZ4ZQ8HSrzXL2niNft0FmLKMI2j0UD29pTRDHcSFND/u5oKXb
         QyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765471051; x=1766075851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oj/4VBhEnuyy+rxbF2Z9gRHv86wmVq1FW4dSlNKTFCw=;
        b=bBt6BO/p2h2nJhKs030HD2p5JYaZkCCguNs11eY5FmdikHdmMa0Fa7QaclbDY0wLiZ
         9fALuz0NWaxbWtOA8OPtJacmK80eZpU4C06MpiuWNwKpqrY/mYJrQRluH01frZIqtdGl
         2hg4NdvpiKh3jI/17PMtQfWO7ryjLOQFC90cxhxE6V5t8r8cYU5YPah5lcbYlXHwJ7Qo
         noxqxv3ZhJmchl5t+pPRKr/AZ0Cy28+2xO17oAwQ9ufBgCGPU6fZKcNo8eLR+KOYjbX6
         bE6mfJRS3otkHmz4u6A5TN/QZ1H9Q0c0fDvWmtQeTeOIZOBywlrH5Ez2B3rN2qB2hcfX
         X4qg==
X-Forwarded-Encrypted: i=1; AJvYcCXc5TGi+gQ20vp/Jj5JPTeb5jlogm8LLLK0Ny8Li7oO8FifwvE2CGrE8LsU+qFOhmqr4SMYH2q2Wb50@vger.kernel.org
X-Gm-Message-State: AOJu0Yycdimyp3mIczysiGmmBrEFAmD7QlbOVgyBHEuuDOg+cyhGZXjW
	1dNoAP6Igz9xGUNSjUXzLxlkl4YM0skmpIMoJlfjNhLFpabmrMIUE/BLieDsYHnbXSXmGv8Vaz2
	kMjUpAL4Cu/dwjOy91+8N9R1ZvQaYdlYcaWXU9PweBRdXQSHQeWlGaWHQlb+5RumC
X-Gm-Gg: AY/fxX5waqsB9DVbad1a+JH9jiX+lU3f8ViGu+KVIZxf70GQXrP48pC9+C64h648/LL
	9bgDgRjgCVvOn9GP95YftsI9jHUHSiTfZBui5sqCHMU96O9l1h2Hxb9mBlneELb0tRLMHArlhES
	HC+p/GwN99mpUOWC5vukvCbaCLCJfQqV3YSSejsdxojjuZnU50ONbWYINKDbtXyvtSGkueIX65I
	s06Ygxjsxy0Sz6uHHE9ZVpnp3+X6RydMXNdiOIWR3S0Zo1dTThEz4l1mosvs8MQUKMx0FCX9N27
	Ehxlkrd4gnxl+cxN9JAu238208BL44pLzaNs1z/V+iZ40wIWvxT5vj+w6MORFQ31Phhzk4gwpQl
	s6AncPg63kxIJmkUbfG0gHGwqzQu6zGm09DONbvHLLeRIEYobvYK3O38RJ7Q8KcYJrMJaI+o/jo
	kDeELaG32dH4Hk/9JGg7wOTwr5
X-Received: by 2002:ac8:5fcd:0:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f1bfc359d0mr34664941cf.21.1765471050934;
        Thu, 11 Dec 2025 08:37:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENr4Swyxte5JX8Dsfr/N4PeCSOX9s1g8MZ+We5bhkOH6HvJgBK0aXo1Yi/w+V5E86bl9HRjw==
X-Received: by 2002:ac8:5fcd:0:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f1bfc359d0mr34664501cf.21.1765471050471;
        Thu, 11 Dec 2025 08:37:30 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-649820516e9sm2877065a12.10.2025.12.11.08.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 08:37:28 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        stable@vger.kernel.org
Subject: [PATCH] leds: led-class: Only Add LED to leds_list when it is fully ready
Date: Thu, 11 Dec 2025 17:37:27 +0100
Message-ID: <20251211163727.366441-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hoNehHXhCR6B5ZdvPwxGL2HsquIZOnfR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEzMCBTYWx0ZWRfXz5fohSTKsuEq
 /7lC68fuD5uAjDJlyxStHQXOMoSEfXgn82Q4bnDQWjVIFvraDVrfgbJ/V+kJ+C4nadorxNqL33J
 VTjQKZ0UE6MizY0yJSrbzZ/4hFgMtpFvmgXVKqGWVd1NIX4qvoTgGm5iFfIQEJcij8nu9VxjSK9
 FyEh5lOyjjqGTXU4paEq2Hg7xAQu1wraW0cfs0PG40FaRDT5cN+XNazTIqFTRWVwqkBWu3NI0Vf
 oWEaoWiU1Q7Oc0VmdPCzhlFPk1VLDQlnRtJPfqRlm2DYE6Ggoa2NKfANBrXut1mK4BHmh7QAjfw
 OlywLtB5BGMdN6uBSaM8MxjvRhYQbX1EmD52aqRY4g/yVgg/hfaLEWb5+yDHDlu+3H1dd+B8Aqu
 2mGlecJyNMScsQpNtr/ZyvByjS4nPA==
X-Authority-Analysis: v=2.4 cv=YokChoYX c=1 sm=1 tr=0 ts=693af34c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=zz-1Wuj_SYMfJuCV:21 a=xqWC_Br6kY4A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jy_3jkUqb48WmY1pi68A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hoNehHXhCR6B5ZdvPwxGL2HsquIZOnfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110130

Before this change the LED was added to leds_list before led_init_core()
gets called adding it the list before led_classdev.set_brightness_work gets
initialized.

This leaves a window where led_trigger_register() of a LED's default
trigger will call led_trigger_set() which calls led_set_brightness()
which in turn will end up queueing the *uninitialized*
led_classdev.set_brightness_work.

This race gets hit by the lenovo-thinkpad-t14s EC driver which registers
2 LEDs with a default trigger provided by snd_ctl_led.ko in quick
succession. The first led_classdev_register() causes an async modprobe of
snd_ctl_led to run and that async modprobe manages to exactly hit
the window where the second LED is on the leds_list without led_init_core()
being called for it, resulting in:

 ------------[ cut here ]------------
 WARNING: CPU: 11 PID: 5608 at kernel/workqueue.c:4234 __flush_work+0x344/0x390
 Hardware name: LENOVO 21N2S01F0B/21N2S01F0B, BIOS N42ET93W (2.23 ) 09/01/2025
 ...
 Call trace:
  __flush_work+0x344/0x390 (P)
  flush_work+0x2c/0x50
  led_trigger_set+0x1c8/0x340
  led_trigger_register+0x17c/0x1c0
  led_trigger_register_simple+0x84/0xe8
  snd_ctl_led_init+0x40/0xf88 [snd_ctl_led]
  do_one_initcall+0x5c/0x318
  do_init_module+0x9c/0x2b8
  load_module+0x7e0/0x998

Close the race window by moving the adding of the LED to leds_list to
after the led_init_core() call.

Cc: Sebastian Reichel <sre@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Note no Fixes tag as this problem has been around for a long long time,
so I could not really find a good commit for the Fixes tag.
---
 drivers/leds/led-class.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index f3faf37f9a08..6b9fa060c3a1 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -560,11 +560,6 @@ int led_classdev_register_ext(struct device *parent,
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
 	led_cdev->brightness_hw_changed = -1;
 #endif
-	/* add to the list of leds */
-	down_write(&leds_list_lock);
-	list_add_tail(&led_cdev->node, &leds_list);
-	up_write(&leds_list_lock);
-
 	if (!led_cdev->max_brightness)
 		led_cdev->max_brightness = LED_FULL;
 
@@ -574,6 +569,11 @@ int led_classdev_register_ext(struct device *parent,
 
 	led_init_core(led_cdev);
 
+	/* add to the list of leds */
+	down_write(&leds_list_lock);
+	list_add_tail(&led_cdev->node, &leds_list);
+	up_write(&leds_list_lock);
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	led_trigger_set_default(led_cdev);
 #endif
-- 
2.52.0


