Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A833E4FC21A
	for <lists+linux-leds@lfdr.de>; Mon, 11 Apr 2022 18:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348347AbiDKQXH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Apr 2022 12:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348502AbiDKQXF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Apr 2022 12:23:05 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C2830F4A;
        Mon, 11 Apr 2022 09:20:50 -0700 (PDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BFktCA023842;
        Mon, 11 Apr 2022 16:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5jYZDB2JMXEjGy9rUnGqErYalGr2ahOf22n3Krhxkcw=;
 b=svRS6mByzld2muX3LVXbpd212dBHqjfzNlifDgLIVL67XlERX1vhpc8fyJIYi/ZjZ6BY
 H4qNMUh064wkthIPZQMthHMVcOLI6FBWzo4wk4xgJXISjt7WeaafMX7Q4/kmYDPB2MQI
 qdxL0jaQf5AxHqJPGaTbk/A3bT6XHDxhOOH7WkrA8tI5E2AVdtJ26nTgr964KdWSTCRn
 dwKPijVt61BYCTsqyOJ3X54IbPKOuhtdsHQzzzkTBhFWE6Viu2uX3vOq6GRYO8ZH5na6
 mSES1bdjWrIxJcOLHIAOBwDWLxq97NZYulZOW/ByIT08L4kAJXXmJIQj/s04g7Yumrlt hg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3fcn5844jt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Apr 2022 16:20:40 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BGJ6DO016500;
        Mon, 11 Apr 2022 16:20:40 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3fcn5844jp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Apr 2022 16:20:40 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BGDalI008715;
        Mon, 11 Apr 2022 16:20:39 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma03wdc.us.ibm.com with ESMTP id 3fb1s98y57-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Apr 2022 16:20:39 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23BGKdZp16646434
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 Apr 2022 16:20:39 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4FF14124062;
        Mon, 11 Apr 2022 16:20:39 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7693E12405C;
        Mon, 11 Apr 2022 16:20:38 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.106.206])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon, 11 Apr 2022 16:20:38 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, pavel@ucw.cz, patrick@stwcx.xyz,
        andy.shevchenko@gmail.com, openbmc@lists.ozlabs.org,
        joel@jms.id.au, Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v3 2/4] leds: pca955x: Use pointers to driver data rather than I2C client
Date:   Mon, 11 Apr 2022 11:20:31 -0500
Message-Id: <20220411162033.39613-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220411162033.39613-1-eajames@linux.ibm.com>
References: <20220411162033.39613-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Yy6DaaP0tieMp4nkbT10PoULF0zvjZUE
X-Proofpoint-ORIG-GUID: lEPHX0FBFGFIwV6jIQmMzpNTTiZE650J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_06,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 mlxlogscore=596 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204110089
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

As a minor clean up item, pass the driver data pointer instead of the
I2C client to the reader and writer helper functions. Now the PCA
driver data doesn't have to be looked up again in the I2C client data

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 61 ++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index a683c872e1ff..cb1895b79eab 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -172,16 +172,15 @@ static inline int pca955x_ledstate(u8 ls, int led_num)
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
 
@@ -192,16 +191,15 @@ static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
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
 
@@ -209,16 +207,15 @@ static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
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
 
@@ -226,32 +223,28 @@ static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
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
@@ -265,7 +258,7 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 	u8 ls, pwm;
 	int ret;
 
-	ret = pca955x_read_ls(pca955x->client, pca955x_led->led_num / 4, &ls);
+	ret = pca955x_read_ls(pca955x, pca955x_led->led_num / 4, &ls);
 	if (ret)
 		return ret;
 
@@ -280,7 +273,7 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 		ret = LED_HALF;
 		break;
 	case PCA955X_LS_BLINK1:
-		ret = pca955x_read_pwm(pca955x->client, 1, &pwm);
+		ret = pca955x_read_pwm(pca955x, 1, &pwm);
 		if (ret)
 			return ret;
 		ret = 255 - pwm;
@@ -302,7 +295,7 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 
 	mutex_lock(&pca955x->lock);
 
-	ret = pca955x_read_ls(pca955x->client, chip_ls, &ls);
+	ret = pca955x_read_ls(pca955x, reg, &ls);
 	if (ret)
 		goto out;
 
@@ -324,14 +317,14 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
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
 
-	ret = pca955x_write_ls(pca955x->client, chip_ls, ls);
+	ret = pca955x_write_ls(pca955x, reg, ls);
 
 out:
 	mutex_unlock(&pca955x->lock);
@@ -632,22 +625,22 @@ static int pca955x_probe(struct i2c_client *client)
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
2.27.0

