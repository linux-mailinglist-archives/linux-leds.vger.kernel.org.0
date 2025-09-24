Return-Path: <linux-leds+bounces-5585-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D852B9CAF3
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 01:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31FAE3830D2
	for <lists+linux-leds@lfdr.de>; Wed, 24 Sep 2025 23:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1E12C08AB;
	Wed, 24 Sep 2025 23:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCmuuGg4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665A2BE7A0
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757424; cv=none; b=E2Wo9Ny+lmHyNH0FAct/kA6xo159lE7p14DYbkZg7rlDueXiESezu+CJjDY2V8VFZy9wh/WTGioKszxsxeqw1Fn35P4eR2L5O6F9+hPlB0EQZhGEerRMG6ed0AG1c9tBL7aByWpkRHcTKODgcsM26bhTS9Zi6/yFjzwVyt21dfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757424; c=relaxed/simple;
	bh=6CSXlCZwl15wpvD4tnn4P+V9Gu48Alpev3pff07bAQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtELdJm+6QR5vZosN0W0cqwJu1rNup26NGRHHPCm38bZlRwMreiBH6C7X3ZBq5zVTsH7M8aBySs0Az2Jn6yUWntgUAgSQFKce0Zy5AQqmSXPVfuuQCW7esY+HM5T53irtVp6JM8Tga7euUhi5eSP3sKCm/Ze85LwwFAaGymoHsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCmuuGg4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCW1MQ018070
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h74aNk7MomfcVP5U+yv9902v1K2etOMKqpcz1QWtIc0=; b=hCmuuGg4/qdsfiPd
	AE/M7auyVnfT186ipCbKXHTq7rrgTWqZgJpLIDOfHGfISNDBBmqLmZDedy4VHZeZ
	sMSfc62lionCadMuzCZXIoWy1dJrvg6gqWYWFD254OPk3N59rG4gMovj1CqKVm/G
	XlSW4qANs7+AEL8/2v5lK6GJkSF362xuDhwitkEUszFsTMJxpJLsCy5Hx0PCjcyd
	qhvlw+aVQmXKrvtg2A4v9Yik7DU7Zms6ya4XERBKxiy1PCJ0JZoCY/oKdOIX+oEr
	4WTMnQqT55LiZSV++jm17k/5gIhMBi7BW3m7pM0kzuVlS5kefb8isKTjnM/FClwy
	rPlzTw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kka1dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:43:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780fb254938so335468b3a.0
        for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 16:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757421; x=1759362221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h74aNk7MomfcVP5U+yv9902v1K2etOMKqpcz1QWtIc0=;
        b=Ho855648RJdcZ3bO+5xJbYSM3BNG8dzpDpT0UM0NPLIRfasmipQS5+RA3P0u/qKJBg
         O+3Bf5FPmeLGewooeIkq6SCTp7ufoQ5nLYuYPQek0eZwvaz7Gmh2ax2vf/+kz2KGodhT
         kuQudjIpgp3YEE0UWO9Mx9KBunjvrrILmqZMn9AcEKjie/mJiaKUrDkWPh87VPE4nROQ
         vDNNT9fgORcAQUCJUYz9lLGsDUOvbVX0nWQyn8iDWbMZA8lZwz1Rb1P2QGdwdYI+DEI1
         xzk6UCAR/xgkCTo24luEhioIgDc9WVCYnk6eVw2urqk1twJPsvZt1M90+iuxxlNfhj/d
         fqiw==
X-Gm-Message-State: AOJu0YyV6oGUUMQ74VOaZLw9dQVi9lpRF/nO/1uLZOZvsK15uSMdArEu
	iQG8wMxgDHK/ZJ0K7K2a8WyNemxBGVOKHHvncDr+rFr01n4ZbKCtR9HXBE2IsH7URQZluMGkZk6
	+4WFaj8fEH4jG5pDqB1gsQR2U1zwaxwNL0k3Q9zvoa7PU5oBBsxJ4PoLoF52ADaVt
