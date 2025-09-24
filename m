Return-Path: <linux-leds+bounces-5583-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CDB9CAD5
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 01:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB33F1898AF2
	for <lists+linux-leds@lfdr.de>; Wed, 24 Sep 2025 23:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39053286D55;
	Wed, 24 Sep 2025 23:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Podo1Hbm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063C2773D8
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757421; cv=none; b=e2fgSnLVlGp/pYYADg/38SnawMsFLUGbdKNC6k+u7Rd2yEk+Ynxu+hBHS/5kvX5eRUxZQBwu83vTw5oRc/8e0lhabX8bCcFd+z2OnUxoruSoZkbn0KgZmHR9lla81krLstTjZUY4zAzLr2Zr7m9jhINkeK7AIBO0xHp0OoaLam8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757421; c=relaxed/simple;
	bh=t7uBoD+cSRGeY0frmDJc3GrPO7PyWVRw817teW4B4Uc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nXEXK78zdXJl9M/D205lB7gX+2K/awKAbhbedrir3JKfqiD7dpJ+20AJGaJnw9Fm8UtWgwKDT027n4BtT7ytxtsqYXYaWWYYjLsaP45yceOXqYkj7u3s0x7BUhH4vzKQZ+MclHGI9wNxLO1Mn25buBmhitYBoJX2iiAJNWkYt4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Podo1Hbm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCtHSW019915
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=In5B4SFUWbiVbNw+6JD72Z
	+7pTL+H4loa1+DnN9jm0Y=; b=Podo1Hbmk0Kex/9AMxoAOFKVXDzwOQ9Kk1v+9p
	Gv485gNO7rbFiXXgFdnYdhZLwwpX9scrgmy9sLfhodG5/cOx8YL3h59JAOwHyr9v
	8I1cjCZMNAiPNBSRjc4P2zBEkIKIfAkzF7AgQPYJH8VX+ycoRqJoC823Z7wMyJTt
	PDg4jKTG4MsmEincYvTr66qhD9EZ0WLnLxUNfLTNizZ5iODmla422V4q1DQLJlbl
	w+pnvMgr3vsJxHe3KvKqrqSPjYJB3ps4qZLTXoLudHEaZEW6RBI/BZGg2RJncUvT
	B2q8+quNi62hkjWoM1HMrMCAnrp69665SA4oMCF99ltYQDog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy9q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:43:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso300961b3a.2
        for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 16:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757418; x=1759362218;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=In5B4SFUWbiVbNw+6JD72Z+7pTL+H4loa1+DnN9jm0Y=;
        b=FS9w/LxqMsAkMUBbEDKW/NDY0Vm/M7L8JNM3yjpVqsfHq0T91r0onDLOQt6rYP/Qin
         MU1lm/9XTa/SJl1n8wZ/D9zeO2/vyF3gri/3kxGxTwPuehrUxmY3Abb98sdQYfuD0Vk5
         mnEh4bKpmdHGAqVXHwU4EkiVJ7e0SNZOabTtL+i2wwmO3hw0fYHB/A6X5/7Ltuynxj58
         Bh7Dnz3TZbLzhUaabScCpDGbn2nAy7vB3TrDD+6FjHGUzkpNqgynaed4NwoCdcRU2BdI
         lL5fHB6xFsS9hnqYGVtpuWBtCNkR/yfTDvwmA+Adpig9Pq1YvbhJoDKEd2O43f/gZr5T
         6yAg==
X-Gm-Message-State: AOJu0YzXheOvztRkEC2PcNg1mSqLAYskKFUd4jgDveOv1xRxLU7Pcjz6
	LJuLlJyOtJ5OS9BNUNGP4ek34e1CvpCrsfFgwV/rT+bvbxT6pvUjbHtJxfBPYHIGNVpTtkG7u5X
	49xyRppZ3VTNsp4gSJXhGMuGcDsFrdj9x5zoKEIE6VUErcUTRstgwO9qIc+KOQZun
