Return-Path: <linux-leds+bounces-9092-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8xwHMo2QV2qiXAAAu9opvQ
	(envelope-from <linux-leds+bounces-9092-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 15:52:13 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5426175EFFC
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 15:52:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LPkjc+ub;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y6ixmzdp;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9092-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9092-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77AA93048F71
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 13:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F5B2F8E9F;
	Wed, 15 Jul 2026 13:44:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93442FF657
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123075; cv=none; b=Gl7PtJu/2lVxDiImsOUqQmXuXlfPgTPU8IEyayvgY4ZEQ3z1n4gqPwqTS5mMLd48QxtgcwoUx9ZqxbpOt+OndzzZHDvlGJIC/zp/Ag8v+OsiPNTD0nFvoypdroG8Q9yKdWKsZlu+djAfPjdOt5M0taMmpjwdgY4QfqJNuiYnL7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123075; c=relaxed/simple;
	bh=4T/4q/GKcuXdMHDGzev5LfJPjRNiNnzaYIn4FFK8R8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bV7sq3ULbQepJ5JAB7sLb00fN80BgTe/hE1RfcpqAL5v+1I4LqWQaySCkIzchgcU3kbGF65H65pPOzq0nxHWxEOC6O5uSb+YiIi0dyYeGgB81kjSlr3DZzSzopJk3DYDBVlNdRFYPgwT+uMV0mgRuW3JuH28nKJ4/pU74YPOFsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPkjc+ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6ixmzdp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcf9m3707590
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HjdSK/FcnmoQgdARK7EzP+
	X8SwoN63IAkBGR1xi3pEU=; b=LPkjc+ubl6Wpz42InI2PEn+HIn41VcHl77/od6
	DfC6iZG0tvCP3IgXIu/ezH6VEr/afVwfF16p31ny1fCWxtECsnqlZNwQ1cyenTjB
	g4WSsY93vRimid7XiPqMRHwEdSiTM/dcH1MrlvEdt+wfXoBKoAv0Kucc2Y8E/gyE
	95V3nylq46E8U3C0KF3TOOnxFveu53++TJy7vMOJiRTCsoqy4BZuTnrSrOsP+wcH
	s0o34/Vg9ca7ur1Wk3mmbU3/cqgZsUwOQn6zivHS1Evlrbfg0huS0hUDwcKTh0cs
	hC8FepNEFJkV7YoHETGeIYGSU8pYeHy4aMaqDqfcobNpc11A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgxpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so41755221cf.2
        for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123072; x=1784727872; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HjdSK/FcnmoQgdARK7EzP+X8SwoN63IAkBGR1xi3pEU=;
        b=Y6ixmzdplow2zcS7EIiihzfT7og+RAE5BepOUL4ig04M4ZIKHzv9RYuzJPCIDiJWIW
         cQfeMxfaFRi1SEWflCYTpODhSZAnr36i0spQfstcrkms609cqX4mdbyHdxDfks/Lf21Z
         f66j7xJnz7JeBW5cy7LAvF6h21YR3GxLoFJS3YFbWDkjrDLVhDfIsllbJy4Xxkcget2H
         dgfh0ow3ulepAwBHkOahKuYReku0TafRKfP64UFlAKxTEi7XUG6A0V+QydT8/C+gmKe/
         gvufJE5diV6BtYJ5lz1D6V3LwrY9wIJt5EhP/ldkiHKQaBAXdc5UnIBkq2gtChYujKdX
         /FnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123072; x=1784727872;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HjdSK/FcnmoQgdARK7EzP+X8SwoN63IAkBGR1xi3pEU=;
        b=A3WnC3JD9V3fyza9Wwvee+lBiW0cAuWWqDrmS46R96liynP+G87lHrbtgTKRSH2Sxc
         YGuuzxOf5gIz2uQogtduKvAOBtofXQS3n4F5KYhCLnwGH+dkXmZ8x7ZaJTs1C/32T4n9
         Td/req6iCrzk7fLzU2ajfGAdJbr3b9bzc6vlYLpoaZJbYnMPNrz/CrjekxXMQGrCQ04c
         AvjPuKtOWhj+HeLz2Xsr+4FBTSBdFm+eolX+tjWwtMwZgMpV3IZDPh3wuyqGNofK4x5r
         rRu2V8RkzndGcST9d7Igh/ggnvQ4oUSd6SXz4RuRYssDiWWuP6KedC74BfjMFgyeWKrj
         V3LQ==
X-Gm-Message-State: AOJu0Yzd5UrvZwCp/LMMCuwTuUDn9FmVgswh9OEsiXjaYukELTtvEBc0
	8Tn63sdpg8m5Xx0wO9drFHn20MIpIrOqM4FRLfth/PEDEVL4h1CuGKfODatJjZqiR//c+CLFf2X
	xCBXAxtfhA6U2PAz7H1M+cH7jZ6FwCbMuw4WO3EcDHjgI44B9NnA2ZOn6ybPsgs5O
X-Gm-Gg: AfdE7cmVxFN8S3BFHJ5oOChf6p/p+ZCKv8llXhxoGmijJIt23o6Pws3vdZMPYYtPijZ
	uXipMNJibp/7nZH6MVscFTregzUSjrQJgn4SLLqaOORnXjDLkxQmKKG+8fPWlPaVYrxisUvH1wt
	cXBQWKo5wOpAb/3T6oj3GvRY9s70Anc5Tus8bxd10X8fEc7PON1WIfzpWrBhsxAqieQ1LRgQHgq
	cm24Z6Ify1k391Xjpgnl4+ZvzTKfd3B7K6hoUXymmLv6nzx827yZ/cbD/rThEFYLMQVF8w5lWIz
	dmn9Fg9lSFEnxSBuMh/RF+L86WiYQKdNsNt7gWQkV9qJO/JuFBYajCauAPm84dJYQiavb4Fnj2k
	9VHuQBm35423HhnM4XRhj7Sv3LQk7CUY30OWAjtzxZ9BcFeycs7PmjvT9SMMxWqPpVov3wFfRe3
	kIERWJF/EKANH85P/ObtW1fcPz5LZTjVBzg5i7vJ/JsY5f8I7/LG7jOmf+ELdpig==
X-Received: by 2002:a05:622a:190d:b0:51c:196:98d3 with SMTP id d75a77b69052e-51cbf2f9fdamr175540781cf.66.1784123071642;
        Wed, 15 Jul 2026 06:44:31 -0700 (PDT)
X-Received: by 2002:a05:622a:190d:b0:51c:196:98d3 with SMTP id d75a77b69052e-51cbf2f9fdamr175539821cf.66.1784123070337;
        Wed, 15 Jul 2026 06:44:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Wed, 15 Jul 2026 15:44:26 +0200
Message-Id: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALqOV2oC/3XPTW7CMBAF4Ksgr2tkjx3/dNV7IBbOxCmWSEzjE
 tGi3J0JGxKJbEZ6I71PM3dW4pBiYZ+7OxvimErKPQXzsWN4Cv135KmhzECAEQY873L/H/g5NoU
 jeIjGoQ/aMypchtim2xM7HCmfUvnNw9/THuW8fcuMkgsusLUogm1Q6q9cyv7nGs6Yu25Pg83aC
 C/BCrkSgASUdRS1tnSU2RDUUjArQZGgbAz0jXPKqA1BLwW3EjQJwQZssQKNot4QqoUgxUqoZsF
 5Cw04BNe+EaZpegBvv515swEAAA==
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfXybu15dnTmp9T
 3FMD/zgto9vazANNaDILy5WaRUMRZAwwLayYTbPtfv+DgTR1BU5BaMLV+/oKU5CVrGwF+qLrhcc
 6ACsdJd2gGrDRAsU/f+kbsnBzt+4yLA=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a578ec0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vowN3T5aPRO3JaQcBOgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vwcVfXsunNr-vX2upMHnwWHhx7dqRx85
X-Proofpoint-GUID: vwcVfXsunNr-vX2upMHnwWHhx7dqRx85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX6ToECgaaf1KB
 ST9TcVzLd7xWgPPvEoj0Rneq+t78AcEbL7r5uP8bhAA5N5qzovaOS8w43U6Caw4TQnZeQGLDLO3
 DrNJiReIeQdDcrYPiEeHJeyjVUPGw3Y+SNo7DzFFxtMUbaLkeRJuOwagbEE3Jqo/6MglBTjYJmG
 MgzYEDtz7v5y1JKS5OuC0BjZfjxi0DzrZ3OhL8TWxwmny3da3uSJoODY29v8hTGVVzJPZR05MOW
 BC3L1vmblT5AiTm8YorVVBK0IxIt2qL6f/iDmCvhkgL8ZPMPKf/BQ3Z5dDd1w84iIzZkXjNaNHu
 KR2Y2ypgmdWLZnIT/Snz1tqTAjqSjp38VcAj9FsXakHdyx+WoBSNwwJgsUl7cSGs9SOSSrBSJqs
 77+sIe4/yoVEqKtkdI7hNXYBFQyoEkIyjnsX+m3cLPLD7bO12IG7dqrKCU2Q/pQUO3cJTs/BthQ
 aS0HP08VAwPtzA93qPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
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
	TAGGED_FROM(0.00)[bounces-9092-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor.dooley@microchip.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.160.199:received,2a01:e0a:830:450:751c:d61c:c91:60dd:received,100.90.174.1:received,205.220.180.131:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5426175EFFC
X-Rspamd-Action: no action

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
Changes in v6:
- pca963x: keep chip sleep/wake state consistent with tracked per-channel
  state on I2C failure mid-loop in pca963x_led_mc_set() (sashiko).
- dts: drop deprecated 'label' from the multi-led@ nodes and use
  function = LED_FUNCTION_INDICATOR with function-enumerator <1..4> for
  predictable per-LED naming (sashiko).
- Link to v5: https://lore.kernel.org/r/20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com

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
 drivers/leds/leds-pca963x.c                        | 162 ++++++++++++++++-----
 4 files changed, 341 insertions(+), 40 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


