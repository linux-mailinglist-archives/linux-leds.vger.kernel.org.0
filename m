Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69D8536F15D
	for <lists+linux-leds@lfdr.de>; Thu, 29 Apr 2021 22:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237210AbhD2UvM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Apr 2021 16:51:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31696 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237191AbhD2UvL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Apr 2021 16:51:11 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13TKYBqq012950;
        Thu, 29 Apr 2021 16:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jX3q+vq0d+05week6S3F0/wSQMjJlxTuY2TLUEtG38c=;
 b=F+e06gUI11IsvRqzWc00aKt1OcTIxoO8fpCTN8Nb3X5QvHyUZJQQjidMCogdxNk8lpR8
 3KCTEkY69hYDSY80MLWDqWTE3AVwNrN82CmtEhwLyZIo2zEAvnVAat5tx0on4dzJFdl/
 EeN75FtoaDkKk4bfPtMKFLrb+4dX3n+XTOkOF7vJF6zd5mwJaQqV9rY/aHOKV+jr1Wdx
 Gop2GR4gvaerPePqFKpWIaWIz9gStCw+eUQoDuEy76/bdEVieCZzE/Y1d56s5JGAHsuA
 ciRuCtiw0rLw8z3BPr+Bn0naaAZccL7PMnQcRsx2oVTZRIjeqemRs2u+7olONqAj2vcs wA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883txrgnc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:22 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13TKYG3P013472;
        Thu, 29 Apr 2021 16:50:21 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883txrgn2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:21 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TKfWu4027434;
        Thu, 29 Apr 2021 20:50:21 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma01dal.us.ibm.com with ESMTP id 384ay9rq1r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 20:50:21 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13TKoKGx38273418
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 20:50:20 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 40D7B2805E;
        Thu, 29 Apr 2021 20:50:20 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5E1252805A;
        Thu, 29 Apr 2021 20:50:19 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.73.43])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 29 Apr 2021 20:50:19 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, robh+dt@kernel.or,
        devicetree@vger.kernel.org, vishwa@linux.ibm.com,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 5/5] leds: pca955x: Implement the default-state property
Date:   Thu, 29 Apr 2021 15:50:02 -0500
Message-Id: <20210429205002.70245-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429205002.70245-1-eajames@linux.ibm.com>
References: <20210429205002.70245-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Id5Bo-hsMpHB49g__r-smhUDbNluRc4e
X-Proofpoint-ORIG-GUID: TwGnGyUqn-M7owWWsN5R_hHBDNSzaR6m
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-29_11:2021-04-28,2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290133
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

