Return-Path: <linux-leds+bounces-3959-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E376DA3340B
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 01:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FF603A53F6
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 00:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1682B38FAD;
	Thu, 13 Feb 2025 00:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hblWFaLz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD8A282F1
	for <linux-leds@vger.kernel.org>; Thu, 13 Feb 2025 00:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739406939; cv=none; b=iVg3GFOJz02MLGPwa/9isGcYd7sx/jxR+zPUWig+tmp7epV2w4zIHMogrdljEbNkzodPbxXfqm7qlHY5+H5V/+COG7lLcuaz8duQovkV9xsFykve4QceVHiLBuc2eeGutsIWOfpxolIjQ0Jt1wgXI0PLghIjpdK1IHr/K1Hg25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739406939; c=relaxed/simple;
	bh=EOVymAULE6kLF8YeY35yDIjWEcbIP+yZoW/WG8TfQT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OXyyQMZ0/OoEYLzia2CY2rzKQCogK7bGHKLhi+eGgr9cDFYYWw/4JQkvBLxB1psKgkJHHFjb1REMpqqRtRjxagP8S2Ehjku35EayHftNuM8HUH2LLQinlMLLyd5yZYtGw1+P59rFhBWQPMTPw7TeOk2Qb2kK92yslrSVystvbM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hblWFaLz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CIN6hh008267
	for <linux-leds@vger.kernel.org>; Thu, 13 Feb 2025 00:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gTyUuYhYRTX4j8dhX9yTaQ0IP/am6Xw0dpr
	kTVdPOno=; b=hblWFaLzCAap11G7lGMVQVreTDiyHWNp6PjQPp+bZyaW2r/pduf
	RMj+DkKktypVlq/7zOxsgfaNriy8MHjjC/YkN7AdEwR2wmtA/oXF1vvpe/50JHQp
	kYr2jYlTfklOIrfSUoucM0mjSpnfDxxrSG6dOqXxMVzH/2ep9HSR6YI8peMQe/vk
	2hebEarQSwDz5B0ewdeaBk9ZmlVcfWLd4gy+0oVxgjgdrUIKHq9suGz5vlQ8ViZ+
	nK44+Le14bZOTi7hgf58ui3+n6F65eAJxOYVyJnORA4lkGMfoByzGhH8zdVxDK0Y
	Xk4RZMWASQxvxdTGBAIkO157jYiFVr/vvlQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qta0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 13 Feb 2025 00:35:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f7519ae0cso4898555ad.3
        for <linux-leds@vger.kernel.org>; Wed, 12 Feb 2025 16:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739406935; x=1740011735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTyUuYhYRTX4j8dhX9yTaQ0IP/am6Xw0dprkTVdPOno=;
        b=RSemRy7qzBNfxwzTRUSaXPLeufyNl6A+ZldGL1WgLqct8JRWHefpy05Z0ESILlPGxX
         5YoJZW7KRl/fVzpgLLnWxX3wS4uU7vMUwXVaqpsQTFuzFlDV0VPOsBVgZ6vMiLbY87GZ
         oaUlo1VR0ChM+8Xxp5Z+7LLFgH4NH0Txj52LwbwOtPRjmZZc54d3tHXx6vgd11LRWYu/
         +PMIh0sCOrDUzXlUfgSCQJVnnYV5/ffuWzHyQ5lyn3O/us+Wkzyw525HwmeHljzAPuZi
         ZwSeGRD2qv2Xu5e9BV+YNZ4RwopKhrmuRAj0dlEbfxoVgxN7C3hD7LSq2MnwRRBU/UNm
         yJTg==
X-Forwarded-Encrypted: i=1; AJvYcCVVQg4Kp1U7VOexdYACvE6NREDgZd7pntZJDuDrHuLen1c0n5QJBOObPEbf1snPYS99s2JcUInWSq8q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxi8wX/iCODY3Xb8GiBy8SU2LZKilaPDHD141A5CjtatOY228g
	sJh7Hysyb7s7v7GNr2LLFUwg+hRWqEux9bZ5wsk2oxMDSbUruo7yrOKuFjrmz+PHqzKxjbLp82V
	cfnyNUfHjgXa320grY+vP8sufCaL1T3RnuhQVzRwTrByqWGYdPeV5nZw3xiya
X-Gm-Gg: ASbGncu9bl8VU5FkVDTuFK3oD7NOuhLzK+e+ShdWIOngoe4+Y3AhewLi0HpQnY10ljl
	Vl6my3yhkwVKwd6qsT3IVZy8TnqGO6qm+QqVJtQ5wZZ6xPs4TZu2/w4LILyp6meh+AJxFruLCQo
	p4VTc7ud1EppeKwa+8Ww7c6JJ591Ui37L7j240xxNTUw7x+0/YjHEpsrcKJKfkoRUy2FV2DHeG6
	1qQxcWKB+RAxEv7m9GQHguUgYR27gqCwAK2VjXPXppR/dcdI4zBit8xjp6f85INBlyDd135TLwi
	+ac4b6AKUe79D48Ha0na9CTWJWpJMCe561MMxU5Ztao8k946JWtYBWBDGzDKybytTjiC
