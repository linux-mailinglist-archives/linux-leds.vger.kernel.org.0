Return-Path: <linux-leds+bounces-8938-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8CJcGZXYS2pcbQEAu9opvQ
	(envelope-from <linux-leds+bounces-8938-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 18:32:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAF271350F
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 18:32:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p6hv2QCT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="bjaTPug/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8938-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8938-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4B4A31D88DC
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 15:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E9F42E8F1;
	Mon,  6 Jul 2026 15:50:05 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E0F42CAE2
	for <linux-leds@vger.kernel.org>; Mon,  6 Jul 2026 15:50:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353005; cv=none; b=k/L1yMtc68PCYEBAeXydWb873n4dBxAkmmc3cqSz/r38fqS57AaqjzN7qLbYKpZqVjkowS3+fJK3VtwbKpB1uNngRCsKti0SI+XLWHOOcT4Wq+/iN0MgyRmxKrLnr993h7ROKXNn0Den4OJbL2bEMUR1nTtV9Vw+nIc1k7y21eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353005; c=relaxed/simple;
	bh=ILYdIx3m61dAB1nX/VjGOC/8TSgyHp5ugCUIjXo5OaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBPHT4PHfX/OMb5REVG5iArYa/mN28oe6qC5/xdFeoo/2CS0XJ3KLOPDnvvFgcBNBj+M98oy8sri40/cjuFB0Nli3w7VzDmPDQjVmfyopfh241zOI+c2mK4d+odNWk0jzABN2/1WFurFOo+I/YAlsxfu3Z2MhcFCzLOTMv5BEhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6hv2QCT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjaTPug/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF44c825884
	for <linux-leds@vger.kernel.org>; Mon, 6 Jul 2026 15:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bFesKw1f2QCeUZxjTiA588dk82SKORVLapcmCwPMo2Y=; b=p6hv2QCTm3SheoHU
	SeVWgDNLZtO4mDf+Mp6sBpbC33rg2jrYvZ56Gu9viat9JLZOTq1/VB/LSg+Jy0XQ
	SGxHWeCAq96Oe9tIlQaHRkaK2jd0NKqO1tilea7XjtaRVTsyJ2SoRg5GuMhALasa
	wdyaOV/kahW0QHx0edCg72pCxiKSGW4JFu+ze+ZDwCmqRHroBQIP+NVDc3u6RvwZ
	sNcTTmrYoTCxNpZUm1mLFVqEcwQUflg+sb1i8m4UCOyU4TuY2rRffUlxKswcxMjo
	DxH6D5N22vGmOWW0S/r9Mr/bMc4u8CpEaeCmR1ghpeH1uLb85/D+XRYf3q7LSC2l
	TQ573Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t89yew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 15:50:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e9a2b95b5so499052385a.2
        for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 08:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353003; x=1783957803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFesKw1f2QCeUZxjTiA588dk82SKORVLapcmCwPMo2Y=;
        b=bjaTPug/03TWlM7XGyX1I4OojDy/z/OqAUnsKVrOX2E3T1FfY2o/wvavwY4kUvncgK
         kR2k4+UjSYOKeG2zUSqqGWGKAt8VLtmVAE4zZTOd6EpM+6LkHFroQIhxdYfkvX2SZ78o
         8X58sme8xhwcg0Pg0WQIGXc8fbdpy0EKVOm4ryCvuu1/xV2HHKvfh6Ldr7RAamokpy41
         85Xv9TDR/p6gmQ+3yzQjzQJRXM+NUVqshWdPEJp48V6C22vAr5gOQDNCHRX60UV7s8IV
         sfKk8iCfzExqki3hMpR5ROq1Q2ZAWAmoe05nVpzPUkW/ReplOKQfCPlvHowHUIf6PRtL
         dyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353003; x=1783957803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFesKw1f2QCeUZxjTiA588dk82SKORVLapcmCwPMo2Y=;
        b=PrwuvLNvZzBlxlOKqjb9TAlmic4qb6SXpTpK6msmU98NQ+m9+Dxk2p+OH++45EDZ5j
         vkmM9PIc4ZrdVowqBfVs9q3U3afKwgTTu7RxPij0GAhwz/cL7ET1kZEZ/41lIqwKtJSU
         fUH4ESL8t1iqqbQ1Ml92q1HJ+/hNrbaZu8E8Ci1v4pMpDQtrNs1W6h4W8DEsBXT67LjC
         T32n6cjW6M/bwWvZGVsEjkmgacTajqXs8SYXw68/EaE3j0/w9V/H4WYLP6h9sCB0NBUP
         IbLbYD/BQr7OU+nZKt75Nh3GavpYOBR3dNHDjGt9snP9jPjpk9YQrQeBmfMgbpJ9X11m
         pe1w==
X-Gm-Message-State: AOJu0Yx4XU9VqMlE/vz4UGXCTHjhrHfa91lE0bmzOeuJtkVFAdAW807N
	X78iWLZUrtUvWp4F3MLhmZd93eRQ4iavyWyCua/CLb0iIc6Ham8Ju+kp9OL7t5iSDh4uVXPdYAL
	bd4KUbV8cNzCv/SWo2gAoEwVvlpplDZ027b1aj3LLom/KTEs+IFvlMoRcxdUrWKX2Vt1oxKex5e
	g=
X-Gm-Gg: AfdE7ckeZzIH8+lAGK93Zr4n/1pJo4PgxmJ2+AxXBeaiPEbH53I2SQKXkWYFajTZx6C
	/0RSesQhk4kFomoFbgjAOBJXYec0cCNJSIgdNHOn7GAa8qqvDUWZZJEbgmUxCJlAQfBoWkfPJnb
	Qn7HjQFpQfJo9ZkoS4bsU5dfyK5Xk1oQxLmhKOfdd79/s11EZAd+wY3Hozo7ksBOaGvE0N5O9jU
	+/993nGlpEvSj1/VRMGApI6RG6SgJI6ARp8X02UGK8PZKxwQQYSYHSajiGzf/5q6VXEWZHjvxTz
	mv5yalzfTzQau1FIdvm02Yj7zKx5z2weMhwjHH03xkN6Mv+W33Zhxzj2jqz4TxPq/iAedtfM/h5
	6Kxfvq2IggXTJqaJMUz5aih9Sr4wKHDJQ5oRrrXk7zsgZqqfMWsA7wl45elG1nHBIT58in0TSPF
	uN6YKoXtZ8gmRGJE7c5AY0mlApusrawZqv/cAqgVxGCGHLsB483NsQqmQ6bUA0bUw=
X-Received: by 2002:a05:620a:8015:b0:92b:d4e3:1f08 with SMTP id af79cd13be357-92ebb60a9fbmr144507585a.55.1783353002892;
        Mon, 06 Jul 2026 08:50:02 -0700 (PDT)
X-Received: by 2002:a05:620a:8015:b0:92b:d4e3:1f08 with SMTP id af79cd13be357-92ebb60a9fbmr144500185a.55.1783353002233;
        Mon, 06 Jul 2026 08:50:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm801997066b.37.2026.07.06.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:50:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:49:56 +0200
Subject: [PATCH v3 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
In-Reply-To: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfXwqmWskUXI0V9
 odAy+P8xGQGmACkPAQ1q3nidAPMMPULjFbc3j4pV9Fqsoha0EtY3PJyDhd+U/JvrlJz5pXWJxxF
 6RPfDHz9blVe09mQQUW5BURTutUwOnA=
X-Proofpoint-GUID: S88SihOInUIgTGpINMe8-Hw7GXDHvwzO
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bceab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qHk1DQmvcQX4ZLEpXeUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: S88SihOInUIgTGpINMe8-Hw7GXDHvwzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX2ca+4gDjClBF
 5AzHKk57DrWQGBM2zx74qtEYdQH2HGWiBLOdZPGsIkdXyXc3r01C4zCXZiNzbhHPpaqPaGVO26k
 99q/7ka4F46MrlsId7Qe2BRuihqfXeQLw6BDQuVBZk3e3aUN5tIDS2zQlKti1tjIwm/ombgo8tG
 N1W6KlJJvAJzAh4qvRofTbqgIm+6e3WZRMJgOfrsm7nr06cvWRQkXL8G0ot6lmutJh3VmP7tUrQ
 iBsj2OlIz6cdO4V1dJ28ReTY8ZPjoAeX9idaMk2PTjY6Qnk/t3Zi2TrMbItFiqf5O0y+rmPARbO
 OmwGFwpBK/FchUrmg+iX4Sqhhdyvg7R6OuRvypvDI59mnu4Dt+6CNLicdV2CqfCQgPPHmcAHlEp
 kpCl6lEG4h7iqfkbVrXg9aH5rnYPusUUGeuvjE4NUzuNMqfEQRc8nhBIKfIp1qw8McagzCnbcza
 OukFjs4OjlJ0eUNt5Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8938-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 5DAF271350F

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 104 ++++++++++++++++++++-
 1 file changed, 101 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 4034139e3f770a1035208490a9436bdc33387279..dccdb1d9421199a51cac5c7f3f7da503caa35622 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,40 @@ patternProperties:
     required:
       - reg
 
+  "^multi-led@[0-9a-f]+$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]+$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            minimum: 0
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
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 3
+        "^multi-led@[0-9a-f]+$":
+          patternProperties:
+            "^led@[0-9a-f]+$":
+              properties:
+                reg:
+                  maximum: 3
   - if:
       properties:
         compatible:
@@ -96,16 +136,28 @@ allOf:
               - nxp,pca9634
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 7
+        "^multi-led@[0-9a-f]+$":
+          patternProperties:
+            "^led@[0-9a-f]+$":
+              properties:
+                reg:
+                  maximum: 7
     else:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 15
+        "^multi-led@[0-9a-f]+$":
+          patternProperties:
+            "^led@[0-9a-f]+$":
+              properties:
+                reg:
+                  maximum: 15
 
 additionalProperties: false
 
@@ -149,4 +201,50 @@ examples:
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


