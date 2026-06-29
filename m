Return-Path: <linux-leds+bounces-8798-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8yCEFB7NQmraCgoAu9opvQ
	(envelope-from <linux-leds+bounces-8798-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:53:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A55956DE832
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:53:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="W/Vk/19v";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a7L80rmb;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8798-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8798-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85FDD3046FC7
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 19:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B892C11F1;
	Mon, 29 Jun 2026 19:52:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBBD314D21
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762738; cv=none; b=am+TUsA6KlVo+xN3Y965E1rkbNpGLqsA9SxMhWJImM0wdT6CM4JwxTIOQv6ez84JxCwgWopcoEY1yZMbr9BNo+vun44Z17XHO9dfCfHHNU4VcSg6btiQ6QQm1Q8x7SBVRFRx7rEzajDEFmr5D+YAbwxcmBWF1RY11aZCetZfNIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762738; c=relaxed/simple;
	bh=1y47odj+NOJ9z0mS6+ykXCLNXopAlKlTgU+V3x/sXtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dISyQmThAZLIQwycghrY+8+RrRDn1g4nILiZt3lHFZPl/2iYeFHeQCDZMDHZhj3g+IUrPoVUVVRQajYMEbDYc4VSeT5Uzkw+1dLRZ3XvKohHBgJwYQ3uhDav1OI8L3xTLOkqUFb12NcFTFxK2jZq5OcvgG4FOLh1AIW/vWOVxDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/Vk/19v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7L80rmb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGKHLQ3433082
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=; b=W/Vk/19v6zKrgD4e
	h5Q2WZacCgohiJIm9V6BIGRsXtQoTOrO2v2rFWe9/0cLCypgxtO0AoyAP5DKBMLa
	g14U0LGZjUi8RAIQ9IKwJpl3NNO5QOAAY9SeLoeCe5wzdZYh+k5LLLkvN5WNxckr
	repTsnXlDpt1OCGuWfFuJrpx17Vy8I4zdi6TIzz7QO5GgZHQppc7nq9hVmuU3xFw
	NNOLMx7JyfZumivGXIX7kGPWXlTNXLzB7SalfEGa4IjA0YtOmU/l1/5dCzf8pVX8
	QWZgmy0AG/iykV7MxL5icxEjVh/Q/S1Acl+vSbziRas9RamOC5xfunYNIToVvy87
	zhrE8Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgtvab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92af3d5e85aso832064585a.0
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 12:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782762735; x=1783367535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=a7L80rmb2u5DXfzfii+bnYxkRAgpjUQNBaHG1ut9RYXdSxGyS9PYnt/Zv1FCdDV2D8
         pLWnsvDq+Q4r6FmRtCXaQxbukvPxyiJJ1qEXeMbY4VcDWdncV+detcD65HNMNhu+1ZA1
         rLvKEYaHCOBP3FxMTyxGx0J90FhRWVI/hr5o3FWE8r4TBYZGPkSlSqDtIsSevzQ4Aezx
         wDexQmTBFnemzgbqi6Ow4aJLvkl7RCFukIZzNcLFnwcFIP9QfjvJVwqrXJnQ2v+zucDe
         bR4GnByhKOVRBIDhIdai7RKIV1gs9MyAUInBGT7UrMJTX1ddRFxn31ByVLHdgRd/u/V7
         yAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762735; x=1783367535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=PeyczUgV/SufwwJPKwN+NfmnuXCOx6i/29y9D8R4YWJinCBPxB26JPhTTbrDTZ48gk
         MN9ZHn+POGNfgZDh76nIqJTb7bGc30+Z8LSAG3iNlgso9M7QbiB3jzjhihXBTvml3FeX
         eH1hsFcxCFxWZwxjskYIzvZfMg4sskc9nhneDToPwq9nK83G7q00qB1kBNU4FUQvcTB5
         uzclDIwjSABydQW+umElcC0d7fD17VGYs6CLhBFJ3Brj26/zLxFLaUfiy6i4SnCYbB7x
         /BRKlSyo19BikuZsMRfJ+xn3d0iKLjmyVwLSfJOqJlF/2dZhQZjME8UgZf//6IeCnXwW
         6zpg==
X-Gm-Message-State: AOJu0YzyFCikXl8gWq8m640iKoveFDoyV40sz23g39aMmxgr4/2XQ/2R
	HhCftzOfGIM2+hG14nasA+3O2EOPseVk2xRNiETHvbeBIJYt3eN0TO1ImRbIBLeKenliT8G6Ygm
	yFJVBYQZVxFDe7CWBYCDfaofoB6isZzVLOzc5c9DmuXm6Ax2HnUcX4azVsLDGS18h
X-Gm-Gg: AfdE7ckQVvQN4srJe2Eus+8+nF7YnCKO4q6B39kn22WvWBZjwYkjR0v+U1a80Edn5NC
	zuWdazZ+H8aQlD7d+0GwoU2wCa73CrfISQmp7z0sDCTK5MR7f/b8PC2M/SmdMmIHBDuZUFOFlmc
	wSCU4GVVD4mWv5QS/w6yqJbHsT1QAIn0fl1W4zgRzYsL45cPFg03WY1yQsGUCGCvbD8kfN56ajo
	lkWlYEzqU6P/5aOBFKkI4iuFjp0tj7RnjkAiI0tKVlvzwqHPktEdHLwqhytUw9xSDqKjnUg02Ym
	aitEPe5nTbyagx/URwuo61XdQ77s0gV8DcFJZB6k5XNSQjCGWywNrZdDG6E9/53Tgd2wypjwLId
	tfcjtVqh3MxBsO+N7qh6yQ9hWVuDxmBrA3QQuWGb6CERbh1jEj0MSRhVjJDKoq8WnFQj5QExk6d
	czSzRZ71JV/zN1EJ2ey/zNdimyxUToAWCJ1nm/laSCnGpIkzOG42tvzTU8gyTjDZ00RKG7wyk+q
	fIyxqE8x5wndtkYf1o4
X-Received: by 2002:a05:620a:25d1:b0:92e:5e38:8ca3 with SMTP id af79cd13be357-92e6267bf24mr156389485a.35.1782762734518;
        Mon, 29 Jun 2026 12:52:14 -0700 (PDT)
X-Received: by 2002:a05:620a:25d1:b0:92e:5e38:8ca3 with SMTP id af79cd13be357-92e6267bf24mr156382885a.35.1782762733915;
        Mon, 29 Jun 2026 12:52:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d99565sm6360005e9.0.2026.06.29.12.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:52:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:52:08 +0200
Subject: [PATCH 2/3] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-leds-v1-2-0cf7c0a7dc14@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: hwSZn88YS4N3_I5eGYglh0XtAIwaFnW1
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a42ccef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TXsEHxuGAXnH8Ii1pS8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX82aCKIfk/KDX
 0ChZIpoKaeBv9a4tCkkW5CkYFGcIQ+IPVWoI3mHAFdP1GZv0J24O1ZXaA/Iu/Q6C7DegVBC/sfJ
 AwC/DEgYP0kDUwe4VW1nKnBoHT8NNys=
X-Proofpoint-GUID: hwSZn88YS4N3_I5eGYglh0XtAIwaFnW1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX6jVEhQcy5o2L
 wYMW2jnkJcKlDJo8bOQ33mI2O66cBXUeHh4PTBN029KrB49sjH6jBIbxBCVrevgS2RiRm5knZDt
 S0Mpvi06ktxeq7nJZkQ1NRktL/RQ7BnYxlK6wgkUF42NKr/jsNnHBY50Sn6i3EqfI0BkLahwQAj
 FLR9oEykjzowMyOzy6xlDkLI7IRCUk2tM8nWvI/jGsmZHARLOAOocPkI4isWa6Y83lc0k6a0Ftn
 azTi7jE529+FUsiFSXDHQMEuDI3QW9uxWJtESLDtItMlrxu770xNhlvLJD49xjrGERNfmb1hgX5
 z8906Ncttu/z+2SlxAjn/pKZLQU6kH2xI8IMCX75lOYf4bZ/GZo2bByfB8v6iH+tJ3A5R64Bufo
 FRoEp8KAdjbBEfdz6kAp0wZ4wx8C5xSQSYNWdMvckagLy6g3pR33nAsH8RvuEXKAca2mqesv8+v
 lIyaeYm3HQGw8WwT9jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290166
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
	TAGGED_FROM(0.00)[bounces-8798-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: A55956DE832

Allow grouping of individual PCA963x PWM channels into a single
multicolor LED device by adding support for the LED multicolor class.

A child node with sub-children is treated as a multicolor group,
others are treated as single leds, keeping full backwards compatibility.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/leds/Kconfig        |   1 +
 drivers/leds/leds-pca963x.c | 126 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 110 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5..14df88f92b12bbe43908b67f9480cf23056e27e2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -596,6 +596,7 @@ config LEDS_PCA963X
 	tristate "LED support for PCA963x I2C chip"
 	depends on LEDS_CLASS
 	depends on I2C
+	select LEDS_CLASS_MULTICOLOR
 	help
 	  This option enables support for LEDs connected to the PCA963x
 	  LED driver chip accessed via the I2C bus. Supported
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index e3a81c60ee27c96e5050a829523dfd43e1f0663f..f6f6bafcc2bd5bad51a3184c4cb08fc50693a0a5 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -27,6 +27,7 @@
 #include <linux/string.h>
 #include <linux/ctype.h>
 #include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
@@ -101,8 +102,11 @@ struct pca963x;
 struct pca963x_led {
 	struct pca963x *chip;
 	struct led_classdev led_cdev;
+	struct led_classdev_mc mc_cdev;
+	struct mc_subled subleds[4];
 	int led_num; /* 0 .. 15 potentially */
 	bool blinking;
+	bool is_mc;
 	u8 gdc;
 	u8 gfrq;
 };
@@ -205,7 +209,7 @@ static int pca963x_power_state(struct pca963x_led *led)
 	unsigned long *leds_on = &led->chip->leds_on;
 	unsigned long cached_leds = *leds_on;
 
-	if (led->led_cdev.brightness)
+	if (led->is_mc ? led->mc_cdev.led_cdev.brightness : led->led_cdev.brightness)
 		set_bit(led->led_num, leds_on);
 	else
 		clear_bit(led->led_num, leds_on);
@@ -237,6 +241,28 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
 	return ret;
 }
 
+static int pca963x_led_mc_set(struct led_classdev *led_cdev,
+			      enum led_brightness value)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	struct pca963x_led *led = container_of(mc_cdev, struct pca963x_led, mc_cdev);
+	unsigned int i;
+	int ret;
+
+	led_mc_calc_color_components(mc_cdev, value);
+
+	guard(mutex)(&led->chip->mutex);
+
+	for (i = 0; i < mc_cdev->num_colors; i++) {
+		led->led_num = mc_cdev->subled_info[i].channel;
+		ret = pca963x_brightness(led, mc_cdev->subled_info[i].brightness);
+		if (ret < 0)
+			return ret;
+	}
+
+	return pca963x_power_state(led);
+}
+
 static unsigned int pca963x_period_scale(struct pca963x_led *led,
 					 unsigned int val)
 {
@@ -300,6 +326,84 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+static int pca963x_register_single_led(struct device *dev,
+					struct pca963x_led *led, u32 reg,
+					struct fwnode_handle *fwnode,
+					bool hw_blink)
+{
+	struct led_init_data init_data = {};
+	char default_label[32];
+	struct i2c_client *client = led->chip->client;
+
+	led->led_num = reg;
+	led->is_mc = false;
+	led->led_cdev.brightness_set_blocking = pca963x_led_set;
+	if (hw_blink)
+		led->led_cdev.blink_set = pca963x_blink_set;
+
+	init_data.fwnode = fwnode;
+	init_data.devicename = "pca963x";
+	snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
+		 client->adapter->nr, client->addr, reg);
+	init_data.default_label = default_label;
+
+	return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
+}
+
+static int pca963x_register_mc_led(struct device *dev,
+				   struct pca963x_led *led, u32 reg,
+				   struct fwnode_handle *fwnode,
+				   const struct pca963x_chipdef *chipdef)
+{
+	struct mc_subled *subleds = led->subleds;
+	unsigned int num_colors = 0;
+	struct led_init_data init_data = {};
+	char default_label[32];
+	struct i2c_client *client = led->chip->client;
+	int ret;
+
+	fwnode_for_each_child_node_scoped(fwnode, sub) {
+		u32 color, subreg;
+
+		if (num_colors >= ARRAY_SIZE(led->subleds)) {
+			dev_err(dev, "Too many sub-LEDs for node %pfw\n", fwnode);
+			return -EINVAL;
+		}
+
+		ret = fwnode_property_read_u32(sub, "reg", &subreg);
+		if (ret || subreg >= chipdef->n_leds) {
+			dev_err(dev, "Invalid 'reg' for sub-LED %pfw\n", sub);
+			return -EINVAL;
+		}
+
+		ret = fwnode_property_read_u32(sub, "color", &color);
+		if (ret) {
+			dev_err(dev, "Missing 'color' for sub-LED %pfw\n", sub);
+			return ret;
+		}
+
+		subleds[num_colors].channel = subreg;
+		subleds[num_colors].color_index = color;
+		subleds[num_colors].intensity = LED_FULL;
+		num_colors++;
+	}
+
+	led->led_num = reg;
+	led->is_mc = true;
+	led->mc_cdev.subled_info = subleds;
+	led->mc_cdev.num_colors = num_colors;
+	led->mc_cdev.led_cdev.max_brightness = LED_FULL;
+	led->mc_cdev.led_cdev.brightness_set_blocking = pca963x_led_mc_set;
+
+	init_data.fwnode = fwnode;
+	init_data.devicename = "pca963x";
+	snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
+		 client->adapter->nr, client->addr, reg);
+	init_data.default_label = default_label;
+
+	return devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
+}
+
 static int pca963x_register_leds(struct i2c_client *client,
 				 struct pca963x *chip)
 {
@@ -338,9 +442,6 @@ static int pca963x_register_leds(struct i2c_client *client,
 		return ret;
 
 	device_for_each_child_node_scoped(dev, child) {
-		struct led_init_data init_data = {};
-		char default_label[32];
-
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret || reg >= chipdef->n_leds) {
 			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
@@ -348,22 +449,13 @@ static int pca963x_register_leds(struct i2c_client *client,
 			return -EINVAL;
 		}
 
-		led->led_num = reg;
 		led->chip = chip;
-		led->led_cdev.brightness_set_blocking = pca963x_led_set;
-		if (hw_blink)
-			led->led_cdev.blink_set = pca963x_blink_set;
 		led->blinking = false;
 
-		init_data.fwnode = child;
-		/* for backwards compatibility */
-		init_data.devicename = "pca963x";
-		snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
-			 client->adapter->nr, client->addr, reg);
-		init_data.default_label = default_label;
-
-		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
-						     &init_data);
+		if (fwnode_get_child_node_count(child) > 0)
+			ret = pca963x_register_mc_led(dev, led, reg, child, chipdef);
+		else
+			ret = pca963x_register_single_led(dev, led, reg, child, hw_blink);
 		if (ret) {
 			dev_err(dev, "Failed to register LED for node %pfw\n",
 				child);

-- 
2.34.1


