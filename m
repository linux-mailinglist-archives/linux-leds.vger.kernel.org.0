Return-Path: <linux-leds+bounces-7373-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEshIKVNumlvUAIAu9opvQ
	(envelope-from <linux-leds+bounces-7373-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 08:00:53 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D8C2B69CB
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 08:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 164D13019FD6
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 07:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB0A369202;
	Wed, 18 Mar 2026 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="QL6ANUiM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C24364958;
	Wed, 18 Mar 2026 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817245; cv=none; b=FapSAq7FDVNdlgMx8fL3lCJAXkRwc1BVJvdgiCTpvOrHnpBPDfrqMW7sOXLGYwUYnsMcYgJ4iYqK3/bhv3LmpZMq41OVqKaC1hGhIlr7IcqQlnsWQpaIEhK2qjBxzJpyrqsNaLBpIGIdodu6yuzt3573Q288Ydbhav0/JPN/oZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817245; c=relaxed/simple;
	bh=RPGS3auzLa3Zj9BdhQuQbW9we5KqcRRhPvqTLu9PTk4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=sApZuVKkwKAE4tYC8Fsnk45vtMCO6HC1UMbs1ip+O3pBbWHK2oDVTMA709uwBoa1gLlGpXwEGkHxQUZsbCI19r/79tN/FEvERM3c29l1/KTmAF554F6tictOPWp5j5Kc3/yPV3bDEXLbJDBJxuxs7Md4hmTJ9Rr90oznhJzcgzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=QL6ANUiM; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I5eamR4040894;
	Wed, 18 Mar 2026 03:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=TiJ9EOuYS2LnjwDdLxbL/SbQL2K
	6Fg/k80LArgn79NE=; b=QL6ANUiMSVeGRtZukn65yZXb/HKKZm4eWApMiutzu9g
	cktgqbQ7ZpEe3IZBJpbTCQre7ySfrSHp0VfGbFafx6SDYPJOF7QZHtgXKU6Z2Afg
	S7XjzoBkhVgSy+LIDnhBi7TBubLEHUYP6qrJJQ6F+nljAvEfTMWRwXXBLDuIdhYU
	+11JFZzuJGDC4A6L+/WT3pK45X13CQNaILjZubsJW/WRcIt4aHv/FV2J6skaGbv4
	J3qTyIySMsRtG3vDJTPZ/3j+opkWW1uhnEx420ZYe3Ct7250pl4dAGMUtB1aZH8/
	k4C9hpVUCMLkM9gU6GEpfwOgW0lSzL/C+O/IB2r6RQQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cyjessher-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 03:00:39 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62I70cmp010593
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Mar 2026 03:00:38 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 18 Mar 2026 03:00:38 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 18 Mar 2026 03:00:38 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 18 Mar 2026 03:00:38 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.27])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62I70PXG031847;
	Wed, 18 Mar 2026 03:00:28 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH 0/3] Add support for LTC3208 multi-display driver
Date: Wed, 18 Mar 2026 14:59:19 +0800
Message-ID: <20260318-upstream-ltc3208-v1-0-015f1f1e9065@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdNumkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ML3dKC4pKi1MRc3ZySZGMjAwtd8+RkC0szi6Q0M8tUJaC2gqLUtMw
 KsJHRsbW1AAFXP9FiAAAA
X-Change-ID: 20260318-upstream-ltc3208-7cc8968bf69e
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Jan Carlo Roleda <jancarlo.roleda@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773817226; l=1135;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=RPGS3auzLa3Zj9BdhQuQbW9we5KqcRRhPvqTLu9PTk4=;
 b=kApm/6OFyYM6c1eAelPPofMIqIuS90Yhoz5f5nXcBUa4aktsetzMm32vJHQ45ziw955QZA4TO
 IJx/Q1CVoCCCg4KRzMDlg/gtflVY+pk6en3Cz+uhfxx5GrJD+NSNIST
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=SpWdKfO0 c=1 sm=1 tr=0 ts=69ba4d97 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=YeJ3jcQhQBvMQWeA9nIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: YQZuEsyxA8ll-ZIIWi4nXIjzVP0NOXSn
X-Proofpoint-ORIG-GUID: YQZuEsyxA8ll-ZIIWi4nXIjzVP0NOXSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA1NyBTYWx0ZWRfX1cR+muttv5OT
 wLRJmCAHkSFH9IcL2kCuKJLJ022nYcZUKgYxZjfSC4h3f30iX/OmSfzncOgTPnq+uRrevG/uGeU
 1I/6WCX2ZBvPhlUHA8N9O+F6K6Ir7bjBP0Ke75mx2WMpZPnz9LJ/RiY7GWctcNUMLIQntT88lw7
 y8pCuAsEsVbvGe4TJLY8vcXnliIh84v10QPubDdXhX6J7F3ckgvQS8k5XVuGSFTIZqTyCXRlXx8
 lYSofVx4Vdv0AVu7jjJ5qyeS3rxgj5AJREygjIz6T4qfq1Il+ceYfp6DN9WeI2G664yXuWJh7uZ
 RfX9eSrknlLy9a3+puk+3JmLtKfVnLTvx+q3xi8zQTtmbvV17gNvAj15AEoLruaJjdwTKhENh6V
 cQ9kls++cjMhI5VNFVT9BX9mYCnnwuZKBK4XFdQXdPGHptaYSprIiFZH7RLXSnvgenZfMjnjiuV
 MFAqwbLI3eEgUcr16hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180057
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7373-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:email,analog.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 92D8C2B69CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
Jan Carlo Roleda (3):
      Add Maintainers to LTC3208 LED Driver
      leds: ltc3208: add driver
      dt-bindings: leds: Document LTC3208 Multidisplay LED Driver

 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 159 +++++++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3208.c                        | 298 +++++++++++++++++++++
 5 files changed, 477 insertions(+)
---
base-commit: e68f95a51d1a8c1594b536c4d495cbea38d47561
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>


