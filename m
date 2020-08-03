Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F7E23A8E5
	for <lists+linux-leds@lfdr.de>; Mon,  3 Aug 2020 16:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgHCOvH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Aug 2020 10:51:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35070 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728224AbgHCOvH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2020 10:51:07 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 073EcNX9020207;
        Mon, 3 Aug 2020 10:51:01 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32pkyfsce4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 10:51:01 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 073EcWkq021051;
        Mon, 3 Aug 2020 10:51:00 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32pkyfscdp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 10:51:00 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
        by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 073EnrmE005097;
        Mon, 3 Aug 2020 14:50:59 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma05wdc.us.ibm.com with ESMTP id 32nxe47h64-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 14:50:59 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 073EotnQ35258822
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 3 Aug 2020 14:50:55 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BA103136051;
        Mon,  3 Aug 2020 14:50:57 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4EED9136060;
        Mon,  3 Aug 2020 14:50:57 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.93.250])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon,  3 Aug 2020 14:50:57 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, vishwa@linux.ibm.com,
        andy.shevchenko@gmail.com, eajames@linux.ibm.com
Subject: [PATCH v2 2/2] leds: pca955x: Add an IBM software implementation of the PCA9552 chip
Date:   Mon,  3 Aug 2020 09:50:55 -0500
Message-Id: <20200803145055.5203-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200803145055.5203-1-eajames@linux.ibm.com>
References: <20200803145055.5203-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-03_13:2020-08-03,2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=1 bulkscore=0 spamscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008030106
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

IBM created an implementation of the PCA9552 on a PIC16F
microcontroller. The I2C device addresses are different from the
hardware PCA9552, so add a new compatible string and associated
platform data to be able to probe this device.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 drivers/leds/leds-pca955x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 131f8e922ade..7087ca4592fc 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -65,6 +65,7 @@ enum pca955x_type {
 	pca9550,
 	pca9551,
 	pca9552,
+	ibm_pca9552,
 	pca9553,
 };
 
@@ -90,6 +91,11 @@ static struct pca955x_chipdef pca955x_chipdefs[] = {
 		.slv_addr	= /* 1100xxx */ 0x60,
 		.slv_addr_shift	= 3,
 	},
+	[ibm_pca9552] = {
+		.bits		= 16,
+		.slv_addr	= /* 0110xxx */ 0x30,
+		.slv_addr_shift	= 3,
+	},
 	[pca9553] = {
 		.bits		= 4,
 		.slv_addr	= /* 110001x */ 0x62,
@@ -101,6 +107,7 @@ static const struct i2c_device_id pca955x_id[] = {
 	{ "pca9550", pca9550 },
 	{ "pca9551", pca9551 },
 	{ "pca9552", pca9552 },
+	{ "ibm-pca9552", ibm_pca9552 },
 	{ "pca9553", pca9553 },
 	{ }
 };
@@ -412,6 +419,7 @@ static const struct of_device_id of_pca955x_match[] = {
 	{ .compatible = "nxp,pca9550", .data = (void *)pca9550 },
 	{ .compatible = "nxp,pca9551", .data = (void *)pca9551 },
 	{ .compatible = "nxp,pca9552", .data = (void *)pca9552 },
+	{ .compatible = "ibm,pca9552", .data = (void *)ibm_pca9552 },
 	{ .compatible = "nxp,pca9553", .data = (void *)pca9553 },
 	{},
 };
-- 
2.24.0

