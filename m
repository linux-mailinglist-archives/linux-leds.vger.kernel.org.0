Return-Path: <linux-leds+bounces-1855-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6124D8FF96E
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 02:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71E641C224D8
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 00:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CB3DDD4;
	Fri,  7 Jun 2024 00:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fMf4ErAw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E88D2FF;
	Fri,  7 Jun 2024 00:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717721621; cv=none; b=E+5GDsQI5/9/96YKzfr0rGomNyLhe5/J1TxqvKmCzV2nfmPObgftuQJqfYza/H4F4yIhOGTdxF91aKIs0VevotYlj44Il2K5Ip+DoP4hsv3Wb2LYUpmbLrVlZ3OYrvTU0pQabdOdON+We0z33bcygaQWzZdHFrGtnEl8/4GtnNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717721621; c=relaxed/simple;
	bh=whxTm1m9+FDgqmbBh3+6J3Hp3yp5syfTVkjTM/AiZtY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=StX9MIIeTq5iugdPykMkQcFOKKheIxF0zxe3Dc4v24a6Tq8dg1kIh3bj8smGdXLzuYkL+bJPOeDNKUFGrl/POZ5PKY/Tri1kfGTiFipFcLr+ORnNDcOrZVMgQWHJhA91EPL/V1YifGwU15MJT/y4GMXwVDYI7LHXk8ctsuxp1Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fMf4ErAw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456McuDV010965;
	Fri, 7 Jun 2024 00:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GR6l+MtUgvHhjzAP/hYqmb
	mV38riRQ6sN23ytTC2cvw=; b=fMf4ErAw1m+aqyEzIROSYWNdhRqwq7NvEuY5Bq
	qFGtnzrtmULZbhmRyxAsfN6ErZN9IiRdzGiY/T+wO1GppFzOcQRCeYACwgPxXuZe
	N7cPFeTOG2bzsxcrs78iTYirgP1jFFM2OVWSutyJjTzUpRZxdZdk69txvBC9ugKK
	LnlsXwZX3ExEBSCm9vnas+Tl2yuIEAsK1SVm1LG9cplwSUAWTjNgASfmDAb+1dMf
	PlqpI3QgPxgel8S6zgnZaOk2BQUPdrDQ6HRg3SB8XQvNN3zqp2heakkC8wnXn5ko
	8aacGdGGbxiKWfH/Fb4qjH9cEqgIm4YYFGIcy8zpVDsjf/Jw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjhw0w8qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 00:53:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4570rQq4025333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 00:53:26 GMT
Received: from hu-amelende-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 17:53:25 -0700
From: Anjelique Melendez <quic_amelende@quicinc.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <robh@kernel.org>,
        <andersson@kernel.org>, <quic_amelende@quicinc.com>
CC: <u.kleine-koenig@pengutronix.de>, <marijn.suijten@somainline.org>,
        <kees@kernel.org>, <morf3089@gmail.com>, <quic_gurus@quicinc.com>,
        <quic_subbaram@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] leds: rgb: leds-qcom-lpg: Add PPG check for setting/clearing PBS triggers
Date: Thu, 6 Jun 2024 17:52:50 -0700
Message-ID: <20240607005250.4047135-1-quic_amelende@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: igZFFnN0w5yzpdAvyttdv1JaqUUEIdv_
X-Proofpoint-GUID: igZFFnN0w5yzpdAvyttdv1JaqUUEIdv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_20,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=776
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406070005

Currently, all LED LPG devices will call lpg_{set,clear}_pbs_trigger()
when setting brightness regardless of if they support PPG and have PBS
triggers. Check if device supports PPG before setting/clearing PBS
triggers.

Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 9467c796bd04..e74b2ceed1c2 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2017-2022 Linaro Ltd
  * Copyright (c) 2010-2012, The Linux Foundation. All rights reserved.
- * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/bits.h>
 #include <linux/bitfield.h>
@@ -254,6 +254,9 @@ static int lpg_clear_pbs_trigger(struct lpg *lpg, unsigned int lut_mask)
 	u8 val = 0;
 	int rc;
 
+	if (!lpg->lpg_chan_sdam)
+		return 0;
+
 	lpg->pbs_en_bitmap &= (~lut_mask);
 	if (!lpg->pbs_en_bitmap) {
 		rc = nvmem_device_write(lpg->lpg_chan_sdam, SDAM_REG_PBS_SEQ_EN, 1, &val);
@@ -276,6 +279,9 @@ static int lpg_set_pbs_trigger(struct lpg *lpg, unsigned int lut_mask)
 	u8 val = PBS_SW_TRIG_BIT;
 	int rc;
 
+	if (!lpg->lpg_chan_sdam)
+		return 0;
+
 	if (!lpg->pbs_en_bitmap) {
 		rc = nvmem_device_write(lpg->lpg_chan_sdam, SDAM_REG_PBS_SEQ_EN, 1, &val);
 		if (rc < 0)
-- 
2.34.1


