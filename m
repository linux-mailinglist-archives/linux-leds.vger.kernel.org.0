Return-Path: <linux-leds+bounces-9095-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RUOzIKiQV2q0XAAAu9opvQ
	(envelope-from <linux-leds+bounces-9095-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 15:52:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3D75F026
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 15:52:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mg92+ZZP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bWRwRmjp;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9095-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9095-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33A2A3051945
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 13:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B0831A07B;
	Wed, 15 Jul 2026 13:44:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A034B30E0F2
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123079; cv=none; b=CUSh4gfzvH9QqFfkD57x7qjAsRkdIgjB1PN46h0d0AXLpxhVnLYe+uwlLoayMI2LYrljUtXKaagDJdMO9xY40BRuN+deqGW/f68b4OA2aQmkCT+MsMpCcCfiHEoImPAyuovj/g75+JL/QagiSM8JIvs7cyZ6n/Nz8y8H6K9+Lns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123079; c=relaxed/simple;
	bh=wyWjpprd5g3d9n7k2TFvz9Qt8l08nSyECnW1RiH61sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tYm+9vXpB1O9OwHWBRuEULk9TxAUKayVO9y+u1ZcE88NEfKeg1MbsRf5SP4NcBSJmugrbJs01JVSRY1fUGTnJT9BJ4bODTmzqbB86uzIbMeaxtuK0Iwqe8zOe/qpVOpJ/U8iZ6z7s6F3tWdLHUnmJh+mDh3u0hOrSVyhm0LcwV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mg92+ZZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWRwRmjp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBconS3479772
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DS0vaonFkcPNV4lGWbOm/M4DDebiFABteqSav+Mh9/U=; b=mg92+ZZPHlTk58so
	26FAq2z0+8WVU9ukBpydNg7NvB0ICQImfHJeWrpNQvGrW3/oYXja0CDP4IauuVFO
	bUcagidxD0ctd3nKB0fcYveyXgt8sJagSuGYIwU1t3Cd2IF1k+t8iHnAai3XlBfe
	tyhEOfwMR7fCW7jLm7YLA2xkbyIr0+/Anb2Z08cxhJiwLljWaZmh5aH/WdR+8+54
	omI4WRoOC5paZgoLInNKq8Wz6ggMPN8GrUd/CCODDhoJOrXxow40j67KTPRkpZK9
	Uz4d++P6fOb0gwDd2UcVmRPLf18KH4ODIv0HeWDpxwc22NEerG++2eLF5UuIZhwg
	B5Y5lw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g3vwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so35403201cf.0
        for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123076; x=1784727876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS0vaonFkcPNV4lGWbOm/M4DDebiFABteqSav+Mh9/U=;
        b=bWRwRmjp/n0tdWAEzLfI94A9qk+2xIwlGnhgKEZ/PmdexCskryJQBoutiG7ErzvFhX
         htI99iJKokPoC08cik83L3p5v1ea2jXduxlhRNDhjAiBEon6pSTb14pBw5ax8fo0w/8H
         JM3TWXNncBlfdV3I5GVF+K4GS6haVlkAxnsxH8qpDnqO2hi1oiVow5Oy/pva/76KxiTi
         d1fWnLc3AUCZTkubdCnokOeUga2nKJ3bMhR+uEvg6ZmE/bFlRjGDqozrVJWZBLwYXoxL
         yJ7QYDP2in0RKlMArhioONWMh5EHPTynT/apgmRJ8nVcfaRQFcW0YEUs69eOSOqlSXrv
         qxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123076; x=1784727876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DS0vaonFkcPNV4lGWbOm/M4DDebiFABteqSav+Mh9/U=;
        b=JYWyFbKvCS8+gUKhpi3f08cRfOcVmzINL5vZAr7MCSqyNrLvfASJBkJaZrQYlsxMhq
         ejMHXpsqnqDKwjaZUhI3yzoznWCfnl2ZZiX9S/8tVEor2LV6hrkcBgvNe/Z5JFR/QJmW
         3R2GWi+JoP0PX7rDykjYIZZnxcKiXv43YugRt/cBlngBnceoDoxwNJlhXUlH1psnSEHP
         quoKpCvZSkyylrH9dkwYeFxLJZyIBPTiG1PL7hEgJClpJD8hcWSb2+PNrWvTVDlIfZHu
         648YFGTyph9gNWG7cqEdwMJLs+/rVMKLLmiHdMtVT3cdrivV8Ob0G7bdsClD64g7FD1r
         WliQ==
X-Gm-Message-State: AOJu0Yx5yV5riLyxVlYCagrTighgjTxoVUtn1+mVqcE+RPDJFAVbQaQP
	KDC9QKs4G4N81dPpauykjhOnQSWPmsH3baxS8W1xi3/5UNVX30aUkMxhbEuutqPoTApcifK7LbE
	a7HopQOkCrlZ5fiAFqZf4mkwFVqB+/4mWg9A7ywn9+8hATb2nfHhmz6OAv0dUUTfEq1OMgwhX7f
	Y=
X-Gm-Gg: AfdE7cm2b18MT3bHl4dXxd3jLkQI4PFwsdrLmRzQzv3UmK/YL6/zHQ3WsQdYvKc/p+G
	O5yRQkaeX5WNUOqT+ngYXpFjHJb5pnmHJbh35mBuurQjNZzugEXGKayNFJKVzjXLDpbceEj4B8f
	5LZfN8wS0YlwEWqeP6OgNxVEdn+Z+r14XjSYSGQFfC3VygzgkuKgpZvnicOTHF9Zp/pQetNT+EO
	RTCopUOBTZDjDkeRDFpIK8+Y/4TQDeW+x920mRbjyoUlu2g6TY6gV7Q452E/0M4aE/KmbFLhfhu
	2Vc/ZU7no9TJWyZ8kpXmwXNxnwbyZ1zGslsgsRC+gCirlYTHlCyHEfiYiNmcdYeeOBWQA16wAth
	Aj6k2pImHjAE7ldQ46CWoeWehzxXJOaCkR/2+Bv0YeD/t+OBZNwvvSiUQFEupAuI7cKedfJMCpG
	1U7RULUWn0JbQFWvLLMpNdL86Hd9lBcIrrPfChtNewHcbsq9y4Y20T9RGUpANTew==
X-Received: by 2002:a05:622a:1f8f:b0:51c:7b12:5ff4 with SMTP id d75a77b69052e-51cbf3e4430mr158062611cf.80.1784123075662;
        Wed, 15 Jul 2026 06:44:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:51c:7b12:5ff4 with SMTP id d75a77b69052e-51cbf3e4430mr158062211cf.80.1784123075038;
        Wed, 15 Jul 2026 06:44:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:44:29 +0200
Subject: [PATCH v6 3/4] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-monza-leds-v6-3-d1724bb7fe3d@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfXzI4LRfju0T6E
 TuHqif7pVeZoD81soVMwYVeTSfb6PRkRVxn45PX+sgLR/rUk1B212E37p0IpMliJxg3JikOt2Pn
 FDjc+nCR0e1JyPoCIXDjW4Hfhk+4gW4=
X-Proofpoint-ORIG-GUID: DkSCyoQHo-jBYWz98ggxzwJx2hyKnPqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX4X41IvdC+rwx
 yRgL+cXoF+gLdhPPd81cHQq38N0lZQSBPu7FyGf9PJD0tabl1dgUs7agdx091dJ7u0HTCyinMjd
 dw/0CaliGd/b9KITxGfEF9a0ZPeruVyk+Qgf2vEyCzNUgWtuYYehtpXq1VkarkbvN+u0CgYl9Xx
 1XdJhw5v7PMP3LZKBxcFD8DSKq5HnHUkCnWmlF/pFGwYf5gGcSs6c3B/etFrHkIYIp1FjqV35LD
 llsPwHpBLGOzOhTtrh62f0NIu80yIysHhLYxTvxJouw38p3nWHEuOeE1zLTQw3SwfC83T4tAnFP
 L36QqqHxprqN9WOhC+FKi9ZyOcN9rsSYonplY+N9/BQmS2YICG7ieFYQVgwrOGJQMAtZVX1o8K7
 sucWSvvRBCZcEwha08ILTYFf3naON3dhlQBK7OquJ6GHzspTnljTAWSdy6tC7FNZbsjvhR+SA1X
 dF28kqoMkjQSVqrTAZw==
X-Proofpoint-GUID: DkSCyoQHo-jBYWz98ggxzwJx2hyKnPqA
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a578ec4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_r7M38PZvEBKBeOnwNgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9095-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[205.220.180.131:received,2a01:e0a:830:450:751c:d61c:c91:60dd:received,209.85.160.198:received,100.90.174.1:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0D3D75F026
X-Rspamd-Action: no action

Allow grouping of individual PCA963x PWM channels into a single
multicolor LED device by adding support for the LED multicolor class.

A child node with sub-children is treated as a multicolor group,
others are treated as single leds, keeping full backwards compatibility.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/leds/Kconfig        |   1 +
 drivers/leds/leds-pca963x.c | 162 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 128 insertions(+), 35 deletions(-)

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
index e3a81c60ee27c96e5050a829523dfd43e1f0663f..f3e4d65e48b4c3eefa147a7fb5c9fe81ce569731 100644
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
@@ -199,20 +203,24 @@ static void pca963x_blink(struct pca963x_led *led)
 	led->blinking = true;
 }
 
-static int pca963x_power_state(struct pca963x_led *led)
+static void pca963x_track_power_state(struct pca963x_led *led, unsigned int led_num,
+				      enum led_brightness brightness)
 {
-	struct i2c_client *client = led->chip->client;
 	unsigned long *leds_on = &led->chip->leds_on;
-	unsigned long cached_leds = *leds_on;
 
-	if (led->led_cdev.brightness)
-		set_bit(led->led_num, leds_on);
+	if (brightness)
+		set_bit(led_num, leds_on);
 	else
-		clear_bit(led->led_num, leds_on);
+		clear_bit(led_num, leds_on);
+}
 
-	if (!(*leds_on) != !cached_leds)
+static int pca963x_sync_power_state(struct pca963x_led *led, unsigned long cached_leds)
+{
+	struct i2c_client *client = led->chip->client;
+
+	if (!led->chip->leds_on != !cached_leds)
 		return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
-						 *leds_on ? 0 : BIT(4));
+						 led->chip->leds_on ? 0 : BIT(4));
 
 	return 0;
 }
