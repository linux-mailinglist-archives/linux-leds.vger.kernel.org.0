Return-Path: <linux-leds+bounces-1856-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 428688FF971
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 02:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 964D9B213AB
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 00:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164181862F;
	Fri,  7 Jun 2024 00:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iqtB63Cc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6091017571;
	Fri,  7 Jun 2024 00:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717721635; cv=none; b=Bvf67nWIE+uJYrXmkksa7l84NO5zYFzZ/HR5g7Gir/KHXvcZeSlhoKkvW9+zDmC89e95n/sT8G0bdDsalGUB0yeJp1XDilbYHrt4Fp9nFskeKQtIWoJrT0SdJn4ANc7XCKQd/ZTO+HRdT1UvAQWxoC2u6Fzu4h9Xec9s2nTFcXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717721635; c=relaxed/simple;
	bh=to7adxZY7YdKvp7zslxgNbl3H08nV+GaV1VtbSCUhEk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LNWff2wTAkxh7RL2XWXZhhdK4PuXohEIdNZKSxH1/zB7v7PfTlja+hVnmMAc4DCqSM3VQhkxzs7F0xE+KxT5bm/WRAPwtisufYaApTHlyIKISz6SB4+FeSvizXVul5+J6USl2DjIrW9Xtad4g3Y0NAcr0EqdFEI9Ah0brEbAJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iqtB63Cc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456BspuP020320;
	Fri, 7 Jun 2024 00:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKxJMdBDXqhj3Ag5ZxzNEkHNTh0quW1THuyXE8ULLoc=; b=iqtB63CcxMfmgr8c
	1Fk0muZGmrtJWWvbzkKo/2xN6BC3lA3kIhFEl9+DEcovwMr/YmpRZ+YHF776XTKn
	TOV/bXy/KfKYXqpYNOch+I0f437cxg8T0LwBTKp+tuWQiWJHsxinKt6HFvXQ5we6
	Yw0G8j1cHDSxv/jzvPIMdT4MP+220jejl3OZuN5XfD49zQIoHCf0tFIAZmrH+g6e
	JeHQt/RC9ThqtSy2OUXoeEbMVIXnJBSPWTCwGqH3zMsQPUWv0Lnxk9ViTpGvJyNM
	knsLHz+KvUCTvm4Okom7OS8/VWzcXfG3qaInjvReHGIP8bqCGdAyyyYla8sOM/1E
	jLu8cg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yk3h2tq45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 00:53:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4570rhNo025439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 00:53:43 GMT
Received: from hu-amelende-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 17:53:43 -0700
From: Anjelique Melendez <quic_amelende@quicinc.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <robh@kernel.org>,
        <andersson@kernel.org>, <quic_amelende@quicinc.com>
CC: <u.kleine-koenig@pengutronix.de>, <marijn.suijten@somainline.org>,
        <kees@kernel.org>, <morf3089@gmail.com>, <quic_gurus@quicinc.com>,
        <quic_subbaram@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] leds: rgb: leds-qcom-lpg: Fix line wrapping style issues
Date: Thu, 6 Jun 2024 17:52:52 -0700
Message-ID: <20240607005250.4047135-2-quic_amelende@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607005250.4047135-1-quic_amelende@quicinc.com>
References: <20240607005250.4047135-1-quic_amelende@quicinc.com>
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
X-Proofpoint-GUID: sNkGu40M66iwJ5SrTOo79ro1ET6kOgoo
X-Proofpoint-ORIG-GUID: sNkGu40M66iwJ5SrTOo79ro1ET6kOgoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_20,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070005

Fix line wrapping style issues introduced in previous patches.

Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index e74b2ceed1c2..7c35b3ba09a3 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -620,6 +620,7 @@ static void lpg_sdam_apply_lut_control(struct lpg_channel *chan)
 	u8 val = 0, conf = 0, lut_offset = 0;
 	unsigned int hi_pause, lo_pause;
 	struct lpg *lpg = chan->lpg;
+	u16 addr;
 
 	if (!chan->ramp_enabled || chan->pattern_lo_idx == chan->pattern_hi_idx)
 		return;
@@ -640,17 +641,23 @@ static void lpg_sdam_apply_lut_control(struct lpg_channel *chan)
 		lo_idx += lut_offset;
 	}
 
-	nvmem_device_write(lpg_chan_sdam, SDAM_PBS_SCRATCH_LUT_COUNTER_OFFSET + chan->sdam_offset, 1, &val);
-	nvmem_device_write(lpg_chan_sdam, SDAM_PATTERN_CONFIG_OFFSET + chan->sdam_offset, 1, &conf);
-	nvmem_device_write(lpg_chan_sdam, SDAM_END_INDEX_OFFSET + chan->sdam_offset, 1, &hi_idx);
-	nvmem_device_write(lpg_chan_sdam, SDAM_START_INDEX_OFFSET + chan->sdam_offset, 1, &lo_idx);
+	addr = SDAM_PBS_SCRATCH_LUT_COUNTER_OFFSET + chan->sdam_offset;
+	nvmem_device_write(lpg_chan_sdam, addr, 1, &val);
+	addr = SDAM_PATTERN_CONFIG_OFFSET + chan->sdam_offset;
+	nvmem_device_write(lpg_chan_sdam, addr, 1, &conf);
+	addr = SDAM_END_INDEX_OFFSET + chan->sdam_offset;
+	nvmem_device_write(lpg_chan_sdam, addr, 1, &hi_idx);
+	addr = SDAM_START_INDEX_OFFSET + chan->sdam_offset;
+	nvmem_device_write(lpg_chan_sdam, addr, 1, &lo_idx);
 
 	val = RAMP_STEP_DURATION(chan->ramp_tick_ms);
 	nvmem_device_write(lpg_chan_sdam, SDAM_REG_RAMP_STEP_DURATION, 1, &val);
 
 	if (lpg->lut_sdam) {
-		nvmem_device_write(lpg_chan_sdam, SDAM_PAUSE_HI_MULTIPLIER_OFFSET + chan->sdam_offset, 1, &hi_pause);
-		nvmem_device_write(lpg_chan_sdam, SDAM_PAUSE_LO_MULTIPLIER_OFFSET + chan->sdam_offset, 1, &lo_pause);
+		addr = SDAM_PAUSE_HI_MULTIPLIER_OFFSET + chan->sdam_offset;
+		nvmem_device_write(lpg_chan_sdam, addr, 1, &hi_pause);
+		addr = SDAM_PAUSE_LO_MULTIPLIER_OFFSET + chan->sdam_offset;
+		nvmem_device_write(lpg_chan_sdam, addr, 1, &lo_pause);
 	}
 
 }
-- 
2.34.1


