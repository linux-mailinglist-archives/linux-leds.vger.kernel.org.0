Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D29C36F15A
	for <lists+linux-leds@lfdr.de>; Thu, 29 Apr 2021 22:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237190AbhD2UvK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Apr 2021 16:51:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17882 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237135AbhD2UvJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Apr 2021 16:51:09 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13TKYeSI179019;
        Thu, 29 Apr 2021 16:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CgwkWaQ4NJl1owyNiDDwL3ETFjvGMyOr55HMbCiRtig=;
 b=tBdoTdxNwxInk3FF3weI+5EEsNCTqr/gEBGONOht0oogZWXdrPqFP+1xkNwkwxejeNd6
 sMokxUipD+DlI+121PrmB5Nhz3GIWEnajuy8Zbp1+mfOpsqR9BEN7VQdeARyomIt37r0
 mk8JQBih54PvfNIOzTglMraa/zLHsoNAg8HdsbGJ/wae38sPDFjnvZ8KEiT1DTjABuJT
 FhKbL5k9XrpTzXpzIKrYg650TwL+SC28dE3k16uBj6BF/upgxfK1lcp/6Y4ECeuoHJ5K
 +tLExdsYzwZeU6faLmNfXMuYCWVQsZZXpFTmJ1gGt/eyAUmHzArRkLeaWjrVOOPrGSa2 hw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883gr910y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:19 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13TKYheQ179264;
        Thu, 29 Apr 2021 16:50:19 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883gr910h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:19 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TKfH7Q020640;
        Thu, 29 Apr 2021 20:50:18 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
        by ppma04dal.us.ibm.com with ESMTP id 384aya8myu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 20:50:18 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13TKoH5133489396
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 20:50:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9D8592805E;
        Thu, 29 Apr 2021 20:50:17 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BAE7728065;
        Thu, 29 Apr 2021 20:50:16 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.73.43])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 29 Apr 2021 20:50:16 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, robh+dt@kernel.or,
        devicetree@vger.kernel.org, vishwa@linux.ibm.com,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 4/5] leds: pca955x: Add brightness_get function
Date:   Thu, 29 Apr 2021 15:50:01 -0500
Message-Id: <20210429205002.70245-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429205002.70245-1-eajames@linux.ibm.com>
References: <20210429205002.70245-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _6PGEpRiklmi57pK32WL-pMSeZhFSgdY
X-Proofpoint-GUID: DqxqdooOrAnE17r-JsEccPYdX_XmD5zy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-29_11:2021-04-28,2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104290133
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a function to fetch the state of the hardware LED.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index f0d841cb59fc..e47ba7c3b7c7 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -233,6 +233,57 @@ static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 	return 0;
 }
 
+static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
+{
+	struct pca955x *pca955x = i2c_get_clientdata(client);
+	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, cmd);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
+			__func__, n, ret);
+		return ret;
+	}
+	*val = (u8)ret;
+	return 0;
+}
+
+static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
+{
+	struct pca955x_led *pca955x_led = container_of(led_cdev,
+						       struct pca955x_led,
+						       led_cdev);
+	struct pca955x *pca955x = pca955x_led->pca955x;
+	u8 ls, pwm;
+	int ret;
+
+	ret = pca955x_read_ls(pca955x->client, pca955x_led->led_num / 4, &ls);
+	if (ret)
+		return ret;
+
+	ls = (ls >> ((pca955x_led->led_num % 4) << 1)) & 0x3;
+	switch (ls) {
+	case PCA955X_LS_LED_ON:
+		ret = LED_FULL;
+		break;
+	case PCA955X_LS_LED_OFF:
+		ret = LED_OFF;
+		break;
+	case PCA955X_LS_BLINK0:
+		ret = LED_HALF;
+		break;
+	case PCA955X_LS_BLINK1:
+		ret = pca955x_read_pwm(pca955x->client, 1, &pwm);
+		if (ret)
+			return ret;
+		ret = 255 - pwm;
+		break;
+	}
+
+	return ret;
+}
+
 static int pca955x_led_set(struct led_classdev *led_cdev,
 			    enum led_brightness value)
 {
@@ -512,6 +563,7 @@ static int pca955x_probe(struct i2c_client *client,
 
 			led->name = pca955x_led->name;
 			led->brightness_set_blocking = pca955x_led_set;
+			led->brightness_get = pca955x_led_get;
 
 			err = devm_led_classdev_register(&client->dev, led);
 			if (err)
-- 
2.27.0

