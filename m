Return-Path: <linux-leds+bounces-8797-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +VuuGx7NQmrbCgoAu9opvQ
	(envelope-from <linux-leds+bounces-8797-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:53:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A36DE833
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:53:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WQVSOeVX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H29ro2eJ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8797-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8797-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FDB83046FFC
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 19:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C0E2EACF9;
	Mon, 29 Jun 2026 19:52:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150833264D0
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762738; cv=none; b=JdEP9eWFIWOw+JOOn2lrzFabB4ueMn85AHASY6YGwLoCOGIPdsrwcSKLcFYwmnfgObYbMDQDr8EeVdLUK3XClFpkBmgCjofs40SSLoHbydbJhvHoVjQLlPL8PBV1sz3Vn8NWwf1Cww6nQvuwCQ9xGZFT6/UsVIHn6bgVXoo3HdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762738; c=relaxed/simple;
	bh=t2q3hueHHFjC6M3y4vZ/UbqDmOXn3O/w1GSgT7yLWXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IObwMYlJbdt+NurZdVjGWJkzUZIAoJ0nsVJqPnzVNvBBa4ynLCxO/VOKdaCBrQVdE7xJ1KyUsgE4S2z5WKf197UWucf4wCFHfR2lGiRIbny8Wg4X/O5uMQaY0HHKktWOsQKKYipgCrWdPAb/4BXp1hA0P/IILMewU/hUAnE9Lt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQVSOeVX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H29ro2eJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGK1li3401229
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnEry42tBD4SnoUYWwOk7jguZ/PQRVHc2ptyoseYjes=; b=WQVSOeVXMgnFA42v
	B/p2m8zTA7rgwtzmAnRBdOh2j0uj1nVmtFX59WhKYE9UZxpnLJ06U0vCP8OAsONV
	LO4/gX9NrUC3ZaepexbEdILQ8XMBzC49QMaHPjIeREOI+xijpce+n9CnYNwX59JG
	Lu64B5WY9k2tLTj1JNhAUTeaZ0yD37IYar4PQyfZwD59a3q7i8m0wbMSzP2xbaFl
	PZvIQR9J7CGdzvGteTnuB8jNjkjaaZAIMbXtQuvIvnPgcLCoZPHZZubG9m0IRPCK
	N6LYOV8ui0OBxk1xpuc7BXhKclKZqRMDJtVpDhMqu6ULuY6nPiAiCl/rkPvYNF6s
	GDlvMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnwaut3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso58682485a.0
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 12:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782762733; x=1783367533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnEry42tBD4SnoUYWwOk7jguZ/PQRVHc2ptyoseYjes=;
        b=H29ro2eJz+r0MPUydCJXRYzmhgIm9FN9XMrpcub7NvDcgrsOYrKlZj5eFctaj5Fu0E
         KGDjxojWJGsy806/dlRMeyOgx4cfJ1LUVzIKFaKMxME/6kxk3SUP0KjYFi2eIHz419cI
         e3Cl5/yPDCHRBtoSf62UIdd97RCYuXF4j2hD2vujG1MTX3RDQGsA1VXQS8GWJxTnp+6N
         2q9tWbZEi+4Qx2k6qzK6sON44uG8u0p5bp7x94u0jx88QcZk1NuDZzg2A9gab9xAAZec
         eQnAqjrYRIB1uRxqTX09x2So4EqX1nQDFPMRX4dzXY1QSvRPMXG0HK8J4P6RSVJhGkxv
         eF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762733; x=1783367533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nnEry42tBD4SnoUYWwOk7jguZ/PQRVHc2ptyoseYjes=;
        b=V5ETM+G7JijkkHbOZHj+fL+BhWzZKfg3A2wcdqPnBe47NBAWgHMx6OipFxcvkODBmI
         QpdB1p5pCoCzjsXJZ+1zzjy+fSJqrm2BiUh+sxgEmSCly5GUDDKpHxjRfFTexOs16gUk
         eQDQVRCwikPhOaWM2iN4Hg57Ys/uEGSEzHgzeea/mmVXUafvUBrK5w2GAYx3sTe+Jsd2
         lxFGQJewe8obaZnO/+nIyOANaeQioMcm0sxGXZ4Q7a4XsxWRwXi43fEOBebP0dTdu8pn
         SWc7K6QvCb3oTV1Bqume68CgUGJwVSn8xnX+rt6lQ0Ke6I+qw5EdKyIBFZ23fp2x/h1t
         S2ag==
X-Gm-Message-State: AOJu0YyX3h9kOduuJe+QgYjBUXuDT+d/naimyiaVL1j1v8lQWyd3guHv
	HcDZ+Hz1HaA1B2Xhu4DhK++LPgJIj8aO/ZtC8uDFHXECmN7oodLVPOpS42Wfke+5T5qs5JxCpUq
	0oQPYj2JYW6P1QI9yDdUAl3ow1U3bYuMkfuHC++ydJZ1EGvoetRaei1CRyEgKfeLtwtZT0vlVOn
	U=
X-Gm-Gg: AfdE7cnpDXXw7d8z7sg8K1ZF2KR8t2DghnATZs9r81RpFlEcZFDicSaW25SX3cKUgjl
	Lhg8Z8LPhHpGaqlMLG+qYXhdTTKgnyTvStYfrNeSWosLRZtjmaWu4+LR54w8AaUQwoQzC31fPfW
	jw5Ub7yvW5Wx6jx3vIcgRwQzBRVE+hP3Fn6CKzDlervSYubMjOcb5LGX6sVPhxyl8riPjMoYllL
	nbQcxoOI4NfRnrFsqVImHI1DmdzJVHIjZy2VLuY/ujMhd/pqJcGK03vva8sC3f3YsO+Xu3qaslT
	xUhpaeKpgt4ddJMjHKmugKrcNMphJ2krbCGkcmewt342pnc87g+CFByUP2T0rgEBy1/9uGri8zx
	Usvu8cLaWe14Fg05wXno+G4+EDRvP22x7psu/DnsGMgJ2RxQVVK+c23cjYf9ApHzLlMaJh8XdwM
	WAKW3makWo2/KimAb1bULLDzWylPCm5DMVRqpiX2nWXS7PV961gLgNXxBYv6Z2hbsENync/WW4B
	X7CRuloucHspqiUXO69
X-Received: by 2002:a05:620a:1d01:b0:92b:6805:eae5 with SMTP id af79cd13be357-92e62818b40mr152195585a.66.1782762733256;
        Mon, 29 Jun 2026 12:52:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1d01:b0:92b:6805:eae5 with SMTP id af79cd13be357-92e62818b40mr152187985a.66.1782762732482;
        Mon, 29 Jun 2026 12:52:12 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d99565sm6360005e9.0.2026.06.29.12.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:52:11 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:52:07 +0200
Subject: [PATCH 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-leds-v1-1-0cf7c0a7dc14@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX1AvDIeDVWBvf
 lZFqANBZubZk54Agl7/T3DbDIyAfixDSKu3/PyCtKW7rTXbOTNffKlqQBC0E95mHSY6REZbF/8u
 PDTHQafAf2O25YTG1b43ISn5phD+b2M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfXzV3695JfS28V
 hnFYqs5GD0A7rGyaT1ZhBhrV46Kx3wk+9aW+l3OuPB5R2aYdo6MP7NUD6H3tYhicTAy2JRYxoAX
 rNRpikf02J5yqN9ZXsHMGjm/F0QVslbWZ3ql1crSjyCihwl3TTaef7r806WNYib8XHVxc7HFGvK
 Zmum80bGIDRDN/8ZBPAK/pVUK2ks3s9/yMIPDnxU9rVdeW0/Rj5pLqWpkVKRLBHD6lilo4tdvAx
 Z8ArP7MXj9AdT7UGPxuIyFOQqtOu2g2hshsflgJqiqLzJ87H+wy5kKdEmvAk+CWRh2jqW6Zyl//
 0sxyboDcilkeQZ9/qdKcg2tu7RFXa9W7jWxnWEI3D+P/h5UxTeK3frPh7wfl+6cnjhI5nR7CmpK
 r1WQpTm9dOwIr/rPpuMcLRaltpj+KVeaoBskOtrTL3ShTVYc3Dh5lKNbdUEmSCQM3AtTqoyxfvg
 lPS+nt1uLOhUl7hzp9A==
X-Proofpoint-GUID: hRW8BtZvVe6pAZreTMSWVsowUkJSDK3k
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42ccee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hRW8BtZvVe6pAZreTMSWVsowUkJSDK3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290166
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
	TAGGED_FROM(0.00)[bounces-8797-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 064A36DE833

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 83 +++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..09ec140c5092950c54e1d4a55f52e11e8dd7b0f0 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,39 @@ patternProperties:
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
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
 allOf:
   - if:
       properties:
@@ -84,13 +117,13 @@ allOf:
               - nxp,pca9633
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 3
     else:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 7
@@ -137,4 +170,50 @@ examples:
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


