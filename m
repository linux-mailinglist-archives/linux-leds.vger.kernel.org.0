Return-Path: <linux-leds+bounces-1679-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD49F8C8CFF
	for <lists+linux-leds@lfdr.de>; Fri, 17 May 2024 21:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A8C5B231C6
	for <lists+linux-leds@lfdr.de>; Fri, 17 May 2024 19:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E89614037F;
	Fri, 17 May 2024 19:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y3k3k4rg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF9213DDA7;
	Fri, 17 May 2024 19:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715975630; cv=none; b=Decc6L1vZ1rbtAQBYfVkIEGhH3o5Ygf1Ghe9ef40FGmF/UIhwP7vXYRaaH51pbh0gekd47oTxhQorCvR6vI3vdP10XuLKui91+Yo9q7cELJoNbOHeywMUvBZ6bG8k0aryvBNcgIT0YEjE1nfMCS0/mq6NIgx+Q8VrfMPCpcGc+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715975630; c=relaxed/simple;
	bh=R3lRBLb/3j3JWgsqDdiYV0Vgqqga6WzQSICVyqNwVTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=hi73guBBmJuKSuc3R31zf87vx4OTrf1W4jTTN+Zbl4FI6UjMZPsgeFGYbectUhdqPBFwTadwwTXnImVqWizzdkQgtPdecmKMwxQYMDIV+nmvoBAZNP00+AKRgbKlRAYvQJSaz5lUkO0WugxkDSZsQ7mB/4s6uogbKeNtGnt39w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y3k3k4rg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H9goF5007753;
	Fri, 17 May 2024 19:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=4vI
	fca3gRh/7VJH/Lxort6X7ppSNKKhcor19knQNvTY=; b=Y3k3k4rgRwDK3FviKhF
	lC9Vk5i4KCn3SclaZOEjsYv4fIZSOeblZTPuj9HESeP3bAP9uhCJpQsKjhVa1/Tw
	YxnCdcZj3znaNwS2bIFbRHj0DtRTtYpMizfVN3C9LmE8g4Z760CkNElvGAA/8ISV
	6pO4SgkoR8qmjrTNrxfsvix1dRncaGMPgrZ+4fLLVo1HAyfM/ail0gqgsJPhgqmH
	IMZRVx4JRdFMLB5OyIWv1kY3d48fJEYkxmBiq8x+7uCgOiwcFGDOcb7qD/4SDdl3
	pa0wFGpBv+blP90bkOhrmuF667R6yarkTeCRDLTB7JZZkNOX5Xl3aOwRvWPSoEW4
	X3w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y51tuns0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 19:53:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HJrVX1008062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 19:53:31 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 May
 2024 12:53:31 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 17 May 2024 12:53:27 -0700
Subject: [PATCH] leds: simatic-ipc-leds: add missing MODULE_DESCRIPTION()
 macros
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240517-md-simatic-ipc-v1-1-bbbd199262b8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALa1R2YC/x3MUQrCMBCE4auUfXahLY2iVxEf0mRqF0wMu1Uqp
 Xc3+vjBzL+RQQVGl2YjxVtMnrmiOzQUZp/vYInV1Lf90LruxCmySfKLBJYSeDg7APHoECeqp6K
 YZP0Hr7fq0Rt4VJ/D/Ms8JL9WTt4WKJdPndK+fwHJuGTQhQAAAA==
To: Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Xing Tong Wu
	<xingtong.wu@siemens.com>,
        Tobias Schaffner <tobias.schaffner@siemens.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JKL-wC1yShDI9o8ceIUMcA_Ktg1Qs44I
X-Proofpoint-GUID: JKL-wC1yShDI9o8ceIUMcA_Ktg1Qs44I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_09,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 mlxlogscore=983 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170151

Fix the 'make W=1' issues:

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds.o

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c  | 1 +
 drivers/leds/simple/simatic-ipc-leds-gpio-core.c        | 1 +
 drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c | 1 +
 drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c      | 1 +
 drivers/leds/simple/simatic-ipc-leds.c                  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c b/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
index 4183ee71fcce..726c186391af 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
@@ -60,6 +60,7 @@ static struct platform_driver simatic_ipc_led_gpio_apollolake_driver = {
 };
 module_platform_driver(simatic_ipc_led_gpio_apollolake_driver);
 
+MODULE_DESCRIPTION("LED driver for Siemens Simatic IPCs based on Intel Apollo Lake GPIO");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" KBUILD_MODNAME);
 MODULE_SOFTDEP("pre: simatic-ipc-leds-gpio-core platform:apollolake-pinctrl");
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-core.c b/drivers/leds/simple/simatic-ipc-leds-gpio-core.c
index 667ba1bc3a30..f35527047de5 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-core.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-core.c
@@ -101,6 +101,7 @@ int simatic_ipc_leds_gpio_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(simatic_ipc_leds_gpio_probe);
 
+MODULE_DESCRIPTION("Siemens SIMATIC IPC core driver for GPIO based LEDs");
 MODULE_LICENSE("GPL v2");
 MODULE_SOFTDEP("pre: platform:leds-gpio");
 MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c b/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c
index 4a53d4dbf52f..3fec96c549c1 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c
@@ -50,6 +50,7 @@ static struct platform_driver simatic_ipc_led_gpio_elkhartlake_driver = {
 };
 module_platform_driver(simatic_ipc_led_gpio_elkhartlake_driver);
 
+MODULE_DESCRIPTION("LED driver for Siemens Simatic IPCs based on Intel Elkhart Lake GPIO");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" KBUILD_MODNAME);
 MODULE_SOFTDEP("pre: simatic-ipc-leds-gpio-core platform:elkhartlake-pinctrl");
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c b/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
index c7c3a1f986e6..ea2745fdd246 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
@@ -60,6 +60,7 @@ static struct platform_driver simatic_ipc_led_gpio_driver = {
 };
 module_platform_driver(simatic_ipc_led_gpio_driver);
 
+MODULE_DESCRIPTION("LED driver for Siemens Simatic IPCs based on Nuvoton GPIO");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" KBUILD_MODNAME);
 MODULE_SOFTDEP("pre: simatic-ipc-leds-gpio-core gpio_f7188x");
diff --git a/drivers/leds/simple/simatic-ipc-leds.c b/drivers/leds/simple/simatic-ipc-leds.c
index 2124f6d09930..348679f0d1b7 100644
--- a/drivers/leds/simple/simatic-ipc-leds.c
+++ b/drivers/leds/simple/simatic-ipc-leds.c
@@ -128,6 +128,7 @@ static struct platform_driver simatic_ipc_led_driver = {
 };
 module_platform_driver(simatic_ipc_led_driver);
 
+MODULE_DESCRIPTION("LED driver for Siemens Simatic IPCs");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" KBUILD_MODNAME);
 MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");

---
base-commit: d75ca803d4950826f6a1227f9ece9eec44b2f360
change-id: 20240517-md-simatic-ipc-495eeed65edf


