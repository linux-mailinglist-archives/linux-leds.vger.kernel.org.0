Return-Path: <linux-leds+bounces-5586-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F71B9CAFC
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 01:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E6E23AAC79
	for <lists+linux-leds@lfdr.de>; Wed, 24 Sep 2025 23:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5162BE658;
	Wed, 24 Sep 2025 23:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XaHniraV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31FA28AAEE
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757447; cv=none; b=S+k6/FRVVOdJf6rogDXfPQeSjEbhf8RttyTBuWe7ahCZhJnRXRDlpZL0ns/i4V6PZm59IzACQV+dTL/deVcsigIhc0jTgpNLoEEgUY91a9qchr++8fwx5DgY1tapDE3O5D6m3X71KBUuKaWPKo+fkrav9ha30daq4SZXObPFcR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757447; c=relaxed/simple;
	bh=ST7vOr29TDO9i9RP8IbSrNRO7LJ0DeNCOw/G8G8H0bg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vzc3naWYPCm26msjLCIfYquoznIsldPNTfreg6Yyjl7W1FK4WWs+/qooUh38y9twMuuNTY1g5i8i7GWGL8/QDpnwuPdqzH03dEwrw3in5DxLE4HdW5HXksEefdxEmT0yWn8JwQfJNkoW0AXGM5djBlQSA4jUYp5FfgYuJxG/0p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XaHniraV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONanZt027774
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=obb4lO5267TXksQoWvciqc
	u5t4/H8CEqGSV3VieHmJc=; b=XaHniraV7tn4fi/dWo9Td/Sp+rB7RvsDXrkSJJ
	NmtVDmvAWfn3XtJs31YegkWOKpr8tWQ/YxnRfOA29joHSbMR+xsTNQzeh+WV7Fqk
	pK1YSjbmXfcbJa8UttiXy21nVZYbDL/TTfhL56mzTqC2WU7uKxFaxxtYEnIn0fA2
	JTP6MNF6wSrACBAabxtRNiBYySm5CiK/MMjNY7a37D7boWA3r5+1mlbMGNgbiTdD
	CrbiNL9unb+Fb0Bmg7UEpB5wEjKdhdLT9SsMHX6HSNEVnSzR4B5PaWCRz7ZPkaR0
	Mvx/khd8m5Fn1kT/eJ2P5Z8/gzB0fEgrp8Jg/o2766SW5cWQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxdx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:44:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eb18b5529so400561a91.2
        for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 16:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757443; x=1759362243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obb4lO5267TXksQoWvciqcu5t4/H8CEqGSV3VieHmJc=;
        b=BD5lf855hP/xJOkjHD8oHoeNTEjrNIc/TE5UdJoXwIv6bsRFarw9NMZGTGlEGZt8Om
         kbun1NMBuvU6EXW/TqMKA/7uY1i5vhWt9WSkk/q4I8+qDeVVj8XvxeqeJEEBRtz3SFGE
         yIbjH0nVTxOmiuc+kubW0CBFS1GOKxhI+rhvZyJE2nj4LHe5VgEbGoiqHDQUIhyV9NFB
         nJo805d/hSLuK6+gzpTENR+4Qer9MykmieBXlPpmAhZXvZi3XlWhTgltzvHqV0sJPefe
         LzbsaljSCcA2c2fYCOMc6feb338sRu6a5ChwN/r0jLNkMc4/rdsC00DmPWBjeJPD8sew
         w+Bw==
X-Gm-Message-State: AOJu0Yz7qwGVoKc6f7PWiDYL61mXvw+KgxKyweJvc72KsAWYAt75FRR5
	DlimbuY6JKwMP3tSkd1r9BftZcF60by2sfo/8m03u24eq3NKDnYrlDvU5I7+jNbrEwk/jXQepuu
	0V7kaa/4TWa1gWjdjXpqInh+ann0X7hPi3J7qOu6RLwsAIz1qvJH7AdcMgdK1mLV/
