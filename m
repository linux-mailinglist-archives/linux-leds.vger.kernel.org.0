Return-Path: <linux-leds+bounces-9006-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rBjNHT/6UGpy9QIAu9opvQ
	(envelope-from <linux-leds+bounces-9006-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 15:57:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE55C73B800
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 15:57:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X250Y2de;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WY5691P0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9006-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9006-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 832F030F03DD
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 13:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB51271450;
	Fri, 10 Jul 2026 13:49:52 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ED125B095
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691392; cv=none; b=jgvJtctV1TkHK661Z27HbjFNSVsOozj3c4Owi2tlD1gepj1zHja/RS2+zLhS+7D0kCIt01YgrC0f28t1qBAaL1l5JdYMkVakm4I/xEEk936KulIW3mwjBxR/v+O4dwMhYCIkK9f+OoUdIqYsitwkCEp1utUfd72iERjUQNfBVV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691392; c=relaxed/simple;
	bh=yhfsNlH0RS+IypgukP+bK07b4g+Hfp3VDvpALH2BQRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLo3TJlz81dA02YH/urw9n8iC1XWBHJlfQGFnNbNC735gwiHiDaxMBzdanqsEe+rP0nsAN4cxI+hoCTW4GeIgZUa8F5VTWzxI8Z7v9cG8PisfS5+bUEezurpeUFk4MPlDchle9nl9tgA8gAN9gffgPCg/+VRXMwsRH7gqqLb1Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X250Y2de; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WY5691P0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6VHd874209
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=; b=X250Y2deU1JxPQLk
	BWpRVtx+AQByTtNv7NnPxUE5qdh6783aCxZDeHf3wBWvtAY7Wzr8nQ3kyCg1tBwN
	nWhoHGqtmnUjeLQa/yzS2ef6Wq4U2V4zWPaKshkPxRia4ZEcJzSZ8iutzg3dU9Kl
	O2MU4j4wHEuKjthtFl5PCZtG4KImDIFx+nj4nQ8pL0nWIARoO5WgJeiCQWcctEqH
	LGVkBT+6A+cu0ieFCycZapvAWNpUmHF/51gyu6UAxU0u0q3/5xWjbVkfxE8jpxvh
	s69crDR0GSjQi0v+WkAQ39RYfvXn7S38DJ87uvxsHiBduH7pSj6xsXIDAlLozDs+
	861ABw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8wcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1ada6c43so13384891cf.3
        for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691389; x=1784296189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=WY5691P0NzQZrWAFlquUkk7w74SEgKT3tkMALtxelr576qFgMA10KcPN//uP0lNm/w
         p7Os89J3db6lnLi9aC1qwqLpH1t1jj9jns4sMNzQVsfxhnaSDs5++U/cMejw5f6c+sN5
         T9oCG5473VdYuFDt5XInefp9WpNeoSvOSswNoBfwrj3ysO771EMmSomIR8gegOk7Q0GS
         dphimL86nFIdZCVybDmWHl+GI3GiaEk/6SvD4AQR1d9S8NRnGYKhNQTUdBKgEZDI3OPR
         K+5YygyG4Tq5DIyFVu5xGVpHP59sGqV/f6Wtq18VVhXxVJCaVEPApKw/yHWGKY4JVGkr
         j9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691389; x=1784296189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=F0eRfVzs8M4Nzrx2u2LW4WmMYJRzei2AlUSxN0OvMdY1pXK5sRnCtdHZTT27NfgO04
         dFSYnesjH2ywwUWflRC0fT0o8OeharF5rZu+7pfAl1TU3JKnHlSLgLGREMXlfmfq3j7B
         SQKmuu9X3J6s2gvQofDhEGtDOaNZQClyRog0WoenDoIoXLjx/bhj4D3l+Uw39cWH9Rrq
         xutseBeB6rTr/i1h02gHq/3d2dxFlXH8n64Q9gSk3Hh5qOTB7Y+TCtu6b70xD7bK5Tk5
         AGUC5dKzGmUjVe/em+C7ASq6qsbczh9fG6W9BHPy2/WuueaeESwegQewwNxKh5Qr+CK1
         TVdQ==
X-Gm-Message-State: AOJu0YzIDJUrr4ZZPCCFQ0KrSqe3c7ra8p4MP5Ut0OABHw7M9Wme9H33
	vlmbkslPUvQsuEXQ6CkzayqlydhUQLnC8ylIENun9WfcnCuPVE4oK7SeMXUVUMbuFfrjAr7feYa
	mIcL3yN1v9ZwFcGmQxi+ArRAPDu6vm7QCImjUnWo/R5A0OgiW94y64Ki4/+ud4uIo
X-Gm-Gg: AfdE7cknOn1w4ZTxAQmbXb3wHL+7feqQF/fHiILaW9L0Y/KN0CdE+PYea9fjt9uD+zr
	Qg711E1qXZyPXhkDnvTfxZ7lwTE6nMpJwqPBz3ohpAFRZ57f1Au7x4g+r2uptQInlMiUjKFt8o+
	FEicXmB6CTIfyNQJihOihWPA4I9lqE3a1tjkGsBmmcuvQMIGQTVgOQAYto+cQEeuDi4/doKYjv5
	UuCFKBiOg5m7uAN+j2g68cR51BZ5x3Whf2cO9a+VGRA/x1RQZOmqpuQAtMo1mp2tBjzpR2qFKOV
	VKWYyqojGVbXnTvVMh3LxOVgZZzcnBJfGMYfQQwfGFWDa3UcGDNu+U4Euqh3xP2t4MEwIRRSKCH
	ivB5j4uxPNr1NrBihyQ0jtA2Uwej34T/FAf8HJLzlGxuUPSS4aEg/iHGtaHfP53neimTeWuGfNE
	i2V/fy0jVwPiJ1/AkN/6sfsvv9YlYGnSEsgyjCSNgYP55vAAJ4DfofhJkaPCgLWCbqEA+kvvF1z
	m2CzfPWJgKtiDUlUQbn
X-Received: by 2002:a05:622a:315:b0:51c:8439:14d9 with SMTP id d75a77b69052e-51c8b3c2a7dmr121726641cf.54.1783691388776;
        Fri, 10 Jul 2026 06:49:48 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:51c:8439:14d9 with SMTP id d75a77b69052e-51c8b3c2a7dmr121726261cf.54.1783691388257;
        Fri, 10 Jul 2026 06:49:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:42 +0200
Subject: [PATCH v5 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-leds-v5-2-a8972d28c28f@oss.qualcomm.com>
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
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50f87d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: jbx1e9ielpUj-r7CG7ONc-RQwlWWU5X0
X-Proofpoint-GUID: jbx1e9ielpUj-r7CG7ONc-RQwlWWU5X0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX/jfVN0vnc0kT
 7A5uJD/b4SHpoxZgqAUfojsdruH3ylF61ofSRVYHHWLoyZkVdzAVwSM92KetDMxgbdmQuPkbMYZ
 TnGR7K+0CLCgAAM7eBODIWv2u016hXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfXwt//FpFFaM91
 7+qqv7IgwVQrvBCKBx20PFjFnPwhon8ZaVf0uPyoAYvHCqhBTQARBjR6jreW/y88yis51m00qaj
 h3xwArqxVKCjQzsz3VjGvCMO7cLvRSUg4ZhFEIA+BXaoR8Yc+fZRsrFiEt8OfW/7rO8yXJQV1a/
 YDlnRiousqIdJD7I8zgMdSTR59ts9fsPYt8CFjFvb1d427M+jxCTjABpmEiIFsSMFyU57DAt7eg
 AXJ7GTT1e/Di0xt2Cvo55fN5IVmRvb4XtCSHehH7Ny2TjE+9pYb40zczswJbg+7Pky96g1CZvzu
 WaxOPvtgbBObPfUq+6f5ocGbn5w/3COXiDv10DohTCycRcBuXGy57szXvXmzheFHCqehZLa5WOg
 ktZBz40f19d2D/4sWwqE5YbckjrEqYLnp76exg0oPbUPLr6+yfvFVbNOL3aFGRyyohedkSLnwpU
 rECa/+qymyel1qiCg+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9006-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: CE55C73B800

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 96 +++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 4fda602912f7a9443b8a77e46bc015e244f82e08..eccf37de51285a0dc6d28ffaba2d47a9f93d867f 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,40 @@ patternProperties:
     required:
       - reg
 
+  "^multi-led@[0-9a-f]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 15
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maximum: 15
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
 allOf:
   - if:
       properties:
@@ -84,10 +118,16 @@ allOf:
               - nxp,pca9633
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 3
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 3
   - if:
       properties:
         compatible:
@@ -96,10 +136,16 @@ allOf:
               - nxp,pca9634
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 7
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 7
 
 additionalProperties: false
 
@@ -143,4 +189,50 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@62 {
+            compatible = "nxp,pca9633";
+            reg = <0x62>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* Three channels controlling one RGB LED */
+            multi-led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RGB>;
+                    function = LED_FUNCTION_STATUS;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    led@0 {
+                            reg = <0>;
+                            color = <LED_COLOR_ID_RED>;
+                    };
+
+                    led@1 {
+                            reg = <1>;
+                            color = <LED_COLOR_ID_GREEN>;
+                    };
+
+                    led@2 {
+                            reg = <2>;
+                            color = <LED_COLOR_ID_BLUE>;
+                    };
+            };
+
+            /* Remaining channel used as a plain white LED */
+            led@3 {
+                    reg = <3>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_STATUS;
+            };
+        };
+    };
+
 ...

-- 
2.34.1


