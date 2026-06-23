Return-Path: <linux-leds+bounces-8706-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uc/sG6wpOmpr3AcAu9opvQ
	(envelope-from <linux-leds+bounces-8706-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jun 2026 08:37:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 679086B4955
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jun 2026 08:37:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=mrLpyu1s;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8706-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8706-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EBFD300690D
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jun 2026 06:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CD03B27F8;
	Tue, 23 Jun 2026 06:33:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609B340286;
	Tue, 23 Jun 2026 06:33:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782196400; cv=none; b=AoBGpUrHbuSY+eBrKAYWL4fpvWrnjSVnTUvQMpK+bo6jewaWjYXaPLbr4R10xnWqU+m0T2VJC/THB9uBgRjeB7Qkm+yRbpoSfjRjFruyD56QjhaZDZkfPTJCFroTRf1MhB4vpGxt8w0T0PpliBWT2LtGIk7sAJxB2Cg3ch31by8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782196400; c=relaxed/simple;
	bh=SSIK/QSN70pASprkaQr4jQcJ+Bv0/9w1QjB1iMjXw2c=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=tZ0LRvzaOKVA9ShpF8TI0VUzr8SrZq7FMB1ECXDfLB8GBTlUVuDZssdanmWZuCU/BV/C56Ce7m14bNxspldxbVcVMgggaBmlzHQMzPAViXj/9eDUoSFLTQv/dkGKlGEh4UY2IxxP4hntJoyVuLuuRosBWr4Gpomn2aexPfam3eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=mrLpyu1s; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N2pGCT990383;
	Tue, 23 Jun 2026 02:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=LLbfAV4Pin7Dn/7Lr1IuHPCgb8j
	MJe2JB6QBYtz6ct4=; b=mrLpyu1sN4I6JZ+MlDHPfjjyjt9/HAB0g7wvcoB2Va8
	dclNY216wpqOYwnHE9p61TtYUsRynUJNmLCpZOmP7Q8+6yHdfd+Yxr6TgijtwB8E
	8K6yFa94hTU19PWOSOzFwqF+mJII/9xxVXgMwM+CEVwJrwLTraHat9UHjr/MTKwt
	Ctxaiyud7ZB/LK1ygMe7f4ibd9YfsA8tavTUHAq4oV0YzhrRTfDoEQdYz1mbWHRA
	XX2EhQX6lczFnPZqx+2nhiyVLqVLXMOGzZJkaZ21kNooUsxxxSxVvpWT/da//Ymt
	WHIPzJ+Ttpwl5Utmh2+1ANOO1z9+BTJuf+cHH3NP92A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4eyhqr0y9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 02:33:02 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65N6X18q003598
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 Jun 2026 02:33:01 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 23 Jun
 2026 02:33:01 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 23 Jun 2026 02:33:01 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.27])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65N6WlDJ023894;
	Tue, 23 Jun 2026 02:32:49 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH v6 0/2] Add support for LTC3208 multi-display driver
Date: Tue, 23 Jun 2026 14:32:28 +0800
Message-ID: <20260623-upstream-ltc3208-v6-0-fc6bd9749166@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwoOmoC/33QS27DIBAG4KtErEs1AxhDV71H1QWGIUFK7Ahcq
 1XkuxeySSpbFasfab553FihnKiwt8ONZVpSSdNYg345MH9y45F4CjUzAUKDRMO/rmXO5C78PHs
 pwPDee2O1GaK2xGrZNVNM33fy47PmUyrzlH/uHRZsv/9gC3LggF3EiGRBd+9udOfp+OqnC2vaI
 p4EoXcEUQUZBm+tGDRYsxHkQ1CwJ8gq9BEGDAKIercR1JOAe4JqMxijKEhSNm636B6CRrsjdO0
 OfRfQgG7vj7Cu6y/c9h3suQEAAA==
