Return-Path: <linux-leds+bounces-8969-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O+nSFdJdTmp9LQIAu9opvQ
	(envelope-from <linux-leds+bounces-8969-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:25:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4827274EC
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:25:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="jiAx/El8";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JkTqNqD3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8969-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8969-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B6FC30B1FF2
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 14:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB213481236;
	Wed,  8 Jul 2026 14:19:14 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3823847F2CB
	for <linux-leds@vger.kernel.org>; Wed,  8 Jul 2026 14:19:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520354; cv=none; b=Ah5Zm4p/WtQjpqyvgOPU7Pj6tYMF8YvL2mmPjtqg+MZJ9ejx/Q5o9Oe08alUcMbDJyYlA7LrPU3QwezCxKOe7/FeEyqGxAV9MB6TvRb+gG+MUgkMfI8MfKJfoOYx9SNjO81dsNTiIPReRGQryD91tMgjM3dTxp1UcgG4PH5uwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520354; c=relaxed/simple;
	bh=+NBAVrPIo7sHJ7MgnZXaHhnNEpFD2cpSnzyBi8ZsiQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iToYkwuXlL5X4/4xRLEED8yjHjNDGAYvJzOoDjVJgFXtYZ9vtJzFTFk7kpxP3iBSqBnQaPxJbucMUdR3qU3gLIunFZZQAsw7viXCDbaMQU+UrwIOc6diJ7nrMy5U8jsY4EozCFyjC/kHFdkO/1k1+Y8hLA+VI0NG37iNraROq+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiAx/El8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkTqNqD3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3RRS2667485
	for <linux-leds@vger.kernel.org>; Wed, 8 Jul 2026 14:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=; b=jiAx/El8MFkuvlra
	XpDo8Ubre+ptbaxkbdfzFWMgAkQmo1ao1VB8UIry8FI4J6x4stk5MK98WKpw1Wqi
	QXgDLMN4vuCaXjEV5Ju90sU/n56n0DUKkasrrvkQUut6x+x8XUzLEeESEdO467mS
	wneYWDsPKhg08NVfWK1C0/0AjTylTfm8TltjJYKVhTnWK/suX9a1Exxo99YkhkGa
	x5PtUnKrWc2cuq+OueuukwPDLUqMRMHChQU0B0IPyn1gIyvtpRXC/fTaK7NbWAk+
	iEoSoMzb+UiDGPQK2b6IdeD1GIcq4XxGRZHf8mYNpHTdu3hQ4XQU7GfeFahDPiKT
	6/Kuog==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgujbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2026 14:19:11 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9694fa5facaso213367241.2
        for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520351; x=1784125151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=JkTqNqD3YThRN8+dkjYD3vV51EdObLS494579V1vqwYvnTRsAFyYVrtILLX2N1mKtM
         pBUEUi+2042jEBqSCOptGsgOmL+I2W+2UtSBFbSa2Pon7VNrbm7Gnh5kDX3i6F6XCbCT
         a6v6eeqgDI56awYNQyY5Ehht8Hg2VOw3Zd2RWPYE9iAJUUNjg0g2dJQ1vKJH7FaBjGLq
         mMKXKe38IXPskuo9FqIU5mAusrSlYFxoH8eDP3O6RKN78UE0/OaKN/BAS0zzVPRca8lO
         OfAWnkiIlOcfwyPSp41t9AVSJr0zKo914nFrjOcAPIPaW2vx/RtMWDB4IMRpVTfoENC7
         ILEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520351; x=1784125151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=ODPdJ2hIQUwXcJ9+2t7SRanbQ9kEnPp3fC5pfwM5ujReNg/eQBBAUp/cyqFssYIR93
         nZmHDzx+wMuH82/SfSVgAfeCeK5OXiE8D3LaoFRySADssYj6IEvP60AuZN6HfgCswKSg
         JCkjL8vXXqXRQRB3on9s9bSrPI0z3kEKVl0ORgVbML6jS7YOhJrWKqWOvHKEQfU0+gUp
         gzDNlk+ytDBk6+QiJ5jeVFvSfw5HnolOjam6D9yhbR0JXrrH12Mixw1b33CxmWUy/oFa
         EVveXLDV/0SyuVTqD4vdUcvpLaKBxoycEesxeYOLJe6WbVtm6XVIxqIK/j5e1RMWDMfG
         3/3Q==
X-Gm-Message-State: AOJu0Yw5qCjlo4hXR7kKg85jnrW7pu8edgxFjWa+DIsqEy1jSUUFi6o1
	UrIC0tifmUTS0fAWiuL8rDjzTYWXAEBcoit7HD0Js7kV5Mrj+XgQThCmW026BDMgMM3GxTP5vmf
	rhtt0KDx88/QakbPZlLEF/UEvJHOr6IYcZKBGIpD2ajKHy+ocq0Qnm3wv6eGsQ1zFf1T+yt0Qab
	w=
X-Gm-Gg: AfdE7cm0mjXS2sB+LZuJpzCIgxZHuM3FJOXkwxZjYhmRUlf6+tISQOecYWCU9BlyRtK
	KiVT5E4PYpsf7paqb1DyGkWhQOZiFJbFuk91NnzgJpv0jOrw27R8elzzBkaKqKxxO12bt0EUsQg
	fcrODs+gsid4zeHywBBxin9VsR9amcZVO0gCueydpuU5cTMOG5M/1syVF0F4D15vjcvYtwhkd4x
	1Q+Zl0D4G0clhBjAv2yfkkViBpQY/cXgQtX3rHcvJZZTL+JAXDmXFxO1hk2WmdtLaQxRhlS8mqz
	1CLEcTI6Yae3T5iD0wtZesFldBacQ2TPgEnyEpmDoIaKumC9iL5mcCioFrmlu14xWKZ86sbxb8f
	E0pp2HUdPcsteSrtwyBP89I44VOzitHzdm7JNPUzJHaGdprqCVpng1jmxf8IGVzE/TVL/0hGxrB
	LtceuAxf+kJZniPkW7L7+v4ChTDlIGQH05FPaI93q+3XHdM1zoKxB9umoCu9RceUvD24Vu4sSR2
	9jv8GV1Wbm/eB5cH95F
X-Received: by 2002:a05:6102:5e8c:b0:633:f2bf:7de4 with SMTP id ada2fe7eead31-744dffb3680mr1400933137.10.1783520351154;
        Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8c:b0:633:f2bf:7de4 with SMTP id ada2fe7eead31-744dffb3680mr1400884137.10.1783520350378;
        Wed, 08 Jul 2026 07:19:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:08 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:19:03 +0200
Subject: [PATCH v4 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-monza-leds-v4-4-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
In-Reply-To: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 9hbRicTd5KHwE2E2Q816V8lJBEP3Jkwu
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e5c5f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 9hbRicTd5KHwE2E2Q816V8lJBEP3Jkwu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX1nTHn1DCk+Dl
 9BFRuFzhbV389fvbBqAuTZuK5Ph057pMch1+EWQXzp59NyPa3tLCpNDR8Sz5QUFk56a5BPYJcxF
 Y4obOqT+qMJl9rR7UuJwG1uE+V50ddU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfXx8e6FNiZETf2
 PooZQBe+bOrjk955jS5aMeAU8GdzQpN276FwuAs5VWlAyxjlFKwKFiV16UwRFaz5h7+oTg9/q21
 eFf/M9rZydVivsqTZ3tuDCn+XFMvBTl6rDfL3BBE61iNr1dgaWFS2BaASzsMpx3f10GntQknWUl
 KCqTEBTBcUq1ZjInCw9BpD9Mr9q5ASpb85xYZwDnHZOiZKO36wMQsy3taXUVhVyMGAJKErkgeCJ
 tbB/ZcWgSwXtEJu/M4XVxbspdmU1ecDMbCetLZ3qB8p8RtzMOpq5gasNuRVQMGzBQze3mxwfxKd
 YlVNe6dIMFKEVfFwTjt0JpBqq41rV7WOa7KeWAmCotCHi3yS2yzHyczV+QCpGDAqDIhDX3dfAEL
 C2ZREU8Tl6LL8B71knV/n98885awPNxQCnNPguJoMA38eTJQTP2mP73Is+kff5UU2Z+gpqACtQW
 hOHzOWa27exD9TWvt7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8969-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC4827274EC

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..83ccc4eec342328c78be37d4642b772d74a8ed37 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	led-controller@22 {
+		compatible = "nxp,pca9635";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0>;
+			label = "stm-led-1";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@1 {
+			reg = <1>;
+			label = "stm-led-2";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@3 {
+				reg = <3>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@4 {
+				reg = <4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				reg = <5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@2 {
+			reg = <2>;
+			label = "stm-led-3";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@6 {
+				reg = <6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@7 {
+				reg = <7>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@8 {
+				reg = <8>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@3 {
+			reg = <3>;
+			label = "stm-led-4";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@9 {
+				reg = <9>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@a {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@b {
+				reg = <11>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;

-- 
2.34.1


