Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBDA4FE614
	for <lists+linux-leds@lfdr.de>; Tue, 12 Apr 2022 18:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357775AbiDLQor (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 Apr 2022 12:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354982AbiDLQop (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2022 12:44:45 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4003252B35;
        Tue, 12 Apr 2022 09:42:27 -0700 (PDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CEn1GL024395;
        Tue, 12 Apr 2022 16:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dn9Xo1APJ5/6vVv+iF7WatOFLVeO5hfIGBJ+FAorzc0=;
 b=CoZZ6TqE3A11NeMvGIPtSn1SiiAcYc/nC+yeBbzS0EakV8hr04qB997uWQ86UnDGGi7d
 dq+ZqX1KOFCjzfmeP92KV8rnQi6/ykWQszEDZGeeUU/AXskl8PFGY2elJDfU60M8mc6V
 WraAiMLBmDcUH00O1yzPwh+OViVW8xuUf589fJs9MxljMVaJspN+A0q66CIADSjS42Iq
 N54vKyWzMLqFivjJRrP7SziDi6DhkYPZ3PglQM1uEJk2X9+OkUZm8UbGdugNzDgTfg+i
 807ZODQ1X0Jxpmn9RbYVFa/HOZeHuQA/DlYen3C2yVLvIaNr7DuYQxNSWnJH1LH8FrgG jA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3fdaqkv03n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Apr 2022 16:42:16 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CG09jH009631;
        Tue, 12 Apr 2022 16:42:15 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3fdaqkv035-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Apr 2022 16:42:15 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
        by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CGXSQe021142;
        Tue, 12 Apr 2022 16:42:14 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
        by ppma05wdc.us.ibm.com with ESMTP id 3fb1s9hebe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Apr 2022 16:42:14 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23CGgEjt38994274
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 16:42:14 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 182D5AE063;
        Tue, 12 Apr 2022 16:42:14 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 31CD7AE062;
        Tue, 12 Apr 2022 16:42:13 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.113.187])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 12 Apr 2022 16:42:13 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, joel@jms.id.au, dan.carpenter@oracle.com,
        patrick@stwcx.xyz, andy.shevchenko@gmail.com
Subject: [PATCH v4 1/4] leds: pca955x: Refactor with helper functions and renaming
Date:   Tue, 12 Apr 2022 11:42:08 -0500
Message-Id: <20220412164211.28824-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412164211.28824-1-eajames@linux.ibm.com>
References: <20220412164211.28824-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kRPknPFpCtAfEW7_AOMarc90M6v3bmvl
X-Proofpoint-ORIG-GUID: rULTmg6jJkwjszoBhA2D0BGZ7zFyJXrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=927 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204120079
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add helper functions to clean up the code, and rename a few
oddly named functions and variables.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-pca955x.c | 50 ++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 81aaf21212d7..a683c872e1ff 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -134,19 +134,21 @@ struct pca955x_led {
 	struct fwnode_handle	*fwnode;
 };
 
+#define led_to_pca955x(l)	container_of(l, struct pca955x_led, led_cdev)
+
 struct pca955x_platform_data {
 	struct pca955x_led	*leds;
 	int			num_leds;
 };
 
 /* 8 bits per input register */
-static inline int pca95xx_num_input_regs(int bits)
+static inline int pca955x_num_input_regs(int bits)
 {
 	return (bits + 7) / 8;
 }
 
 /* 4 bits per LED selector register */
-static inline int pca95xx_num_led_regs(int bits)
+static inline int pca955x_num_led_regs(int bits)
 {
 	return (bits + 3)  / 4;
 }
@@ -161,6 +163,11 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
 		((state & 0x3) << (led_num << 1));
 }
 
+static inline int pca955x_ledstate(u8 ls, int led_num)
+{
+	return (ls >> (led_num << 1)) & 0x3;
+}
+
 /*
  * Write to frequency prescaler register, used to program the
  * period of the PWM output.  period = (PSCx + 1) / 38
@@ -168,7 +175,7 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
 static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + (2 * n);
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + (2 * n);
 	int ret;
 
 	ret = i2c_smbus_write_byte_data(client, cmd, val);
@@ -188,7 +195,7 @@ static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
 	ret = i2c_smbus_write_byte_data(client, cmd, val);
@@ -205,7 +212,7 @@ static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
 static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n;
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
 	ret = i2c_smbus_write_byte_data(client, cmd, val);
@@ -222,7 +229,7 @@ static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
 static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n;
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
 	ret = i2c_smbus_read_byte_data(client, cmd);
@@ -238,7 +245,7 @@ static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
 	ret = i2c_smbus_read_byte_data(client, cmd);
@@ -253,9 +260,7 @@ static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
 
 static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 {
-	struct pca955x_led *pca955x_led = container_of(led_cdev,
-						       struct pca955x_led,
-						       led_cdev);
+	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
 	struct pca955x *pca955x = pca955x_led->pca955x;
 	u8 ls, pwm;
 	int ret;
@@ -264,8 +269,7 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 	if (ret)
 		return ret;
 
-	ls = (ls >> ((pca955x_led->led_num % 4) << 1)) & 0x3;
-	switch (ls) {
+	switch (pca955x_ledstate(ls, pca955x_led->led_num % 4)) {
 	case PCA955X_LS_LED_ON:
 		ret = LED_FULL;
 		break;
@@ -289,19 +293,13 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 static int pca955x_led_set(struct led_classdev *led_cdev,
 			    enum led_brightness value)
 {
-	struct pca955x_led *pca955x_led;
-	struct pca955x *pca955x;
+	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
+	struct pca955x *pca955x = pca955x_led->pca955x;
+	int reg = pca955x_led->led_num / 4;
+	int bit = pca955x_led->led_num % 4;
 	u8 ls;
-	int chip_ls;	/* which LSx to use (0-3 potentially) */
-	int ls_led;	/* which set of bits within LSx to use (0-3) */
 	int ret;
 
-	pca955x_led = container_of(led_cdev, struct pca955x_led, led_cdev);
-	pca955x = pca955x_led->pca955x;
-
-	chip_ls = pca955x_led->led_num / 4;
-	ls_led = pca955x_led->led_num % 4;
-
 	mutex_lock(&pca955x->lock);
 
 	ret = pca955x_read_ls(pca955x->client, chip_ls, &ls);
@@ -310,13 +308,13 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 
 	switch (value) {
 	case LED_FULL:
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
+		ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_ON);
 		break;
 	case LED_OFF:
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OFF);
+		ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
 		break;
 	case LED_HALF:
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK0);
+		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK0);
 		break;
 	default:
 		/*
@@ -329,7 +327,7 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 		ret = pca955x_write_pwm(pca955x->client, 1, 255 - value);
 		if (ret)
 			goto out;
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK1);
+		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
 		break;
 	}
 
-- 
2.27.0