X-Change-ID: 20260318-upstream-ltc3208-7cc8968bf69e
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jan Carlo Roleda
	<jancarlo.roleda@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782196367; l=3616;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=SSIK/QSN70pASprkaQr4jQcJ+Bv0/9w1QjB1iMjXw2c=;
 b=NqOUHbUK3HcPEOEKPXpiyM18L6HOu+N3MU25kWtDzPocig2d+AL0pltFJ22BlJ9qVJD8BlQ2j
 2g59JIzX3JeCl6te5IQ2ikLH8Tp5zkFJWT2hoDHSa1qsMPt8gXRVAvD
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1MCBTYWx0ZWRfX1e/KctIusV7y
 ybZrCqP3b9qGZGTxs7sx5kH8MrzUCQB69KuIHPlla/hQ99owzcqC4gg7yZNAwdbI3EO8J6CZgDp
 0SwS4TQfbxTPgBfleXVMIBLtVRhrjCNTh2dZYkNZ3MI28U9kMnWkteiZENqvUh/0Ceidj6WrX5V
 xrYRPH8dTykE5ZS0QCiWnTn9g+tisKFC2kOK4wGiK2rgh82Efc+A6yaAvggRBtobEehgiZt3jgd
 ERL3y+OvykMeij8yQXMaxoguYs8XMZlU6ln4bZnV5Muc0XhWZtFvbx+BkHMErevFBlLAdnB1A9Y
 dWFlL+EVM0Jyc1XZOiB05WczC1gRPYkt/l+dgOOON1HowYE1ZDSAUj/a6QXq/DbD85494ldbxwt
 NuG5y2n2mVAS7g0oqi574EMKGKvRmLvYBlViXnyN/2oL4x22U0PS3b8l/k7EYHMPivNRFm7TDGT
 G3y5tt4g9HbjeMl7WLQ==
X-Proofpoint-ORIG-GUID: QjB3e5t0iBKpcKag0OzSoNgA-kl8iYrD
X-Proofpoint-GUID: QjB3e5t0iBKpcKag0OzSoNgA-kl8iYrD
X-Authority-Analysis: v=2.4 cv=J5yaKgnS c=1 sm=1 tr=0 ts=6a3a289e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=itDfUeudex1bMM3OCFYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1MCBTYWx0ZWRfX7nipKul3WXnt
 SdhgK4jkISb+jd14bKKFYv9wcH+vomxZuDT25C9vaRsZ5X37jhULT7ZEcpo5XJK3KnvmxjWyXBq
 noty9zoTjya2OgkAHn1pTM3ty/JZfPbU1x65WTbUfAORhGYhHeuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8706-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:email,analog.com:mid,analog.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:u.kleine-koenig@baylibre.com,m:jancarlo.roleda@analog.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 679086B4955

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
Changes in v6:
- Fixed code conventions (spaces in brackets, awkward line breaks)
- Removed unused `i2c_set_clientdata` from probe function
- Added guard for potential errors in AUX channel configurations
- Added guards to prevent duplicate LED registrations to the same ID
- Corrected `dev_err_probe` return values
- Link to v5: https://lore.kernel.org/r/20260619-upstream-ltc3208-v5-0-075d18060606@analog.com

Changes in v5:
- Fixed MAINTAINERS commit ordering
- removed i2c_client from ltc3208_dev
- renamed ltc3208_dev struct to ltc3208
- refactored brightness_set function to use regmap_field
- updated leds attribute to use constant size array
- updated regmap_config to use REGCACHE_FLAT_S cache type
- added max_register to regmap_config
- renamed variables in probe function
- renamed map to regmap for regmap instances
- moved AUX channel configuration inline to probe
- Link to v4: https://lore.kernel.org/r/20260416-upstream-ltc3208-v4-0-3884ed3e49f5@analog.com

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

 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 181 +++++++++++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  12 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3208.c                        | 244 +++++++++++++++++++++
 5 files changed, 446 insertions(+)
---
base-commit: d43f1d792902ba0a53fd311bff2cf96095c7606d
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>


