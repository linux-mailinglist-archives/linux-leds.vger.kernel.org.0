Return-Path: <linux-leds+bounces-7499-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CIECeRixGkuywQAu9opvQ
	(envelope-from <linux-leds+bounces-7499-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:34:12 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B932D0C6
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7203530179EC
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 22:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A7E32573F;
	Wed, 25 Mar 2026 22:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="J0hQFrPQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2996C269D18;
	Wed, 25 Mar 2026 22:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774477947; cv=none; b=cmCDxH7jNXPlERbJVTUaC57z6zGs+lyHEPg12ofStSXc//33CfI+iRUi9Y96iL5qrIyeRxAbKFEdjI2u+2LzASurIKfUdQZfTpHckQx3LxHw2k0/dPqZLX1ZSh490U0xHrd8QSpl2SGMA/Bpav9TmSS4ZTIctxNY8rxiyUypwPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774477947; c=relaxed/simple;
	bh=BGHbC0wpqIjRx49NrwF4kdL6z4I/PyI1ypL48cYM9nc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=O2KyikXY6a6zqdHdednvZQsIPhQ0aDis8swd4IN3BKYiUsHZi9ktikYnSPRRUcmirBM/iFUsJe6VuzrIuNCowyxObpeWuLzkd2QGs6e0n7+ncrgczd2zXE2JcYSySgXCsNQ+q3VKbMPJYabw3+L/Tf9F3x4hAcn8wd9YthQDvEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=J0hQFrPQ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKoOhZ3463638;
	Wed, 25 Mar 2026 18:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=lIEAzyP/bI9sOEaPsMpjcTnoLjl
	71a0Yq5hRKFXKvZo=; b=J0hQFrPQUsLFyrJ6u4/u4GvuFF5a8UEvRyUNhzunRAn
	vb6AqWAdDKirD5bcQQJ4chN5dOfSGkdXVDTeN6oFfDrYHxd/FaSlzYS3kUzq7VOu
	GalQdLkV0vcaC51eidLsNoYc27OaWe2o8o7LcCXQW4DzQqJ90/8SKmmardVdHdCx
	aRZCOltZI3g41mUYWR5TNKVe2HeBQHjMzHOt4lkFlFM74q1vwV+77GRlJwnto1Ro
	FbNkjoPDV5ZbYcbS9kP/nC7b9A0WcalxRwFbHiFDUWfBgIqqeuhCO+jvYkiJd2qq
	y5kLi6UC8yoW63HeYgJL6Us6A6YxlzpipVNTZ+XsABA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4d45m1nj70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 18:32:17 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62PMWGMP054872
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Mar 2026 18:32:16 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 25 Mar
 2026 18:32:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 25 Mar 2026 18:32:16 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.22])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62PMW4ah032703;
	Wed, 25 Mar 2026 18:32:07 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH v2 0/3] Add support for LTC3208 multi-display driver
Date: Thu, 26 Mar 2026 06:30:09 +0800
Message-ID: <20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPFhxGkC/32NQQ7CIBQFr9L8tRigKYIr72G6QPy0JC00gETTc
 HexB3A5k7x5OySMDhNcux0iFpdc8A34qQMzaz8hcc/GwCkXtGeSvLaUI+qVLNn0nEpyMUYqIR9
 WKIQ22yJa9z6S97Hx7FIO8XM8FPazf2KFEUooGyyzDBUVw017vYTpbMIKY631C8DHy5WxAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774477924; l=1450;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=BGHbC0wpqIjRx49NrwF4kdL6z4I/PyI1ypL48cYM9nc=;
 b=n88idrvOvEL7IcTsYqyAbxDZJRcGSKDrjkQkxYl2wC+Y2q2I0Of6qCgd9JLsdXJvrTlmWK4ze
 NmAWs2t6PwnBNKZCE9m1uijdB8m112YZdqAIgo3b92tN42PRYqf0DjK
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2NyBTYWx0ZWRfX+wHKX3XSo5p+
 UM2sSO9ouJ5HqGCu4Pufz+ocMp/zKAg3tF+6XxFJ1Cns0SAWAQ9c9GQhwfzmVwkvabFVn7DFAP2
 P3ZXoHTX0tI+DQR2HmPX5OYlFHaVRxhdMZt2uoBjhmCct35K9BLSC+ydvhZZMv4zuvPac5ns/s/
 sscaGqdcRan5KbedIEARAmVrLrZiNnSTzLLj5cWtx89/pmrepSf7r/ktBbEDoKlO69cRnQ6Sn6A
 KSjJAw4gr2hGoT0UCXxl0J1ZuvZq/LW60bbi7dawCPxH1XkbF00I2mIf+qxrr1vfvmXkhS4MUd4
 EM/MQji183vDQC0mphzEQXgI5yuKqL8xDswW11UpyQ5pakHYUHkKzcq93+ACEVdaNT6OXxSxypF
 Ap59fSOc8XjRlFSFQ1nJtwy0OJPcq67mqDqc1G1UFGE1oGs4+sWGly9LAwrQrlSZxrRfg6TyIhC
 om5Uh7iFZHgXMAOR/xw==
X-Authority-Analysis: v=2.4 cv=He0ZjyE8 c=1 sm=1 tr=0 ts=69c46271 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=YeJ3jcQhQBvMQWeA9nIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: MocuaAkAEQ6QKnVIGE1D0uqhMq4rH6lD
X-Proofpoint-ORIG-GUID: MocuaAkAEQ6QKnVIGE1D0uqhMq4rH6lD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250167
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7499-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:email,analog.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7D5B932D0C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
Changes in v2:
- Addressed DTSchema bot warnings and errors
-- removed extra blank lines
-- fixed $id to match current naming
- Addressed Kernel test warnings
-- fixed bounds for aux channel configurations
- Link to v1: https://lore.kernel.org/r/20260318-upstream-ltc3208-v1-0-015f1f1e9065@analog.com

---
Jan Carlo Roleda (3):
      Add Maintainers to LTC3208 LED Driver
      leds: ltc3208: add driver
      dt-bindings: leds: Document LTC3208 Multidisplay LED Driver

 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 158 +++++++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3208.c                        | 298 +++++++++++++++++++++
 5 files changed, 476 insertions(+)
---
base-commit: e68f95a51d1a8c1594b536c4d495cbea38d47561
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>


