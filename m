Return-Path: <linux-leds+bounces-9096-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UflDFqqRV2rtXAAAu9opvQ
	(envelope-from <linux-leds+bounces-9096-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 15:56:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C2175F0BF
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 15:56:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RhGtwxgK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cFmVx+0y;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9096-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-9096-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C121D304E27A
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 13:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA3B31E85E;
	Wed, 15 Jul 2026 13:44:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C733191BB
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123081; cv=none; b=a5Iovl2DCwTpIDBNr4gch7IrZn1IuYOtQfUSnW86lXsX/IFodxax42xKgJ3biO6kb+/6/a4m16QSYMzN9uU1fkIrJpg0bE+sC4Fq5AJAFCvrGBRl54TC1OEs4UXGEOo0F1c47vi7TOOjHZF3zYq2volO7JB/fVcTJdsNxihSUmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123081; c=relaxed/simple;
	bh=0Rq8D/NoyC39EmLSzNVbHI8oYiwR5Wkjwf+f9tdSuzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4HiTEnOv2wxjtz2x2PLgtCh6ixGkozx+WKc7dM/xa7HiDJPC7qOTFs3kxqEgR8kakbTB92i6obBjyKSnp9yK27pxCpfAmspRhu0/b2vl0zGztcErPbrPsIIMYDu8qXr2mjT59vGSOBuHTR9DhbFFuPnYqsWZYz0tvg0AD/0/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhGtwxgK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFmVx+0y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcf9n3707590
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=; b=RhGtwxgKt6MHOu/5
	R9FHBAr0CD0adw43yh37Q/Fj2Tby6L7uKWob21vjo5r3LCqse4jAJfWz5q/o4xdE
	H6tXjj9itjuu3l/5OqKtChciciMfetQ+hLAWv6lh2GRo1eqkPJ6PVMdxUHti4Eyh
	YxG+s6+NgCx/N04nrxr+Q15nB09OONmFoxUN5ezBpVC748FLPfqZYYpcshby/9Qt
	NHbOYVh/AUnhB2AwYzFlaKikyn+EzCWvObW3kIH0qpyOgT408F3SYFZma9MjV2mg
	H96qBgje55XWHHTzIxlH/cfEcHEBOemA2wQiOZL8nM1KJzC/jI7VH2mSrM3gAOhj
	arxWAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgxq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso23300771cf.2
        for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123077; x=1784727877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=cFmVx+0ysPl5TOYsAsz6+95hB2DDDUP4gzlW/sUH3K3WJwWtoSUG4ioLik9xPe/EOz
         FYe6hQh4GvriPhqHF7FERB21q8bPU+UqlWkpdeD1F7tvWg2UtApWFlrscT2ofSCG2paz
         vCPICl4bAZa8ZohA1AlZqefd4LImdRuxLNZIyKFgntVw/pPoKsF7NG0z9NtbvVSa62do
         3GZGeecNyVGf5zR3lnaMA0rd3I9/j1cVp/OKumYWpgrw5/fi6YLmxPimNQSHVlnYJ1Rw
         Kqg67XM3A3kSOFgWrBmEN0He/AXcUMoSHA1IQzdi1AV6jsDZdKCNGDAE3jITLsVrc8Y8
         IgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123077; x=1784727877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=hQ5QWCwrB0OamMFNKedPaW400Q68nZWa1rg9G11T73EjqGLcW8TBAOcYwUiohbA8cd
         F/wQIA9JKHRivDxHwbcAMIxrR4+u3zX3F9U5wAHCcoAZu0cM8KQg1u/J9gYBrtJe0WIu
         H/Sn+7POpoCxuaFxkHbTCv6dW2+AQAp4LBVjVTA8t+zJeCHyLjH4zMEZW5CFaMOBf55j
         yWSg3lxvolLIutfgyFcqiHFWpl3C9KRHPcz1MvBa3TLZPAsUbifwwxnprt4rjyL+zQtG
         Rfjy2BZVWi+Hr/yI38QmVT008qDLoppVx/sYXnNzw6xFmXqBcZ+Mu3yApS71Xg4zrsie
         sZ8Q==
X-Gm-Message-State: AOJu0Yyzzx5l2RFoi3rYdeTs/BZpPBJwb0dyhxufl//2tRARrb3nwmp8
	fqUW4/FMW4qYn+wEovj/T6wWLb6YLAUdV1901jOy3yu7PNXStRZFZujdEWnmkVjV2QkR2mN87kk
	E7IlutqV8RExAABgzvOZMZSCm+thpCD3v0lBDNxvE2ShOx3qxkiwUCaGU2I6idku/
X-Gm-Gg: AfdE7clxVirqMtoj3y62SMb4G8kj+D2SJqnh8MOKQm3TRMYOKRGovM1l0DnZfrZ9zrv
	9+b3/X5pYH90vWHgOGXHmJHAcrZHASM67lwsrUt7YajoJyDIYneL7LkdRwXdX6pPJfp9dMaiEjC
	yMvb/DLG0E8ugwQ0D2NmiL467I4lTvWqvLDXumAFr/wa+s0K/0HIZ6GiwPGVwadm9bTiMhs37G5
	ZjnpmWOly00FPtU3dGQKZY7FbBzd8Nsje7zjXbx6T2geRhKboo2YJHEPCvciT51wEC8xu1YiKjO
	/I1by/l57z1Ackug+qcz04QiASzo4ke7xU3ZslJDW1FMkoP2u9+7W8dhzAdC5BmE6/dYP4/NEpr
	IgCoMp67Oe8E7A6u9CHcBMkrgVMuK9JuRMNQFU+FLS4zbiHk74ikKewy5BqXNM7KKHMlMn77I5L
	c1jJc6NWJQxwVQkEeSbwkkSw16VDXy2t0777ZiCQwZgkVRlaemSXEerMs2TWnu0w==
X-Received: by 2002:ac8:5710:0:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-51cbf05b838mr164820541cf.12.1784123077389;
        Wed, 15 Jul 2026 06:44:37 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-51cbf05b838mr164820171cf.12.1784123076851;
        Wed, 15 Jul 2026 06:44:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:44:30 +0200
Subject: [PATCH v6 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-monza-leds-v6-4-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
In-Reply-To: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfXwWkU5b+Z5cel
 5FSOoi76OUEwfAV2RA11EehVuxIgr14wSb4b2qLHm4mLSTfHxnr/5ZtC5QGsfyEtyWxXrzrohrr
 LVRL7Glg+bkXb3Y/Ady3Vfaheax+HSk=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a578ec6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 1Emn80ZvFObwEzKdBDY542hsMTNlV0HI
X-Proofpoint-GUID: 1Emn80ZvFObwEzKdBDY542hsMTNlV0HI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX+KU/lhudjXhI
 v+Aqb0qTp3mejY3+QbuzsLwIIMAzYmzlEyFOnE2Qlzaa9HkyPPQ+VqRcc/JYYH4DPcT86THDUEF
 L525mkM7LZ0NvaoP/RgMi7OrBP9Ezk6cZX1VRJ9ynXiuvmkAVCRvvnW7XeT3tlmZ99dG6NPAmI+
 nnBKoEHOY2CYmPk1icBD8pujUgKoKKsrlN8dLLYO9xvKOa3vtdZFt9IJzHjRzeobawE+/xUCx08
 1XWpIu//yVq6/koMIiWgFo2G/4hLZYInjRZcewW4CRpGUkafIB2DK0HGZQ8pZW0gkYuROpVQOPC
 G5VhVH/4mE00Op56w51hdXLtPCHcvnNZdlRHpegdnfL4eELQtaObTnthQztMyEVz995fW5MKxuR
 gB65SQ/CgJsTi1gjWBCk5AazB7obbuBaLHSI/B7jYUnwQeoPkhuDiKuCRvmvHZ8WP9KCYkSjn+z
 14UCBbRFKelalVwjMJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9096-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62C2175F0BF
X-Rspamd-Action: no action

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..21e32df66667eab2f882731f6ef09b7b6e29e61b 100644
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
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
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
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
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
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
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
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <4>;
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


