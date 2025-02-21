Return-Path: <linux-leds+bounces-4050-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C92A3F969
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 16:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 614717A7224
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 15:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEF21DB958;
	Fri, 21 Feb 2025 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oZs+XDzo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622B81DA612
	for <linux-leds@vger.kernel.org>; Fri, 21 Feb 2025 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153118; cv=none; b=kFVseWBZBAuPpRvNr9QUtIzQGeXe4Cw0iRoRvGFXD9GyrPGM4jc7b70Ivy5Y84rCuxcnt4kcQw7Go+2s7P3MmhK2DSBMN/L6hO+AAZNqvp7djXAnUnbxDkitH5u0Q/8PP6cKX4E1wqGren0jMiRUBJYjV4nQm/0C5hpMEZE/zDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153118; c=relaxed/simple;
	bh=KZq7U8+nGJMot3sK9tFvGqG2pul6QdI2CtaQ/fWWIvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1q2EMUApViFnlHqyDWUeWRL+u8R1f/WOQdywgiuIVy93qu4dh8TyP/jzWmX3d2PDyf8v+gOyrHU096bhmSv9Tub0KhNiFwRkNobGr9EjqrKV2EQA857mh6z38ZUFyNymRzcpozWZpHJDg4STMkXS1TDImdGD4Q0ZvlZZZoviI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oZs+XDzo; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6QUwQ010017;
	Fri, 21 Feb 2025 15:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=e++4XMTcBvqMXGJht5j2TJ0tOwHc3MRqPpgF2V69A
	V8=; b=oZs+XDzoqUMAqAgINwU1hcxOybVcmE/8r9dV+PalATt5X6ubFL5VWLG9L
	kTIrsboTkeKTaOWh8AbEHdFSmEG8SwLefzXoM+snKMtjGJtPQzAsthvzxD1XSMyS
	AZ6Cfg1562nlpimqFOwk3WXD8l3FugyNlc6ErBqy9BaioAnDKo2h4f6on8p64dUA
	4PWQWA2paWJU4UOqHu2DOnGxgN07nUqDHZHxZ/ZaNNiTat/GQlpNg5ksjwP82zgI
	1LikiuxCsDz6o/Fxd3ewTQgKH2VIxtHablKC4Iesox6s56ej791MRjHwcZPznMFf
	uGXMeo86QzkiXfA7cHXoLr/wiD5Fg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44xm752pjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 15:51:50 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51LFdOD6025629;
	Fri, 21 Feb 2025 15:51:49 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44xm752pja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 15:51:49 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51LFWQSB027095;
	Fri, 21 Feb 2025 15:51:49 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44w025gsmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 15:51:49 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51LFpmIV25231646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 15:51:48 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C2B65805A;
	Fri, 21 Feb 2025 15:51:48 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0183558051;
	Fri, 21 Feb 2025 15:51:48 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.129.233])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Feb 2025 15:51:47 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org, pavel@ucw.cz, jiapeng.chong@linux.alibaba.com,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH] Revert "leds-pca955x: Remove the unused function pca95xx_num_led_regs()"
Date: Fri, 21 Feb 2025 09:51:44 -0600
Message-ID: <20250221155144.2109806-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _Ggj_NlqPzUwnUw5qFL4qBk4Mhry8Arf
X-Proofpoint-GUID: MYLFeSxPKaeVwEkkkceK8knoUvlw03Z1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 mlxlogscore=568 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210111

This reverts commit 38bcb51f81af17a6d40fc135e565fc1fb8aa8e9d. This
function is needed by the hardware blink support just introduced. Also
rename the function to pca955x_num_led_regs to match the rest of the
functions in the driver.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Sorry for the build failure everyone. My series was pretty old so I didn't
have that commit to remove the function. Simple rebase didn't conflict so
I didn't notice. Will make sure to test build *after* rebasing next time.

 drivers/leds/leds-pca955x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 156649e1e1c4f..e9cfde9fe4b13 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -147,6 +147,12 @@ static inline int pca955x_num_input_regs(int bits)
 	return (bits + 7) / 8;
 }
 
+/* 4 bits per LED selector register */
+static inline int pca955x_num_led_regs(int bits)
+{
+	return (bits + 3)  / 4;
+}
+
 /*
  * Return an LED selector register value based on an existing one, with
  * the appropriate 2-bit state value set for the given LED number (0-3).
-- 
2.43.5


