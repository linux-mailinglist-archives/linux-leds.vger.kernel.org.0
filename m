Return-Path: <linux-leds+bounces-3859-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68656A234F3
	for <lists+linux-leds@lfdr.de>; Thu, 30 Jan 2025 21:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D4471624E1
	for <lists+linux-leds@lfdr.de>; Thu, 30 Jan 2025 20:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46541F12F2;
	Thu, 30 Jan 2025 20:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EkOkz1qw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC481F130A
	for <linux-leds@vger.kernel.org>; Thu, 30 Jan 2025 20:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738267979; cv=none; b=iIpthAc0anWT098LjPPPaA+DNabbtRju0VSOkhPEL/i1mTkmSUuo5VNrBcYg3ffuT4SR+U8b5oEHxBKisRG35gKcSRUsRvQeWUYANxDnFRvfR0KWnand/p4giR20QZLqKP8DyG6Y2OqbLsLuzXhxF06+fgp+xFi870ccJ6LxYa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738267979; c=relaxed/simple;
	bh=HUk64tGkozM1XtDmMYMR6QpBPfvulA1Uw9FYnJqhX5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezqnXByLihSWoTJxEiUPIpa9sRzBZ87cSNsEJiVk2wXJygaVf8CnHgniqGlGEYSbaJRC4Mbu9i5Nz++z5fDV1D95e+OxWPN5bxg4yyErY3PitFqIqCCzd9qQ7/HQH6E7uUawTGJHagn3DCSF8fYNwe+baZggdSUwBwxU6jhFH1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EkOkz1qw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJUbvg018501;
	Thu, 30 Jan 2025 20:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=eq6ZT4Vs2pmIeEUdy
	qNCoyZuZ0TaHYFbEJ+7j1YWucU=; b=EkOkz1qw7X7dFXcM65u5t+sEh7+3rlejf
	cLLXu4LYo9t1ds+eAwB5qzipu3vaIt1Mskm6v5Zt1tn7yEXtmrdwvpG/2pDVaDu+
	We4ycBzQDtUxCakpwq7aiWXm6syjEgSoOgDAxpetV49BC1HdvE0WAbw/Ho06o6He
	1dX1JOMqA467A65qq7wiusjQ6VPQhauDUcWXRH7FPqb0tLjQFVIwNzM6wfhPsFNN
	AuxRn7FlUx0LIU4/y8LZpPcLIk7FCJZwrWJ+/+A/xyY+YBHhvLAcxlO9VkESDUBA
	e52i9Q6p9Nfy9t+b1qqzgA6eJ/OecudGtQMArYXWpGWStIw+E3WEg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gfn4r581-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:12:50 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50UKArkB006496;
	Thu, 30 Jan 2025 20:12:50 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gfn4r57x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:12:50 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ8lFx017196;
	Thu, 30 Jan 2025 20:12:49 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44gfay8756-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:12:49 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50UKCmRT22348422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 20:12:48 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAD4358054;
	Thu, 30 Jan 2025 20:12:48 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6314A58055;
	Thu, 30 Jan 2025 20:12:48 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.92.209])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jan 2025 20:12:48 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org, pavel@ucw.cz, andy.shevchenko@gmail.com,
        eajames@linux.ibm.com
Subject: [PATCH v7 RESEND 4/4] leds: pca955x: Add HW blink support
Date: Thu, 30 Jan 2025 14:12:46 -0600
Message-ID: <20250130201246.292079-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250130201246.292079-1-eajames@linux.ibm.com>
References: <20250130201246.292079-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZB-W1jhxanHX_cqk5c0Nfc7x-szF8bKs
X-Proofpoint-ORIG-GUID: VykYTvBgMy3PlZCHLzef1j9kFqD9i7Xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_09,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501300153

