Return-Path: <linux-leds+bounces-5588-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA8B9CB17
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 01:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AA973AEAA8
	for <lists+linux-leds@lfdr.de>; Wed, 24 Sep 2025 23:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89EB2C3247;
	Wed, 24 Sep 2025 23:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA7w7HFC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E762BFC7B
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757449; cv=none; b=mDaKwIrDJA0spPTbpO164kyf5YB7m1k0zpDq4PAVgY8+dl5j5koBNkMLhcrUjxDydROTu0cmnl6oC5Qa8LGhlTSC/tC7l4elulCa18lV8NwQcPQb0Mo+ssyEXFFj73UODB+X9Bgd1aoA0UkDCo8hwUrmtOtcZULme1s+3d3l9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757449; c=relaxed/simple;
	bh=6CSXlCZwl15wpvD4tnn4P+V9Gu48Alpev3pff07bAQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTN66xppNP3ZJCcfKfbG2k+m/CrWiihkRT971JO42adeBDTjJKm2yJXC+9pEwdXtfQBU6tA2WluhFUc7lqIWX9bPQDHfudwJri93VyS+OoM6mWDNwcYfpSAEwpmPDFspfVYFMz60gcLspuhvIQTenfRJhO42GCfhHUhLUAoOUSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VA7w7HFC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODLLNT025133
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h74aNk7MomfcVP5U+yv9902v1K2etOMKqpcz1QWtIc0=; b=VA7w7HFChVb7xpYy
	F+jvt1i3tBfpqClLmE703lfiqifISvnyFVn08T3kBLI7x4icGAX9uk5PFuGaB5Z3
	sTip920ZQdJej+6O3oZgwsTd+98h6HmVmKAh8kZtO3vI/C8nxagl7OU2QMZjTL8m
	QCuMwMBD4zx2/Kz0w03/Z6ncY7MMk8Jf2w4TdQImxKyrdUbD8ugBq+HPTFbILUBq
	jo5hBhUd+R7f23UzpM9ggWUTN/kHJRp2Itr8q7um05/InqK07rhuapp10dpbTGO1
	psYbOFAgJlREttHEC6l7k/MAcPcZixipyOUXnGA/6O0Z0IntCIHqxApIxL84KZMN
	9A7tkw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv163f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:44:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eb18b5529so400589a91.2
        for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 16:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757446; x=1759362246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h74aNk7MomfcVP5U+yv9902v1K2etOMKqpcz1QWtIc0=;
        b=NBcGwYkw6Pq6EH3joIE64GruJgLfxEoZyLUJ7D+RCc15KyQWAFa5ezEuzw62gsx4Sr
         8/zrhunYV9jmHZPafqWEC4SsZmKSKQtUNWhjD3c1kAqzjX/0xJSMdjKuwx0JDJuhZGhQ
         kJl9qscLOhw0ElC7e/OtpdQdIr+DDhPTBMZg8LcAXtXX7SZdZM5v5Pc1NrEzagwV30ff
         9z9ixcCXjdjQyYH879gqi1xREmtP1KAdsvf+AeQDxZcAwUVcPMPKz+sm0vaykE9aFaOT
         XVFFAqedtODtYRU3TwI12iWmcyx5Up/EThpXhFEUlg1kwzf1O2Bnp5oEA5PjcQKsP7Zh
         1Iug==
X-Gm-Message-State: AOJu0Yy7MnHZiWNTkPzfch6iHe0YjFnXHsbfldEd5yBCxj0u2s/FtZOF
	qIDajBQOwoUkFtgvkFzLiP20lK8jQNq4A3ZmVYNQULYqbx05lzH0yMR9ETnCHs2/RdsvZEo/xVf
	1wFmd0gOnhSUREbTtpUyJkhuqyk5COnqw9WHvfSvghI4VzL1t3qIRaympCH/17v3p
X-Gm-Gg: ASbGncugaJBXn7QHy0xyT0Xwxo8vhPzWkVfcK2430Wb6pwndWZD1KOoVO/Ll7hlQxxq
	vIV58IG0efShh4VJEVfQ7BcLmJH1JwgYu02qzc3g1JWEQMGwBgg1hQfBPC93Pu3t7WoovNs/vhj
	cF9rWDZGSVDYSlcoTm9JL57jGx6kaQ99dmcGv2xRzpDfCl4ByiCNcH02nKPIRjNQV4gai8GdWaX
	cyHy+9+EiF9xm5LclwDPT49Eh/FH6p8lOp5WNtcGh9pjcCDH1Yqg3H86TigymxU2Y95XmeYvI62
	YaBOs5F1O9vrCvg68O58ggm3+j3f6ESpepBXGWQKQVg/08356aSiaAu32WW9Vwbin63+gLs4cko
	R84dh67/jEy6PcXk=
X-Received: by 2002:a17:90b:1d92:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-3342a2c0fcemr1354155a91.23.1758757445737;
        Wed, 24 Sep 2025 16:44:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8z+A1KWVQWorWWqyY31DwajnrkzdDoaEzs0mWZGfa2IXLHTbGwMZrfxiPvY3rOWYAjBeqZg==
X-Received: by 2002:a17:90b:1d92:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-3342a2c0fcemr1354124a91.23.1758757445329;
        Wed, 24 Sep 2025 16:44:05 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3347453dc35sm206983a91.16.2025.09.24.16.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:44:04 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:43:54 -0700
Subject: [PATCH v2 2/2] dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101
 compatible
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pmic-peri-v2-2-32316039db2f@oss.qualcomm.com>
References: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757441; l=900;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/+orHcqdoCJiYis1BeSN59ik+XCNFok4pl/dlM9EI5c=;
 b=NB8xEE8JiBYmK00CC6N4C4DUA4nCMYhZ4ZfvNrUTiP/i/Fwf1en/3kenpwd1884NFz+f6fqrd
 9kWFHGSI685APxoCgDiVRB7S/OYam8MHTifIyoTG0IrPyZqU2n+58e3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: l75I70jl0rkUkjR8TaADMaZC2yHLpjZj
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d48247 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RkQeGxZFYsPkH16At1YA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXxs8fPwJBLUhW
 nr11umctB3MhpEvir568NF7ANMdgxzrcEbELSlo+jT1yB9FNjdhwiXx894HP/hCuDOwYVkRcIBk
 OUHj40qkJyV0+cEYkN5Lk0uqkx/JpHlfQlDh3lSRTxhRiRimDJGBOylsHPMpvZei8tpU8m+0l5R
 qmqZi8fDmMpusVkeEpA0juu0LjzcdL79GpLR+7zHP6/0KyMfNyIJZ07+X5KBAWkAKk+md1siuxe
 21fLRt3Q7uA1ii2NhWVGcaUZ3yDv3lGoJtGnD1blViIpz/t/dfVJJVEeiGmrJw7eEg9VD4gi2ps
 NAlgE6V3oWa4JGw6ii/bUQdqYmxg4bzD8Eop4GnsmZXhasD3v9ECP5NjtFTv+B3Dh52626vqLj2
 DplfWxYG
X-Proofpoint-ORIG-GUID: l75I70jl0rkUkjR8TaADMaZC2yHLpjZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

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


