Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43EA4FC21C
	for <lists+linux-leds@lfdr.de>; Mon, 11 Apr 2022 18:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348472AbiDKQXJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Apr 2022 12:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348504AbiDKQXF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Apr 2022 12:23:05 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473E730F4B;
        Mon, 11 Apr 2022 09:20:51 -0700 (PDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BFvCn4030688;
        Mon, 11 Apr 2022 16:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=o1wPZInYvGr/lHB99pGGplf+6hVIPyoDxe+zg9l7KHw=;
 b=LFUiAFufCQk7TuEDYXOWtejB1ORcLMsi9wJo4flF0d5mxC5CwhS2CO9WKDUeHKITa+jw
 g4TkP6SARZBi+AegpuemWOMogDd2uWBa5VATR864EtmTDD5aCulrZuKrcrIpwRxVJie4
 BijAH8S4TOIGZiKQQe5ryOKrKD17fsmsjcz8BxRo/iGnMNIOTcqM2KSVKJmYGOG7uj9d
 6NkEdtpbovO3CCiwGpNWqfuSWK4/035MDk9VtRQv37n5J3MnLn1iXB9XlSmgvCzizEdQ
 282MM2OG+hZfcT0npJJUKNPgA/WMudLPdvRIlv6BLakD8n3PUkRRcRmxm/H8aYls8mY+ +g== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3fcn4p429w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Apr 2022 16:20:41 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BFwU88017521;
        Mon, 11 Apr 2022 16:20:41 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3fcn4p429k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Apr 2022 16:20:41 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BGDsx5032450;
        Mon, 11 Apr 2022 16:20:40 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma01wdc.us.ibm.com with ESMTP id 3fb1s8ryds-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Apr 2022 16:20:40 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23BGKe7D12124564
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 Apr 2022 16:20:40 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 60BFA124053;
        Mon, 11 Apr 2022 16:20:40 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 83E2012405B;
        Mon, 11 Apr 2022 16:20:39 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.106.206])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon, 11 Apr 2022 16:20:39 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, pavel@ucw.cz, patrick@stwcx.xyz,
        andy.shevchenko@gmail.com, openbmc@lists.ozlabs.org,
        joel@jms.id.au, Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v3 3/4] leds: pca955x: Optimize probe led selection
Date:   Mon, 11 Apr 2022 11:20:32 -0500
Message-Id: <20220411162033.39613-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220411162033.39613-1-eajames@linux.ibm.com>
References: <20220411162033.39613-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iTPtsrIWswU8TTuyse3OOfT8aR2s8Mpv
X-Proofpoint-ORIG-GUID: YHvE3BKY6CqEluHIvUMq1LnXTuXQ7qa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_06,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=553 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110089
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Previously, the probe function might do up to 32 reads and writes
to the same 4 registers to program the led selection. Reduce this to
a maximum of 8 operations by accumulating the changes to the led
selection and comparing with the previous value to write the
selection if different.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 40 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index cb1895b79eab..61f3cb84a945 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -483,7 +483,9 @@ static int pca955x_probe(struct i2c_client *client)
 	struct led_classdev *led;
 	struct led_init_data init_data;
 	struct i2c_adapter *adapter;
-	int i, err;
+	int i, bit, err, nls, reg;
+	u8 ls1[4];
+	u8 ls2[4];
 	struct pca955x_platform_data *pdata;
 	bool set_default_label = false;
 	bool keep_pwm = false;
@@ -554,6 +556,15 @@ static int pca955x_probe(struct i2c_client *client)
 	init_data.devname_mandatory = false;
 	init_data.devicename = "pca955x";
 
+	nls = pca955x_num_led_regs(chip->bits);
+	for (i = 0; i < nls; ++i) {
+		err = pca955x_read_ls(pca955x, i, &ls1[i]);
+		if (err)
+			return err;
+
+		ls2[i] = ls1[i];
+	}
+
 	for (i = 0; i < chip->bits; i++) {
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
@@ -565,21 +576,20 @@ static int pca955x_probe(struct i2c_client *client)
 		case PCA955X_TYPE_GPIO:
 			break;
 		case PCA955X_TYPE_LED:
+			bit = i % 4;
+			reg = i / 4;
 			led = &pca955x_led->led_cdev;
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
 
 			if (pdata->leds[i].default_state ==
-			    LEDS_GPIO_DEFSTATE_OFF) {
-				err = pca955x_led_set(led, LED_OFF);
-				if (err)
-					return err;
-			} else if (pdata->leds[i].default_state ==
-				   LEDS_GPIO_DEFSTATE_ON) {
-				err = pca955x_led_set(led, LED_FULL);
-				if (err)
-					return err;
-			}
+			    LEDS_GPIO_DEFSTATE_OFF)
+				ls2[reg] = pca955x_ledsel(ls2[reg], bit,
+							  PCA955X_LS_LED_OFF);
+			else if (pdata->leds[i].default_state ==
+				   LEDS_GPIO_DEFSTATE_ON)
+				ls2[reg] = pca955x_ledsel(ls2[reg], bit,
+							  PCA955X_LS_LED_ON);
 
 			init_data.fwnode = pdata->leds[i].fwnode;
 
@@ -624,6 +634,14 @@ static int pca955x_probe(struct i2c_client *client)
 		}
 	}
 
+	for (i = 0; i < nls; ++i) {
+		if (ls1[i] != ls2[i]) {
+			err = pca955x_write_ls(pca955x, i, ls2[i]);
+			if (err)
+				return err;
+		}
+	}
+
 	/* PWM0 is used for half brightness or 50% duty cycle */
 	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
 	if (err)
-- 
2.27.0

