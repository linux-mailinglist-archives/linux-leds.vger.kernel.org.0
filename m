Return-Path: <linux-leds+bounces-9005-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dhdGJWn7UGr59QIAu9opvQ
	(envelope-from <linux-leds+bounces-9005-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 16:02:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B173B8D7
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 16:02:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oD2z+ZjE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fPGMD3az;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9005-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9005-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1AC13078C19
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 13:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C73D259C9C;
	Fri, 10 Jul 2026 13:49:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58531C84BB
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691390; cv=none; b=e7h/L1qWnQl+qFqO+7T7RIkUx2XpmqINg9gKHeEec0FyJ+qBbjVT19L+HqfpRKmFsqsZI2hs79D6qE9Om6kld8DnvyuNMfVBC57iHHDYX/RnoLAPVwlwqx81mEM/2hDq5ijrrvFermbigheL6HTCmLmCOwicV68jisnF/+cE1h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691390; c=relaxed/simple;
	bh=d09lYffK7NKQtWks133wtN3qnkJ/qWtJQRxHm1karAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+h05nMaee6N9wORchukGsOGRyfui19YXFZJDDqWwucS2IvxVfn1WzVCjpxIA3tbdByssrBnHV8/cjxUESCuqRLNRXrUjdtpfEbVPpD5unJRUSx8DjjTJWauKP/uArYQ/8jk1e2u5Gl8ZF/JtbDSBaEesMpc3ZFjnth7RcC99WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oD2z+ZjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPGMD3az; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5vHE919930
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=; b=oD2z+ZjE+c/m/MoI
	MjqxMNUP0+Eoif9yAsCdqYqFUVOkyJXw0zrDKJyWDdaTBK/h+exCq4zptZo1KMdR
	D9ux4oY/YJwLn4hUTCpWsFeM7bUjVGpa4oyLT/2+MLrYukTrUtyjL7ftzoSqlw0m
	rRUcNMkSxiHCGIrR51guUxVPN0TgaoFN9jLTOQpi+SitNmvMXRfFFd5E09Q1GIAz
	WsWJWVzoaiGirPs03VLdxHRX0BISn9hpN2dA+HNLAcJr9mBJI2LJbdCY+RjigEd9
	K0Si5D8x8oTajWCASY9zT4qC0CSo3xm4dDHRexMAHO4x22yT16TK110qGqgCj19i
	RDY39g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte3bth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 13:49:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso24954881cf.0
        for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691387; x=1784296187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=fPGMD3azt9D0FK7eIh6f82O5k4p9JFa3qwZjU0wvIRnxmMksoHRd1vzOFFvz+APip6
         6gkvFHRDEybfpvjaSFmZSksUBE4ldLVzx864rjlri3DASXLvpBbJumNSf2TLULzBn+Ss
         Zk+FzPS7YCnrMAAbIS3wNP7vK14WosGArB7VnCH9QEARCcWWyKH05vYV36ULRsufbUBw
         AKsUmNCvt0JhpW3PZ4IDrZYxTH2d9EH08Pp8ZaslX8Wwzq2ZFdTlfyt2f7Q03ddaELTU
         HyWaLZnED5K0VQh1caLvzrBh/tGToTw4AKDUxCRRvnGYdU5GHJQxxt+b1ZpYMKRD/kTx
         ddOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691387; x=1784296187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=cWUjLAvYe1MtP7ZHtGWfTdPgZHVvAOi+X4vtwmUI+pqAeDPVZcs2v3aUbby9kS/+5e
         2WgxCNCwKmdtvA3YPz6g1IgCmrL6w0U7ovoEOsDLCTYv6WgbU/Mcg1bBrD3L91g6iNUa
         vH4FEp3vjSMdIq+A44Qrw+tKl6l89eKrLM0vOCq0NjyXMR7EdQ4h0A+0R+Cj86X2q+QY
         q9uJ9+qUXaDwPcoFG1LhPt/YdI/7dbNlyCM+/rspZwisljjwnRHkDSi6GZOK7axfVKhc
         QNo4G8/F7yKY/AnX9rBetbwLJvnUTQ4du0ezV+YAVlpb2VtcS1G//y8KTln9haT0NwXd
         9ONw==
X-Gm-Message-State: AOJu0YyCuPnqdla12jNpPCFZxpemcgl+j1avUnvuIsrWbSfzjmWB50Pp
	Ja+3ikUA4c6ezVjzHAATdoWJw8dhQsTLmBEZ1NRZtY9lsYdb2loAxMcRaFbC7VnlCaVZvSOd6R+
	sPRzjNBphnJ4X+GQTV+JkRWwc/2vQRhessm2/9EXN2tDpA9QYbM02QVhj0ky67WvL
X-Gm-Gg: AfdE7ckR6d06EyIpZy1Ya8uyKTQ6MrvlwQWan80FY6wmz6B/kcTNELwlGWwc+XyIT7W
	yQt2QdnkNhP+MMMn7lLpJ9C+bhRy0B27AgRiZzeFMOWnQnCd+jyKk83ZiEn/i83HUBWZo82iqbh
	dbE27eZe8mMZqEgQBhB/S/tHBpkAKDbhqxnSe04XgcOrcYixB01+OpEMJUTVdX9xHDQDqu31NN3
	+dT6wUt0pghkIuoBJWFcUuFqibv2VC9sXT1om0PJsbUwp143Yp+4z61QcQdFMkO+stgFLuIHsGK
	P+/wb/tUNoRgCgIGe2SPy04lLlX7dMZsxcXGt0Xo00WROtNsV2bOkDw1abq2/4tHImOQL6v4mag
	JLmk76gkhAksJnYekWywGmvciZA2tXCQ54T2HELb31wCyDY2wCwl+tNpjryTVOcg0pLoo5zvNKR
	t8GOj7UBmT/0DXaMRNVAJGtTo8ojQm0omoNhogvqoQSPDt47LH7FMG4xQ5TGvSr15sXW2ylPgMd
	PBmaIITxllNaJ5NDKSk
X-Received: by 2002:ac8:7f92:0:b0:51b:feb2:3827 with SMTP id d75a77b69052e-51caa1702a5mr36452611cf.32.1783691387106;
        Fri, 10 Jul 2026 06:49:47 -0700 (PDT)
X-Received: by 2002:ac8:7f92:0:b0:51b:feb2:3827 with SMTP id d75a77b69052e-51caa1702a5mr36452251cf.32.1783691386647;
        Fri, 10 Jul 2026 06:49:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:41 +0200
Subject: [PATCH v5 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-leds-v5-1-a8972d28c28f@oss.qualcomm.com>
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
X-Proofpoint-GUID: YxqDHd2ZsEvh6FcOadYcMh8KFujTe8FR
X-Proofpoint-ORIG-GUID: YxqDHd2ZsEvh6FcOadYcMh8KFujTe8FR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX6qkg6k9AH4zk
 ovIeXOLPTGp9ZSLpfH6AOAKPTqUJivKWPoTraAEhFZEZhrETGZS1BxcxLIe9LWq+1X9vyseFdq9
 2rq9mrumhrh2X4O3DVrDrRdKrpeIJyEjnpGoaBlQxtCwVzRU1RudYWaOyzV0YjJS2/7C7uVvJjl
 CcJEAkg52N/wQioYbbCT/JdWuQI4DpeTkxx2jttcN+eS+E6USDFLd+NW/k7UI8bkPAQBKQpnbPq
 kecYgtGM6wkCLWOLXYd4NxgYWkx+UkoJtnQS7NsqcHyEfYYNLSHXgGXl7RPomeA5t67x9CedOdZ
 mrKzU66/+PRdJX0W2qiGdQmQjsI8oB+y1QDnmUDnnh83Vh4qMg4f//EVOF4krnfBapcWPL7MYtE
 msZdGKJuYm5nie5fSagrEAR2tcb6410sOGPehSSvVooptHeIDCCa5+lAyUlpC1bhKSH+RDUlQNq
 KFMY/gfFeoQ4zSPlfpQ==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50f87c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfXybFVUTtpC8Mm
 uNn4dDv1gejkmim7qW+XgPQ/ntSYN6o79g6mvYS4mI83E2qniQFq4lXx+7pAVsjbZPr2SvrQP5F
 59Uq9mD7BcEq5xSNqPYXG9dCRWcy2hE=
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9005-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,microchip.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: D88B173B8D7

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and set maximum: 15 unconditionally
in the top-level led@ node, making it the default for pca9635 and any
future compatible. Also tighten the node name regex from [0-9a-f]+ to
[0-9a-f] to match the single-digit hardware limit.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


