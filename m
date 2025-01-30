Return-Path: <linux-leds+bounces-3856-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B660A234ED
	for <lists+linux-leds@lfdr.de>; Thu, 30 Jan 2025 21:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2701887FB4
	for <lists+linux-leds@lfdr.de>; Thu, 30 Jan 2025 20:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B5A1F1312;
	Thu, 30 Jan 2025 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HBRCQ8qr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555E91EEA43
	for <linux-leds@vger.kernel.org>; Thu, 30 Jan 2025 20:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738267977; cv=none; b=TO7AX9FhsILZcWCyzk5e4cR+U4DhP7YFjQ/2UqvzFbt6XZ/xsTgT5gjWAvfS//Eu1sT9LgKtPOBSfkHE38v1DZjAUs30YuAszmNw/r/D4ZeH9aXklV6rw+7+ONNhJqGoMc3pKXzkNx5Q5IQe21HMdWvMBm0IRO4QdbhTyuFQ+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738267977; c=relaxed/simple;
	bh=9KGCHgjovlcK5XrnD5jnkmmToaXePww/iq4vlR4s49U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgM67fpzl+YaVt+cb4P3WSd3K+Pz/L/K52t9w+fN/6QsK2lFW5QGUSJc2GRDRCu1tJ4sY6tlkiRFYFQYJXtC3Mp9sfYoqSxqfja2XLXQ4Jp0e+xEoug9SGLvSUOXUYGbVykCvtDkDfBhNqNaqGQUABtaQs4Tnnh9xx5XovfsSxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HBRCQ8qr; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJUYv0024279;
	Thu, 30 Jan 2025 20:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=k80e+u6/Ql2NWACKD
	DC6QYoK4nwJH+jfVAEChXUCh+k=; b=HBRCQ8qrV1en8957CN17VYTHVMKvV9mFH
	KA4BmMCSizV5USIeeG+LxLxoAY8VSUak6hPKdQxI31kqL2peynGgz34gOH2N2sVo
	N3gWdh43ww1BvKPUCT0ARJhrLlOmspXFZ5lDwZqR709kBKqozgpaIgvD4nNZuDu+
	R1CFpNff8TjghXyM65vH9wsEU0BMIlUF49tpCemtYLrvkbh1vtIz5zorEMDJqKTj
	XzCDta4al3tep11IpR3K9qErK43+pnSvEXQDeg8PyC6MKAyPMYikQE3vUNRSb5FW
	7uKZ6KXPBmxPo0iEfv+W9JfdBCdW47Su7/+h4oh8xpS9SR1EEpIkw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gfn585f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:12:49 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50UKCmPs020369;
	Thu, 30 Jan 2025 20:12:48 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gfn585f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:12:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ8oPq017346;
	Thu, 30 Jan 2025 20:12:48 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44gfax875p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:12:48 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50UKClL620775626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 20:12:48 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D415858054;
	Thu, 30 Jan 2025 20:12:47 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C5CB58055;
	Thu, 30 Jan 2025 20:12:47 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.92.209])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jan 2025 20:12:47 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org, pavel@ucw.cz, andy.shevchenko@gmail.com,
        eajames@linux.ibm.com
Subject: [PATCH v7 RESEND 2/4] leds: pca955x: Use pointers to driver data rather than I2C client
Date: Thu, 30 Jan 2025 14:12:44 -0600
Message-ID: <20250130201246.292079-3-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: PMdm7Chvtybr-zFuEdzQyNlI6Lbd557O
X-Proofpoint-GUID: vDDkreWjWZOnlpJXSPWMwTeaZY2FgHbB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_09,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=767 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501300153

As a minor clean up item, pass the driver data pointer instead of the
I2C client to the reader and writer helper functions. Now the PCA
driver data doesn't have to be looked up again in the I2C client data

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-pca955x.c | 61 ++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 4a7111a24ab49..4990f8aff6d16 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -156,16 +156,15 @@ static inline int pca955x_ledstate(u8 ls, int led_num)
  * Write to frequency prescaler register, used to program the
  * period of the PWM output.  period = (PSCx + 1) / 38
  */
-static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_psc(struct pca955x *pca955x, int n, u8 val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
 	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client, cmd, val);
+	ret = i2c_smbus_write_byte_data(pca955x->client, cmd, val);
 	if (ret < 0)
-		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
-			__func__, n, val, ret);
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n,
+			val, ret);
 	return ret;
 }
 