X-Gm-Gg: ASbGncsEd1eYTPz+u6mXrB2pb7lo0sKFi0dxZgabhjOmPvS5p6tbG+0VxpPRxTrahDe
	hdAHO5qMU/wCo98XNKdXQIZWX7NRrdMpKmK3kFLLsEzfkhMcu8pM8nwDvhcK0c4INr2YV3wJOA4
	/BBNV3pEynpHG9AV1ybgaW9DfF1KrZwNeS9fm9+cBo2eEhLsvaTuN/1y4jopPj7jonxzzrmF4u1
	QjN1ibOjn8/3U8uXYciw+ppDulppooYlGnyDq51fjIuMmHm9FBgd5uy04/bqVw31WerZo8IMRGG
	qKVA0++hKbJXMJgJXds1zU6y0T4SXMR65NrFmQO/XYuakJgVBeZATtjk8J4RffeIp05caJxUIqQ
	iPpquXS8KCZE2qS0=
X-Received: by 2002:a05:6a00:170d:b0:77f:2140:9685 with SMTP id d2e1a72fcca58-780fce1f6edmr1769859b3a.9.1758757418194;
        Wed, 24 Sep 2025 16:43:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDlOrNCje4Yf6Bti8pW+x17hT253jff+SFz9WfQJSBDEqdRLA+UARXeByWoA+aLojWJr5O1Q==
X-Received: by 2002:a05:6a00:170d:b0:77f:2140:9685 with SMTP id d2e1a72fcca58-780fce1f6edmr1769847b3a.9.1758757417745;
        Wed, 24 Sep 2025 16:43:37 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64599sm192088b3a.70.2025.09.24.16.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:43:37 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: leds: Add bindings for Kaanapali PMIC
 peripherals
Date: Wed, 24 Sep 2025 16:43:32 -0700
Message-Id: <20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACSC1GgC/x3MQQqDQAxA0atI1g2MI1brVUoXY0w1FMchKaUg3
 t20y7f4fwdjFTYYqh2UP2KyZUd9qYCWlGdGmdwQQ2zDLTb4ygXLKoTFQ+Rw7aiPHbVNDd4U5ad
 8/7/7wz0mYxw1ZVp+lzXZmxWO4wRd7X2weAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757416; l=653;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=t7uBoD+cSRGeY0frmDJc3GrPO7PyWVRw817teW4B4Uc=;
 b=VQhNc+8yRnhOFDbwK6RZoyv2w/g1+PdrKQffBcjCCY+Crg3fyOgSPav9opyPXX6Srem+8r6DS
 PKd+UiruCN8C4iS2nf+4Tc/RovOGdSPPK6/k3QePF4PR1n2P7Ja74zS
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: bnJeyvu96sD-_wGyiHdHwSz-FQnVTyaI
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4822b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w1v-58I_rqdrY5_ohRUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: bnJeyvu96sD-_wGyiHdHwSz-FQnVTyaI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX2ldAaiq2qShC
 YFTLlO23puIYaFLAxSKUv/ClFfr1qvLst0aVvoQfxk8oywrBy7/oWZwpFA3NnZGqOA8dAfPirH+
 OkxPp+Wdkvcoy3IFiWtxsf03eqML4oUiCco9x5jh286EVR5voNhxI/ZmyeVOYx2b8MDm4gb3c5b
 t8XZsTTgdf7qXYc/QKUpMOlSOjG0hkmVDhECSKt/VFKyBVNec9lLZCKGD4ebQqAqWZ1VEHDodGs
 /8cXRIIKq6aAsfAMn1O8ZEDlrfjG6AODiqbbjo1VIwUCnn5/kuBof1U0W1r+XZueqDokdmceThO
 LCXZBcQvVkBgeFv9JQ9KVDHlJ9bJRZBbEIEYZ2m3F4ISHVY61dAkphKvi1x7OctWVrR9LnYiCKV
 WRFaxB8U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

Add bindings for flash led and PWM devices present on Kaanapali PMICs.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
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


