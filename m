Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1AF3CBEEA
	for <lists+linux-leds@lfdr.de>; Sat, 17 Jul 2021 00:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237326AbhGPWGk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 18:06:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16742 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237148AbhGPWGj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Jul 2021 18:06:39 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GLY3kD051284;
        Fri, 16 Jul 2021 18:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8WyTTiWT9XFs+RnW14lvbqi88uPp9uqoQNzYkIP3x+U=;
 b=JVI9HsK5OqhguQ4xlvlQcI39da/Kl2j+D0NcN7s/QgdUQWiGxXFpL/jq0VY9MF3pPrGy
 TGo9qdhmL9svGpuBBRZYp7Pg4YG919RgYHnRxdQZ0Uhq+PrEOHAFXUUeFpFfki4MDfc0
 u8oUzNxUFgNhOnv0a6LN9VgtJzZdmwPanER/CvccIeNPXrffNcJAOQGZumJkHLCd3TjT
 tmeH+9v73HDdWdo8PRWzDzFMRA5P82nzqQMjEsup4v3S/b0gjXtV8ppzsmhzsJ0qudvj
 SlZ7HzsldW7WUEn0xDpNpHg66UEalUAp5CzhpqzzTYK225/90w2mF43pK/wjXx3o7ofA Zw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39udw7qdy2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 18:03:39 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GLwN8G021270;
        Fri, 16 Jul 2021 22:03:38 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma03wdc.us.ibm.com with ESMTP id 39q36efud6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 22:03:38 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16GM3btW33161658
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jul 2021 22:03:37 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 579FFC6067;
        Fri, 16 Jul 2021 22:03:37 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 16DD3C6055;
        Fri, 16 Jul 2021 22:03:37 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jul 2021 22:03:37 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, pavel@ucw.cz,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 6/7] leds: pca955x: Let the core process the fwnode
Date:   Fri, 16 Jul 2021 17:03:30 -0500
Message-Id: <20210716220331.49303-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716220331.49303-1-eajames@linux.ibm.com>
References: <20210716220331.49303-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RV9hapQ7hhX48u1LABvaUaMtE_J7ei8f
X-Proofpoint-ORIG-GUID: RV9hapQ7hhX48u1LABvaUaMtE_J7ei8f
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_10:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160136
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Much of the fwnode processing in the PCA955x driver is now in the
LEDs core driver, so pass the fwnode in the init data when
registering the LED device. In order to preserve the existing naming
scheme, check for an empty name and set it to the LED number.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 58 +++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index fa1d77d86ef6..a6aa4b9abde8 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -127,10 +127,9 @@ struct pca955x_led {
 	struct pca955x	*pca955x;
 	struct led_classdev	led_cdev;
 	int			led_num;	/* 0 .. 15 potentially */
-	char			name[32];
 	u32			type;
 	int			default_state;
-	const char		*default_trigger;
+	struct fwnode_handle	*fwnode;
 };
 
 struct pca955x_platform_data {
@@ -439,7 +438,6 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		return ERR_PTR(-ENOMEM);
 
 	device_for_each_child_node(&client->dev, child) {
-		const char *name;
 		const char *state;
 		u32 reg;
 		int res;
@@ -448,17 +446,10 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		if ((res != 0) || (reg >= chip->bits))
 			continue;
 
-		res = fwnode_property_read_string(child, "label", &name);
-		if ((res != 0) && is_of_node(child))
-			name = to_of_node(child)->name;
-
 		led = &pdata->leds[reg];
-		snprintf(led->name, sizeof(led->name), "%s", name);
-
 		led->type = PCA955X_TYPE_LED;
+		led->fwnode = child;
 		fwnode_property_read_u32(child, "type", &led->type);
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->default_trigger);
 
 		if (!fwnode_property_read_string(child, "default-state",
 						 &state)) {
@@ -495,11 +486,14 @@ static int pca955x_probe(struct i2c_client *client,
 	struct pca955x_led *pca955x_led;
 	struct pca955x_chipdef *chip;
 	struct led_classdev *led;
+	struct led_init_data init_data;
 	struct i2c_adapter *adapter;
 	int i, err;
 	struct pca955x_platform_data *pdata;
 	int ngpios = 0;
+	bool set_default_label = false;
 	bool keep_pwm = false;
+	char default_label[8];
 
 	chip = &pca955x_chipdefs[id->driver_data];
 	adapter = client->adapter;
@@ -547,6 +541,9 @@ static int pca955x_probe(struct i2c_client *client,
 	pca955x->client = client;
 	pca955x->chipdef = chip;
 
+	init_data.devname_mandatory = false;
+	init_data.devicename = "pca955x";
+
 	for (i = 0; i < chip->bits; i++) {
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
@@ -560,23 +557,7 @@ static int pca955x_probe(struct i2c_client *client,
 			ngpios++;
 			break;
 		case PCA955X_TYPE_LED:
-			/*
-			 * Platform data can specify LED names and
-			 * default triggers
-			 */
-			if (pdata->leds[i].name[0] == '\0')
-				snprintf(pdata->leds[i].name,
-					 sizeof(pdata->leds[i].name), "%d", i);
-
-			snprintf(pca955x_led->name, sizeof(pca955x_led->name),
-				 "pca955x:%s", pdata->leds[i].name);
-
 			led = &pca955x_led->led_cdev;
-			if (pdata->leds[i].default_trigger)
-				led->default_trigger =
-					pdata->leds[i].default_trigger;
-
-			led->name = pca955x_led->name;
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
 
@@ -592,7 +573,28 @@ static int pca955x_probe(struct i2c_client *client,
 					return err;
 			}
 
-			err = devm_led_classdev_register(&client->dev, led);
+			init_data.fwnode = pdata->leds[i].fwnode;
+
+			if (is_of_node(init_data.fwnode)) {
+				if (to_of_node(init_data.fwnode)->name[0] ==
+				    '\0')
+					set_default_label = true;
+				else
+					set_default_label = false;
+			} else {
+				set_default_label = true;
+			}
+
+			if (set_default_label) {
+				snprintf(default_label, sizeof(default_label),
+					 "%d", i);
+				init_data.default_label = default_label;
+			} else {
+				init_data.default_label = NULL;
+			}
+
+			err = devm_led_classdev_register_ext(&client->dev, led,
+							     &init_data);
 			if (err)
 				return err;
 
-- 
2.27.0

