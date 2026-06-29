Return-Path: <linux-leds+bounces-8799-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zp8KOkDNQmrwCgoAu9opvQ
	(envelope-from <linux-leds+bounces-8799-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:53:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4BB6DE83E
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:53:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pnl8g2+G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FAGk8mUs;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8799-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8799-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 698533051A75
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 19:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C9F27816C;
	Mon, 29 Jun 2026 19:52:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDC6314D21
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762743; cv=none; b=BWrhBS8/xstwTJgxZ/wbS7mYybstx3Plfx06LmsOW9hmIR6LjFE2/+u6IdIoMmLcBbq2glMwvXA/4diTcZ4JfRoHa+0K2C2qhcSb+rzAW2uyOYhVJ/QXXL/k4dQho56r2Kt4qSSm03qUjZurYRXOufiWEsGly+OtDKcpeZ40wG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762743; c=relaxed/simple;
	bh=xzD9r7m1mdIsz8vG8N/LmGO1tj0nBeLuziDr8pQ4fYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pm6L7DuU/lq/+JSl1d9qnuxxZewRoJVt2YOnmrOQN5iMTL9iTlJr9nmA863tAmcuf4qO4P1xFwEzyKYFXyNjsJ1SvTjoUL0oeCFH6iMV9Mhll0Qajptm++kNR3sZSQNbWfLirCwVGbmgD70BWeueJFwCnb8ltfIQiEbMLKrDpjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pnl8g2+G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAGk8mUs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGK5MQ3380400
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9bp34Ti6ivWdInuxYzOVcR1zKZg/fDN2ENN/Gc9YdM=; b=Pnl8g2+Gc00JSQte
	zEfbMUAg+El0+G8hjxrGuPrHtz9f7nHwTEqEmBefloF+tlPw54SQYH1oIMVGGIXB
	F2KgxvlLrkGa1OlSSsYEVLwkb7SelKzvJfVHLVWGKTug2g6zg/lpyhLxPVHisl4V
	0SSMBT/gzbIBt8m8XVD0MO0a++p9a4ezbltBQ8sh7lag4HyTxx4ujUPMvQJ88ygT
	yChmPTqzjpD6rmEE+9alY9wYfruvb+m4gdtOrdKEwPV/vOj6l3xgmATeww3x02RZ
	PCQFg3flAfR+E3Hd1ulBOO3U/vMt+QYEbFlmlnZj6kZatDCThJ6LQkVSj5iTDlZZ
	1cr+9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7kc64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92da6f3cc81so513054885a.2
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 12:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782762740; x=1783367540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9bp34Ti6ivWdInuxYzOVcR1zKZg/fDN2ENN/Gc9YdM=;
        b=FAGk8mUs/aGGtO4BxovG9ooK0BMAkjci8oXVxZPb2ENUk2y8s0SIrfgMJ5H9x257AA
         2QPG0RS8eat8d2ryGjs/rKWSeV2GzRl0XbPKMOICrXNqc/yTxHt15krf064mckm/HTUE
         jD1xxjZYYK1cHTv0TSictXrtUc3BWxiFjN5I50luPfGzmE7X2NbBeoSVEWCxKDEnjKCP
         9IQkikGt8OjmtBbjlOFJ9DloUs5gqlEe4I9kI/hMO5jTQ2O7izeXCusnCMmy+MKdjDww
         QItbvFBYUeUnlZTGon5TkWz2sMcnz2GN9JgC9bej/HDDXE5wlgWpMy80BaAVqL1P1oRO
         RN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762740; x=1783367540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p9bp34Ti6ivWdInuxYzOVcR1zKZg/fDN2ENN/Gc9YdM=;
        b=WFzuWggOivFwRSBPZgiF3IvqnRUdK3mExnS0EndnZPtLKRutBT2Rqlc4RtimsKO0Ps
         qYGAihTY08yBV5x9BqSO9ayuSxUvMUmAyleaRaFrbbtab+hjdX2VSHQAeAjwwnXS2SW/
         WJ+zui1TTdNz0ElLsQesiTS/IoF7d2/j/TJFj1Jlol1kXyhxnH8dfrvdPtxUFXe8jkOg
         SOFrL3SR709FLnnSssOk3F7wo0DzUMieYSZ8KDv6ADbbGTdBYiRguZ6ceIAehiRXakbg
         FHA1rPtyIxqH0X1/+7d+UG5jHo5va4P94MVk4uxXNz+PPQ3YG/C2oSvl2ieV54SyHqLJ
         rMUg==
X-Gm-Message-State: AOJu0YxgnoMwFfuVSojQjtlHB38BZsiqYCqMdIS5yewhM3tUUEVun+e/
	XIQ70Zn1Fvl2YgR3qtwH737ZgxOipGtIZiTk1QTvPINrEn6Lubo0lA5lmhpy6FQdjuX7jyBZRNT
	QOgJuXxn3BZUn79u+6zqft2na+8QcbC8I0hhHGAcRXd29i3m+foayY0tzQohDyhpe
X-Gm-Gg: AfdE7clypcCBC/kl72TPSn6GmfextzlXHfVOuGbm9bvWeNLYZrJoyfTzO+3P+y8sUok
	mLMvXIgfwOGwQaBEnHtTO4UIFHEfMhayK6mgPc9ENvnM+YdklrRrBUhn8ugUYgBSS71KZq76WHs
	BEFoeB99mH6bF8M/RfcrhsM4eE9sIGyz0EidpxxYJlH0IkxQs1gsENW2tyiAtauVptW06/vFzTX
	Gjv8r/0MK7Bg/Mg9rPZluMILGeD2XlS7XttNcDq9o1jHnCpIetbXz6t82Bg2I0wHHn/q4VJqI4I
	Bk09knT0uO0a35ly0kmjw+1TDht/yzsFVsOtlw7ioYx/zoiznF6OpYhYodKboRHf2TpzYKehrDX
	d4RHXx4KDfHq0WuT46OMIqm09PXXbayOQBfvaouFo4fqIrBoGjjFoGEueQ5F//irOohF2nuA/Tu
	WnF4ixh5N3vwYNmO+1gbPo8fvOYY8fsrAMbGKufyGu0MK598oaxAvGKI1v3i7zfJhfnGDOLOpO6
	bJC+GNvdZk1T+Ag2P3s
X-Received: by 2002:a05:620a:4690:b0:92b:6805:9193 with SMTP id af79cd13be357-92e627e2931mr164276385a.59.1782762738872;
        Mon, 29 Jun 2026 12:52:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4690:b0:92b:6805:9193 with SMTP id af79cd13be357-92e627e2931mr164253385a.59.1782762736442;
        Mon, 29 Jun 2026 12:52:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d99565sm6360005e9.0.2026.06.29.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:52:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:52:09 +0200
Subject: [PATCH 3/3] arm64: dts: monaco-arduino-monza: microcontroller LEDs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-leds-v1-3-0cf7c0a7dc14@oss.qualcomm.com>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
In-Reply-To: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX64YfdqgrGDOd
 IGfe1mWve53U0k8IDH95jvTZ8YhtqItLuLYvQvbqao4dMlJevAzTE+2Fxgmhz41z4MzbqYKQ+f7
 TIYqGAGsPhPWDGHAbQ16uKRTNu3vMVQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX0+19X+Kn5mVp
 4tlSsQ72d6sw36O7EZ5SWdM+hTH0td4g9pSlcPLOUnC6z+7UX7Tz8gcSnMjjRqUbKLVaCVs4mt0
 4GC3P1VmxcnMcbTFQjLObj/mo4RElSYNvDKn2PpWjuNE7kamcuxP5GrramtTgqxCGcIo5Lqc6GX
 24TTs2N9DCw++LBm5OJTGWm1e2TBSHtUk92uABia7lhTAe8zsS2if9mcIXSN6bQmJy8DTy5n3gb
 zB0Q5VHhMPGNMXRAxBLLMtNsGWBGyPck1wHmblUFNCrs98LjkYc9GMl7oCSIpPplpBjkjYLvyMI
 LuWiOeEZOhW3kIyTeWYaHhb26O27InO6wxiiPCQZdmy/+4gOoZ1qfgxMVGJkBcL7TXz/hCaujzs
 z8v7lFniGN276qtxHCHtJwRfnvJY+YsJ3X6YLewmVW4/xQY375O0k7EK9EFOHZrhaLMFKCh646u
 wxmilQ7tHIcqYwcRB7A==
X-Proofpoint-ORIG-GUID: ifrYTHiGw2vXBMSgKTqU5KPjp18Z7nck
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42ccf4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KhZQscbOQyvxDa-8kVMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ifrYTHiGw2vXBMSgKTqU5KPjp18Z7nck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290166
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8799-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E4BB6DE83E

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..71685e54a3781c9b03fc41cacecfea77650a7182 100644
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
+	leds_controller: leds-controller@22 {
+		compatible = "nxp,pca9635";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x22>;
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
+			led@10 {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@11 {
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


