Return-Path: <linux-leds+bounces-6415-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 256B7CBD74A
	for <lists+linux-leds@lfdr.de>; Mon, 15 Dec 2025 12:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1532F301FF52
	for <lists+linux-leds@lfdr.de>; Mon, 15 Dec 2025 11:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850C432FA34;
	Mon, 15 Dec 2025 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JA+d9JxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgRIRX7J"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D4232FA1B
	for <linux-leds@vger.kernel.org>; Mon, 15 Dec 2025 11:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797092; cv=none; b=lVL+K+fRGX7nWL8NlRvsYgkbCqPFFpJmnP3BGtV8ifpq4ajGmgdegGCW0SfvR3r/zKo4Brxg/WlAgmRQ/U1gRWEyYZJ55OzvV4/YLZYP0HC1mmZvjW+KcyOoZNBM7TzR7BGPd6ADDI8fZcBAtMYrXp3cwzcM0mikKiFPvk8aTMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797092; c=relaxed/simple;
	bh=jJzhUAVqnjEE7xQJfD0Z/rpFIMfoyIfHHNdKkonpEGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Af7fN6GnFjBpVI3AmGWSxdseGHx91aRgoKxFTzaooWcVhWIQmDJ4Cl7gTbv0jihr2TFdPRBhVZ1JCOoQAhYXZVA5aOko9OA0yqrqaxoJhrpwX4WMYcG9/WC4GIUSaNtNlsIRWR5wjpSsvtr/KOF8E/Qj1mivAq88zFmzm2LhFbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JA+d9JxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgRIRX7J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFANpFG675843
	for <linux-leds@vger.kernel.org>; Mon, 15 Dec 2025 11:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jR9tCjr6Z+ELgPCuFXaDHFuAfQoa+UU0pSvWjSrMSIQ=; b=JA+d9JxZJoG699j3
	OkvofhmcSVO4ak7mVQBvqWQFECB7XHNoYEuDCnJw6ia5pU2wUq1yXRjBE0ObzRlF
	9Gr6K/1JXna8cMItRS5ppjneiXy/nto3TqgWfDcr+tfylh8Kn2IoPF9gSo7tViJS
	qZk8r/Hh6B1/QcrV303iUvSdkAS5a+y/2sosTrAk71OPvEvO1aazqSHPuMlyv4No
	HmueFb9DO2hhsAJwTxZnfaB6+DJ1Gzbp+E55Sf51EO5xHJSDA+BZ0nm85yXVVHN7
	MUx+0OXOzw0kOvShBReShKCIi23Zq290rJo/u1M+WUPIiegpJNiz3DhJoBfi+iQh
	nJJlzQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11cyma5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 15 Dec 2025 11:11:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f21951c317so2814845b3a.2
        for <linux-leds@vger.kernel.org>; Mon, 15 Dec 2025 03:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765797088; x=1766401888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jR9tCjr6Z+ELgPCuFXaDHFuAfQoa+UU0pSvWjSrMSIQ=;
        b=fgRIRX7JylgdlcVpi0/d3nCPl8f5oqk9kKezxVRNkXqCzUe5uNF6gRKYM/imLhgQ9A
         FFL/yroZI3WTppHsWp9aRo7nMiOPK+4+RwXvSJhFkxRsGgicnaEzi26ayLx+a0bxILhs
         RQqe4xTY49aMTNQQo2Occ0W9//xz14L7iniNE5hvuguLA25XKK8jVWXuUm+SGgE+Ew9E
         P2ZltZRjpbpnJ/FwqE2tXrkr6W/ksx7kW3hzibz0729MTnFYYegCxE270TroHcHzR9iS
         RHgKjUEThlfGLtVmhw6B3PHf41HNl7ehbtcK6pv8Cids/nbgwWQJWbFNjesfKf/sXQqN
         Os0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765797088; x=1766401888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jR9tCjr6Z+ELgPCuFXaDHFuAfQoa+UU0pSvWjSrMSIQ=;
        b=kWDCgOvPFe8E2rYorzwMi/GcOFkGeuVzkZf2cSf+WHBS8fNvAftfCI/sYdJYzlbV3F
         73wrxywYy0RdZ3kY+7DloI41pMSps4GaKVnFAmOTFyFp2EFV6vieu2yaP85cYth57b1j
         BI8ZfbKhxFS6hKgTLPDNH4BvN56zihzWM7MZEtFcRh+beylfZI6ILFdVEguH66/MwC0+
         mcPNSKfePbuGlmFlZ8Lp6h9cOB1hRaP0U2rieC8cQOXO0mkHDv/LRsAz7MAj3MlvB4s7
         jY+S73Fh/VEZM0UFxqKRPhJCbiHnvfh0KWK0vwIYKXQ1P//EBFjqiCpMuszvB7Xcx7kG
         jKBw==
