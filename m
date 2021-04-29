Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0C536F155
	for <lists+linux-leds@lfdr.de>; Thu, 29 Apr 2021 22:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237173AbhD2UvJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Apr 2021 16:51:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26748 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237175AbhD2UvG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Apr 2021 16:51:06 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13TKYg4W137975;
        Thu, 29 Apr 2021 16:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4K4No1wgqshj6qsOA+DEubDBMzndscSeJwTUX4nhr3Y=;
 b=Id1KEDSWeD+tNTq6aEOHFws3Gtil0mOXhwGUNZ8V6t/sMl115i0Is2na5zk5cCW/zoZY
 WtSrb3SoFYgR0Bp15KcxK0SZ5Fpilxu54+hVC/v+g6S7ab0hpnZWJsp/GVlZVd4WmNMM
 3uOm9I/mKJlziliqAJaQqUA0ETzhR6vso5n9oZxQgKxtEy+OOrX+QvZ22TeSbjlJARri
 oDVulR74Sbyw1qPOxMaqBDh5PSFKG3jimYJdErDqxVvx7ta2XrhfOI94BtejXekJUQGy
 C/PCe4k0aTFn+6btqm8qW5qChLrVgHplFsPp7jtSWGlb5s0Bi8puCfdmCEsqRK18nY6x cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883t70gvv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:17 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13TKYri0138526;
        Thu, 29 Apr 2021 16:50:16 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883t70gvn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:16 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TKg67R005975;
        Thu, 29 Apr 2021 20:50:15 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma03dal.us.ibm.com with ESMTP id 384ay9rnr2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 20:50:15 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13TKoFlh52494678
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 20:50:15 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EC71B28065;
        Thu, 29 Apr 2021 20:50:14 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 13D222805A;
        Thu, 29 Apr 2021 20:50:14 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.73.43])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 29 Apr 2021 20:50:13 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, robh+dt@kernel.or,
        devicetree@vger.kernel.org, vishwa@linux.ibm.com,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 3/5] leds: pca955x: Clean up code formatting
Date:   Thu, 29 Apr 2021 15:50:00 -0500
Message-Id: <20210429205002.70245-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429205002.70245-1-eajames@linux.ibm.com>
References: <20210429205002.70245-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HNJOdO0LsZIyCInRmggpRBp2ytNeIZNK
X-Proofpoint-ORIG-GUID: c8RNzEa7tX8ez2pKdnS1vVgCG8dFHG3d
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-29_11:2021-04-28,2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290133
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Format the code. Add some variables to help shorten lines.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 63 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 7087ca4592fc..f0d841cb59fc 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -166,11 +166,10 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
 static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client,
-		pca95xx_num_input_regs(pca955x->chipdef->bits) + 2*n,
-		val);
+	ret = i2c_smbus_write_byte_data(client, cmd, val);
 	if (ret < 0)
 		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
 			__func__, n, val, ret);
@@ -187,11 +186,10 @@ static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client,
-		pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + 2*n,
-		val);
+	ret = i2c_smbus_write_byte_data(client, cmd, val);
 	if (ret < 0)
 		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
 			__func__, n, val, ret);
@@ -205,11 +203,10 @@ static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
 static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client,
-		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n,
-		val);
+	ret = i2c_smbus_write_byte_data(client, cmd, val);
 	if (ret < 0)
 		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
 			__func__, n, val, ret);
@@ -223,10 +220,10 @@ static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
 static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(client,
-		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n);
+	ret = i2c_smbus_read_byte_data(client, cmd);
 	if (ret < 0) {
 		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
 			__func__, n, ret);
@@ -371,6 +368,7 @@ static struct pca955x_platform_data *
 pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 {
 	struct pca955x_platform_data *pdata;
+	struct pca955x_led *led;
 	struct fwnode_handle *child;
 	int count;
 
@@ -401,13 +399,13 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		if ((res != 0) && is_of_node(child))
 			name = to_of_node(child)->name;
 
-		snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].name),
-			 "%s", name);
+		led = &pdata->leds[reg];
+		snprintf(led->name, sizeof(led->name), "%s", name);
 
-		pdata->leds[reg].type = PCA955X_TYPE_LED;
-		fwnode_property_read_u32(child, "type", &pdata->leds[reg].type);
+		led->type = PCA955X_TYPE_LED;
+		fwnode_property_read_u32(child, "type", &led->type);
 		fwnode_property_read_string(child, "linux,default-trigger",
-					&pdata->leds[reg].default_trigger);
+					    &led->default_trigger);
 	}
 
 	pdata->num_leds = chip->bits;
@@ -426,11 +424,12 @@ static const struct of_device_id of_pca955x_match[] = {
 MODULE_DEVICE_TABLE(of, of_pca955x_match);
 
 static int pca955x_probe(struct i2c_client *client,
-					const struct i2c_device_id *id)
+			 const struct i2c_device_id *id)
 {
 	struct pca955x *pca955x;
 	struct pca955x_led *pca955x_led;
 	struct pca955x_chipdef *chip;
+	struct led_classdev *led;
 	struct i2c_adapter *adapter;
 	int i, err;
 	struct pca955x_platform_data *pdata;
@@ -449,13 +448,13 @@ static int pca955x_probe(struct i2c_client *client,
 	if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
 	    chip->slv_addr) {
 		dev_err(&client->dev, "invalid slave address %02x\n",
-				client->addr);
+			client->addr);
 		return -ENODEV;
 	}
 
 	dev_info(&client->dev, "leds-pca955x: Using %s %d-bit LED driver at "
-			"slave address 0x%02x\n",
-			client->name, chip->bits, client->addr);
+		 "slave address 0x%02x\n", client->name, chip->bits,
+		 client->addr);
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
@@ -471,8 +470,8 @@ static int pca955x_probe(struct i2c_client *client,
 	if (!pca955x)
 		return -ENOMEM;
 
-	pca955x->leds = devm_kcalloc(&client->dev,
-			chip->bits, sizeof(*pca955x_led), GFP_KERNEL);
+	pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
+				     sizeof(*pca955x_led), GFP_KERNEL);
 	if (!pca955x->leds)
 		return -ENOMEM;
 
@@ -501,27 +500,25 @@ static int pca955x_probe(struct i2c_client *client,
 			 */
 			if (pdata->leds[i].name[0] == '\0')
 				snprintf(pdata->leds[i].name,
-					sizeof(pdata->leds[i].name), "%d", i);
+					 sizeof(pdata->leds[i].name), "%d", i);
 
-			snprintf(pca955x_led->name,
-				sizeof(pca955x_led->name), "pca955x:%s",
-				pdata->leds[i].name);
+			snprintf(pca955x_led->name, sizeof(pca955x_led->name),
+				 "pca955x:%s", pdata->leds[i].name);
 
+			led = &pca955x_led->led_cdev;
 			if (pdata->leds[i].default_trigger)
-				pca955x_led->led_cdev.default_trigger =
+				led->default_trigger =
 					pdata->leds[i].default_trigger;
 
-			pca955x_led->led_cdev.name = pca955x_led->name;
-			pca955x_led->led_cdev.brightness_set_blocking =
-				pca955x_led_set;
+			led->name = pca955x_led->name;
+			led->brightness_set_blocking = pca955x_led_set;
 
-			err = devm_led_classdev_register(&client->dev,
-							&pca955x_led->led_cdev);
+			err = devm_led_classdev_register(&client->dev, led);
 			if (err)
 				return err;
 
 			/* Turn off LED */
-			err = pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
+			err = pca955x_led_set(led, LED_OFF);
 			if (err)
 				return err;
 		}
-- 
2.27.0

