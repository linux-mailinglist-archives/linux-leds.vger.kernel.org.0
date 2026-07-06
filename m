Return-Path: <linux-leds+bounces-8940-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xaxFF2DWS2qnbAEAu9opvQ
	(envelope-from <linux-leds+bounces-8940-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 18:22:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBD87132F9
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 18:22:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WQl3TLLc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gIsN75r6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8940-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8940-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D5CE33D1FF3
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 15:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296C5430CCE;
	Mon,  6 Jul 2026 15:50:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCB642CB1C
	for <linux-leds@vger.kernel.org>; Mon,  6 Jul 2026 15:50:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353009; cv=none; b=FRfcO24gGUBzuAEYHa+Wix+yJq3MdLO3UA8hx/gHi6mOxvae594lO0cfvVxLv0kiDI1HVdB/L8CHz097mMSk8aD9gju/WiUJTWoAPRV6lNtot5gXjwyF2gS9fDh7dVZHeNXUWkny7KUboHheDhi0gOBdrMNgP0RoBnOgJO8R8FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353009; c=relaxed/simple;
	bh=+NBAVrPIo7sHJ7MgnZXaHhnNEpFD2cpSnzyBi8ZsiQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgqwvbfinBe0WsSndwzXJ9hG+SnQDZ26AQlCLyCIkids0yeyimqpfhzPyqAtj3XL6WT+d7q+pOepKLdX1Nmr04wI9PQCTRnlrl7rddNVBc2e8aROSeGNLzy7CV003tLKf+MHr5XdzqBykhf9GUve07JAI7ARVTSEKF2tA+ONXic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQl3TLLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIsN75r6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF1Fp825623
	for <linux-leds@vger.kernel.org>; Mon, 6 Jul 2026 15:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=; b=WQl3TLLcwxuy4/TY
	EDnKyXj6tBvmvhmoZZpI4kOM0ifRlKfe4KC8xZqHwJVHax9r/Hzi4QXqC+KdqCTh
	Au0vyBRTXTdJrwIg2F817lOkUxHUqKrno7txf7SS2TmoULgKLKBhTLIcALc4niZY
	ifRaMMUe99PzmoYgrLh5u/yuY1DnFZPfm6GYWEsjaEaZzNN1oBXwj0fWDiVeLb3e
	sqXV0LvWyDBOT5SCvYk+7kvJk2WgXe+fOjoad2KiLDETn3eZpV1r8/MQfpfLT2J7
	nEeR8gkH5RnOJufKW4vDpjs9/NmkI56fkb+DH+QvMxbq8bYKoMPBOVAmZoTsWgII
	ZZSLiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t89yfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 15:50:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6ed4fe99so542242685a.0
        for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353006; x=1783957806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=gIsN75r6IPmBXcFfVaSNv/FhynJ/Ya5zRC5/azKjo8iD5wSCIQv1RarfIHM1ISLU6R
         hL0W03XKwO9XS0Fj1wroDMJ/gu6xRr1z5MnD/olpIUfYl6k3x4TJFWDs30x9GMvuu0Mh
         CtaTB/Gd3SNv+NqIDE6cPfWqzKjFDl5KbD3m1p/nXamlWRAtV/yZ690oHM2wpQPxZpQI
         8mN03HvCmKAsyWUoPjp2vN4oeWodk5KHbsdTmscs7wULbvNl8QyNJ9TGgeCp2cDeMWVr
         DrX1weTQkVzLy6eCgjiS++kCsTV9kL5dwQL7WldunJUVTNT2ez5cRFf0eHF6RPzanwwB
         m29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353006; x=1783957806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=srw7T3DBQ7dAr+6Gm5b0isJAbSwXrckC8qgxeCNV52ZLSV/SKW0tBtj+oZ845++lpZ
         53jLO67vW1gbj0ciNNn/v2H/yU8SL7aELFvOtHDfxGTUgPl+oqAfqYDa6yhbR3FkrYfj
         0DvcAQGIhIC0/PosZ9aW95bUxEqLK6qXo3TSVKZ100RI7TqDzT6lM8cJkQrVDdeJCfY3
         tNOUAXss6hMJ8Zmm/FKHlJMlvc3yGnHkEva2BNR01vjC+uXUAS/fNQ5vLDYLbeEyxK79
         gnwyubyOgpmJUU7QbPyjufO0OZ1kw7RhlT+w1mVbRPimHlTUJGusM7Y7ea2D36fTrCdP
         O7dQ==
X-Gm-Message-State: AOJu0YzsAphwzqmu7lKXIZ5hTGgPO1oohkJqwBetcpYoCm/fx8F40qE/
	tJWtqp1egyyqtL/7erOj0SwZh9R3cfXwmImrvKfKCaOQG3yqMLZpLTfFu96lafqHNqRYqyMtPOR
	KkWSwIvANcgbt3ySE8c+TYP62gyl7EwPR7c29SonTO7HxnnH10CB5cq3FvnwGpOK7WXdpEbnjv+
	E=
X-Gm-Gg: AfdE7clzF4kpU+L4VDbekti8pHtyaC301jNyf1rc/l+uZsE9mXofwzaYoSSXCYJ/06A
	z8jw6bjnAceSaLbdHriNS6Z2mIrC5keju7xFurN2qMd1lUav8BwBRjCMv7gqizdR/spPPNLLuO8
	JU13XjNTs7p7HMVsqXoaOI9yDjY6OafthL2/OBsEW7QAHsySapIYMSUK4SrAa+kbsGYXXnEZV1Q
	1NdJy5iTwSkBhJzRQmC6+WhTdWI4N4H6kUQg9YxQNwqaPr8xFhMH07Hap6Sr1NvwKukTi1rnbv7
	wodvhuGgmPvMrjZcnHdfOxDQMW0q/x2IUukfSTEJHyUlFglFnVKq/jWOE125SdMDiKkO77NrkQJ
	Eys4GMtMfCM1XkfVlFLIT60K6l3wOpVms5AcPwJ4KGK+JwpJIa3ckHl4qFl2NSqwdoGKg6yV5XU
	YdqCkqXf2JkgwNtCBfn7QXkSK1IDIgV22/2qpRCW+B8egn2ElHMmgLUJzpGuErTOI=
X-Received: by 2002:a05:620a:17a5:b0:92e:7e4f:eaf8 with SMTP id af79cd13be357-92ebb4d8ad6mr154269685a.23.1783353005983;
        Mon, 06 Jul 2026 08:50:05 -0700 (PDT)
X-Received: by 2002:a05:620a:17a5:b0:92e:7e4f:eaf8 with SMTP id af79cd13be357-92ebb4d8ad6mr154263085a.23.1783353005532;
        Mon, 06 Jul 2026 08:50:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm801997066b.37.2026.07.06.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:50:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:49:58 +0200
Subject: [PATCH v3 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-monza-leds-v3-4-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
In-Reply-To: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfXyBX0fLLPcvyB
 RrBWA4G8mYoQHgvAIe4fsi+4EYYsT7ksa/ONzYXtgs0JsaHJTFhIPpbvI7x3sMwqJ1f/ZMV4Row
 DRbGbbCnUeKYMmV3bTAHNh4skpXZosA=
X-Proofpoint-GUID: 1J3Didod2AJIM3bPvBEQg4HM10YDqHr9
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bceaf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1J3Didod2AJIM3bPvBEQg4HM10YDqHr9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX3SWChxWheOGi
 B9TlxEeWVk2Jrznvpv98N03zGEGQ86Rut9AOKZF5ot9VVuRNYEb+Gibnzp9aiIQ3vwNuH5lIo4p
 E7+7/Om+IFVg57qEV3XVLzbi81R9YZQHQ5rOBrvwPkatONHsv1d4NqqISg99HSbqDWiGu7iNcDo
 PQcNIZZF3JLySeREBUYFK2kK1nNzreVwyfrN9epmveV2buljI0K1vZP17W3ynoGdFguln5oLuQa
 +6LianPuipcu7oKod3OafmlaqiyZTNsO9P8v4lspv3SqG1y4q0jYK3PuqeHNZzvJqsWVHmKOjEx
 wt/HnocgqGTtUgv8EAGIr/GCbiO3aGSP38U9r5PzwAGpTE2bMFXAR79EQ0LrhQRApbAWRMF5D72
 r4NZYuN/VeD6Lbe1RC2cT1DPPJv2VFmQIz+t8CMlZ6EzqL+GPjqAYXV4V0gMsEmg4pI3RwQC7mR
 dOgFXVRTPMTIvl/tqmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8940-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFBD87132F9

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


