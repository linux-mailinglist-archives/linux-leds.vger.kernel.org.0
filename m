Return-Path: <linux-leds+bounces-6416-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72260CBD747
	for <lists+linux-leds@lfdr.de>; Mon, 15 Dec 2025 12:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6742C300CCD0
	for <lists+linux-leds@lfdr.de>; Mon, 15 Dec 2025 11:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698CE32FA39;
	Mon, 15 Dec 2025 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHKWjdkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNixLx56"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DDD32FA14
	for <linux-leds@vger.kernel.org>; Mon, 15 Dec 2025 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797098; cv=none; b=P5cHZ1Mz+SpQIC2kYIx77KcXUmy9AQuKX2yUKACmAWBpZTuaaEapl8ZqDUqTi7WLyCw0bb1yynWieAaOF6zAZcwCUQ+52oDVwnADXYZYDi2gAp+st0QvdqrkPilAvgHubFESos4GQqWqsu946a44rSt1PI5XopPdd29wrfanQcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797098; c=relaxed/simple;
	bh=DUs4wJC+VDe1QuwgJs0TQdGCZpxs4c2W//GgpczUYho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=meWOBSW8w+V1zk2UXDM/L+OlCulrH3FZcMt5eC5HR9uP38U7wkag0CyewKfGXYvirb9n2Oz/jInT/NTTTq0LWbWgrkW4Xc07xzyHbpGBR2hPQLtfkcaeXGK1r5lyPiFWMbodA/yJaSHHEprSoQVNLqk1hhnsQOGpRq9dhNrdsDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHKWjdkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNixLx56; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFANpSI675929
	for <linux-leds@vger.kernel.org>; Mon, 15 Dec 2025 11:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ffG3VR+qlMIzXuQA/U6HHK8nmsBe+hFJK9dh88LIiI=; b=cHKWjdkjB7mQZ87d
	83A0etNMLzq8sKdPDGgGstDQQXOUdD65B62vL8j1tNaqhRSWFj0kvzWZ39STuyZ6
	50e4kL3/KjEkNRPw3JFFDpVWgcPkrhjA+VMhge1uUtv4Pe0g+dTns3Xtrh/gNk1n
	zUAVx6bIa9eluY5thx4znkhJ3cs5LTqVgNRUf/9ck4uJ1Cb9qabFBmdk03VUoVZG
	6A69pkHovjyya0v+pjSKvEQZwzYtWLUUnXMrewcefhrue5VsOiHbc3CKgionR4xR
	JRrZNY+xM26v6NIDV6GWU/bAxSPjPQ5OkGoZvAO7tJwIs4iwQrYnUDo9enMmHaTj
	Ehd1sg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11cyma66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 15 Dec 2025 11:11:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so3910697b3a.3
        for <linux-leds@vger.kernel.org>; Mon, 15 Dec 2025 03:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765797094; x=1766401894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ffG3VR+qlMIzXuQA/U6HHK8nmsBe+hFJK9dh88LIiI=;
        b=dNixLx56m38GP65bak+AHBERlVarj/+G86hqyCyhl87tznnMl7d8KlagIGZUQBnMqT
         +F0wZgh6D7r/lIuFSwejbQYaUfSJnl5CxkGdwl3clkVUePNsK5k0bfAzVzhU8SNnhwGm
         Markm4IaIbxROLhcP7mecpTsV4rOD8E6QPZ2fs+G9AZUIUehCX9hNa9WX2o+4Tt786LT
         s0htGg522OuyWSy9+p9/mPsvqERziUGpSJG08+m1wLnsPzOmBMc98BQifEGB1mqxcvbq
         xjoefn82Zwn/SdTSBRJbgtDaPvDjR8AXtNqBwfn2ZvmWayh1U0N9jHWSqMSaUX7jzTCa
         PckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765797094; x=1766401894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ffG3VR+qlMIzXuQA/U6HHK8nmsBe+hFJK9dh88LIiI=;
        b=ISY8sAVDCtD4l15rI5Ti1aoI87l4HWYv1ha0XhC1NJr1zXeJDKo6E+fwhAhTVgVEty
         OctKRQyuxojG/KVo8XXxozK3rIRve+yHF8omHGP2ifwuBJeqYOULDXdY3GicVqDd7Q2F
         YYB9dMAO9dpIggDYeW3/Rr3XmQUXOhfjdcF0ZEGUeNbp2vIyQV8XJKoNmg8XV08dwL09
         /+VcCTCGm9uzmRs00NP+qnLfjRJ0ZGhU6LiLpugRiMcKJ70VMAOhE47Romj8Uch76Zhh
         TwHLij2Nv6O2SfdotYm9QBa1rh7MnMEzTB/G9UHxWyX8poKYm2HBVEjlZG831VMDtP2q
         cbfQ==