X-Gm-Gg: ASbGncsBIPZJ6iZMQ5yF28M51lIFIjuZZcAdrJ8rLMmRMBjqyX59rspJG8xzbeMuXpi
	zom2Vchbv7QvkEhNKcRhsYOV4NG4dMElocZ7bSF6kYmEnymWpBfLrRxK9Enu2SIf+V+jl7QH04q
	ERL0KCO6Z4/arcmGoMuTpUApUVzq/IRhN45bumsEJDZd97lCnAWokoT8qy0uGBD83imYRRA+a+G
	Bsif8mzZkyqmG2MlRDm33XFjismGIAMD2gxiHghNGZGqxA+Znp0pkH/0IQOnyrHIulWgfzqPU15
	PyHkHe5iXzevsRhRZjkzxc1D9HdMVIBiOrzlg9Y1YOYrktD1/x3YjluDA1fR1y3JPpM4g/lPjKI
	N1TmWWMMI2anPuLo=
X-Received: by 2002:a05:6a20:7f99:b0:24c:dd96:5500 with SMTP id adf61e73a8af0-2e7c5089ad2mr1405274637.11.1758757420677;
        Wed, 24 Sep 2025 16:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdCe0j5CR4NDWA6456FRnN4l/jjecqJTFbVlhKpwlC7CmhUhcUtXBR9LkhZzDu07Wsd2uVKw==
X-Received: by 2002:a05:6a20:7f99:b0:24c:dd96:5500 with SMTP id adf61e73a8af0-2e7c5089ad2mr1405253637.11.1758757420237;
        Wed, 24 Sep 2025 16:43:40 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64599sm192088b3a.70.2025.09.24.16.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:43:39 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:43:34 -0700
Subject: [PATCH 2/2] dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101
 compatible
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pmic-peri-v1-2-47413f8ddbf2@oss.qualcomm.com>
References: <20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757416; l=900;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/+orHcqdoCJiYis1BeSN59ik+XCNFok4pl/dlM9EI5c=;
 b=z99WCkBgPuSR7Ka1AneTYCNVrG8aURUdIjBbvNJ/OjMWWtA9dLXxnQzPuwbV4fpBLrZvq0N8n
 tHxQq9Ww+JICGc5rCuQazqbUKGXQ2zHqaAgCP2wMY7itPMv979fla+p
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: xRJC3WgNO9tlBzBr2vhE9STkfQI_rbER
X-Proofpoint-ORIG-GUID: xRJC3WgNO9tlBzBr2vhE9STkfQI_rbER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXxv1xKDOTBBR0
 /wZ+Dsz9ad0WrkeoXuSFPjf04ANg3GqvLTa3m+aZyeYcFXlHreOqnxT2PvFy6f7omHs/MvRC12P
 5jDuDCy6xLHeita5gmB9NSy/yMiJFchEseZ3rOvjNzp0u6OryByTb2fjzg0zzjfIFZXNDprFj+6
 O1zj3yfA/JFiFZYVUefPezoynS6q2NnWJfDiWh2G8SU4MLbfQ9rISPAaWFwgjMWdDdmLXWPckmy
 LJV4AokotMcps8OwolU38AkoVEO0Qh8R7YHPQjFxAtgEXIpgy9hoa56yXlmIQxlfq9fxCz2ENvS
 uvKmhvO+/xcEc5HOxcjmELkIYuEFPcfftyFYUbNO2Gkm+hwIvuaJ8Q8ObUpFamUxlvfYaRzJA4F
 IQRhRhrc
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4822d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RkQeGxZFYsPkH16At1YA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Document compatible for PMH0101 Torch and Flash LED controller.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index bcf0ad4ea57e..0df3e460a792 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,pm8150l-flash-led
           - qcom,pm8350c-flash-led
           - qcom,pm8550-flash-led
+          - qcom,pmh0101-flash-led
           - qcom,pmi8998-flash-led
       - const: qcom,spmi-flash-led
 

-- 
2.25.1


