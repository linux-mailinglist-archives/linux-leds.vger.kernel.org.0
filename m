Return-Path: <linux-leds+bounces-5587-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F82B9CB05
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 01:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 860083834EA
	for <lists+linux-leds@lfdr.de>; Wed, 24 Sep 2025 23:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1962C0285;
	Wed, 24 Sep 2025 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhKY6jTw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0341273D6F
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757448; cv=none; b=cOnITYQcaqXtjI9eoJilk7uXkUvVLDBEf2GPyMOEArcW0kO2HMOZ0w0WADsZWVzkiSSeow4mCLWjvKf8CF8TxTtryvw0GbkkxSiSxtuetuKWjd1PRhbAXEi6VQVLXlKJIr8nyMRMQCUSNlHt9LVWaoXXqW2Dhsu9aCj6AhZ2+HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757448; c=relaxed/simple;
	bh=+PguNXnKz4shlGzI8jizbctu7QM/1nClTAgxolHd+Xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q4khBp5eqkz5v1kW26nG2wI+bsrsVOHsNLCHlYG5G/FnvkSSgssl1TqIAvtb5vM0AwzSFtGU8rS5DRmbaw058tN8gKRRMF0yjv2j+C5njh/5jW1BbyPCOKeba9QsPOcB0HXFZAL0qVdC4UwIIAsFtPy3FZoMMSwCe5v74gvYwuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhKY6jTw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODfFp0024045
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSmqcMOdgm06/uXCrcq/BO6IeQZcYft2rlSV8w8pItw=; b=YhKY6jTw9TeZlutZ
	iR9yBjg2+XhWYOJ+6ogv8590TAxqEIlxuNKsmyRx0d8JnigOPGQIbntTcvaxPE4D
	OiqGOngCmLKTnrMPUTVYf8Im6IRKmqkfV30Hbh0fEhel/g7LvPbZ30Hg2dJTkZqV
	gQG5Af+BlWc5ZdutP3qujm6ifMd7ortPYmnE9iORa1u0jAuBl7+ZaWkKQqT6U++I
	t/8rTrAu2gce1/FhwgqdJLB/ti++V2+1gMu7ji+02Kz3wbIkCznThLgkrwdqGWCl
	N+zBydCgt61gMsswQ/DP91neaxo+13tyU18eud2x/ypKQW1jKk7FlVqX0rIXmX9p
	6IjLrg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d3r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:44:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3306543e5abso264337a91.1
        for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 16:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757444; x=1759362244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSmqcMOdgm06/uXCrcq/BO6IeQZcYft2rlSV8w8pItw=;
        b=C+qAbdLrzWIITekrwDrLxMR7k4Bt5x68wx5PXfhYuqmtNsHfWDMUoy5LtQuCVWnZio
         /x6xOPlp3dFmcdJtCAwNHaCQuqcCAsgqYJhbW+HfbmvQlpua0ZKGul0fDEvHxw0EEuHM
         hPr/KEBLKGkDPgVINvfxTw3lEmnHmNP6YNmZTuPVOYJV4vUqP19jSSiNdPgK78m1IiLF
         UAwJQEOpHTSfLkv1xaYEM8ZtiqY6U25BJMR5pDoHAAaFGfmPArUqNXHz4FYj2GU/gp1G
         p9mTJ3dtPBebsHWv2avb0jzbE0lTJZpnguwCJHLDRB5G5e4G+0TMb68OeS825zBg7sE8
         iJdA==
X-Gm-Message-State: AOJu0YyOnemI0yGoipss4+us8zRSC8wHoG2gFK9V4jdGBvfqJkj9qdku
	Ynne/WLuL0BzcG5eNHCuj50XJS9zrIcRiuthNbzOjgEYeaN3t3Aim2Z2CGRvO3Wvx95jlJiJCAs
	1JST19jmfHxaJgMdQ9C/SwRr+fXPUZMB19ETAgCyetgZASlBwaqe114RFlFxT0HQN
