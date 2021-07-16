Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689713CBEE6
	for <lists+linux-leds@lfdr.de>; Sat, 17 Jul 2021 00:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237149AbhGPWGj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 18:06:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17940 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235482AbhGPWGh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Jul 2021 18:06:37 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GLYbkZ075095;
        Fri, 16 Jul 2021 18:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CgwkWaQ4NJl1owyNiDDwL3ETFjvGMyOr55HMbCiRtig=;
 b=Z3G91TqIt6aeCfJ56S2ut9Ircfk/h5sN2IPXDyEMO4ZyZadXRFTUhrqW6KfwFglrozfT
 65RoJKwaarAtKhLjGDBs+SmaIS/zCjoZfyDNWuMyk5rSnB/dwsDX26y4966aRGoqocYJ
 bBRA45jMo52nAWgZndrKvUTyEqPLnf2yXJf7MGdo1/YzdwVwbWuTCDo2uZIl41+O6ia0
 Y685KwKvm2Ou70hnZnzwp4gHoiHz9w9FmPTcBqZZ4uLd4B4Xvy1ay2kqnVG9oMrS31t1
 IISN2z0OY9zdI1svJ3CUM/30wFA9HIHeaNk4WvbgjFacn55C16fP/QDf6EsMNoVIj5ds RA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39ue6vepn7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 18:03:38 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GLwL6l020935;
        Fri, 16 Jul 2021 22:03:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma03wdc.us.ibm.com with ESMTP id 39q36efuct-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 22:03:37 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16GM3a7B42467720
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jul 2021 22:03:36 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 92ED4C605A;
        Fri, 16 Jul 2021 22:03:36 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4E049C6055;
        Fri, 16 Jul 2021 22:03:36 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jul 2021 22:03:36 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, pavel@ucw.cz,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 4/7] leds: pca955x: Add brightness_get function
Date:   Fri, 16 Jul 2021 17:03:28 -0500
Message-Id: <20210716220331.49303-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716220331.49303-1-eajames@linux.ibm.com>
References: <20210716220331.49303-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PYiBdjIqNFJWHt1VF69NF_FLVV6C5fLg
X-Proofpoint-GUID: PYiBdjIqNFJWHt1VF69NF_FLVV6C5fLg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_10:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160136
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

