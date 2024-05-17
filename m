Return-Path: <linux-leds+bounces-1677-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA8B8C8CB1
	for <lists+linux-leds@lfdr.de>; Fri, 17 May 2024 21:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 251E41C20DCC
	for <lists+linux-leds@lfdr.de>; Fri, 17 May 2024 19:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB99B13FD8A;
	Fri, 17 May 2024 19:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jzFbfdw3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B45813E88B;
	Fri, 17 May 2024 19:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715973543; cv=none; b=RjYLHVX5gsmvDx45hO0jsE9pi/Df6uWX8B72K3EfFS5SiwmSFjOX/I9pG4cmCSCnNqSrd8AWbRsYvowq1XbEQR1pe58rN44KkPWhEWnmTVQ28L7Hmj75S8jH1GVyPoAhXemoyWO6sJzlSfl6WTA8POdOGB77UM32Xo559gfqyLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715973543; c=relaxed/simple;
	bh=C56LQKRTjnVnJG3YwZzJraSuqgQKogoB9XvmcKydv0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Fly29YnjY+8hWHNiQDgjj30zBulePqxkVwJzM1AkzQqs/tAFrTUltIekvEKDgRmdmC4otWD0kd+gsbQ7l47WwqYnG4RUUvom/wgZUBJ4CljgqBTNHgIL6HXDECjJPKY8eMr1xuP8EXgj0Fd22LR2Lk+uJ4iej0AOSuZPmDH+884=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jzFbfdw3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44HI07ua022358;
	Fri, 17 May 2024 19:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=BDh
	CaFuutonQDkWjUPolgJamStWN/o8ldxvcLtdYTRI=; b=jzFbfdw3KY6kvKbwhoB
	CBsRONONFgjo912rzmdrSWouQLBMrD/FiQgIQ8SIZ40OzEQ+5075NiUmHnsnluz9
	9S9MTKwD+WvfrBLLezOP+I8Sey1WpsqK5EcCWoVkWiwLAUAcdXU/FmCcqbtUaQ68
	8kNOfJq4MBvyoQ9G96jjrae/8C6IdoZKO0BFFBXD23hFdS37G0QUM1BVBiMmyMxj
	prLRi9iCBuOniDIBG59Ly+AoKxc7hJqDIZpM6xuhCVybfh77RCQSigH/znRXnDnT
	ZsL+ZMrlKFsV5X4Y539YAB1ovnKE3j05H+9btXBk21nk744VZ/8IvgAkiIhQTI8u
	+2Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y62a818sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 19:18:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HJIpiW029578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 19:18:51 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 May
 2024 12:18:50 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 17 May 2024 12:18:49 -0700
Subject: [PATCH] leds: rt4505: add MODULE_DESCRIPTION()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240517-md-leds-rt4505-v1-1-2f388ff6b672@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJitR2YC/x3MQQqDMBCF4avIrDuQpAkVr1K6iMlYBzSVGS0W8
 e5Nu/zgvf8AJWFS6JoDhN6s/CoV9tJAGmN5EnKuBmecN8HecM44UVaU1QcT0MTU+uFqnHUJ6mk
 RGnj/B++P6j4qYS+xpPGXmbhsO85RVxJcPnUK5/kF+RWiHIUAAAA=
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s8RjBnKt9u0Uch6uN4aby8kOD3BfuhwM
X-Proofpoint-ORIG-GUID: s8RjBnKt9u0Uch6uN4aby8kOD3BfuhwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_09,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxlogscore=769 impostorscore=0
 phishscore=0 clxscore=1011 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170150

Fix the 'make W=1" issue:

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/leds/flash/leds-rt4505.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/flash/leds-rt4505.c b/drivers/leds/flash/leds-rt4505.c
index 1ae5b387f4a5..f16358b8dfc1 100644
--- a/drivers/leds/flash/leds-rt4505.c
+++ b/drivers/leds/flash/leds-rt4505.c
@@ -426,4 +426,5 @@ static struct i2c_driver rt4505_driver = {
 module_i2c_driver(rt4505_driver);
 
 MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("Richtek RT4505 LED driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: d75ca803d4950826f6a1227f9ece9eec44b2f360
change-id: 20240517-md-leds-rt4505-0ac84f30212c


