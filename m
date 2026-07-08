Return-Path: <linux-leds+bounces-8967-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fIekAKVdTmpsLQIAu9opvQ
	(envelope-from <linux-leds+bounces-8967-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:24:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC47274BF
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:24:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=owrAu1gj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U4WBLyyp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8967-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8967-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11C5E308FC66
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 14:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795D747AF5C;
	Wed,  8 Jul 2026 14:19:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EFA44D696
	for <linux-leds@vger.kernel.org>; Wed,  8 Jul 2026 14:19:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520350; cv=none; b=m1aJh509CZWH+CsW4zcjMVj0FVvw07luKhY7B2tGvg2FVpifrTmgdfgl42SXwohhkll8ot8cJmY8gqShqQCOoY9YceDNAug6PZaBrIdnVGXHdw+ixCBseReuT/SQyXidPOk1ryXsHXIZKTiiISXXWEzQyeyIY7R4314GXMed1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520350; c=relaxed/simple;
	bh=A9oiqMvMvHneoJV2ZBiozRHMKsNh7mwKSxwv4q8Mt54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUQwer/QzaADIyRtzB/82i5M6TW4+nB2mV+Wu/LqxLS1kpXigaf2pu72pniXHMx8OSKLsHOSzGB11r+e7ZEhrWzxl6ti4DYowKzH4VMV0j/s4wkhSx3YOogc2YFpsmtI5/nbxBf3/tmBhrC+bh2fc4264IlOLk2Hqsw/oXh0qKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owrAu1gj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4WBLyyp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3hvn2617718
	for <linux-leds@vger.kernel.org>; Wed, 8 Jul 2026 14:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Id2VXhGZdTLxLIP+KHMKsc8u39pNhhgBQwA5jSrqzjo=; b=owrAu1gjdGnPQkgP
	D732Wx4rmkUUSHa6KVUcYJORwChWv/exGbo+IQ5fTn26XAbHBQeIYfIwvEKZt6zk
	s42eRNSmdzLSGB+vlaOI2IEjjVdiJUBdwNq6rsk21E0sRMD1MdSyI63/mKYoeLGC
	VEnFLj6Qt99KJGCaIt4oR5ktGbPFNOWfWQC5FQMVbRxF1zRQNR/LKYEwBDB0yVZi
	bd3zRMyfQ3vShDeg0AMmQRw6vgtpEiODQ7r6QTHD0mX0JHJynurQkhUbWO1RDjDi
	5kyHL2CvE9mMd8Speuwy+hfGSVJQv5OzOjVJP+y6C9x9FS4eB4RYk9wLXAHqOcqn
	J8xXQw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw9whu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2026 14:19:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so8323831cf.0
        for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2026 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520347; x=1784125147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Id2VXhGZdTLxLIP+KHMKsc8u39pNhhgBQwA5jSrqzjo=;
        b=U4WBLyypzJSx4DNEYQFmH7KNJlv8Il5VDp+eEE1SZb5fsYd6o1ZZVXOvMYO6XYSk+d
         AXBzSVrWFet4EPl8W1UqG60O7+deWuDgGlMa0Z6pqH+H70VgFMwHxgAtShN6aS62JQK9
         MGv2b3l2iYiDfjzfYPHj7gPwML3E01TMQA4XwcT37ZnQ6LKYtmYpmtNPYXk0HYryDHyo
         jEiUJrnerN8HB+fVUWdfjGA2BLUE9ZoqEmo097eraWwAg+E9tCX8/fldEAMiS2FGg0Hi
         hKw0+RbDiC0ebxQmWaKGr0q9O8x/mVqUWmPvmadvsJDfNpwodh7c0SvtR0AICSjfqUSY
         vHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520347; x=1784125147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Id2VXhGZdTLxLIP+KHMKsc8u39pNhhgBQwA5jSrqzjo=;
        b=I7TD/Venzplr7ozX8P9+lUHNLUfRzHKTKqje8x7SxyqN0THYOxyS98Veziq6QUOv2H
         WBPvnf//oFuP3ykEQ6Q+39GRfjDQaVM5dEoRS7n74tihcQm1Tkgtw53l6m3cmdp0ps66
         LiabZ/Hj4aAFq0RFdJ3Xg1oRJdmYKrpAkGPGN52dXWQSTWtmEGwQiFxGB2a2Rzlr81HA
         GWKfWzZjPfGA/+Roy/tar83D4ZYYUXkK1/Xwy7ZD2E9NR61F10OEcthfegUbelsy5lDh
         6ZNIbtNvx8+yLSeiZJ7EqWBknX7Gi4/pzTzMi93lSgUigJN9FKBI0uu3vpBRlWtU6gec
         KyjQ==
X-Gm-Message-State: AOJu0YxvonBZOfQNJ4ON2G6unuDpZOFwXJ6Sj1SJ8VLRiaxlLJ7AAg77
	DTIf+GuO5VXrXGpUqINmFG+N88fMFx0bOo9QUP4q2+U5owhRxvOJrzUG0xTe9RitUf6McwcbeoA
	T9lUyqzJmr+AMSejnz+CgRyyfqMZVvkb5H2UBxnY537uBHu5uyWSZmDr+sLLyhzta
X-Gm-Gg: AfdE7cmb6i99M06epkXOLm3zvxgTdjqVzQPXVT+9c0n/JjoRh0HIlnNFWr6mNa848JL
	rNYpfPoZaWQefIbvjAbrX+j4Qr3EwZ23GG27wuP5Qs83tjd4IwlLtsG07enr8xUC/0oiR96ek+O
	EqVkh+0NMZF6e5sM9FkQBXkppMDdWIKdKFqP9WLpdSMiG123COAsjFpGXasykZ6seHoajLMnx4v
	aw9VuvZzq8dbNYJR2gal9kLB4Hw++5RaoWHn3RXi7Ts8WqK30llmpBB4MOtm3rTjFJ9t1LPihJ3
	zqKJ8Xp35H3RURVo54hTCqXckW8jTXpnw92lY9s0cpMYd9vSIxSes88qF2q/tkwplFOaoiXHZFp
	swpcVo3hAVGesD71LEIAVT2EA9yI1Yt3HkPOM4oP3p7AHeSzqp1bp3I9dvnUGTzq6Zq3JwLUlq0
	a1uFpoImjoK0q2GCkpRdMtSTW8tko7b8uBnSIlYQNxoIrj6DoJ2wfZs3fkwgAXosEuEAB8xU5uR
	UsCeSDuPoNjqGIvqXFk
X-Received: by 2002:a05:622a:303:b0:51c:7b12:6007 with SMTP id d75a77b69052e-51c8b57f94dmr27120431cf.83.1783520346881;
        Wed, 08 Jul 2026 07:19:06 -0700 (PDT)
X-Received: by 2002:a05:622a:303:b0:51c:7b12:6007 with SMTP id d75a77b69052e-51c8b57f94dmr27119771cf.83.1783520346380;
        Wed, 08 Jul 2026 07:19:06 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:19:01 +0200
Subject: [PATCH v4 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-monza-leds-v4-2-a7acfc524c0b@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfXziDf3uKhV5im
 h7FKipXTaHFh1ThjqEST/Bzd+8Gc/cwm6lP0312YorcHOjcFoyF4g83lxhg6fX3VnagIHbbHD2y
 jGB31nDAGhrKFuCHSJtDC4TPQbNswXECvjTsOiM4lXP2NcR4LUKwyCCh11/xErtLCi6COc3jnTY
 bD8g8yRE3CjW2FkHzcMu51dqb0HCjK1GbwyRXwSmxgbzeHvvy19vkrR6t6tvW+50n25pAlJqFrP
 8UPLvEuPM3EBegMbU8hSqUajlvpWj7cgX2KERsgdf9Q4asv2Wwoy530xe4BHDalfFJ8nFvz9FJI
 vxJvI3FMzHGi2TQ6Y26Ui76+42vR6E5f/69XDj2D3B5/C1uqvX+0B8uuHFoDCabjbN6yp3Xgt5r
 ve0WcXuU6d+DCI5Bqxg5QfZDy9ryCo/pzPYJ7tovfCYWtV6o4twuedINy2x1rgjDGXf+evuEBu6
 JFSXLh3Jx2ABPPpknXA==
X-Proofpoint-GUID: shi6bHpZUtmdB2PBlIdIBpqTkQ2POH8d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX0NkAOvdPqrl9
 KPwUIRO4SuaqrYJ42V7yGpoDpVqmzAH+WKXJmEFJB+PeX8K/Fng9d0lzQzDQxcZfinq9EYQ1yVZ
 vFsTLTqUnfeMj+j87gCcYS3rkiMaHlI=
X-Proofpoint-ORIG-GUID: shi6bHpZUtmdB2PBlIdIBpqTkQ2POH8d
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e5c5c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8967-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: CDFC47274BF

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

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


