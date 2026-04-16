Return-Path: <linux-leds+bounces-7735-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAB5E/FL4GkXegAAu9opvQ
	(envelope-from <linux-leds+bounces-7735-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 16 Apr 2026 04:39:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291F409B8C
	for <lists+linux-leds@lfdr.de>; Thu, 16 Apr 2026 04:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1042302F0F3
	for <lists+linux-leds@lfdr.de>; Thu, 16 Apr 2026 02:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7CA246BBA;
	Thu, 16 Apr 2026 02:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="VJwXDEnt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92F018872A;
	Thu, 16 Apr 2026 02:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776307177; cv=none; b=kqg+D7QtceBAmTioURYt6WMrV/w86zBjGWDui5AgDTn7aty1B//eWd6Ep+tMYdQUaYMYy7mYnhOFKC+mHqnu9TxQ6j24RYE6DtGHoCJTPEPBpDonwSsZgDJW4xR9pVip9uxwmxQmvxtGevWukWzV6Ugg6naPkUNvOOBEUoC2Lx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776307177; c=relaxed/simple;
	bh=rWGYOW+dVMm1F57SXLjtSZILpqDH9LQRFtO4GdJAAzE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=pw9gCyclGOIuA+gJGQzUF4DNIjO78l2geKT+KwY6mHKC9BfJr5qb3VjTyBApH9+fyWKt5DR/aBfT+FhjlijVdFby7vSFU9sTYi8MUYub5TheJW4fdLmwzw0c2hagtlF2TYL5nFYq1/b2qxcyn6cXWqZDAgTBpw/l/NvcoxeghRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=VJwXDEnt; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G2FVXd679991;
	Wed, 15 Apr 2026 22:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=CRxjkH9LvsGZqlAMtC4QC3mAJS/
	Tj1JNO9+b76EyTBo=; b=VJwXDEntvV99V1+o1BDkGN2CUjV5qkdZdx9JvJZMIl4
	VgmLQB6/KVawDEH2C3kOnNRkquoT4wKidfprEnAF10Xq7DmJaURf7KGRj5rvX8KI
	rdNc3I9AED6ISypWw4uOYmwFJNVc3HtwvXzjjj093CW8gGNTEPAPxCm6/hKUKE59
	0ZZbwmbo3vKytp6X99u/M6P97otT6sIrbWSZ96HBN4DZ5N7oK7hqApv3lLR2sFX/
	zYWvqo9caGV4Zplt6lN9AjjYjJOZwEXRICS8ssTGNzvY9rchSw08HTRyPo2gB/K1
	ioPvPz7aMQxylO2kefrzunGljbLtLI/DmVNSyzx3EkQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dh84rk3rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 22:39:32 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63G2dV1o001030
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Apr 2026 22:39:31 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 15 Apr
 2026 22:39:30 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 15 Apr 2026 22:39:30 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.30])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63G2dJpN001886;
	Wed, 15 Apr 2026 22:39:22 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH v4 0/2] Add support for LTC3208 multi-display driver
