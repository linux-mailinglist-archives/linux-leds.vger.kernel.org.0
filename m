Return-Path: <linux-leds+bounces-9094-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sEvtLl2RV2rWXAAAu9opvQ
	(envelope-from <linux-leds+bounces-9094-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 15:55:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F6B75F096
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 15:55:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p1dXWGvP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A2rq1Yln;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9094-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-9094-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6747730406B2
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 13:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EBE30C35E;
	Wed, 15 Jul 2026 13:44:37 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BAA3033C6
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123077; cv=none; b=f1CrOjVK0CFYv31iEKMe97eEEURdeZgNGpFZF3wqLRgrmHRTG6xfECxYTnDITBUMIMzLve3sY+co0E/Z2zFp2GpceAW8MW3Wxjjo63UGigRAFGOS79F8f+LPoopgdW7xqME5M6Bt2uVy6oi7vRHpoEWos1Fnt6QWvzl4dHfTDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123077; c=relaxed/simple;
	bh=yhfsNlH0RS+IypgukP+bK07b4g+Hfp3VDvpALH2BQRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfqR1fjOvRc7ummLrMiZHxOesAUB8Sha1A6cKPS4AEZv7GYfAoO6uZ05TzAKRPQCIjkWJSUtsSbneMYXYNvxBhCvzgu+Q16zE1tl3cRozWgAeI2WOOsTAlnf9nPkiYWppn7F5a/Gq07FcG0t+IUqrBZmakzXzgzWx9+IJEnIYjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1dXWGvP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2rq1Yln; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FDHut53851993
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=; b=p1dXWGvP4dG+CwZb
	NO9LA3qIxwGeSZzNM+Ae2No+B1X3BnDvD4k0OBAXj/3bCv/HWPXlyzBQ8PGAcBRn
	CqjXWTUwaAU8RIv8XT2T83Sthawpf0V7tPGYxRIQqtAZMLCklr0BEYyCGqTr/GvI
	fgUGWC+tY47ClD2oknu2VyxAEujwSZjWDXt1ykxYQKqXQ6upKrsHLxkYsshIRIB9
	QWi9gOQJpvy4VjANWDgxDPVSDyy9ojA/H/iATkfFG3/2J6XcWbo9B3jH9IJeYS4e
	vuyBeZd/1H7Y+1ueNK5iKb6NE4N8vfdkoBn6VBiBu4xHWK/bTl33fDp2AlP89/bT
	LL6jsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfg3gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 13:44:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso31020691cf.1
        for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123074; x=1784727874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=A2rq1YlnY2qKkHzqsDDXtebFTIbe5lJb6EPQ271XLQd60ykQqoQMVKK5hac9l3ierg
         qGH6II5cjP71fJc2gFAG9uXi48b4PHSUnM9zhrS16IGDX8cULl0o0oy4Cj3kqwIur8DW
         rEvzicwXCUBO1uFbN4oPI45VHqWYw72fBNBeoN1srehOnnusUxaT+xJr/3C6mgwrVt7T
         0XZk+2gylxwaOg2JgmDBS9GudJdU6vITLRW2Yumr0sbQNqXBRdDRwaWAe5gyVT7aJQVb
         BAtEiy/cteoixEjByK07lctbYcbLwrAKN0zlk5SDxq/Z8lWVZZDLwurW51vHswW8P9Q/
         qsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123074; x=1784727874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=A5aVE7QgCAcJ+A4EuPY0z0DnneDwXo76MKNSfMyv7iUBGNhFK6WVJ+lnkmLycdvFKe
         hyVgZEcmIUzi368SHiv9YNY7a7aEhKhRmeq0+Jiq6f88QgzQedYvxryveEJDqEChkeSb
         KTIHZTOUxHCP3x9ayK6PjwdSWf+HwtuhTum9aUYgmQdx6C3Cv9s9Pu3PAhpW/10zcUa5
         XGVvsyZspmxvloryfhCDM9Ah/ans79kOObeHVtGgdqwHkAzz0mcK4weXHh5Av9ZO5rDg
         DoSB4GsyfM16T6HJIKHpAFC5Hwjvg0pgnf87UjLQXyJURewSvPiXkiPlqpeC2X2aBUxG
         rH7Q==
X-Gm-Message-State: AOJu0Yy4xYLsKr9udbs/2Rw5uW5QeB06CLWaF8gsqLFAVDodIChw04vu
	d318lgV4bwNMLJ5RCebKzbxHUFV8gYeA8WlZnMXp5u4DUbxYA+Ij1mQpfzFUe+Vs9WefRYMW7fN
	kg0zgKQ4HDg/Avzok71QhScxG4GuNyxlUklq4bkS1eOf5PUYNMcJUnkSzezw/OzL+
X-Gm-Gg: AfdE7cmDVqT0lCJI2V/yyGTHTLR6gG5AEwnEwLdeK45PGojKeH7qFWrEPo3u7aBLdG4
	hlMffp0IF5UH/g/LI2QhyPauQ781/dPwyw3qTbTmgSlb9OxdVS2ACdEb85Cab62EmOuJkB0iY40
	ec8mnLmUX4OmMAfpXnz7gJJQE8pLxeBKSJv/O4VR7QH/lObzIAXXs22JBTPyz7bFR/RY2T/AJeY
	ZuOp4itNCnHYFRqo7W6Z1uLndlbAhsH1DCLrf+yPh4VYBgVQv7gxnIe43e2/oOKnVsGx13Z8PwD
	Ws8whmeDUQsjA/jveKvaUtFsCxro8/oAX6xp2gQRZyyzi+GMOa5M/TvnCCB2mMtTuQe0wqqz3Xg
	a+xuVmPePUBxLFXD9qTCs4PQ2bEcp8wQIFnXspmbRSM0DtjlDio8uK5HCo2nU3DvsEdK+0iz+CL
	yWIM+kQVrevjbX6tIymWyDGvW/6EJZGvdo3GEY+3/8/30wYfnB8fAUxN16vzVfcQ==
X-Received: by 2002:a05:622a:8c3:b0:51c:1ec5:d11 with SMTP id d75a77b69052e-51cbf130085mr181466831cf.19.1784123074055;
        Wed, 15 Jul 2026 06:44:34 -0700 (PDT)
X-Received: by 2002:a05:622a:8c3:b0:51c:1ec5:d11 with SMTP id d75a77b69052e-51cbf130085mr181466461cf.19.1784123073563;
        Wed, 15 Jul 2026 06:44:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:44:28 +0200
Subject: [PATCH v6 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-monza-leds-v6-2-d1724bb7fe3d@oss.qualcomm.com>
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
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: qX_EGI4dJBIU2v3DkcWHEa_sVgHQ-iHv
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a578ec2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX9GhpZrY+aKIa
 D63xGcnaEnR/+HO751PhjjiQYpkcKlxNDMScrzGXYyUvd1q3IHQrGt+ex8SBin6pK/19B+gVOxx
 GiCJC9UDQHiTGEjGWt3ghTVlaLJpds/Nf53czA4OHiG4ZvPjThxz0U1Zm4dsErIjUfa3ganTrKD
 XmwG8wYRnBJca7YVUdA0x+tYXSDaE35jRYbeJ6MIFoaud1HM+TeXpQAb3JEPp826QpzJaPNOHUO
 UiRfZF6SK+3E0Zp3wYlLHqUN1qUB1EZHWk7K2NBnEQ/2dJq77T6ZraK/VrsubQ3HFY675mI8UMe
 SC0VJIM58qPPv2/QKfqVkQ6QFgSbEx/4WLczi7nrQ9s4Jw+7Ce8r+hqqJBXN9DPzzzDUpDkYHe6
 vxpcINOocpkuvsXJoUifwhZGyY59jihOs0rETlt3+eolGzeKIWnlySQcRg3UPqQBk4yzCJ2R75m
 45DGPzdcW5+MXyNA9UQ==
X-Proofpoint-ORIG-GUID: qX_EGI4dJBIU2v3DkcWHEa_sVgHQ-iHv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfXxVBw7RGmNgWZ
 +4xKPsZq92kfa0xtHQD7oeEoiRmJ4moEGZH2w7wtWtSeg39TU6nN+j8oiaw2GE5RjUWe+S9QKBq
 cpl3JyasAD7BvjiXTxd+Nt7b5/p+TjE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9094-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,microchip.com:email];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 00F6B75F096
X-Rspamd-Action: no action

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


