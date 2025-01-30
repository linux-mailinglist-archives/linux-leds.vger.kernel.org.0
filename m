Return-Path: <linux-leds+bounces-3854-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A18A234C9
	for <lists+linux-leds@lfdr.de>; Thu, 30 Jan 2025 20:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D096E165613
	for <lists+linux-leds@lfdr.de>; Thu, 30 Jan 2025 19:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86007187848;
	Thu, 30 Jan 2025 19:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LgMh8gTA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0417BB21
	for <linux-leds@vger.kernel.org>; Thu, 30 Jan 2025 19:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738266398; cv=none; b=A3PmIEXo9ZYGoIcrPX8aWAttIi+lthQ3q1UPw27tTnialuoncLv7OdM7iXCjkxsrl9oPW28xvqeMyYG+0Ed7MF52rpbIMIFpUeNyTbhP5H1gAauWOvcr9d/eUpxlH1K0Fp5SQ8DLwQc3dItMPGLSAhAchXKXxmrVrp0/V6kp3X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738266398; c=relaxed/simple;
	bh=QdzWXyxbTWzJYX+vgMLFB/l1cBAfrTovTYSZ2D9oKgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y58m/zcgeefn48vx2awf4HZyb//dffnzLvQzrHu6XgwP0N6+Oh7kNaHKlcw1LlUZ46+D6LMGuGgJzl+kEY+3coAd3YZN2aeGv/NsnNWOSTaZVg2fVBCVFVMvaqy7omC3a7FCVMjwagfhmmyR0an25RQT5RSf3Ce5AwFZ23HKfjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LgMh8gTA; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJV9SI004687;
	Thu, 30 Jan 2025 19:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=lgED9X+xewwiNqarM7ONx2FLzdQKDJ8si7YYgXbd0
	4U=; b=LgMh8gTA23xuoGjyIIFEziWjfhGuB5Nu+HODbaCrxCLaxFqNLIm6BBuU1
	PwnUcJ6SIPIKmAmMKQYqjH29CYmTG84mlbm+ovnPYufXX+JBLiZlDM9CmNB1TChC
	W+n8t+Q3YR6bDD28Botkf3LFUfJQXB5sgVt7tGOy715KBhkwUFZHiNiODo/Mtf/Z
	UbcsqWKYq/UVlPk6iJxbJP/Gqk2MUHn/mw2n+upJ4ydVzbi1txXuYgnSOCmfOkDM
	rZ9/r7XgAt6+CVD1dyBcNqzuVpr4RSDF/x8l9WFLOjLitMr6JgC1PpcBseVKmjIa
	r+DDcCcLrbMqC4chhFoMT1kr6ivEQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gfn6r1q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 19:46:30 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ4bg1024517;
	Thu, 30 Jan 2025 19:46:30 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44gf9104w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 19:46:30 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50UJkSQJ26214968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 19:46:29 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 706E65805A;
	Thu, 30 Jan 2025 19:46:29 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49FD658052;
	Thu, 30 Jan 2025 19:46:29 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.92.209])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jan 2025 19:46:29 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Cc: pavel@ucw.cz, lee@kernel.org, Eddie James <eajames@linux.ibm.com>
Subject: [PATCH] leds: Ensure hardware blinking turns off when requested
Date: Thu, 30 Jan 2025 13:46:27 -0600
Message-ID: <20250130194627.280618-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e8yAf22YgG5c3NtaoQApwNuAV0TENzj6
X-Proofpoint-ORIG-GUID: e8yAf22YgG5c3NtaoQApwNuAV0TENzj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_09,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=537 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501300149

If an LED is blinking through the hardware and the trigger is deactivated,
the driver will set the brightness to 0 to disable blinking. However, if
the LED driver doesn't support non-blocking operations, the request for
setting brightness to 0 will get queued. Then if a user requests a new
non-zero brightness before the request for 0 brightness is executed, the
LED blinking will not get disabled since the brightness will simply be
updated.
Fix this by flushing the workqueue before updating the requested
brightness.

Fixes: 4d71a4a12b13 ("leds: Add support for setting brightness in a synchronous way")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/led-class.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index c20ac8ccf52b7..dd0a3c42ae11e 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -61,6 +61,8 @@ static ssize_t brightness_store(struct device *dev,
 
 	if (state == LED_OFF)
 		led_trigger_remove(led_cdev);
+	/* flush out any request to disable blinking */
+	flush_work(&led_cdev->set_brightness_work);
 	led_set_brightness(led_cdev, state);
 
 	ret = size;
-- 
2.43.5