X-Gm-Gg: ASbGncsualDnPCBGYFlNcOBGrXMJVLCWsm7+3d9gQSv8Qwbiw+j+dTRxeidjhXVjmJY
	QH9rIjz5aJWvfwX0yyVmchiE8kJbyrQF9+XB65EAgz//9zGBwKxOA+9vv/nRJT08LzbJDTgpqT+
	XV6KVNFFBlsavu7j1v6wqAkj7SkAQVA5dePMxlkE1MtfvVsaJm7RrYBlHUnNNGyp5gDHqa3Bdl4
	FsyF5pqJthQMe4L4A8CI4sarpjLs1wdqEhxpa1tDcGqwKUxlMy2ebQHYxBl5/JkkpZ7A0d04141
	XS9SkH8c6Zoa7WA+hu5cfJm2FSrTTeA6H+UaOg0wrve01K+sMqeIpCwNDi+shs0wy2vp53pG0Js
	n0vFVyCU2ZA5eH/Y=
X-Received: by 2002:a17:90b:1d92:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-3342a2c0fcemr1354043a91.23.1758757443228;
        Wed, 24 Sep 2025 16:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0TxC32/4r64+xVuO2ZdIoa+1ml3rjX8myfrrzn8Wie45klXhgJClDIMGhR2jHJwNtuCEvmQ==
X-Received: by 2002:a17:90b:1d92:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-3342a2c0fcemr1354020a91.23.1758757442765;
        Wed, 24 Sep 2025 16:44:02 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3347453dc35sm206983a91.16.2025.09.24.16.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:44:02 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] dt-bindings: leds: Add bindings for Kaanapali PMIC
 peripherals
Date: Wed, 24 Sep 2025 16:43:52 -0700
Message-Id: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADiC1GgC/12Nyw6CMBREf4V07SVtAUFX/odhUcpFGu3DXiQaw
 r9bSNy4meQkM3MWRhgNEjtnC4s4GzLeJZCHjOlRuRuC6RMzyWXFT7KAuwsQrNEQ0hCQH2vdyFp
 XhWBpEyIO5r3/XdvEnSKELiqnx+3FKpowbsXR0OTjZ/fOYqv/FOWfYhbAoaxLUQxN33eDvHii/
 PlSD+2tzVOwdl3XL5aP7brKAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757441; l=884;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ST7vOr29TDO9i9RP8IbSrNRO7LJ0DeNCOw/G8G8H0bg=;
 b=rBA8xpzV+0eQ4YNHV7IuTbVY3dKaHO80pQiG0Ef78uayvrSTLAr4lmDSUQXmke1FCU0vC3Ghy
 iH9uJwaCn6GDSf1Fuf9ILkZ9MUOHjO5BErHSEpKrqkyrznC3eAS9AwZ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d48244 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=w1v-58I_rqdrY5_ohRUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: lqQ8DKJ4isXzGMkt5Di0wPl-9DLMYTKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX+/aYPWiIkeLG
 1NZMJWVUYAyXrRGKzRkBPjBHnrTuFk/qVEY8MO6CxkjbPdiSowP3fwspUAdn9Zg14sj2Rfl7Kx2
 aSfLk8sYvlK749oFjruxihf4LkNrcJb251aY4u34yECfYj7iP/KlwBjuJluKh/Cw7rTI/DB1kv7
 5RscWS36e+uff9FRbQk/3brynQeZFQUoQ4d6hzaGkoB04UZo++q++K5L9fB5kKLShIpzfyL7rTu
 9gzyTc1yeyTe0kWiwvVcWGzay1SQJuw7I1CyW1udNe2i99lxkbR2qOjPoAw+u2CXu3czu2047MD
 gFQ3WgtFJdYYIWORptGmzmVOPz2hc/veIhS/7BxcEVHCOad9MnYKc7khCRtZT69zmwO9RUYIJcv
 loPiYWPQ
X-Proofpoint-GUID: lqQ8DKJ4isXzGMkt5Di0wPl-9DLMYTKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Add bindings for flash led and PWM devices present on Kaanapali PMICs.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com

---
Jishnu Prakash (2):
      dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
      dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101 compatible

 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml       | 1 +
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250923-knp-pmic-peri-e067c827c531

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