@@ -176,16 +175,15 @@ static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
  *
  * Duty cycle is (256 - PWMx) / 256
  */
-static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_pwm(struct pca955x *pca955x, int n, u8 val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
 	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client, cmd, val);
+	ret = i2c_smbus_write_byte_data(pca955x->client, cmd, val);
 	if (ret < 0)
-		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
-			__func__, n, val, ret);
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n,
+			val, ret);
 	return ret;
 }
 
@@ -193,16 +191,15 @@ static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
  * Write to LED selector register, which determines the source that
  * drives the LED output.
  */
-static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_ls(struct pca955x *pca955x, int n, u8 val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
 	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client, cmd, val);
+	ret = i2c_smbus_write_byte_data(pca955x->client, cmd, val);
 	if (ret < 0)
-		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
-			__func__, n, val, ret);
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n,
+			val, ret);
 	return ret;
 }
 
@@ -210,32 +207,28 @@ static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
  * Read the LED selector register, which determines the source that
  * drives the LED output.
  */
-static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
+static int pca955x_read_ls(struct pca955x *pca955x, int n, u8 *val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
 	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(client, cmd);
+	ret = i2c_smbus_read_byte_data(pca955x->client, cmd);
 	if (ret < 0) {
-		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
-			__func__, n, ret);
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", __func__, n, ret);
 		return ret;
 	}
 	*val = (u8)ret;
 	return 0;
 }
 
-static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
+static int pca955x_read_pwm(struct pca955x *pca955x, int n, u8 *val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
 	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(client, cmd);
+	ret = i2c_smbus_read_byte_data(pca955x->client, cmd);
 	if (ret < 0) {
-		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
-			__func__, n, ret);
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", __func__, n, ret);
 		return ret;
 	}
 	*val = (u8)ret;
@@ -249,7 +242,7 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 	u8 ls, pwm;
 	int ret;
 
-	ret = pca955x_read_ls(pca955x->client, pca955x_led->led_num / 4, &ls);
+	ret = pca955x_read_ls(pca955x, pca955x_led->led_num / 4, &ls);
 	if (ret)
 		return ret;
 
@@ -264,7 +257,7 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 		ret = LED_HALF;
 		break;
 	case PCA955X_LS_BLINK1:
-		ret = pca955x_read_pwm(pca955x->client, 1, &pwm);
+		ret = pca955x_read_pwm(pca955x, 1, &pwm);
 		if (ret)
 			return ret;
 		ret = 255 - pwm;
@@ -286,7 +279,7 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 
 	mutex_lock(&pca955x->lock);
 
-	ret = pca955x_read_ls(pca955x->client, reg, &ls);
+	ret = pca955x_read_ls(pca955x, reg, &ls);
 	if (ret)
 		goto out;
 
@@ -308,14 +301,14 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 		 * OFF, HALF, or FULL.  But, this is probably better than
 		 * just turning off for all other values.
 		 */
-		ret = pca955x_write_pwm(pca955x->client, 1, 255 - value);
+		ret = pca955x_write_pwm(pca955x, 1, 255 - value);
 		if (ret)
 			goto out;
 		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
 		break;
 	}
 
-	ret = pca955x_write_ls(pca955x->client, reg, ls);
+	ret = pca955x_write_ls(pca955x, reg, ls);
 
 out:
 	mutex_unlock(&pca955x->lock);
@@ -579,22 +572,22 @@ static int pca955x_probe(struct i2c_client *client)
 	}
 
 	/* PWM0 is used for half brightness or 50% duty cycle */
-	err = pca955x_write_pwm(client, 0, 255 - LED_HALF);
+	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
 	if (err)
 		return err;
 
 	if (!keep_pwm) {
 		/* PWM1 is used for variable brightness, default to OFF */
-		err = pca955x_write_pwm(client, 1, 0);
+		err = pca955x_write_pwm(pca955x, 1, 0);
 		if (err)
 			return err;
 	}
 
 	/* Set to fast frequency so we do not see flashing */
-	err = pca955x_write_psc(client, 0, 0);
+	err = pca955x_write_psc(pca955x, 0, 0);
 	if (err)
 		return err;
-	err = pca955x_write_psc(client, 1, 0);
+	err = pca955x_write_psc(pca955x, 1, 0);
 	if (err)
 		return err;
 
-- 
2.43.5


