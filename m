Return-Path: <linux-leds+bounces-3948-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D358BA32877
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 15:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C89618828BA
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 14:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9D120B7FD;
	Wed, 12 Feb 2025 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dpQiZ5Uk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53CA27180B
	for <linux-leds@vger.kernel.org>; Wed, 12 Feb 2025 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739370646; cv=none; b=CL8HD8SqRb/4QsV+Q66SqfGlOnlBHGX6iIAh/tY214q+1VIOUu4vDBa/jogEmqqjpr2xpH/gHUJC0Tg3MVbIMSvz4uUv8W40pqW8PthjLZdpNjOFEtAP1Y58mADjYEyACpBARty9cge3h3SD6P7ZSm8bpdYjE+lFl7pi6Ud9sv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739370646; c=relaxed/simple;
	bh=h6TmbT1d5R0P+dDpokLZA4S/Lxc/xYZre37OWJoMIHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HN6xRmv/Qizwby0FS1IikxQPuQ5twcF+zsfpp7ZW0xLgKLNTmhTFTXvJq8hDK2NQKrWZcbYI62p4SFyJwFF/IV2wqAZhoU8hTnOT4w/mwZ9PpPawhaCAhvON3yOt1kxv77EuaboTN9542HcshDgOQ5pT5pAUjKaDBdPH3EHoJK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dpQiZ5Uk; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CDJvOP020597;
	Wed, 12 Feb 2025 14:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ZEh8G7jvCKPbLR+7Q7yeSfA6BCb9HFU1cysyCHnan
	1U=; b=dpQiZ5Uk2/yxc5TZL1TZoO+a5sEwwn612kz+/ggJ7JIx7sGkhcdliExdK
	Cu1fzyfTruATdP/oESXsR+fZE6q/zkJ3YuFvKmffaIwewzb0y9uFfplwdSps+o9s
	0gVjX6pTEHO1eMOzklfX7E64Kw4Auop1mgute8nrzKUHgAbmswzDlxZPr9Zm8Ivy
	HWie5VwnEldzO5NkgsV1cWB5FEPo5HzP+FSLgJeCdFhbFRAD3LAqiIMyg/RJGN6w
	xMXJadgwIbgSIPlkSsPghAOxkSfjP4K4IS+hVk0aeay7S97VDnBDttpXeR017cpm
	yAMFXjkzBu7XslJY665lJK6HU8cGw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r9cue6nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 14:30:40 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51CEUeXC022827;
	Wed, 12 Feb 2025 14:30:40 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r9cue6nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 14:30:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51CE60aP028716;
	Wed, 12 Feb 2025 14:30:39 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pma1rwgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 14:30:39 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51CEUdkf19333810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 14:30:39 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DB1E58065;
	Wed, 12 Feb 2025 14:30:39 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CC5158067;
	Wed, 12 Feb 2025 14:30:39 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.210])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Feb 2025 14:30:39 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Cc: eajames@linux.ibm.com, andy.shevchenko@gmail.com, lee@kernel.org,
        pavel@kernel.org
Subject: [PATCH v8 0/4] leds: pca955x: Add HW blink support
Date: Wed, 12 Feb 2025 08:30:34 -0600
Message-ID: <20250212143038.1416501-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TWWVHZoxtWkjp4zusNqr9wypdWa7vaaz
X-Proofpoint-GUID: VE5TqOvEGDYVvANDE-0Ju1k7Jf93lTBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 mlxlogscore=597 mlxscore=0 clxscore=1011 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120111

This series adds support for blinking using the PCA955x chip, falling
back to software blinking if another LED on the chip is already blinking
at a different rate, or if the requested rate isn't representable with
the PCA955x.
Also included are some minor clean up and optimization changes that make
the HW blinking a bit easier.

Changes since v8:
 - Fix comments and style

Changes since v6:
 - Fix erroneous return value check of smbus block read

Changes since v5:
 - Use auto-incrementing control register to read all the led selectors
   at once during initialization

Changes since v4:
 - Set duty cycle to fifty percent for blinked LEDs in order to maintain
   the specified blink rate.

Changes since v3:
 - Initialize return value in the blink function
   Thanks Dan Carpenter and kernel test robot

Changes since v2:
 - Split the cleanup patch
 - Prettier dev_err calls
 - Include units for blink period and use defined unit translations
   rather than just a number.
 - Use positive conditionals.

Changes since v1:
 - Rework the blink function to fallback to software blinking if the
   period is out of range of the chip's capabilities or if another LED
   on the chip is already blinking at a different rate.
 - Add the cleanup patch

Eddie James (4):
  leds: pca955x: Refactor with helper functions and renaming
  leds: pca955x: Use pointers to driver data rather than I2C client
  leds: pca955x: Optimize probe led selection
  leds: pca955x: Add HW blink support

 drivers/leds/leds-pca955x.c | 353 ++++++++++++++++++++++++------------
 1 file changed, 241 insertions(+), 112 deletions(-)

-- 
2.43.5


