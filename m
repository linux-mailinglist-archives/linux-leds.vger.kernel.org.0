Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6F23CBEEE
	for <lists+linux-leds@lfdr.de>; Sat, 17 Jul 2021 00:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233454AbhGPWGp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 18:06:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12714 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236239AbhGPWGh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Jul 2021 18:06:37 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GLYPSp179480;
        Fri, 16 Jul 2021 18:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4K4No1wgqshj6qsOA+DEubDBMzndscSeJwTUX4nhr3Y=;
 b=Q75XfwlR+O9W4OGMkpOgs08RubuUjBla91KRWaI88joUb7ThcdbH/k3OeuGskUe4J+zy
 bMbqGO7nS0dcnZf1E8oObZLqe0oS6xzVXGT1sKbbNayC0CKFu99I+r5x6NCBrLAA0lMx
 flgQjX3+v1Xfrn469kFbfp3STex2mE0jYS8r7I7aOT3MYxFvp27bxrATsbO1gFxpiPjs
 kJuMQZMFKbd0LcX9iEiZiasr7YWaryILiRgjHqOUDMhHJgk5RanPt69YXqJfmEZmWtG7
 A2qTaAreKiPIJhLWjfA5hU2TvaBfrg3fjOTDN3TgRLxvnme/t2Uhe4TYqPUS2tHLUrI/ 2w== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
        by mx0b-001b2d01.pphosted.com with ESMTP id 39tw2sac70-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 18:03:38 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
        by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GLvj6o026238;
        Fri, 16 Jul 2021 22:03:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma05wdc.us.ibm.com with ESMTP id 39q36ffrn6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 22:03:37 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16GM3aTc42467716
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jul 2021 22:03:36 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3308FC6062;
        Fri, 16 Jul 2021 22:03:36 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DD99AC6055;
        Fri, 16 Jul 2021 22:03:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jul 2021 22:03:35 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, pavel@ucw.cz,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 3/7] leds: pca955x: Clean up code formatting
Date:   Fri, 16 Jul 2021 17:03:27 -0500
Message-Id: <20210716220331.49303-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716220331.49303-1-eajames@linux.ibm.com>
References: <20210716220331.49303-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KABkywCkS8IXiPhyLqMDU_bQTp0eZHrW
X-Proofpoint-ORIG-GUID: KABkywCkS8IXiPhyLqMDU_bQTp0eZHrW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_10:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107160136
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

