Return-Path: <linux-leds+bounces-8493-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3l3OOEGJImpaZwEAu9opvQ
	(envelope-from <linux-leds+bounces-8493-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 10:30:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463FE646678
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 10:30:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="oo/3CBd5";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="HK2Vt/AN";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8493-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8493-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E2A73018745
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 08:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D509D3C344F;
	Fri,  5 Jun 2026 08:19:19 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E1D3358AF
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 08:19:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647559; cv=none; b=cyv3pm0ZfnDlgzosSpMXbew/Wu4ptOPVbpkvpr8baswR4nNSi8vFZ0Y/7j9mJydrhnMytu2CV297RmNgndkBV+nuqxTV3RVJ5YDFJhSy12d0exZfsuQ2D2A/T7jJQ/w6SoUJDBG5BLgFKgyet0YpX4AQ7xDYNs60l86BerkjBy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647559; c=relaxed/simple;
	bh=pLBgdPnPL6CCcTZBAU1Nc0ZyiQ5sp8g36luZ6dHW9vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FVk4EcB7/c21iBFiH7pun9CB2ZN/Tp1WrjsQAtP9VfATkFQGifSkC1N3stf/A+BJ8xCYdQD9QULaoBJUZ3SVcts4ugIyql7+WHASNXNqlB2m6veqhhmohbL5etrZM+OAUBjxZsI1bgXiaEISKOnWX38lAtoqpFyMNJopNcL2jBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oo/3CBd5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HK2Vt/AN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65525p6m821588
	for <linux-leds@vger.kernel.org>; Fri, 5 Jun 2026 08:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rmlgNOg+uqMW5pF9FH3Wuf
	JOYU/bHWvIswBDiuAIugY=; b=oo/3CBd5z4Ps5iTalsZjKdUSj47McfMrHYf9JS
	Z/X+bKBkx5ad5RHrh0u54bwDiLrz83HTQjXnld3/JquFZAT5Cxx4hz9J63cRzF4j
	Mn8OFD9bzfDW+pV7+pIdvI83LpvG2wcba3oJ68PnokGsi/LVBcZQp/NDuRvoJaUr
	k1CJ5n4YtKzjF+KfTK7xdEmXImLcsI2II7NyfxaYeb2wom1FNzFZuU3nWepsxOpG
	BsaE8QzXDbc9EBzgima3tGJK6XfMCLa+THjByj3aiiikFwFWyCROsdP8Axsu1CkX
	PRiID6SXzFQCC8hVJg+o/toNs/gr7hIf4jPeHq4SmXvdnj7w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekncbh847-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 08:19:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304f23c55b2so1463712eec.0
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 01:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780647556; x=1781252356; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rmlgNOg+uqMW5pF9FH3WufJOYU/bHWvIswBDiuAIugY=;
        b=HK2Vt/ANHANkPWeYxWtTsKR4uPgzdnt6y89KrrqEyAod/JWQnjQoJRasyEpfWFS9kw
         jLXweg4MS+qP4tkJ06w7Kk1smvgA0FiUPq9xI0kdXG9ZQADTRx2bdIZz6iV7Gaym7IDl
         bbYjETwATinewsmUSvgoRGP1Bx26qzrfzXHONp8JYPq+4EfHbms4mw7maH3lIkx7vQP9
         0YkRSH71LFdvRTViyOz1Qr34kpxQxGSSUmfZwt0yCwzPXNh97E+pTArLqClLtOwjn4vQ
         sKZPDLre+uKVGo1ly/rKiWBTfffjckkRzkZAQMgupYMTdsJAUvUrnGxIKctto7j3H7Au
         UmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647556; x=1781252356;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmlgNOg+uqMW5pF9FH3WufJOYU/bHWvIswBDiuAIugY=;
        b=BQe5/6SkN9lseI69qMLpuy+Oo43GsrZB27ZM+IZM6jTO0+TVZOyar2UiF71gVx5WCU
         OerwKD2ZC2mhE+NsqFsVN2wJqCGIOA4aoMvycHZyKcca3Ht3o5UZqm186XdsUm0kvG49
         uE6dahRQDyX+MQ5rOy1CJpdy3PbX2/sz4w9XlkgHtB3QsHMOEoAqiRE6GCoPbQvNEW10
         DhzPczs7Xc/QwtO2D0XPfRZ4eAFeIHIzoTDK4LRn9RWsfZfAB59BqHyjDR9zEwpAgV67
         3hEy6H3QUCLft79ryxlNey5PHA8ojQR+AM/tVQOGp/RrGsWaVwb706iLIGTDd9ilI9tx
         Ou+A==
X-Forwarded-Encrypted: i=1; AFNElJ9li/KBKABmHfVxa2n6wpBnyL2n6qBzgQJKQpzL3H60Y8ALW3tI16Z4ypdSDunAOSXjrAWs1WDM3OXD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz8S/v1cKdVJam3bSFWBPlIE91l8eCDmvxd1c4mcCGkhqVIWeY
	Yelf06icaNp3QFJO15zeXyPJ+1WNscrJo4JRE4jNU0SQMQofb79bfGyqBNziOb4bQ/f/TVi/msN
	CPOMtRd6mcp1S0zZjTrbm7KFfdl1UnS/gHWjspk/YAJrO+8P9UqAV0Zgmf3Zogn6w
X-Gm-Gg: Acq92OHkm68wAFPs8lYETToilzz/qSNMdXe641arb72jUqQ2WgleyAD8aPJOwr0ScuF
	3yz+Ve30ANSx+TilW0L6108bBwI5iY51Su9zUmERT2ZiK1pwWdH98osbDdXlvSrBsojq5HfWW5C
	Awu+a3nPBgwrPV5r0DUYIiBWGQ/2xWEzWI1KNmm5bNEwNoS9t2UWAXzQmloMmCMMQWdk2dEc0Ag
	wJimge03up/NVWKbt/hO0f9rgYT787T1GoFP+imXsF1tp8BHHH6EiOdA61n1lXJTDdTK0jEKkTr
	DMfoulr9HWMnYfeau91K3WULym5fw/31WjcP9ZQbBZpehFTMNpreLr5zrycblt8skTe7t2TqFDF
	lVrXrKcE1mVlMPLvUuRWe45B85TLY18zviO3rXNVBna8FKYRqbXodLVLCsygNiA8/QOmjUCsEFh
	eFDEfkn064
X-Received: by 2002:a05:7301:5f11:b0:2e0:1f09:d924 with SMTP id 5a478bee46e88-3077b33045emr1104978eec.5.1780647555747;
        Fri, 05 Jun 2026 01:19:15 -0700 (PDT)
X-Received: by 2002:a05:7301:5f11:b0:2e0:1f09:d924 with SMTP id 5a478bee46e88-3077b33045emr1104947eec.5.1780647555062;
        Fri, 05 Jun 2026 01:19:15 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm6442528eec.30.2026.06.05.01.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 01:19:14 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 01:18:24 -0700
Subject: [PATCH] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE+GImoC/yXMQQqDMBCF4avIrDuQRg1tr1JcJHGMU0IiEy0F8
 e6m7fJ78P4dCglTgUezg9CbC+dUcb004GebAiGP1aCVNsqoHuMSUIJDn2MWdDba5Akn/uBNd60
 x3d26qYX6X4Tq/Gs/h7/L5l7k128QjuME2s1HCX0AAAA=
X-Change-ID: 20260605-lpg-rgb-color-balance-fix-82436649abf3
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780647554; l=10106;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=pLBgdPnPL6CCcTZBAU1Nc0ZyiQ5sp8g36luZ6dHW9vs=;
 b=6Z0oVyd1xr8VCs3uZ1XqVFhvWm9oO8Sprf488QlI/8qIGPw8uMV5vtsjv702W9WvF37QM7z2X
 g5kLJluamlNDd4QFCuWe/IV5HFHmzRS5JC9KM3Kw3CFK9nLNrJf3Aky
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=OauoyBTY c=1 sm=1 tr=0 ts=6a228684 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=q7j7SU0M432TpuN6ahQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA3OSBTYWx0ZWRfX7PutWxYMKzFO
 lcuQIScEwosXn7ZcIwAv5IU8TA7S68yPdeI9PwzqMxNCtt3nRROBwSdao8F4RWiZ8P3hKn8I7JE
 8pQznbSLgbLmjrJAMthckVmgXaja6vvUoqEXsay28wuxHWO/9bbCRrnsOcTkrJZpSYWHyU42NIG
 o/wnkMMqml6ToktcULVVwhi3av+kNyZKdQWd4PGsYUmU58xBnFzOHD41GpHnE3yKhw2zOhUZWnc
 g8MrIewppPqlGaIx8Vm1TFNPQEcHDpcPamo9shhh+ygFI7OFwaBghBaRkL/wmRMSQtCuoZnPRC9
 V7Onza3WRhee+xl9yNCfLYYFuGZQ4rTkrHAlDP4z6L2ZOYoH1D5F/aY0nfC//4Zg356lHoOafHl
 Lu5zw3sEiIq8aj/BPpKM80lGWqcs+1BoO58fi6wBXhfeZFwF5VnL5I+RiSbBsY3JhslcRa5J3WQ
 68EQIDISOAd8cMDDnXA==
X-Proofpoint-GUID: KbqrFwGKoie_FZ2XMfP-XXewNfOVR8p5
X-Proofpoint-ORIG-GUID: KbqrFwGKoie_FZ2XMfP-XXewNfOVR8p5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8493-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pattern.data:url,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 463FE646678

Currently, when the LED is configured as a RGB LED or a multi-color
LED device, the same pattern is programmed for all LED channels
regardless of the sub-led intensities when triggered by HW pattern.
It results that the LED device is always working in a white-balanced
mode regardless of the intensity settings.

To fix this, scale the pattern data according to the sub-led intensity
and program the HW pattern separately for each LPG channel.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 174 +++++++++++++++++++++++++++++++--------
 1 file changed, 141 insertions(+), 33 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index d7d6518de30f..ca84da563e09 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -148,6 +148,24 @@ struct lpg_channel {
 	unsigned int pattern_hi_idx;
 };
 
+/**
+ * struct lpg_pattern - The LPG pattern normalized from the LED pattern
+ * @data:       The pattern data array (caller must kfree)
+ * @len:	number of entries to write to the LUT
+ * @delta_t:    common step duration in ms
+ * @lo_pause:   low-pause duration in ms
+ * @hi_pause:   high-pause duration in ms
+ * @ping_pong:  true if the pattern support reverse
+ */
+struct lpg_pattern {
+	struct led_pattern *data;
+	unsigned int len;
+	unsigned int delta_t;
+	unsigned int lo_pause;
+	unsigned int hi_pause;
+	bool ping_pong;
+};
+
 /**
  * struct lpg_led - logical LED object
  * @lpg:		lpg context reference
@@ -959,23 +977,23 @@ static int lpg_blink_mc_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
-			   u32 len, int repeat)
+/**
+ * lpg_prepare_pattern() - validate and normalize a leds-trigger-pattern payload
+ *
+ * Collapses the paired-entry format required by the trigger into a compact
+ * array, detects palindrome ping-pong, and extracts timing parameters.
+ * On success the caller owns prep->data and must kfree() it.
+ */
+static int lpg_prepare_pattern(struct lpg *lpg, struct led_pattern *led_pattern,
+				u32 len, int repeat, struct lpg_pattern *prep)
 {
-	struct lpg_channel *chan;
-	struct lpg *lpg = led->lpg;
 	struct led_pattern *pattern;
 	unsigned int brightness_a;
 	unsigned int brightness_b;
-	unsigned int hi_pause = 0;
-	unsigned int lo_pause = 0;
 	unsigned int actual_len;
 	unsigned int delta_t;
-	unsigned int lo_idx;
-	unsigned int hi_idx;
 	unsigned int i;
 	bool ping_pong = true;
-	int ret = -EINVAL;
 
 	/* Hardware only support oneshot or indefinite loops */
 	if (repeat != -1 && repeat != 1)
@@ -1001,9 +1019,9 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 
 	for (i = 0; i < len; i += 2) {
 		if (led_pattern[i].brightness != led_pattern[i + 1].brightness)
-			goto out_free_pattern;
+			goto out_free;
 		if (led_pattern[i + 1].delta_t != 0)
-			goto out_free_pattern;
+			goto out_free;
 
 		pattern[i / 2].brightness = led_pattern[i].brightness;
 		pattern[i / 2].delta_t = led_pattern[i].delta_t;
@@ -1016,7 +1034,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * through the entire LUT, so prohibit this.
 	 */
 	if (len < 2)
-		goto out_free_pattern;
+		goto out_free;
 
 	/*
 	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
@@ -1073,13 +1091,13 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 			 * specify hi pause. Reject other variations.
 			 */
 			if (i != actual_len - 1)
-				goto out_free_pattern;
+				goto out_free;
 		}
 	}
 
 	/* LPG_RAMP_DURATION_REG is a 9bit */
 	if (delta_t >= BIT(9))
-		goto out_free_pattern;
+		goto out_free;
 
 	/*
 	 * Find "low pause" and "high pause" in the pattern in the LUT case.
@@ -1087,20 +1105,48 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * duration of all steps.
 	 */
 	if (lpg->lut_base || lpg->lut_sdam) {
-		lo_pause = pattern[0].delta_t;
-		hi_pause = pattern[actual_len - 1].delta_t;
+		prep->lo_pause = pattern[0].delta_t;
+		prep->hi_pause = pattern[actual_len - 1].delta_t;
 	} else {
 		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
-			goto out_free_pattern;
+			goto out_free;
+		prep->lo_pause = 0;
+		prep->hi_pause = 0;
 	}
 
+	prep->data = pattern;
+	prep->len = actual_len;
+	prep->delta_t = delta_t;
+	prep->ping_pong = ping_pong;
+
+	return 0;
+
+out_free:
+	kfree(pattern);
+	return -EINVAL;
+}
+
+static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
+			   u32 len, int repeat)
+{
+	struct lpg_channel *chan;
+	struct lpg *lpg = led->lpg;
+	struct lpg_pattern pattern;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int i;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
 
 	mutex_lock(&lpg->lock);
 
 	if (lpg->lut_base)
-		ret = lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 	else
-		ret = lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store_sdam(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 
 	if (ret < 0)
 		goto out_unlock;
@@ -1108,12 +1154,12 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
 
-		chan->ramp_tick_ms = delta_t;
-		chan->ramp_ping_pong = ping_pong;
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
 		chan->ramp_oneshot = repeat != -1;
 
-		chan->ramp_lo_pause_ms = lo_pause;
-		chan->ramp_hi_pause_ms = hi_pause;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
@@ -1121,8 +1167,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 
 out_unlock:
 	mutex_unlock(&lpg->lock);
-out_free_pattern:
-	kfree(pattern);
+	kfree(pattern.data);
 
 	return ret;
 }
@@ -1144,23 +1189,88 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
 }
 
 static int lpg_pattern_mc_set(struct led_classdev *cdev,
-			      struct led_pattern *pattern, u32 len,
+			      struct led_pattern *led_pattern, u32 len,
 			      int repeat)
 {
 	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
 	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
+	struct lpg *lpg = led->lpg;
+	struct lpg_channel *chan;
+	struct lpg_pattern pattern;
+	struct led_pattern *scaled;
 	unsigned int triled_mask = 0;
-	int ret, i;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int scale;
+	unsigned int i, j;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
+
+	/* Allocate buffer for the per-channel scaled pattern copy */
+	scaled = kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
+	if (!scaled) {
+		ret = -ENOMEM;
+		goto out_free_prep;
+	}
 
 	for (i = 0; i < led->num_channels; i++)
 		triled_mask |= led->channels[i]->triled_mask;
-	triled_set(led->lpg, triled_mask, 0);
+	triled_set(lpg, triled_mask, 0);
+
+	led_mc_calc_color_components(mc, LED_FULL);
+
+	/*
+	 * Each channel gets its own LUT block scaled by subled_info[i].brightness
+	 * so the pattern respects the configured colour balance.
+	 */
+	mutex_lock(&lpg->lock);
+	for (i = 0; i < led->num_channels; i++) {
+		chan = led->channels[i];
+		scale = mc->subled_info[i].brightness;
+
+		for (j = 0; j < pattern.len; j++) {
+			scaled[j].brightness = DIV_ROUND_CLOSEST(
+				(u32)pattern.data[j].brightness * scale, LED_FULL);
+			scaled[j].delta_t = pattern.data[j].delta_t;
+		}
+
+		if (lpg->lut_base)
+			ret = lpg_lut_store(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+		else
+			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+
+		if (ret < 0) {
+			/* Free LUT slots already allocated for previous channels */
+			while (i-- > 0) {
+				chan = led->channels[i];
+				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+				chan->pattern_lo_idx = 0;
+				chan->pattern_hi_idx = 0;
+			}
+			goto out_unlock;
+		}
+
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
+		chan->ramp_oneshot = repeat != -1;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
+		chan->pattern_lo_idx = lo_idx;
+		chan->pattern_hi_idx = hi_idx;
+	}
+
+out_unlock:
+	mutex_unlock(&lpg->lock);
+	kfree(scaled);
+out_free_prep:
+	kfree(pattern.data);
 
-	ret = lpg_pattern_set(led, pattern, len, repeat);
 	if (ret < 0)
 		return ret;
 
-	led_mc_calc_color_components(mc, LED_FULL);
 	lpg_brightness_set(led, cdev, mc->subled_info);
 
 	return 0;
@@ -1174,11 +1284,9 @@ static int lpg_pattern_clear(struct lpg_led *led)
 
 	mutex_lock(&lpg->lock);
 
-	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
-
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
+		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
 		lpg_sdam_configure_triggers(chan, 0);
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
 		chan->pattern_lo_idx = 0;

---
base-commit: 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5
change-id: 20260605-lpg-rgb-color-balance-fix-82436649abf3

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