X-Gm-Message-State: AOJu0YwMGSPTgDGzUcYGHnH7qSan+u9mk+DjZwjVE8voIux8ZQNqb2cG
	2uCTTYhcvE3tn9Mg2MKzNGWAi2tpDZXW1mTwI4jkQrmy/AatpcHB+xwPPPM/JWUpAvy/n4aCH+g
	FarQvDQ1n656L/Kmumc4Bz503S8GCQ1o1Mpv7wFwk6NwESSZntDRevY+PYwwXFv+kjhtpDODq
X-Gm-Gg: AY/fxX7dPgi+x20xCiMgDOKq/sw/EX9JJeUvvuLCbWpZIkO98uda1YFvDseOPWq0/Z+
	Pp2RXM+1JOmWce+fn587G+4KB/3e3zvqMr+cms5kNUCBDRC52XwnoYqaL6jG6L2s/lMELr0mEK7
	GT8HTwhFw9l9yprfMKp5TsuiJUkYXWu9ulZdANonE0nbOj6NO+mtu3QpAvvXHSZmKxVqla4sjJ5
	Na8CuYgnCWQWdPlUt7iC1racaNBAeXD/anl+2d0/P/5Tt3HuEMB4qpd84cAsFws8T3VmwNLcfyK
	PJP0H1bnTJQXKLlPssSB02VP28Y8p/pRB9w11nFOf2JFa5TFEzd5dx/Y0n5u+0YQGYi4x/UjbL6
	3WhDZl/MgbJzL9lCG5aeik/L/zXMNTjZN3baHsdgwkkFT
X-Received: by 2002:a05:6a00:420d:b0:7e8:4471:8d2 with SMTP id d2e1a72fcca58-7f669a9517fmr8364722b3a.51.1765797093053;
        Mon, 15 Dec 2025 03:11:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMAG3FqJ3rO8O/F6vgV20Uh7A7qwd0IDUFCE4AJkIO6SxD7DJFPLNODUpHPj8MI4zg4KfsjA==
X-Received: by 2002:a05:6a00:420d:b0:7e8:4471:8d2 with SMTP id d2e1a72fcca58-7f669a9517fmr8364684b3a.51.1765797092519;
        Mon, 15 Dec 2025 03:11:32 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2379e40sm12408918b3a.5.2025.12.15.03.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:11:32 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 16:41:05 +0530
Subject: [PATCH v3 2/2] dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101
 compatible
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com>
References: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
In-Reply-To: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765797078; l=900;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=DUs4wJC+VDe1QuwgJs0TQdGCZpxs4c2W//GgpczUYho=;
 b=+fdqUtJl468HYmox3ssrVw9vp/3lRX056AtNh36u3Vy3N1dkxQWuS9TMo9IMZ6xkbB71AWhsl
 JHQj/nwLhH7A+blW7EL0r0WRqfU1WTBZRpIy7ZJSi1OiTKksuabu1DN
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA5NiBTYWx0ZWRfXzLJvxCvFE/fv
 LXO1Egx7jJ8xheAxB+4qugN8m+ZgTV0eE0cjQMEol8lLWFrDY3tEKwOZjjaiJg58xTNj4R9i25U
 Hj3ZiMKKsmGBOyDkPgb3ApHnAWVquDgZGsau52+Ob1mnUOBYtSbMNzsHIYXMq5rbVZBvyTPPLWs
 qzFmbywUyJGT9nLmn+dSKANyunFy7Fz7uywpJIrvd+jLy0AGWKwTYZGZPCXutF0gR61/+jIkrw9
 aDWFiolf6XkQOmQcDUf95TaQcHFGLi3eFY0mfhuj8WsmiUmZ9W/m/rBDTcjz6WBEmDnEXlHHFCW
 bXqWDaFU27f4qgN7gAHP7Kftjljqh1zvNR5uEQBFbDm+KcBtqXGtm5FR5cAfTQfrnGT7aOgjgzm
 OzTCWBsHfkxY++HAc1ahYlEzWBWG0w==
X-Proofpoint-GUID: QtM9xCeIWcwXpyHapcoz_yrtUQZi467W
X-Authority-Analysis: v=2.4 cv=Afq83nXG c=1 sm=1 tr=0 ts=693fece7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aS6jM6utL2cIvELFAl4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: QtM9xCeIWcwXpyHapcoz_yrtUQZi467W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150096

Document compatible for PMH0101 Torch and Flash LED controller.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index 05250aefd385..3bfa24ff58cd 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,pm8150l-flash-led
           - qcom,pm8350c-flash-led
           - qcom,pm8550-flash-led
+          - qcom,pmh0101-flash-led
           - qcom,pmi8998-flash-led
       - const: qcom,spmi-flash-led
 

-- 
2.25.1


