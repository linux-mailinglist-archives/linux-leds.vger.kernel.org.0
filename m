Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FCA3CBEF0
	for <lists+linux-leds@lfdr.de>; Sat, 17 Jul 2021 00:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237438AbhGPWGq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 18:06:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14526 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236106AbhGPWGh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Jul 2021 18:06:37 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GLWsmU178579;
        Fri, 16 Jul 2021 18:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jX3q+vq0d+05week6S3F0/wSQMjJlxTuY2TLUEtG38c=;
 b=bjGqUjOxvmPI1aiDpMZKAD0/9tTdH8JJzMhmIEuO2uEtzQDIMEbkdeMw1tqBBzi7Wk+q
 sHRf5j54RfJvBZO38LSDTz4Y4jBHDNLpik2/+RXixuW/EGhldNS1hbi2sME1BtmKPqHI
 RdNko1u2oojfBlcvmBSXrNxSP5yW7mJjyHj8XOhyELdS+N5SnUlb97cgSRrYKD+l2Fwm
 yRbGoT/nYNJx5yqiXdZdyWSarb0a2CN0AnkDvOOLeKd1G2BUZvZ7ToDGaalLsO4UaXIJ
 hlD8uk++gtx8EjPTJ+ChEPnWHwdu8XlfoH50dRTRwHSw1c9Vct0y1tJVRqeKZSZWAm2Y ww== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0b-001b2d01.pphosted.com with ESMTP id 39ugakb7p2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 18:03:38 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GLwWK3016408;
        Fri, 16 Jul 2021 22:03:38 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma02wdc.us.ibm.com with ESMTP id 39q36efwbq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 22:03:38 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16GM3bbJ22151498
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jul 2021 22:03:37 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F01D5C6061;
        Fri, 16 Jul 2021 22:03:36 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id ACE4EC6055;
        Fri, 16 Jul 2021 22:03:36 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jul 2021 22:03:36 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, pavel@ucw.cz,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 5/7] leds: pca955x: Implement the default-state property
Date:   Fri, 16 Jul 2021 17:03:29 -0500
Message-Id: <20210716220331.49303-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716220331.49303-1-eajames@linux.ibm.com>
References: <20210716220331.49303-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pwpIOSERPG4jddETZMHxpj9KkKngmRx4
X-Proofpoint-ORIG-GUID: pwpIOSERPG4jddETZMHxpj9KkKngmRx4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_10:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160136
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In order to retain the LED state after a system reboot, check the
documented default-state device tree property during initialization.
Modify the behavior of the probe according to the property.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 54 +++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index e47ba7c3b7c7..fa1d77d86ef6 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -129,6 +129,7 @@ struct pca955x_led {
 	int			led_num;	/* 0 .. 15 potentially */
 	char			name[32];
 	u32			type;
+	int			default_state;
 	const char		*default_trigger;
 };
 
@@ -439,6 +440,7 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 
 	device_for_each_child_node(&client->dev, child) {
 		const char *name;
+		const char *state;
 		u32 reg;
 		int res;
 
@@ -457,6 +459,18 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		fwnode_property_read_u32(child, "type", &led->type);
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led->default_trigger);
+
+		if (!fwnode_property_read_string(child, "default-state",
+						 &state)) {
+			if (!strcmp(state, "keep"))
+				led->default_state = LEDS_GPIO_DEFSTATE_KEEP;
+			else if (!strcmp(state, "on"))
+				led->default_state = LEDS_GPIO_DEFSTATE_ON;
+			else
+				led->default_state = LEDS_GPIO_DEFSTATE_OFF;
+		} else {
+			led->default_state = LEDS_GPIO_DEFSTATE_OFF;
+		}
 	}
 
 	pdata->num_leds = chip->bits;
@@ -485,6 +499,7 @@ static int pca955x_probe(struct i2c_client *client,
 	int i, err;
 	struct pca955x_platform_data *pdata;
 	int ngpios = 0;
+	bool keep_pwm = false;
 
 	chip = &pca955x_chipdefs[id->driver_data];
 	adapter = client->adapter;
@@ -565,14 +580,35 @@ static int pca955x_probe(struct i2c_client *client,
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
 
+			if (pdata->leds[i].default_state ==
+			    LEDS_GPIO_DEFSTATE_OFF) {
+				err = pca955x_led_set(led, LED_OFF);
+				if (err)
+					return err;
+			} else if (pdata->leds[i].default_state ==
+				   LEDS_GPIO_DEFSTATE_ON) {
+				err = pca955x_led_set(led, LED_FULL);
+				if (err)
+					return err;
+			}
+
 			err = devm_led_classdev_register(&client->dev, led);
 			if (err)
 				return err;
 
-			/* Turn off LED */
-			err = pca955x_led_set(led, LED_OFF);
-			if (err)
-				return err;
+			/*
+			 * For default-state == "keep", let the core update the
+			 * brightness from the hardware, then check the
+			 * brightness to see if it's using PWM1. If so, PWM1
+			 * should not be written below.
+			 */
+			if (pdata->leds[i].default_state ==
+			    LEDS_GPIO_DEFSTATE_KEEP) {
+				if (led->brightness != LED_FULL &&
+				    led->brightness != LED_OFF &&
+				    led->brightness != LED_HALF)
+					keep_pwm = true;
+			}
 		}
 	}
 
@@ -581,10 +617,12 @@ static int pca955x_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	/* PWM1 is used for variable brightness, default to OFF */
-	err = pca955x_write_pwm(client, 1, 0);
-	if (err)
-		return err;
+	if (!keep_pwm) {
+		/* PWM1 is used for variable brightness, default to OFF */
+		err = pca955x_write_pwm(client, 1, 0);
+		if (err)
+			return err;
+	}
 
 	/* Set to fast frequency so we do not see flashing */
 	err = pca955x_write_psc(client, 0, 0);
-- 
2.27.0

