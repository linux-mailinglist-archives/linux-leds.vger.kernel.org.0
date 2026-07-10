Return-Path: <linux-leds+bounces-9004-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NTR4Cmr5UGox9QIAu9opvQ
	(envelope-from <linux-leds+bounces-9004-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 15:53:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD6973B759
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 15:53:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kfC5hG5h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LuvLk9YR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9004-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9004-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AE48307D73F
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 13:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F9E24EA90;
	Fri, 10 Jul 2026 13:49:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C38523E342
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691388; cv=none; b=NTM1grPxOL8Bnzpf1BdjhPSY3lmwY3GgijWZUoGoO6bpOeE177qmqh/aRJJc2/RFoPHYtzp7mi5RjpK2UHyQ3ObKrb5u4kwJaXlrkIbHWfr3y2sRLyi5nTgacY8qLIHBxOGbqpOZagwVYg83TPRMjUehp08zw6hPTsskPsegAug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691388; c=relaxed/simple;
	bh=9eJJJ3/IG0SKZRgIbUDxACLmRKgHJO9u4VmJm+Df6uM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kXPcw2MplrNZN8wg1CQI98hrmsN3BvHTwppuFlFnN5DSAXLofatlKkMFpQmAesFZufIopkTDKBHjU6uuXT28pQw9uSJz5suEbye7yShs+pKoBNJK+VVE+YFodvmRvatbVV9CIS/XUuPrilt/i+T7QUPHhCZOI64AASw1OLWs5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfC5hG5h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuvLk9YR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD67P8920255
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8HBXLpoj220Wse3k0fYLcR
	C+Pkmai2cbvL7zm7NY/jY=; b=kfC5hG5hs5T/78KffCWxUYUUo1T8nNTsQF2O/w
	hIGEUHMSZWzEL0LwvJHz/wmQw8k3KqwVNCH0ugWj98n80TSMJaVpZA7gT2Kg+hQf
	EU5v2lTPmFBa7eJrCbfGGvh2AHuodNtPRRppgDWnPnmfuZc9Vfh+YBmH9yIYeqlI
	o2lo2EpCQ7xfU9Lac5C7LDQt3DyYt/cix23Nyd5aAWoag8gLJEUaLh/OUDVJ/+Jz
	7wcWTyKM26/Xfcw38DYwzQrpjVPyc4TOofFLtz1OVmTZ+YzlLm5mU12Qohyxpm2p
	4X9a+BtGnwAHuL3pxKVOPcFJTOwfSTr7f5G8/Tp6UNF3Oq3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte3btd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so12092631cf.1
        for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 06:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691385; x=1784296185; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8HBXLpoj220Wse3k0fYLcRC+Pkmai2cbvL7zm7NY/jY=;
        b=LuvLk9YR5dejOPiLW0cMZJ9bjJ8b1NxvUtTLTpXVnqHwnq9zU3lbCj2eou/Ixee+fS
         psvEcZIXuQo5g+fructCcx19uhH5GI2On1lDVl1fcVI6/jsybkWYmU91xSBTuQDz81Ze
         0+FfnpLfReXbjOt8f83QE+64O9noFH3+1z8pCAhEucI2gTYfjjJBKOFVk5YQ5qUuH9hC
         2PT6tPyCuOLVVO5z3lHsdhxmNQLSBi/8n1ON+nRzX2JICLwCFYI7mzbMlNWe5+hAd0Je
         B5LR9j+Lw0Zv4vCyeh79bbgw8Wj4MWP9f2uZFYwiGz/se3XcW0yLm/GPFr9hPN9AQ6jm
         yBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691385; x=1784296185;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8HBXLpoj220Wse3k0fYLcRC+Pkmai2cbvL7zm7NY/jY=;
        b=p3UZWsCNqPiYWFKjz5W5ADxXVfIcirKbC8Mc9DRIY3C9x72JjWQsIfdLz1iVzNFUsO
         6RMyxfSw4XrMMeAJ+BWAbemrNbImL782fktroFy6GkexP0Xrf/9GlC+lORKNv0yQ2TBd
         0d27NasHictFYrI3Bjng58kCaQyEpiCyQIr6V4vZrQHGcNdK5JHfIIl8r0gfq9a9ViID
         D7iYk82Eos9ajnpNm3IrnIq1CckCf2XYdXz4LQg8jQ0QqKUIjBdyPpcbnT8mumGtPala
         yXD+uGGyMT+vFmm8Lb5e5RYsFZfjpnhNsJjs+8T5kVnNPF+BhM3NOTmjshzuEfuCORQk
         EvKg==
X-Gm-Message-State: AOJu0YwvIAojxYfw+hEp14QBUD43Lnq8CcJyG0efGPn4ds/Fw8J4QN6e
	RemYwOb+1053410fSS9K+1B1zo2tIT8WLQCBJ4AcZgUHn7OFUDOLDqLoA++dWJqJnLVJl3+vI2V
	bu68zEjK9F9Os8c1kQpbDcQ829fFIt3BEGgdRpuMfJLN0n6u20N3VZYz9RV/uKiUb
X-Gm-Gg: AfdE7ckonyyUtdaPHcJxbXM5DQcVoItRkO0hBll9ps4lkWLSzGj0d5e4FzzSBvZBXR2
	nP8aMxH1nlyOEST7LD5VSst2rBtf4p8qwUhYPj+Uv6i8qIxjvd54JziLVSL+6GdPklSPcoygjFE
	bHmFMU1Ol+hh44pG8YxBovEn3GKLNtnMOC1wpNy213IZu42XmI/pwf9gUSXcr/rLmms8wC7ae1l
	v7BIRO9itNTauVifgHWwCQvAOq1/McdatgYx/lTPDs7kP4YDppHuyENeh6r3K1QaqtMFO1Wm5p9
	v9XdV9sDUckLU3f21nReXy1A6Vkv/jJA9WkoOjX0ilo56T71aia82WNgWpvToUGDvMD5NHQyESR
	1JBfUZ64xQrItjJVwA/d9cwSs4rA9vjYkaO3SdFrWOlqZE4E7jV9v9xu0jIsSRpcFK+rtz/9BGy
	tACovGis9kzxQo7DufOCfl4UvthmL5npEAaRZoFdjdu6OX88ju3o5hIe/HBQG1Hb2qdKtnYtoY9
	uzOwzYeBDQF70Baifsx
X-Received: by 2002:a05:622a:1f87:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-51c8b2adf8dmr130796911cf.12.1783691385493;
        Fri, 10 Jul 2026 06:49:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1f87:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-51c8b2adf8dmr130796421cf.12.1783691385009;
        Fri, 10 Jul 2026 06:49:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:44 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Fri, 10 Jul 2026 15:49:40 +0200
Message-Id: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHT4UGoC/3XPyw6CMBAF0F8xXVvSly248j+MizIM2kSoUiU+w
 r87sBES3UxyJ7knM2+WsAuY2Hb1Zh32IYXYUtisVwxOvj0iDxVlpoSywqqCN7F9eX7GKnFQhUK
 bQ+FNwahw6bAOjwnbHyifQrrF7jnZvRy3P5lecsEF1A6EdxVIs4spZde7P0NsmowGG7VefQUn5
 EJQJIAsUZTG0VH2j6Dngl0ImgTt0NM3ea6t/iOYuZAvBEOCdx5q2CgDovwhDMPwARWLh09xAQA
 A
X-Change-ID: 20260629-monza-leds-c292e68c9a49
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
        Conor Dooley <conor.dooley@microchip.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: dV9QGwmFXByL2ZPuoMnNvHN6nJSi_B-w
X-Proofpoint-ORIG-GUID: dV9QGwmFXByL2ZPuoMnNvHN6nJSi_B-w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX7m5IA2o+hNmj
 23QyjizjNhMJpqFH6fJ7iVn7azr0Uu9Ih1npXKq1rpqt5qhNCbbyxp6B33gc+uiHVnrDEqpwFOA
 k0B5DFG6cQP6ZR34TfK/dDeW/WZ+mpsRb363+cynxoAfpb5iGqstTg/Ay5/ZWDkYwbmkFAGaLrL
 NoUjwbz3GF/ThJ8WU8gUyJRN+5kLz2ngY6L9/8+773NzX/Z3/qXePwUfTxPzcUwWqDvNrgLAlRT
 Ul8+IvULDUpj6ysdqgGxNq85PDM3Sqy19vg4++6wiX8Pl6Eckurlfymup195IQ3bGhY/jQ9quKK
 Oj+6BJfDHWFDc1PxFV6NM8eF/fdkBLRWXxtUttZJfjn2cQTs+ufUZXm7oQqglfJGlo+wdoqYY07
 JEJXUJ5lZd+RxPLEAEHIpfV8KB1RGrTsS6sko6etzEoxMqwL1vKUWsxBh5Jld/W6onpINLFQnuJ
 gi9mLQRIomDgsfg1VMA==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50f87a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vowN3T5aPRO3JaQcBOgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfXwtV/Vnd3WNfC
 xrkNAbiRAgmwBJzCA8VpsCxJ3i3eRsY0IPi2SIeDhRFW1AUqigTbiUD3ODDGJZ4PJczmnpKjFZp
 t0/gPF+la+eMsNElH3sL68MxPHf2kdo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9004-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor.dooley@microchip.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: CBD6973B759

Some devices use PCA963x controllers to drive RGB LEDs, where
multiple PWM channels correspond to a single logical LED. Add
support for grouping such channels into a multicolor LED device,
using the LED multicolor class framework.

The DT bindings are extended to describe these groupings via a
multi-led@N node with sub-nodes representing individual color
channels. This follows conventions used by other multicolor LED
drivers, while maintaining full backward compatibility with
existing single-color LED definitions.

The PCA963x driver is updated accordingly to detect these grouped
definitions and register multicolor LEDs.

Finally, the Monaco Arduino Monza device tree is updated to expose
the onboard MCU-controlled LEDs (compatible with PCA9635). The MCU
manages four RGB LEDs mapped to channels 0–11, which are described
using the new multicolor bindings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v5:
- pca963x: fix multicolor power-state tracking (leds_on now updated per
  sub-channel, avoiding wrong sleep/wake state).
- pca963x: dedup the single/multicolor registration paths into a common
  pca963x_register_led(), with mc parsing split into
  pca963x_parse_mc_subleds() (Lee).
- pca963x: use dev_err_probe() on the probe error paths (Lee).
- pca963x: pca963x_led_mc_set() cleanups: drop the extra loop variable,
  use 'for (int i ...)', etc. (Lee).
- Link to v4: https://lore.kernel.org/r/20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com

Changes in v4:
- Narrow the led node-name regex to allow only hardware-supported addresses.
- Remove useless 'minimum: 0' prop, and add 'maximum: 15' in the default block.
- Link to v3: https://lore.kernel.org/r/20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com

Changes in v3:
- Add color to required multi-color leds (sashiko/Conor)
- Bounded registers value for nested led subnodes (sashiko/Conor)
- Add fix for PCA6535 reg limit (extend it to spec)
- Link to v2: https://lore.kernel.org/r/20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com

Changes in v2:
Changes in v2:
- bindings: Reworded commit message to explain the motivation (Krzysztof)
- bindings: Kept the "^led@..." pattern and modeled multicolor groups
  via a dedicated "^multi-led@..." subtree.
- dts: Renamed node from "leds-controller@22" to "led-controller@22"
  and dropped the unused label. (Konrad).
- dts: Moved "reg" to directly follow "compatible" (Konrad).
- dts: Fixed unit addresses to lowercase hex (sashiko).
- Fixed checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com

---
Loic Poulain (4):
      dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 160 ++++++++++++++++-----
 4 files changed, 339 insertions(+), 40 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