X-Received: by 2002:a05:6a21:3291:b0:1ee:3b8e:344e with SMTP id adf61e73a8af0-1ee5c8228b0mr10017703637.40.1739406935531;
        Wed, 12 Feb 2025 16:35:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdOSmyuS1/Z18GxXR1yavoEapUcckTz6EmedzNfNydunkLDjxX+oWubtWLLVz+uL9PsDxlSg==
X-Received: by 2002:a05:6a21:3291:b0:1ee:3b8e:344e with SMTP id adf61e73a8af0-1ee5c8228b0mr10017655637.40.1739406935153;
        Wed, 12 Feb 2025 16:35:35 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324254627dsm61269b3a.3.2025.02.12.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 16:35:34 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: lee@kernel.org, pavel@kernel.org, andersson@kernel.org,
        krzysztof.kozlowski@linaro.org
Cc: morf3089@gmail.com, u.kleine-koenig@pengutronix.de,
        marijn.suijten@somainline.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Zejiong Huang <zejiongh@qti.qualcomm.com>
Subject: [PATCH] leds: rgb: leds-qcom-lpg: Add support for 6-bit PWM resolution
Date: Wed, 12 Feb 2025 16:35:33 -0800
Message-Id: <20250213003533.1684131-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wt6tlx3sIyhj4gf75HRl3KK78RMVhI_T
X-Proofpoint-ORIG-GUID: wt6tlx3sIyhj4gf75HRl3KK78RMVhI_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130002

Currently, driver only allows for PWM modules to use 9-bit resolution.
However, PWM modules can support 6-bit and 9-bit resolution. Add support
for 6-bit resolution.

Suggested-by: Zejiong Huang <zejiongh@qti.qualcomm.com>
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index f3c9ef2bfa57..4e5c56ded1f0 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -24,6 +24,7 @@
 #define LPG_PATTERN_CONFIG_REG	0x40
 #define LPG_SIZE_CLK_REG	0x41
 #define  PWM_CLK_SELECT_MASK	GENMASK(1, 0)
+#define  PWM_SIZE_SELECT_MASK	BIT(2)
 #define  PWM_CLK_SELECT_HI_RES_MASK	GENMASK(2, 0)
 #define  PWM_SIZE_HI_RES_MASK	GENMASK(6, 4)
 #define LPG_PREDIV_CLK_REG	0x42
@@ -412,8 +413,8 @@ static int lpg_lut_sync(struct lpg *lpg, unsigned int mask)
 static const unsigned int lpg_clk_rates[] = {0, 1024, 32768, 19200000};
 static const unsigned int lpg_clk_rates_hi_res[] = {0, 1024, 32768, 19200000, 76800000};
 static const unsigned int lpg_pre_divs[] = {1, 3, 5, 6};
-static const unsigned int lpg_pwm_resolution[] =  {9};
-static const unsigned int lpg_pwm_resolution_hi_res[] =  {8, 9, 10, 11, 12, 13, 14, 15};
+static const unsigned int lpg_pwm_resolution[] = {6, 9};
+static const unsigned int lpg_pwm_resolution_hi_res[] = {8, 9, 10, 11, 12, 13, 14, 15};
 
 static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 {
@@ -436,12 +437,12 @@ static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 	 * period = --------------------------
 	 *                   refclk
 	 *
-	 * Resolution = 2^9 bits for PWM or
+	 * Resolution = 2^{6 or 9} bits for PWM or
 	 *              2^{8, 9, 10, 11, 12, 13, 14, 15} bits for high resolution PWM
 	 * pre_div = {1, 3, 5, 6} and
 	 * M = [0..7].
 	 *
-	 * This allows for periods between 27uS and 384s for PWM channels and periods between
+	 * This allows for periods between 3uS and 384s for PWM channels and periods between
 	 * 3uS and 24576s for high resolution PWMs.
 	 * The PWM framework wants a period of equal or lower length than requested,
 	 * reject anything below minimum period.
@@ -558,7 +559,7 @@ static void lpg_apply_freq(struct lpg_channel *chan)
 		val |= GENMASK(5, 4);
 		break;
 	case LPG_SUBTYPE_PWM:
-		val |= BIT(2);
+		val |= FIELD_PREP(PWM_SIZE_SELECT_MASK, chan->pwm_resolution_sel);
 		break;
 	case LPG_SUBTYPE_HI_RES_PWM:
 		val |= FIELD_PREP(PWM_SIZE_HI_RES_MASK, chan->pwm_resolution_sel);
@@ -1276,7 +1277,7 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		resolution = lpg_pwm_resolution_hi_res[FIELD_GET(PWM_SIZE_HI_RES_MASK, val)];
 	} else {
 		refclk = lpg_clk_rates[FIELD_GET(PWM_CLK_SELECT_MASK, val)];
-		resolution = 9;
+		resolution = lpg_pwm_resolution[FIELD_GET(PWM_SIZE_SELECT_MASK, val)];
 	}
 
 	if (refclk) {
-- 
2.34.1