X-Gm-Message-State: AOJu0YwXVOyVVJJIoLfFslC9kX5YZymEJ7s8qPG2cOiq0zzb2STixB1W
	8DLfQo8TH/81H5cPFcRAim/B7Rq8B3iVu9kSsSuMPlSmyYS+1RjWZ8hXgnNon6xVqzFSK9vK9UB
	LvIg4QhdfL4p6cUnBCwhixUYvxUUOpDHxTSvuEVY4cWLvSQaxtU4Cv8YgiLpFKsepPl5zx3T5
X-Gm-Gg: AY/fxX5Yr8i2+F0O4EyWwog9hwfvSFjR7EOt7cS9JudR0vT557oIb7TvuA+PJ/JT0+y
	ndqb59xpdsX2TZjilXX2tm04+U/Pvyxubo+Zs2gXpIPY0Kbg+S7v0voBCI/w8ORQHTDqhurO9TF
	HisQEjtHwU5XJiY66WI2DyBncZL01jzS8jnZj/gYtMFsj9JhwbsLFFJvEZUXQacCJLRMGKm/j+z
	g1UizE7eQ+DYgyJ8rWsEyGJVUk8No5kb+t1MtIT/PgG4VO79rodfQh0frqRr8rugALcbYeejiAP
	b/1l+ZTDzp717qkkks0cc+s1ajYgwgqtcDLkNo7Pmr/QsppQefQQ0BEymD1ei2QONg2EwXsWkFo
	PHFVzRUEwXv2K/tJFulrUQrWV2axSe8sc0nnVQbp78byB
X-Received: by 2002:a05:6a00:a381:b0:7e8:4471:8cb with SMTP id d2e1a72fcca58-7f6694ab102mr7825450b3a.44.1765797088320;
        Mon, 15 Dec 2025 03:11:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7r4351sjS8Nxlky7ansYRrwn9nrpxIcYkkyBMYzMH7Km1X2tHrnoZ4A8abdqUdPrIQTG08A==
X-Received: by 2002:a05:6a00:a381:b0:7e8:4471:8cb with SMTP id d2e1a72fcca58-7f6694ab102mr7825436b3a.44.1765797087852;
        Mon, 15 Dec 2025 03:11:27 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2379e40sm12408918b3a.5.2025.12.15.03.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:11:27 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 16:41:04 +0530
Subject: [PATCH v3 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for
 PMH0101 PWM
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-knp-pmic-leds-v3-1-5e583f68b0e5@oss.qualcomm.com>
References: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
In-Reply-To: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765797078; l=851;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=jJzhUAVqnjEE7xQJfD0Z/rpFIMfoyIfHHNdKkonpEGA=;
 b=NiTfsOXJEsLkqNqIu3Y0OhdaSRbQXaWppeXzCC9vQ1+4yaWrnL0qsxzEbOaSP/30rJKS7kFWy
 IC2WybB6XMEAs3rczQbBLPIsF89vq96vknLpp/16wPk46UyjrAz/57M
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA5NiBTYWx0ZWRfX+AqoksYHIN1J
 UGVKDIEfxemZ2uB5PwXCdFPwNQ0+8vDutg/qUGYc47FUM9th8wPb/aUhYJEvrsYsJYsaHX3YrA2
 3x8wgD58jx3Y1lqhkW7Ycy1mQGbmSA+3j/vgIZDvvJntoLb8mZoHEjvnLw5wWS2CesAWenIyAgf
 1THWjRiWRzAvkQP6kb2Ppuq/ue6UxI4Hq64Hqd0NtdRI58UEriQ4M6b+J50D0SZtucVIlKYr5xV
 PyIvjahPBk65wjNVbuE3FGZIUdXoI9vjNRazO91SycT4z/yYlC6PMNx+7O7ugSfrTPo7gQ5+7J9
 Inayp7MHGXQTL39Zcotosk6e8bpQuVYnTrH9loCw0VR89EYUcF16lG3EAP7kd0NxG3tt27ggAjo
 1thkJ9jZuLIYBGhyMYQaXfugvxQIkw==
X-Proofpoint-GUID: H5Vtd_DoxN5EIfT_c7F__5PRaPSpV68w
X-Authority-Analysis: v=2.4 cv=Afq83nXG c=1 sm=1 tr=0 ts=693fece1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=l_06JH2mHj-VWuRQOQwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: H5Vtd_DoxN5EIfT_c7F__5PRaPSpV68w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150096

Add support for PMH0101 PWM modules which are compatible with the PM8350c
PWM modules.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index c4b7e57b2518..3da0fe532e74 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -43,6 +43,7 @@ properties:
       - items:
           - enum:
               - qcom,pm8550-pwm
+              - qcom,pmh0101-pwm
           - const: qcom,pm8350c-pwm
       - items:
           - enum:

-- 
2.25.1


