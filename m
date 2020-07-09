Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38EB121A8BD
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2020 22:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgGIUMn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Jul 2020 16:12:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41558 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726228AbgGIUMc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jul 2020 16:12:32 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 069K37wa002696;
        Thu, 9 Jul 2020 16:12:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32637tvg66-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jul 2020 16:12:26 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 069K3Gxl003081;
        Thu, 9 Jul 2020 16:12:26 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32637tvg5s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jul 2020 16:12:26 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 069K611C032710;
        Thu, 9 Jul 2020 20:12:25 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma02wdc.us.ibm.com with ESMTP id 325k1vgtkp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jul 2020 20:12:25 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 069KCOKo11403860
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 9 Jul 2020 20:12:24 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B8F6212405C;
        Thu,  9 Jul 2020 20:12:24 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B0623124054;
        Thu,  9 Jul 2020 20:12:23 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.54.227])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu,  9 Jul 2020 20:12:23 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, eajames@linux.ibm.com,
        vishwa@linux.ibm.com
Subject: [PATCH 2/2] leds: pca955x: Add an IBM software implementation of the PCA9552 chip
Date:   Thu,  9 Jul 2020 15:12:20 -0500
Message-Id: <20200709201220.13736-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200709201220.13736-1-eajames@linux.ibm.com>
References: <20200709201220.13736-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-09_10:2020-07-09,2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=1
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007090135
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
index 4037c504589c..bf7ead45f66b 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -65,6 +65,7 @@ enum pca955x_type {
 	pca9550,
 	pca9551,
 	pca9552,
+	pca9552_ibm,
 	pca9553,
 };
 
@@ -90,6 +91,11 @@ static struct pca955x_chipdef pca955x_chipdefs[] = {
 		.slv_addr	= /* 1100xxx */ 0x60,
 		.slv_addr_shift	= 3,
 	},
+	[pca9552_ibm] = {
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
+	{ "pca9552-ibm", pca9552_ibm },
 	{ "pca9553", pca9553 },
 	{ }
 };
@@ -412,6 +419,7 @@ static const struct of_device_id of_pca955x_match[] = {
 	{ .compatible = "nxp,pca9550", .data = (void *)pca9550 },
 	{ .compatible = "nxp,pca9551", .data = (void *)pca9551 },
 	{ .compatible = "nxp,pca9552", .data = (void *)pca9552 },
+	{ .compatible = "nxp,pca9552-ibm", .data = (void *)pca9552_ibm },
 	{ .compatible = "nxp,pca9553", .data = (void *)pca9553 },
 	{},
 };
-- 
2.24.0