Support blinking using the PCA955x chip. Use PWM0 for blinking
instead of LED_HALF brightness. Since there is only one frequency
and brightness register for any blinking LED, track the blink state
of each LED and only support one HW blinking frequency. If another
frequency is requested, fallback to software blinking. In addition,
blinked LEDs can only use full brightness in order to maintain 50%
duty cycle, which is required for the specified blink rate.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-pca955x.c | 221 +++++++++++++++++++++++++++---------
 1 file changed, 169 insertions(+), 52 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 8bdebc14ea2e6..6e0e9deecb4a6 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -62,6 +62,8 @@
 #define PCA955X_GPIO_HIGH	LED_OFF
 #define PCA955X_GPIO_LOW	LED_FULL
 
+#define PCA955X_BLINK_DEFAULT_MS	1000
+
 enum pca955x_type {
 	pca9550,
 	pca9551,
@@ -74,6 +76,7 @@ struct pca955x_chipdef {
 	int			bits;
 	u8			slv_addr;	/* 7-bit slave address mask */
 	int			slv_addr_shift;	/* Number of bits to ignore */
+	int			blink_div;	/* PSC divider */
 };
 
 static const struct pca955x_chipdef pca955x_chipdefs[] = {
@@ -81,26 +84,31 @@ static const struct pca955x_chipdef pca955x_chipdefs[] = {
 		.bits		= 2,
 		.slv_addr	= /* 110000x */ 0x60,
 		.slv_addr_shift	= 1,
+		.blink_div	= 44,
 	},
 	[pca9551] = {
 		.bits		= 8,
 		.slv_addr	= /* 1100xxx */ 0x60,
 		.slv_addr_shift	= 3,
+		.blink_div	= 38,
 	},
 	[pca9552] = {
 		.bits		= 16,
 		.slv_addr	= /* 1100xxx */ 0x60,
 		.slv_addr_shift	= 3,
+		.blink_div	= 44,
 	},
 	[ibm_pca9552] = {
 		.bits		= 16,
 		.slv_addr	= /* 0110xxx */ 0x30,
 		.slv_addr_shift	= 3,
+		.blink_div	= 44,
 	},
 	[pca9553] = {
 		.bits		= 4,
 		.slv_addr	= /* 110001x */ 0x62,
 		.slv_addr_shift	= 1,
+		.blink_div	= 44,
 	},
 };
 
@@ -109,7 +117,9 @@ struct pca955x {
 	struct pca955x_led *leds;
 	const struct pca955x_chipdef	*chipdef;
 	struct i2c_client	*client;
+	unsigned long active_blink;
 	unsigned long active_pins;
+	unsigned long blink_period;
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 	struct gpio_chip gpio;
 #endif
@@ -154,7 +164,8 @@ static inline int pca955x_ledstate(u8 ls, int led_num)
 
 /*
  * Write to frequency prescaler register, used to program the
- * period of the PWM output.  period = (PSCx + 1) / 38
+ * period of the PWM output.  period = (PSCx + 1) / coeff
+ * Where for pca9551 chips coeff = 38 and for all other chips coeff = 44
  */
 static int pca955x_write_psc(struct pca955x *pca955x, int n, u8 val)
 {
@@ -235,6 +246,20 @@ static int pca955x_read_pwm(struct pca955x *pca955x, int n, u8 *val)
 	return 0;
 }
 
+static int pca955x_read_psc(struct pca955x *pca955x, int n, u8 *val)
+{
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + (2 * n);
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(pca955x->client, cmd);
+	if (ret < 0) {
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", __func__, n, ret);
+		return ret;
+	}
+	*val = (u8)ret;
+	return 0;
+}
+
 static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 {
 	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
@@ -248,14 +273,12 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 
 	switch (pca955x_ledstate(ls, pca955x_led->led_num % 4)) {
 	case PCA955X_LS_LED_ON:
+	case PCA955X_LS_BLINK0:
 		ret = LED_FULL;
 		break;
 	case PCA955X_LS_LED_OFF:
 		ret = LED_OFF;
 		break;
-	case PCA955X_LS_BLINK0:
-		ret = LED_HALF;
-		break;
 	case PCA955X_LS_BLINK1:
 		ret = pca955x_read_pwm(pca955x, 1, &pwm);
 		if (ret)
@@ -283,29 +306,36 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	if (ret)
 		goto out;
 
-	switch (value) {
-	case LED_FULL:
-		ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_ON);
-		break;
-	case LED_OFF:
-		ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
-		break;
-	case LED_HALF:
-		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK0);
-		break;
-	default:
-		/*
-		 * Use PWM1 for all other values.  This has the unwanted
-		 * side effect of making all LEDs on the chip share the
-		 * same brightness level if set to a value other than
-		 * OFF, HALF, or FULL.  But, this is probably better than
-		 * just turning off for all other values.
-		 */
-		ret = pca955x_write_pwm(pca955x, 1, 255 - value);
-		if (ret)
+	if (test_bit(pca955x_led->led_num, &pca955x->active_blink)) {
+		if (value == LED_OFF) {
+			clear_bit(pca955x_led->led_num, &pca955x->active_blink);
+			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
+		} else {
+			/* No variable brightness for blinking LEDs */
 			goto out;
-		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
-		break;
+		}
+	} else {
+		switch (value) {
+		case LED_FULL:
+			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_ON);
+			break;
+		case LED_OFF:
+			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
+			break;
+		default:
+			/*
+			 * Use PWM1 for all other values. This has the unwanted
+			 * side effect of making all LEDs on the chip share the
+			 * same brightness level if set to a value other than
+			 * OFF or FULL. But, this is probably better than just
+			 * turning off for all other values.
+			 */
+			ret = pca955x_write_pwm(pca955x, 1, 255 - value);
+			if (ret)
+				goto out;
+			ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
+			break;
+		}
 	}
 
 	ret = pca955x_write_ls(pca955x, reg, ls);
@@ -316,6 +346,102 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	return ret;
 }
 
+static u8 pca955x_period_to_psc(struct pca955x *pca955x, unsigned long p)
+{
+	p *= pca955x->chipdef->blink_div;
+	p /= MSEC_PER_SEC;
+	p -= 1;
+
+	return p;
+}
+
+static unsigned long pca955x_psc_to_period(struct pca955x *pca955x, u8 psc)
+{
+	unsigned long p = psc;
+
+	p += 1;
+	p *= MSEC_PER_SEC;
+	p /= pca955x->chipdef->blink_div;
+
+	return p;
+}
+
+static int pca955x_led_blink(struct led_classdev *led_cdev,
+			     unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
+	struct pca955x *pca955x = pca955x_led->pca955x;
+	unsigned long p = *delay_on + *delay_off;
+	int ret = 0;
+
+	mutex_lock(&pca955x->lock);
+
+	if (p) {
+		if (*delay_on != *delay_off) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (p < pca955x_psc_to_period(pca955x, 0) ||
+		    p > pca955x_psc_to_period(pca955x, 0xff)) {
+			ret = -EINVAL;
+			goto out;
+		}
+	} else {
+		p = pca955x->active_blink ? pca955x->blink_period :
+			PCA955X_BLINK_DEFAULT_MS;
+	}
+
+	if (!pca955x->active_blink ||
+	    pca955x->active_blink == BIT(pca955x_led->led_num) ||
+	    pca955x->blink_period == p) {
+		u8 psc = pca955x_period_to_psc(pca955x, p);
+
+		if (!test_and_set_bit(pca955x_led->led_num,
+				      &pca955x->active_blink)) {
+			u8 ls;
+			int reg = pca955x_led->led_num / 4;
+			int bit = pca955x_led->led_num % 4;
+
+			ret = pca955x_read_ls(pca955x, reg, &ls);
+			if (ret)
+				goto out;
+
+			ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK0);
+			ret = pca955x_write_ls(pca955x, reg, ls);
+			if (ret)
+				goto out;
+
+			/*
+			 * Force 50% duty cycle to maintain the specified
+			 * blink rate.
+			 */
+			ret = pca955x_write_pwm(pca955x, 0, 128);
+			if (ret)
+				goto out;
+		}
+
+		if (pca955x->blink_period != p) {
+			pca955x->blink_period = p;
+			ret = pca955x_write_psc(pca955x, 0, psc);
+			if (ret)
+				goto out;
+		}
+
+		p = pca955x_psc_to_period(pca955x, psc);
+		p /= 2;
+		*delay_on = p;
+		*delay_off = p;
+	} else {
+		ret = -EBUSY;
+	}
+
+out:
+	mutex_unlock(&pca955x->lock);
+
+	return ret;
+}
+
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 /*
  * Read the INPUT register, which contains the state of LEDs.
@@ -450,8 +576,9 @@ static int pca955x_probe(struct i2c_client *client)
 	u8 ls1[4];
 	u8 ls2[4];
 	struct pca955x_platform_data *pdata;
+	u8 psc0;
+	bool keep_psc0 = false;
 	bool set_default_label = false;
-	bool keep_pwm = false;
 	char default_label[8];
 
 	chip = i2c_get_match_data(client);
@@ -502,6 +629,7 @@ static int pca955x_probe(struct i2c_client *client)
 	mutex_init(&pca955x->lock);
 	pca955x->client = client;
 	pca955x->chipdef = chip;
+	pca955x->blink_period = PCA955X_BLINK_DEFAULT_MS;
 
 	init_data.devname_mandatory = false;
 	init_data.devicename = "pca955x";
@@ -533,11 +661,16 @@ static int pca955x_probe(struct i2c_client *client)
 			led = &pca955x_led->led_cdev;
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
+			led->blink_set = pca955x_led_blink;
 
 			if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF)
 				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_OFF);
 			else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON)
 				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_ON);
+			else if (pca955x_ledstate(ls2[reg], bit) == PCA955X_LS_BLINK0) {
+				keep_psc0 = true;
+				set_bit(i, &pca955x->active_blink);
+			}
 
 			init_data.fwnode = pdata->leds[i].fwnode;
 
@@ -565,19 +698,6 @@ static int pca955x_probe(struct i2c_client *client)
 				return err;
 
 			set_bit(i, &pca955x->active_pins);
-
-			/*
-			 * For default-state == "keep", let the core update the
-			 * brightness from the hardware, then check the
-			 * brightness to see if it's using PWM1. If so, PWM1
-			 * should not be written below.
-			 */
-			if (pdata->leds[i].default_state == LEDS_DEFSTATE_KEEP) {
-				if (led->brightness != LED_FULL &&
-				    led->brightness != LED_OFF &&
-				    led->brightness != LED_HALF)
-					keep_pwm = true;
-			}
 		}
 	}
 
@@ -589,22 +709,19 @@ static int pca955x_probe(struct i2c_client *client)
 		}
 	}
 
-	/* PWM0 is used for half brightness or 50% duty cycle */
-	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
-	if (err)
-		return err;
-
-	if (!keep_pwm) {
-		/* PWM1 is used for variable brightness, default to OFF */
-		err = pca955x_write_pwm(pca955x, 1, 0);
-		if (err)
-			return err;
+	if (keep_psc0) {
+		err = pca955x_read_psc(pca955x, 0, &psc0);
+	} else {
+		psc0 = pca955x_period_to_psc(pca955x, pca955x->blink_period);
+		err = pca955x_write_psc(pca955x, 0, psc0);
 	}
 
-	/* Set to fast frequency so we do not see flashing */
-	err = pca955x_write_psc(pca955x, 0, 0);
 	if (err)
 		return err;
+
+	pca955x->blink_period = pca955x_psc_to_period(pca955x, psc0);
+
+	/* Set PWM1 to fast frequency so we do not see flashing */
 	err = pca955x_write_psc(pca955x, 1, 0);
 	if (err)
 		return err;
-- 
2.43.5