X-Gm-Gg: ASbGncsB+ZW+V3/qe78z94w1Gd/OVySui5NdC7HJ2M6Ya33XA+M1rEzO1trFa+j+QPq
	Kz+Ng6/aLBX0nIEf8VwHFCn0YTOOfGtyoQvD4URUipUeeijO9U3rwMATeDnoD3yi1Q32fMzBWb0
	ud2ZV0wFXgU2Z61uhwMXydT4GJzdKIXnjtGJlmdE8d237mFsk3Fet4wxph+V2C/f3e4jIWmFE9+
	AT4BqKuAJG9p+2X5XiDRhWqRcv4QkUjKXxihQCmsXaOp444mc0pNQ8YBNy0QagR7x1u3+HZtpzh
	WppdvWE13jeAsFF5t6kDStPTRrz5pCeC3D0UmErwImw/d2uUZxt/wY2VRDDwHVW7xaTBrt2ZO7c
	+tlTW3Y6+4i6xJcM=
X-Received: by 2002:a17:90b:3911:b0:32b:7d35:a7e6 with SMTP id 98e67ed59e1d1-33456c715d0mr526448a91.18.1758757444481;
        Wed, 24 Sep 2025 16:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnbw/R/ieUMgffqkQ9oegzvq9+haEnU55ylejKV2ZmhkVF/1e0/sfHGVVDCgw9SQDnekgoCw==
X-Received: by 2002:a17:90b:3911:b0:32b:7d35:a7e6 with SMTP id 98e67ed59e1d1-33456c715d0mr526428a91.18.1758757444026;
        Wed, 24 Sep 2025 16:44:04 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3347453dc35sm206983a91.16.2025.09.24.16.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:44:03 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:43:53 -0700
Subject: [PATCH v2 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for
 PMH0101 PWM
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pmic-peri-v2-1-32316039db2f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757441; l=851;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QTBiSyI3nJAg71OzCZCRGKakt5nc3BD7jBRfC3qPe0o=;
 b=UbnSeZlbwRc86lY5l6M0xtgXmffAuI7ZX0Bfwmk6rotsBBFqtWTyHuumX2J8C0u0UPn8OdBVN
 eq1+Q8xGDKMBSIM7kbMRSfJcBFUanW8HFHCLLohNvu2m4YTTcdUaouO
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d48245 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5jWUu6Y50JxcgPCnrowA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _AcSPPorjpCOSnmc2AE3vL8Nonb5fhv2
X-Proofpoint-ORIG-GUID: _AcSPPorjpCOSnmc2AE3vL8Nonb5fhv2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX36AznMrwZEFU
 VCkrlcipKsK3Wp0j5MNlL1TxGxWI/rzwzH9SbucP5FfhfexlLzvGLb8lqFGEqQo1u+lhUWAtD6D
 r4BcMo/XwLanT8YzKz/nqUyoxIXPOxaLpMOw4zkgjpCXdNsU6jl3jampVaxlVLVIDCLSfkyM9H7
 Nqxx3ODZEEyLcX0qOMa41n+0BfOXUUyxeDShzgxQnvDMp5fOEMl1cXCo1v/yk4+w0JI74p0cLaC
 fPk1HpcCusAoxvjpmJ5vIN1I+YoK/If5H1O8yUDDg31awWdiKeqaLJRIiKHID98anE+mjRnLh1g
 7c4MATiw2VmCQT0450OriQFuAwsfxNF0H2Bt0IHXUSqvvYZOwOYspYwHT64vH5dWRRi1fK3dj9i
 9qR9EJVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add support for PMH0101 PWM modules which are compatible with the PM8350c
PWM modules.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 841a0229c472..1278152e8eed 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,pm8550-pwm
+              - qcom,pmh0101-pwm
           - const: qcom,pm8350c-pwm
       - items:
           - enum:

-- 
2.25.1