Date: Thu, 16 Apr 2026 10:39:05 +0800
Message-ID: <20260416-upstream-ltc3208-v4-0-3884ed3e49f5@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMlL4GkC/33NQQ7CIBCF4asY1mIGUAquvIdxAXSwJLVtoBKN6
 d2l3ajRuPxfMt88SMIYMJH96kEi5pBC35XYrlfENaY7Iw11acKBSxBM0euQxojmQtvRCQ6KVs4
 pLZX1UiMpZ0NEH24LeTyVbkIa+3hfPmQ2r3+wzChQYDvPPEMNcncwnWn788b1FzJrmb8JXP4Qe
 BFEbZ3W3ErQ6ksQL2ELvwRRhMqDZTUHxMp8CNM0PQH3XVtFNQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776307159; l=2619;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=rWGYOW+dVMm1F57SXLjtSZILpqDH9LQRFtO4GdJAAzE=;
 b=2AvkAzhnjsBe/f3F5PjCw+4mClQDcAlRHhMngKcYvkcO+OVf6ll+vo7+wf5MoyDBFBIN0dNav
 TzjsrN+gtYZAD59tskKDiwDsdjvjo38k/1TFj2HmvuwQjouzCDzdRZt
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: v73-9MYxxnJnWyzeu2_FGr0nHaVrlp6O
X-Authority-Analysis: v=2.4 cv=GIM41ONK c=1 sm=1 tr=0 ts=69e04be4 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=klxL6F2T4m-zQSqrJGUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyMiBTYWx0ZWRfX0CAWEPGWL4Rs
 G0kcWHAHMr6dhez3OF40egBkj3LTvoBhUzLdiJIzQGsrrMh8kJLZKLzyVKLPsL9+9Xk1sfOGeKa
 YlIvOkDVlE4c3azmN+6rw61eBtfJAIgIO7SC7AMO2b8wKLTti0Bo2KcPA7sjMCoqTiFnE2aK4BZ
 9eyowV0/i6TK97HvF+OoFhJWRyfjCEk42dfAsB3pWqk5CJHSAdXUtIEtBWJLKEE7JLcDoszrYtv
 jb5jmbuD6SL0AhYzRqQNoZdieQBsoR2I9V53iQTVHw1VVQ8GeBcXqqNPUDaP+8xG/1BcPixqTtr
 cdupVs8wgFls8W/ZNSpl8ZCfQUlEoqnkEdai6VzOmAxWUvmzX+DJMlkKmxLdy1OXwGyQFpPv8/H
 VtqvyoHOVbU3z0IQcuYZXZ9U0DF6Je/ii5sKsXoCLdDkCEpqBYLVEOmiLe5Ia5vcLSI27a3xCFe
 kbfaYlnp4ofW1ImPVAw==
X-Proofpoint-ORIG-GUID: v73-9MYxxnJnWyzeu2_FGr0nHaVrlp6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160022
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	DKIM_TRACE(0.00)[analog.com:+];
	TAGGED_FROM(0.00)[bounces-7735-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0291F409B8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
Changes in v4:
- Reordered commit order to match dependency order
- Updated Kconfig to be more descriptive of device
- Added led@0-7 with more complete example properties (function and
  color)
- Driver changes:
-- Removed unnecessary include headers
-- Formatted macros
-- Created helper `write_current_level` functions for LED current
  configuration, using `regmap_update_bits()`
-- Adjusted awkward tabbing issues
-- Updated variable names in probe to be more descriptive
-- Updated inline comment capitalization
-- Initialized `i` within the for loop in AUX configuration in probe
-- Refactored `update_aux_dac` function to use array pointer
-- Fixed error messages in probe 
- Link to v3: https://lore.kernel.org/r/20260406-upstream-ltc3208-v3-0-7f0b1d20ee7a@analog.com

Changes in v3:
- Edited device bindings descriptions
-- removed full stop in title
-- replaced quotes with double quotes for consistency
-- removed <dt-bindings/gpio/gpio.h> from example
-- removed led1-7 in example for brevity
- squashed maintainers commit to driver commit
- Link to v2: https://lore.kernel.org/r/20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com

Changes in v2:
- Addressed DTSchema bot warnings and errors
-- removed extra blank lines
-- fixed $id to match current naming
- Addressed Kernel test warnings
-- fixed bounds for aux channel configurations
- Link to v0: https://lore.kernel.org/r/20260318-upstream-ltc3208-v1-0-015f1f1e9065@analog.com

---
Jan Carlo Roleda (2):
      dt-bindings: leds: Document LTC3208 Multidisplay LED Driver
      leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver

 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 181 ++++++++++++++
 MAINTAINERS                                        |   7 +
 drivers/leds/Kconfig                               |  12 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3208.c                        | 278 +++++++++++++++++++++
 5 files changed, 479 insertions(+)
---
base-commit: e68f95a51d1a8c1594b536c4d495cbea38d47561
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>


