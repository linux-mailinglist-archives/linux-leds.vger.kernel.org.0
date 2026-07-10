Return-Path: <linux-leds+bounces-9008-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0RiIFDX7UGrl9QIAu9opvQ
	(envelope-from <linux-leds+bounces-9008-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 16:01:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EFD73B8B0
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 16:01:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kBYrZ9Do;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HwbmvNyc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9008-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9008-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DCEB30FB0BA
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 13:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A732BFC8F;
	Fri, 10 Jul 2026 13:49:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344428C5B1
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691397; cv=none; b=B0ay6e2mbPr0AhLhtzHEqDEGT8oPUiUWqFsI2VYB5/CGW2S7W/ZYPA8ynrkI5h+MoNxoIcSEgUKpLtwtpXdxT9GXI9gOJCK2eSwzIXdRsbld7+XDn42kWmhsM1NTveTAyWdFkL0j0j7mo1pj7OnYazTn9XuadP0teTMF3xtV5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691397; c=relaxed/simple;
	bh=+NBAVrPIo7sHJ7MgnZXaHhnNEpFD2cpSnzyBi8ZsiQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RRYfotPLg8dA4Po2SbHusBHVYOomeoW3uKre36il4OgzhQ6P/FiFw4mWuYDC0fW/w9U6WshnJnEh+OmvJgW1RTvjbXJQMuT3q0y1yTFvYLr2rtWMXLziPAIS/Kg8tayGYpmGuJucGi48mpwk1zHO+lC5USumebcdI9CIm5NJHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBYrZ9Do; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwbmvNyc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6UWj871595
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=; b=kBYrZ9Do3IDDr6Pl
	+j/6KaqbqWIUgiE4L77bTqgfe4l6rd0JHfP8vpKJj2rfSZ8dV2tDVKXJzm5EsLu8
	BZolFgLCBomZtvUZaysvd7mgBFWmZoMeAz31yzVX5M4Y2HcFP4/d6e3NHrz2vw/I
	B5s6TAEwKOhpFQtPGnTVnss48B2xgSQXEbQxMIn20iqha8+TBW3WF4Q4f1EQ/NTR
	fiN+WVBy+HYY02ZK+rCOKQtRzbISnDdt2MNxFQ5T6zYa32nZSs9iQnTonCIPRTAR
	QMcrYsUNVfxd1uMKZS+TMQvfluaE+VuqQx6YHg7YLInwP9nhy8CCeOairQJYJbGr
	C0w0Rw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8pm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so10425601cf.0
        for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691393; x=1784296193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=HwbmvNycnBRMywAqUv9rwQCGHO1FrK/WImR2rhl4Ad1MgiBmneBqYZofq03gbZtb6r
         tuoY0vKQRSGAmGMfad7DmtwvqjvT7zU7xRFEKUu5aEIg7HwWub2CqWjQmEpx+2CI8yJj
         YbqixFQgWJ3Y4AkOXPIlYnsIPhXASfc5S3NEZERRsa3/KT8szW2wA8zvPWuwf/0KQLzt
         7Ca9LZdaIJabLR9hE58csT9VwPy7ldPrqpwKr5QRydyiNLTy2KUviY4EbfLcZP5Onw1M
         8Vn3KQQ1z4zOTFjlggFZ5fzL2WUlVhx+2vUXCg1JrG/tSKsvmnT9MXJGjrh+qv1fyAdV
         WS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691393; x=1784296193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=kG5Z4eFqgt6F2cYQ8Es57Lcdu6cxKNNvAf3O5QeU07qEsctKwFRLy/882wKqWT5Q/k
         tTfW9gW1a/dZm+4cx5gw8V4ZGNyDwTnf/zuVi0T1ijqCE0sKMOD3MiJGgILprUzKpMTo
         ZuqAjGTbdI7Ng+uBLwD5F04e8cBgkDdL/ClHNuCMO48F76nGpzegFf1fQs3wL4yXbbr7
         Dfu+YOG0BKXtrk3nQKWm/xWubBfog5dLFR0fl1Kvu2jbFfBkktf3O91ozJ67F3tWtE91
         qSj3xUfQQMdyerI4qPBrXQFDgUZHUO1HOKlU9pJfcZ0d8KpUeWcIpmHSY+mlzH3UeB6w
         VOZQ==
X-Gm-Message-State: AOJu0YwSBRBJ0rnti5Q61GBifkEWgJaCiv75QM4R+o6klEAeOfTlziuk
	A7ZereclXX6eNRscPVO3Ir2L+1bP9He05nq0UkRTVF30zKTu/MPpFQYSukWlvqXSsyOSlsfPKi8
	lbYgTqXyjrpUIlICZGZIVPIOgSb3fQOBnY75lkBugCyrTMsNEQf1O4CfAWGhOsDYZ/tbwnegBm9
	o=
X-Gm-Gg: AfdE7cn+jDokAv2lyu523TtPPxKbogwcSTT0w/UJm/PbToLXodsCUA4tgUuCOQs/sMk
	8Quq0Wj3/zp1IL5wTQrbTx1n1nhuJB/1BlYN91rDxKdprP3gnZo+4s98yUidSawaN2NBLl9WiAV
	U4oWAQTdNTPktg4hdxI8yE9BWN2YJAGGdtxrLlSzWYD6NXB4bctYambpRE0Qm86oJYniUD4v98Z
	iNmSiXCNKXImJGaoApWOwmfE0g9kQs6xPpnPSAyvDqpwVQRp1Rc5Buo4ZLyo72P2OU5R/CFWQhN
	fpebO8uZTaS3uYzJAVbPqdTgmPs2uPtPu2yrp7MTBYO/E/ybaet3nQIySoHV7QlbdoZ3ZSkH83m
	UGRgVt1HJ0JEYMU/Mplmxh/lFubmPVC/Yl4dZ47PrlqYr9pkIr6A5Tk8TKe6hVjpx3K3W9XdU3t
	7h8J7SNagpQJH4fAN/Ou38X/Pv6YotViRsYvBNt/RQAfDN19levNIDXSweiQwyVbqZWAS2K/dNQ
	CCxwUnzNgC/F8hJhAgn
X-Received: by 2002:ac8:5d05:0:b0:51a:8c9b:64a2 with SMTP id d75a77b69052e-51c8b40e741mr120111141cf.70.1783691392577;
        Fri, 10 Jul 2026 06:49:52 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:51a:8c9b:64a2 with SMTP id d75a77b69052e-51c8b40e741mr120110541cf.70.1783691391753;
        Fri, 10 Jul 2026 06:49:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:44 +0200
Subject: [PATCH v5 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-leds-v5-4-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
In-Reply-To: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 5dQyV0RMv7eav6WQ9rSeLXqJRpUHPMrW
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50f881 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX8YD5hdpREawK
 Aaf1ecUSDL/PJ0iylONrkcWU+Hd7RJkp1OX1+Od0ATBKefbDUrxxkTFjJho+RXSvXUuGoAY98TN
 VF9if65ccnhrnySc1+Q4fnVDpQUMwt4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX6xzsCD5LK/1V
 070jupZ3gOG1QnlWcVlhvHHq3AHJVJHS/KRurtVmxW57Stv/8uXWrJ3I56FbZPnwU+9iGr9lPHX
 pooltqPS2CftvCjsi61DBT03c22eFAt44EQxLDNrAG1f7w3xDG8GZFwhV6cTWIB+yr4f4C6TlJ0
 S3ET9tztlqEJyhieKmg4Iby86W8uujweWz5DVahnLKvVcXI0XR06FcMuTvxmds+XLfzk/hKazDJ
 uqFCrfmv2lgwnSH3KVJq1EkihCRLRXE4nCVy2ghARFOZftGnqgXBUrjQ6NYrerUBgbdEalWEJeM
 mV55CAaloBwR+oXiDDMTTTg64qVnMpVGjRt2CxRrhFOGCqC9FLPTazM7iqp/OoytdTyUaind+m+
 fP/RcpOtOGAIRH9dMW3gmDsnYad8mNYfs0SreL58IV62RoXSmkKAfVzQi3Or3fnQTMuweYw77LH
 ce+/g5g8eo+6s7TjQVw==
X-Proofpoint-GUID: 5dQyV0RMv7eav6WQ9rSeLXqJRpUHPMrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9008-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[dmitry.baryshkov.oss.qualcomm.com:query timed out];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7EFD73B8B0

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


