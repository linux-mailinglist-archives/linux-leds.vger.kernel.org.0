Return-Path: <linux-leds+bounces-1678-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D53178C8CCF
	for <lists+linux-leds@lfdr.de>; Fri, 17 May 2024 21:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85C40281AF9
	for <lists+linux-leds@lfdr.de>; Fri, 17 May 2024 19:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB1B140361;
	Fri, 17 May 2024 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dlDIvAae"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA6713DDB6;
	Fri, 17 May 2024 19:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715974234; cv=none; b=hL3udg3hanKr6i9eynq8vDKt1e8OOmM+1aBz2tx1cdP8Uob2S1xPQqVbpmOjQgDGFBf8bn+0TP3cj/1o5peaHW84FmOxkS/Gep3FtcDbhumTz7ElBG2LWEx+Ond5PHt+e+PDqbhoHFY046tgOZmsq8rJX4k5iMHrxGa+ppQmFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715974234; c=relaxed/simple;
	bh=xF6UKemZvaSoGr9T7LbwJUMiuww6NUchpCXO1mMNK0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Q/6ThBwcK+qwQYfsmiykUIPau7Vm8VPkZhLwtO69aY19NcyFOjqjmo/s2Yd9mAc84g36mHj9acCv1wV/p5O292HQpZgQjIrnjYMdA+KCwCesAj+yc2kVN+BlUiOlpcYSs4WNMPxGTKbGBWTmTlMZP3zbbklxFllX1Y6NFOIftoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dlDIvAae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H9hkt4025967;
	Fri, 17 May 2024 19:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=VOI
	NPK4KPgHsYAeEGQ/kh90Sbkf9gkMSJhlYJH2uwkg=; b=dlDIvAaedgXM/mKbcNc
	PwUsx1yS4U/62hywOpa1t1PvYwjEXH65+xRkme9Qi+xKfvEdnEon7rBMZVVY8C/a
	hiecoNbutZzwmEvaMRjJS/vRLFjMHEQMmSnmjyIftE79Z/zYDRwN2Cv+YAkGMiFx
	m96TgvtF5IYrBOciCDFT7poZGnmdYl2d72wWbBEKNM5JxfG41MvtqtqWR+6NcxYr
	AM8TooDVHfB3eVJQrSsIfnozOgmePGCCBbehNo5YwiVnqpWsI77KVTcC56pIDWfV
	7O43Tp1pt9QC8FxDnWqyG1nhxREjj1kaKfw03wGjBHEQsY9CrawvZdhuK7IDe7BG
	I5g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y49ft9364-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 19:30:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HJUCNe010582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 19:30:12 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 May
 2024 12:30:12 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 17 May 2024 12:30:11 -0700
Subject: [PATCH] leds: bcm63138: add MODULE_DESCRIPTION()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240517-md-leds-bcm63138-v1-1-247b7302edb6@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEKwR2YC/x3MywrCQAyF4VcpWRuYi23FVxEXc4k20BlLolIpf
 XdHlx+c82+gJEwK524DoTcrP2qDPXSQplDvhJybwRl3NL0dsWScKSvGVAZv/QmtT8PYm2ScI2i
 3RejG6z95uTbHoIRRQk3TLzRzfa1Ygj5JcPm0Kez7Fz5J1oSHAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        William Zhang
	<william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        "Kursad
 Oney" <kursad.oney@broadcom.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?=
	<rafal@milecki.pl>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>
CC: <linux-leds@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ONN4WLRpdLqJfmUstXPrQ9t5faSk8t5m
X-Proofpoint-GUID: ONN4WLRpdLqJfmUstXPrQ9t5faSk8t5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_09,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170151

Fix the 'make W=1" issue:

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/blink/leds-bcm63138.o

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/leds/blink/leds-bcm63138.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index 2cf2761e4914..3a5e0b98bfbc 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -303,5 +303,6 @@ static struct platform_driver bcm63138_leds_driver = {
 module_platform_driver(bcm63138_leds_driver);
 
 MODULE_AUTHOR("Rafał Miłecki");
+MODULE_DESCRIPTION("Broadcom BCM63138 SoC LED driver");
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(of, bcm63138_leds_of_match_table);

---
base-commit: d75ca803d4950826f6a1227f9ece9eec44b2f360
change-id: 20240517-md-leds-bcm63138-13c6750c022e