@@ -221,22 +229,54 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness value)
 {
 	struct pca963x_led *led;
+	unsigned long cached_leds;
 	int ret;
 
 	led = container_of(led_cdev, struct pca963x_led, led_cdev);
 
 	mutex_lock(&led->chip->mutex);
 
+	cached_leds = led->chip->leds_on;
 	ret = pca963x_brightness(led, value);
 	if (ret < 0)
 		goto unlock;
-	ret = pca963x_power_state(led);
+
+	pca963x_track_power_state(led, led->led_num, value);
+	ret = pca963x_sync_power_state(led, cached_leds);
 
 unlock:
 	mutex_unlock(&led->chip->mutex);
 	return ret;
 }
 
+static int pca963x_led_mc_set(struct led_classdev *led_cdev,
+			      enum led_brightness value)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	struct pca963x_led *led = container_of(mc_cdev, struct pca963x_led, mc_cdev);
+	unsigned long cached_leds;
+	int ret = 0, sync_ret;
+
+	led_mc_calc_color_components(mc_cdev, value);
+
+	guard(mutex)(&led->chip->mutex);
+
+	cached_leds = led->chip->leds_on;
+	for (unsigned int i = 0; i < mc_cdev->num_colors; i++) {
+		led->led_num = mc_cdev->subled_info[i].channel;
+		ret = pca963x_brightness(led, mc_cdev->subled_info[i].brightness);
+		if (ret)
+			break;
+
+		pca963x_track_power_state(led, mc_cdev->subled_info[i].channel,
+					  mc_cdev->subled_info[i].brightness);
+	}
+
+	sync_ret = pca963x_sync_power_state(led, cached_leds);
+
+	return ret ? : sync_ret;
+}
+
 static unsigned int pca963x_period_scale(struct pca963x_led *led,
 					 unsigned int val)
 {
@@ -300,6 +340,77 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+static int pca963x_parse_mc_subleds(struct device *dev, struct pca963x_led *led,
+				    struct fwnode_handle *fwnode,
+				    const struct pca963x_chipdef *chipdef)
+{
+	unsigned int num_colors = 0;
+	int ret;
+
+	fwnode_for_each_child_node_scoped(fwnode, sub) {
+		u32 color, subreg;
+
+		if (num_colors >= ARRAY_SIZE(led->subleds))
+			return dev_err_probe(dev, -EINVAL, "Too many LEDs for node %pfw\n", fwnode);
+
+		ret = fwnode_property_read_u32(sub, "reg", &subreg);
+		if (ret || subreg >= chipdef->n_leds)
+			return dev_err_probe(dev, -EINVAL, "Invalid 'reg' for sub-LED %pfw\n", sub);
+
+		ret = fwnode_property_read_u32(sub, "color", &color);
+		if (ret)
+			return dev_err_probe(dev, ret, "Missing 'color' for sub-LED %pfw\n", sub);
+
+		led->subleds[num_colors].channel = subreg;
+		led->subleds[num_colors].color_index = color;
+		led->subleds[num_colors].intensity = LED_FULL;
+		num_colors++;
+	}
+
+	led->mc_cdev.subled_info = led->subleds;
+	led->mc_cdev.num_colors = num_colors;
+	led->mc_cdev.led_cdev.max_brightness = LED_FULL;
+	led->mc_cdev.led_cdev.brightness_set_blocking = pca963x_led_mc_set;
+
+	return 0;
+}
+
+static int pca963x_register_led(struct device *dev, struct pca963x_led *led,
+				u32 reg, struct fwnode_handle *fwnode,
+				const struct pca963x_chipdef *chipdef,
+				bool hw_blink)
+{
+	struct i2c_client *client = led->chip->client;
+	struct led_init_data init_data = {};
+	char label[32];
+	int ret;
+
+	led->led_num = reg;
+	led->is_mc = fwnode_get_child_node_count(fwnode) > 0;
+
+	if (led->is_mc) {
+		ret = pca963x_parse_mc_subleds(dev, led, fwnode, chipdef);
+		if (ret)
+			return ret;
+	} else {
+		led->led_cdev.brightness_set_blocking = pca963x_led_set;
+		if (hw_blink)
+			led->led_cdev.blink_set = pca963x_blink_set;
+	}
+
+	init_data.fwnode = fwnode;
+	/* for backwards compatibility */
+	init_data.devicename = "pca963x";
+	snprintf(label, sizeof(label), "%d:%.2x:%u", client->adapter->nr, client->addr, reg);
+	init_data.default_label = label;
+
+	if (led->is_mc)
+		return devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
+								 &init_data);
+
+	return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
+}
+
 static int pca963x_register_leds(struct i2c_client *client,
 				 struct pca963x *chip)
 {
@@ -338,37 +449,18 @@ static int pca963x_register_leds(struct i2c_client *client,
 		return ret;
 
 	device_for_each_child_node_scoped(dev, child) {
-		struct led_init_data init_data = {};
-		char default_label[32];
-
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg >= chipdef->n_leds) {
-			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
-				child);
-			return -EINVAL;
-		}
+		if (ret || reg >= chipdef->n_leds)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid 'reg' property for node %pfw\n", child);
 
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
-		if (ret) {
-			dev_err(dev, "Failed to register LED for node %pfw\n",
-				child);
-			return ret;
-		}
+		ret = pca963x_register_led(dev, led, reg, child, chipdef, hw_blink);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to register LED for node %pfw\n",
+					     child);
 
 		++led;
 	}

-- 
2.34.1


