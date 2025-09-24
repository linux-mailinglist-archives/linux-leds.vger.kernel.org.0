Return-Path: <linux-leds+bounces-5584-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E77B9CAE7
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 01:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D6A53A9F60
	for <lists+linux-leds@lfdr.de>; Wed, 24 Sep 2025 23:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882D62BFC7B;
	Wed, 24 Sep 2025 23:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5pg0CNL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFB1296BA5
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757423; cv=none; b=lcrFH2PZycNPCGHkJ18kKmDJ45Vld8KpreKM0b5WNvLELa29cXSvPy+juO5h344RrW0OidqKU18X9E7UYa/5S96Y4mRC+8YJ654bts9wjeYKt5itwItCYQavQqBNiP2+otwARs9dDeLZ3n8R6AIEvB/UAACOjARLI4/pextSTsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757423; c=relaxed/simple;
	bh=+PguNXnKz4shlGzI8jizbctu7QM/1nClTAgxolHd+Xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WZBZdY3OckLU94PO4hhumciXBIR0r4BeBKojNQ4P9JZ2xUfbMMbVkt6BVmbg685sNTCGabuwznqLXbGQNS9qElzwPoY1SO76BFrPGGyURvAB4682RGQ1ZnQhs2c4Rk5npo12vvqVH37j952CE3xC8oMzX6jnDk8R5yMNySQ5w9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5pg0CNL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODCtMv002152
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSmqcMOdgm06/uXCrcq/BO6IeQZcYft2rlSV8w8pItw=; b=V5pg0CNLOhyclzB6
	1015W++m/kBMoFtdlwGyrHkZLaNKyJ82wVVIL2gw9ueN3rqEgisi+0ty/hWKp9lE
	RKexsSUmfi3RSst7FKY6uR+LsyiBtkCamf8KnnnnEWkx3tuTwvq+eqF8/Ql1Fht5
	opnvS8LxNW4nbqDDY02OcInwQuoh6y919PqeEZ4Uvj08tUpLt3mBEMp7dpT8IjI9
	atyvsm6ctqFF++bnzdDadO6/G8Q7CqYrMRljDr3UE8BAOXwvUfM1OOMnRFwXr5Io
	2/k2sDExj+kPSjwdC9FInAqlhCBstrdQx9F+DmpKWH1MYSBk9ntxne4C5AWxMiNR
	VavUSw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p33x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:43:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77e76a04e42so934995b3a.0
        for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 16:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757419; x=1759362219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSmqcMOdgm06/uXCrcq/BO6IeQZcYft2rlSV8w8pItw=;
        b=PrVBeNCElLX//DJDqqd/zBB2DTZjaZPdQOi/SSjRen7cPMu55qmMizFQ6aDbCUxWqm
         oS9JcExQX1kmTLa4Fr55MtVJmZ0FzaW/RzOOSAWtsjzrV4ZvVzUufAIPi3+NbDF4mu/3
         CdiE87JSET7gbeTg34fkA3tEEjLP6YsNphaz05SrLzvJkqcUcGQo7Rq83/69FGGM0GPw
         nFBtLGCi/8EGfLrhvTVNju7Ef3hrla+fMAOO6bR+o4+otw9HVagC2Glfr4vz1cLTte5l
         fmFeT9yAdel2reBv5hTIvyePeIUKY9gjAPtRoj2lycx5oWHbjcdu9LepOo8EoLtRazit
         6fzw==
X-Gm-Message-State: AOJu0YzqVFm3qJvMMO4Hoi0yyOt0PyYpZhvEVYZnZrb4Kg1Qm0XqeJXw
	Ksw/7kKvjCIrUJ5is72NaeLenazgdmBR0jwarzZ+G2YmT3t1+W2PdHiiwghimemm58qDwA0LW9G
	3tF4EDU755tCoHfRyMQ9O/GNzo5rdWchOnjbTwm1ICqZL4sQ3jwoePhOKj6xP8P0T
X-Gm-Gg: ASbGnctc9HW/X3yK3OYXfgxyEK+x7+RqjvCRWTYeL1gj2MJXpjIZLUMNtJ+Azu4Ldn9
	dgWCjhYAzkigLj5iVdN8PUUPjVXoKmmhtcpEwtarLL2yTFOaCGt+2z7kwyWeYspeVUI140R8sEK
	Mi8PBRGL8zxRJLk2u7Uzza4gj0FVTfPNjGpdRR4dgoYc06evQwLx3rDzoRNRmPPqJy34gkR4slT
	olhUaGPspouS7zYiCTo2D9fwePMzCPAUDWEg5KegxUQkcNsQXwFQDwWpDHxjty+OB/h5PdzPIHk
	HO0hIUBwYkQa+0bPkxBPESCWXfDd8aJ2VDzbzirMdAxN/1ZA1/U1GsR5qZf/1ZRzrK8JiNIJkWu
	maOz4Z4faH2aSprE=
X-Received: by 2002:a05:6a21:6da3:b0:2ac:7445:4947 with SMTP id adf61e73a8af0-2e9a98848damr661866637.19.1758757419460;
        Wed, 24 Sep 2025 16:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcuIRmS7RIsvaeOm57KDRbm38CTDuz3keIizggRlO/lUSftrPyZWVJOOBtLRd0M0r4HDiNtA==
X-Received: by 2002:a05:6a21:6da3:b0:2ac:7445:4947 with SMTP id adf61e73a8af0-2e9a98848damr661843637.19.1758757419050;
        Wed, 24 Sep 2025 16:43:39 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64599sm192088b3a.70.2025.09.24.16.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:43:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:43:33 -0700
Subject: [PATCH 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for
 PMH0101 PWM
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pmic-peri-v1-1-47413f8ddbf2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757416; l=851;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QTBiSyI3nJAg71OzCZCRGKakt5nc3BD7jBRfC3qPe0o=;
 b=ItnrOGsrkJJ9kT+UpfamhX55N903VnN5e2kd4l4ebA1exELav+BfJJ21XIOhHTSOY4pKg3vdb
 +4In3GHQJ2WCZVoeV7Zy2f6F6sBswr3gjW/6QZeskFBwgalGXzeVfaO
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: DEahL1EU1pSnhpRfBWIeO1wmtNpDhyKp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXyDQfWc3nPCOw
 YtLTSmwmi5w0L6kP9OuDEzP6VZaz0lzlVh+SfVmBEDXYsPvdQqlVYVHeTe70H3/Qc2I9HVbOXUf
 wzDo+tHqMVF5CK6H1A5lem4Jrsv6Zz+KzurUcpW/4euJqwevdZ0hiuDqgrEyEm5EMZhaMlCkq7t
 Zab435ThYsjGhX33OB90CGPiipJuHYhdsPBMhTSgd6aNnG6d4/Iz7YKSUW4+V28hS3prX6XvvEO
 pvT0jqfG0OWSNYOyGpVwzY6xS2OxSmHdQI5IvDg4ABEvNzRq+9vCdtBLDxWNBmiyMTtXqjs7cQn
 QD+l+L9cDXexaAL3CvuQsDsfFaggMgps/KNO+jSpIvPYIiIkxSCsE8mdkMDbD70NcNtOXY9Wg/0
 AHXnLVMM
X-Proofpoint-ORIG-GUID: DEahL1EU1pSnhpRfBWIeO1wmtNpDhyKp
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4822c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5jWUu6Y50JxcgPCnrowA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

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


