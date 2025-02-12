Return-Path: <linux-leds+bounces-3950-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E58A32879
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 15:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F40121882AB6
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 14:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3307D20E314;
	Wed, 12 Feb 2025 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TQLsbTbF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7933B2066E2
	for <linux-leds@vger.kernel.org>; Wed, 12 Feb 2025 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739370647; cv=none; b=Z/g22J44EztzClQRX7CDNgfP1MsvlSpw1LUQUjvl1z3dDNSyQ2Hao1GYMub8oiZFjmLDBcEi9IIzeaAjFyUhFCIgIQdb3NiUzLy95oEJKjWHLwJrHy1Cc8E8QjixTre6i3SSPNVkiypNDyhqe8H54YbUTkJ+fOjXSwXXVn5mKWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739370647; c=relaxed/simple;
	bh=QQvooXI0tVQVA5T46yImYY8GI+9R0G36ovFEEqmR+MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7R3KjFvnMWxGAww8fXqNpiS97bcuizvQsp1KrsqK9fkAcH5kVDzEndTvJZ3WPnX7MY/mGVGpU6QeThmGMuOyBRcmfTTSQglvqqg9GFwiYk39ciDvSQW2K0yN2ITNgqmBg3oB9mHkwsRczzGR6cQTYl8hvZPkZRh74pMgMN7oCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TQLsbTbF; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CAT094021320;
	Wed, 12 Feb 2025 14:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=kdbdrs8hWKIdppRKu
	for5ddAEudusp4cDLzfQcOtm6Y=; b=TQLsbTbFvfcUaQI3fF/LtSDAZ9oBIAgzR
	CgMz5sov2D3b0h1OhyhljV1ADXAn3nn5qW2xtnUlnTJPXI5hf2upfCVKy+c2T97T
	PbNhSIrOzvY4tUEcKHOet603yFpevbrufqAatUeaCxh7vso6c1+7k0dzyQMFFRoc
	K2MNRC121L0IwzbnVAK3I36rmqp+u5ITv+cr2biXXmZEGLquAJOgrOJY/Xt9i+VC
	II8WUlpIm64MxMspPLgeTHkHQCMgVsuVJGpuTp1X/48phxPLgCNQmUk8RWVqMGOz
	YxheldRh6JwJmOAjmwjzH08QG4C4Et7G4GAyXbovdTiHGUFYsndOA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r9cue6p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 14:30:41 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51CEJmmc022120;
	Wed, 12 Feb 2025 14:30:40 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r9cue6nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 14:30:40 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51CDV1QZ012083;
	Wed, 12 Feb 2025 14:30:40 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pktk120q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 14:30:40 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51CEUd9D14615156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 14:30:40 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D605758065;
	Wed, 12 Feb 2025 14:30:39 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B502958068;
	Wed, 12 Feb 2025 14:30:39 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.210])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Feb 2025 14:30:39 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Cc: eajames@linux.ibm.com, andy.shevchenko@gmail.com, lee@kernel.org,
        pavel@kernel.org
Subject: [PATCH v8 3/4] leds: pca955x: Optimize probe led selection
Date: Wed, 12 Feb 2025 08:30:37 -0600
Message-ID: <20250212143038.1416501-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250212143038.1416501-1-eajames@linux.ibm.com>
References: <20250212143038.1416501-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: r47-l7TSvlSkRS1y9gxDf5mWtVvooPzP
X-Proofpoint-GUID: p8ZNk2AbylB7jMuYSzC2aXKx_t5AhTM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 mlxlogscore=716 mlxscore=0 clxscore=1011 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120111

Previously, the probe function might do up to 32 reads and writes
to the same 4 registers to program the led selection. Reduce this to
a maximum of 5 operations by accumulating the changes to the led
selection and comparing with the previous value to write the
selection if different.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
Changes since v7:
 - Improve comment
 - Use post-increment

 drivers/leds/leds-pca955x.c | 38 +++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 4990f8aff6d16..eb268e6ee2a8b 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -446,7 +446,9 @@ static int pca955x_probe(struct i2c_client *client)
 	struct led_classdev *led;
 	struct led_init_data init_data;
 	struct i2c_adapter *adapter;
-	int i, err;
+	int i, bit, err, nls, reg;
+	u8 ls1[4];
+	u8 ls2[4];
 	struct pca955x_platform_data *pdata;
 	bool set_default_label = false;
 	bool keep_pwm = false;
@@ -504,6 +506,17 @@ static int pca955x_probe(struct i2c_client *client)
 	init_data.devname_mandatory = false;
 	init_data.devicename = "pca955x";
 
+	nls = pca955x_num_led_regs(chip->bits);
+	/* Use auto-increment feature to read all the LED selectors at once. */
+	err = i2c_smbus_read_i2c_block_data(client,
+					    0x10 | (pca955x_num_input_regs(chip->bits) + 4), nls,
+					    ls1);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < nls; i++)
+		ls2[i] = ls1[i];
+
 	for (i = 0; i < chip->bits; i++) {
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
@@ -515,19 +528,16 @@ static int pca955x_probe(struct i2c_client *client)
 		case PCA955X_TYPE_GPIO:
 			break;
 		case PCA955X_TYPE_LED:
+			bit = i % 4;
+			reg = i / 4;
 			led = &pca955x_led->led_cdev;
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
 
-			if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF) {
-				err = pca955x_led_set(led, LED_OFF);
-				if (err)
-					return err;
-			} else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON) {
-				err = pca955x_led_set(led, LED_FULL);
-				if (err)
-					return err;
-			}
+			if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF)
+				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_OFF);
+			else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON)
+				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_ON);
 
 			init_data.fwnode = pdata->leds[i].fwnode;
 
@@ -571,6 +581,14 @@ static int pca955x_probe(struct i2c_client *client)
 		}
 	}
 
+	for (i = 0; i < nls; i++) {
+		if (ls1[i] != ls2[i]) {
+			err = pca955x_write_ls(pca955x, i, ls2[i]);
+			if (err)
+				return err;
+		}
+	}
+
 	/* PWM0 is used for half brightness or 50% duty cycle */
 	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
 	if (err)
-- 
2.43.5


