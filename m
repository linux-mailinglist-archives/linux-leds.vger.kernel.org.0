Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2290E3CBEEB
	for <lists+linux-leds@lfdr.de>; Sat, 17 Jul 2021 00:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbhGPWGl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 18:06:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22378 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237111AbhGPWGj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Jul 2021 18:06:39 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GLahfY054129;
        Fri, 16 Jul 2021 18:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Dar/qzeXVLlj4sPzqVyzEDrvQNCwdGWIFsIMhA+myRY=;
 b=MPPwGFUeeyq0Jcd5j9FVMPFBpg2oAvq87RTf7IbNYzoNHEfzl3LDN4wKxu5AgTWrQN0x
 ZqVShMeoiyoCNK3nMYDD34scBSJD6F2+pC4a5Ux+loqU0xszSSltRITnU8B0lgXVXz4k
 yZQV/Mg/geNOv9tfVQvLw9tQIZQtB5gS7MY6M9loKZzhV9IEea3TeQrQ7V0SOhYEyGNe
 ofQGtH2XpzIkB2/p4uMUuDB7sgvlCJEAuX2mdAJ4TFXZVIIFxxXwe+JuYA4WR6k+uwW0
 XWGldKLGzaKoHEJeQOfg9u8I1dXYVepeRioAXPWYXWLCC9SZhhxY5SUO168k7GbKDLOz 4g== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39tw4q1qq4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 18:03:39 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GLw2Xp014417;
        Fri, 16 Jul 2021 22:03:39 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma03dal.us.ibm.com with ESMTP id 39rkgyca71-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 22:03:38 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16GM3bp331326704
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jul 2021 22:03:37 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B886CC605A;
        Fri, 16 Jul 2021 22:03:37 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 764E7C6055;
        Fri, 16 Jul 2021 22:03:37 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jul 2021 22:03:37 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, pavel@ucw.cz,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 7/7] leds: pca955x: Switch to i2c probe_new
Date:   Fri, 16 Jul 2021 17:03:31 -0500
Message-Id: <20210716220331.49303-8-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716220331.49303-1-eajames@linux.ibm.com>
References: <20210716220331.49303-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uU0o8tTZXt1Ap1ZldDvnPg7_9rsuAgtV
X-Proofpoint-GUID: uU0o8tTZXt1Ap1ZldDvnPg7_9rsuAgtV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_10:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160136
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The deprecated i2c probe functionality doesn't work with OF
compatible strings, as it only checks for the i2c device id. Switch
to the new way of probing and grab the match data to select the
chip type.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index a6aa4b9abde8..a6b5699aeae4 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -479,8 +479,7 @@ static const struct of_device_id of_pca955x_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_pca955x_match);
 
-static int pca955x_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int pca955x_probe(struct i2c_client *client)
 {
 	struct pca955x *pca955x;
 	struct pca955x_led *pca955x_led;
@@ -494,8 +493,24 @@ static int pca955x_probe(struct i2c_client *client,
 	bool set_default_label = false;
 	bool keep_pwm = false;
 	char default_label[8];
+	enum pca955x_type chip_type;
+	const void *md = device_get_match_data(&client->dev);
 
-	chip = &pca955x_chipdefs[id->driver_data];
+	if (md) {
+		chip_type = (enum pca955x_type)md;
+	} else {
+		const struct i2c_device_id *id = i2c_match_id(pca955x_id,
+							      client);
+
+		if (id) {
+			chip_type = (enum pca955x_type)id->driver_data;
+		} else {
+			dev_err(&client->dev, "unknown chip\n");
+			return -ENODEV;
+		}
+	}
+
+	chip = &pca955x_chipdefs[chip_type];
 	adapter = client->adapter;
 	pdata = dev_get_platdata(&client->dev);
 	if (!pdata) {
@@ -670,7 +685,7 @@ static struct i2c_driver pca955x_driver = {
 		.name	= "leds-pca955x",
 		.of_match_table = of_pca955x_match,
 	},
-	.probe	= pca955x_probe,
+	.probe_new = pca955x_probe,
 	.id_table = pca955x_id,
 };
 
-- 
2.27.0

