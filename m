Return-Path: <linux-leds+bounces-8965-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BgDBMpNdTmplLQIAu9opvQ
	(envelope-from <linux-leds+bounces-8965-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:24:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7477274A3
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:24:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S5QHnqcE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gw5t7lW5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8965-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8965-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89D783088DE2
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 14:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80458478869;
	Wed,  8 Jul 2026 14:19:08 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229C444CAFC
	for <linux-leds@vger.kernel.org>; Wed,  8 Jul 2026 14:19:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520348; cv=none; b=ZTW1FHj0JCf2d3d1BzTFU8jDMv49rwsxgdJ8CUz6jVsaFf07OW1A4qNXBXmL0vYH2WVRaXLHOxReNlIAI2xaJ8FDj3AtcV9GT6MRdjXc0I+6ga7d+7ldpJqXEw8R3TSsKgWKGjFZNNP/qI3R+ztku1T+Ndfi0KHY9Ng5CT3ZHBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520348; c=relaxed/simple;
	bh=YewreDPcb9R6Fd6Lq9sZCitjEsz2xapkn3qNod8LQQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p3XENgWtmroTkuapWDnBd0U8pSVLddzLYHSahTsxwLo4NxHPLqptDL17KgMMGJtlBE7vi5/uulNyCtyePck2uyPQJ+B8uMt0y1UwpFn2aUcphhUGP3r1YAzQMR/K7uflfFCCNl0gIOzlZ8kRV/lkaWjks7Z//P3ivyQPHswhBQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5QHnqcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gw5t7lW5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3lOd2759449
	for <linux-leds@vger.kernel.org>; Wed, 8 Jul 2026 14:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rAZndPAw45cJsqtMkZT/+l/usaUKqi+xP1wvmZN57/A=; b=S5QHnqcEgEPQtkjD
	McqmjVZKR06kK3BIfvHx1lqeHmAeJ/CudXj7b6jqAmKOsO0Y8Ix6EZzna0+PkfxH
	Nwrtkl+KA69fsBVKJPXMZSoHtRckciZVMv9C86iIvPQxeJps5zotLDsz6xjicnjl
	YLOoBnieVR387ghH6MMe8H6QSIjyi0I3XuSIhuRDCroBvyn15HRD325l6fKhIJZm
	xDeS656Yb0edS8lSQpzNPrwlcj7mi6Y26LOqKXtDvMHNCnbITkYuQmMJq3AtI2E+
	5Cj/RPgx3xqwtufdQaUFl3e5Tw2xfjC4Pz0H79qJaRxPSXdCAUtkLtHneFqHItI/
	toAr+w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5vtk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2026 14:19:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738e5b5ef68so221172137.1
        for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2026 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520345; x=1784125145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAZndPAw45cJsqtMkZT/+l/usaUKqi+xP1wvmZN57/A=;
        b=gw5t7lW59vSB7JBQ2kqiB9rzG477JAjZCHNhYkyU7J9IS50vRus2A52tXG4hZC1uCT
         YtBZZybvskpWors0iO/J0hdNyPxh9ccTH3Oe7ajFfRwNmCQxXebRNa1/EmQ/sKdgK1o6
         NLJ085ihkxgRcUBaFb+QPDJykldixnOrDwd7J+m1GCHSdSl/Hr3+cT1nmmSWUa5/4HTT
         cHvm92aWQeBpUBWrlhEgWKdBgc+4FYXOdjO6mI72HXHumWwRQhC/j52sHJg9RWrOftuM
         UG0wlmU1aDoWD78tEl/tygkeSYpgR9ZokectvrZTBerE6jR8an9+eSiv7eRqWS46YAt+
         2LZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520345; x=1784125145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAZndPAw45cJsqtMkZT/+l/usaUKqi+xP1wvmZN57/A=;
        b=BNgyDbDXmBCMCMx6I9Cn2fcVvbjFe3ZCa6OK/05eGNUjOHPxNHwQHI6W4s/wM/tDjD
         DVjrIw3qceX5zdzAZI6J1kw4n/wY2HvpiBE+3RURPDEB9PR013fheHji0Az2bvbebv/j
         AX9RqtEHtg5b7sihpzOHs+0v3M/zGCNMpWNZgddS0X70NXmG54zKmYTkr+ewNj1Z5YAu
         zwdOwMyBHYvpofnSQdrVaQrfRLwfLDE9zsoENia9dsdiE0x/T1snGEdwMYGykgceiALT
         yjLHiErl3ty0gpKUg9YIJHv5cHZKiEn66TVdr+Q4mzgBtmHz4d/e1feJgxWu7yrOOvyJ
         DZvQ==
X-Gm-Message-State: AOJu0Yx/Za2Cj4rZHXfa5rJwq7LjGGnsuTtuEaoqe5nmQFTUI7afOSXN
	S5X0oYJlRlsKZRCBmkdzaDVb68764MciBXm+aKYoy47KjomWMVmlqs/P0T4bSK/bwuNm5pWY9no
	D5las2NZ2mtfEDcXi9Ne5z/cmkbh6AMvPASlV0J9miaP/206Tv7QmuDUZlafT500p
X-Gm-Gg: AfdE7cl4iumlTCq0x7ZKIhAxHElEAyS+TSwqNBwsWyY+J+50a8pazx9N10xwpwzk1cN
	gY+y5YvDROBBgldtez6EslobcV8xQz4/mg/oN/9S60Ir65PxKuO59N4ptEnW00CZrXdV0CEqe47
	9JZA7W2jqSounb0fzMjpzjaTbPgZlUboGHb5vooVOXa7nvWyd/KuLayfJdpHk1QpgTXUZnQbLI7
	4C3F6Dm5YW6OWs2YpCHmtwJVQohgY+hlL7SinWqC7PmSybsboPYEzRPanDpRdBxtRGaZfLvf1L9
	tIbJavSdvTwvQiyTGC4uDTVVKSVlL3m4QSEZD6EEqdvhLyzod233AQXn6aoU4gl3x21mJnbfh3j
	PqhSuOmdjzru/rzUWQMwewphqOTrTDaKr5qXr15W08HvRgfaM4GuWQcS432nEKRubBnWtUnjvTh
	MSyGHz02jDcq22amH4LCbOLgOEFt77HlR7oQQPMx14ue/Th9rEE4Z+23+/MaNhurbmKjagzUGXM
	YVGHLGwOn2sZy/oFlO6
X-Received: by 2002:a05:6102:50a1:b0:729:65e:f08c with SMTP id ada2fe7eead31-744df44ca17mr1357913137.0.1783520345293;
        Wed, 08 Jul 2026 07:19:05 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:729:65e:f08c with SMTP id ada2fe7eead31-744df44ca17mr1357876137.0.1783520344722;
        Wed, 08 Jul 2026 07:19:04 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:19:00 +0200
Subject: [PATCH v4 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-monza-leds-v4-1-a7acfc524c0b@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Wpk3JCfU8VGJtjMzQS6l2kh7f9jtL6YE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX5WOZG9crTP5q
 x+6WJGM62tY2dgNlo+pHCr4jrYKT2Ib/Dbz665yeHTBHUvsTv8Bo7ql8IYgBGX5H2duwgbplCsL
 cJz7zcjn5rRagTFXWquXVWWT8WqCmXU=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e5c5a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: Wpk3JCfU8VGJtjMzQS6l2kh7f9jtL6YE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX4gPIKGrrmxEX
 3BRWT0DMo6MmMyIYLIFd5IKVaIVdQXMNnDNaaUxb2EDjTGHrI78Ae79eSwLZhku/KpBXedq5gaz
 v/hUawkZDrVg1EmTSIRR655PX/OPAmjMgy5iYgAE1MmuKEEWEAxvQxGobEStuno7Dz/iWuXV0V/
 cE4QFZX7pgEe8wdMGHn/Tuaqr89K+36CZmgrzShK/qHMwoZHwKl/gK5n7vT2ImixGrAiZ50Rqvj
 PWCLPuXPimrGeWp5nAk/fZGnWjlafP0ewsRDc6mDDhgc7Uj+7otCDWMt8WCZ1dv7X3TAVRkUZym
 VYl94oANH7AmdIESZqqBpF7t9UqvqyNFy6ZPBW77cm4HFSZJ5RjzzxX1eutvM/ya3t1qYoZFJsO
 0gxolBK75heS+PqJLL2YiSjMZdI0GkY0FRrTZ58o8drythqIjwIYKvTupm4xcXoQ99zahrSVfO4
 g4+iwmp2qoE+bYWIAoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8965-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E7477274A3

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and set maximum: 15 unconditionally
in the top-level led@ node, making it the default for pca9635 and any
future compatible. Also tighten the node name regex from [0-9a-f]+ to
[0-9a-f] to match the single-digit hardware limit.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..4fda602912f7a9443b8a77e46bc015e244f82e08 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -62,14 +62,14 @@ properties:
       open-drain, newer chips to totem pole).
 
 patternProperties:
-  "^led@[0-9a-f]+$":
+  "^led@[0-9a-f]$":
     type: object
     $ref: common.yaml#
     unevaluatedProperties: false
 
     properties:
       reg:
-        minimum: 0
+        maximum: 15
 
     required:
       - reg
@@ -88,7 +88,13 @@ allOf:
           properties:
             reg:
               maximum: 3
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9634
+    then:
       patternProperties:
         "^led@[0-9a-f]+$":
           properties:

-- 
2.34.1


