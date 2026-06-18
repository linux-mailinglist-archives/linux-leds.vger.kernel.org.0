Return-Path: <linux-leds+bounces-8685-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YYmBIVF1NGrbYgYAu9opvQ
	(envelope-from <linux-leds+bounces-8685-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2026 00:46:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 186E76A2F98
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2026 00:46:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b="YdIqhac/";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8685-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8685-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 215EC301048D
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0C22E739D;
	Thu, 18 Jun 2026 22:46:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121B25C80E;
	Thu, 18 Jun 2026 22:46:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781822799; cv=none; b=klPMval7Y+2Pw6sh+b+uy+1FGrigPtacXaudBXGCKLVHc0zE6WVjaWDYoMto21Zv8OQspnaWHVhRlHiL56qR/l2xebw5LW4aIcdBVt6T1d60xuXIdMvPdrU7FOix2Uj4IpepjYmWSBd4xdjA0X/gkfksg7nLQyMWkT8H0D7VmL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781822799; c=relaxed/simple;
	bh=gV6oKQFxNA63WFKwOrcK5L4yV4mZ7qOALubRwzqLyPY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=lsEL+AwpP2BPw5fxXuPPzEtLVi0B2yeaYitQXD8X6bi/XALdcPSC38mgQwMCHXXun2Hh30Hdf+x+IU7eZsL+YrJ6CUmhmV6RkItWuVc68xJofTQdNRPCgH7tPf71NCTz7Q6fRKsxU8nLdXZogjOybkw4/+krGc8FQBJjupqHbBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=YdIqhac/; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILsBhb2327685;
	Thu, 18 Jun 2026 18:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=NRB9Wv8BaS1J5jEh4E5Uwy/Ir+R
	bZqZmW6TjVQ6NHqE=; b=YdIqhac/WP844QHYLurEkPPPdBD/6ZTx1wsoky7L/B1
	i9DLhnnuW3VKIoysicbjY81QlkERqXqEei3cM5ZAKZHMfhNIX55j1qoUoJQSm02A
	MIEkAiQ49PMKyDzB4S18JEmX80O2Jsb4GQgGbxFoOgoDjT4Dewqg63mrJhL/o5sL
	DK2Ij7nwp3OIL/+5oB0dsiisYmlk0jutXmHWNbD1Ii7GlHFLABsMfY8tybev8D5T
	AAEFK0so+osqAp01dbdD1swzlMYFX+f68+pN12i6IICCOO1nNLH9ZsuTwTYdy4BG
	HVdkvpNjExSgMzdvnHgWWy3B85yAmxrwvo5A3y7XO+A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4euegf9gr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 18:46:22 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65IMkLYt011266
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Jun 2026 18:46:21 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 18 Jun
 2026 18:46:21 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 18 Jun 2026 18:46:21 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.23])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65IMk8mJ028006;
	Thu, 18 Jun 2026 18:46:11 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH v5 0/2] Add support for LTC3208 multi-display driver
Date: Fri, 19 Jun 2026 06:45:07 +0800
Message-ID: <20260619-upstream-ltc3208-v5-0-075d18060606@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPN0NGoC/33PTQ6CMBAF4KuYrq2Z/lBaV97DuChlqk0USItEQ
 7i7hY0aics3yXxvZiQJY8BE9puRRBxCCm2TQ7HdEHexzRlpqHMmHLgCwTS9d6mPaG/02jvBQdP
 SOW2UrrwySPJaF9GHx0IeTzlfQurb+FwaBjZP/2ADo0CBFZ55hgZUcbCNvbbnnWtvZNYG/iFwt
 SLwLIi6csbwSoHRP4J4CxLWBJGF0kPFag6Ipf0R5IfA1gQ536C1xFqgNP77i2maXu6njW13AQA
 A
X-Change-ID: 20260318-upstream-ltc3208-7cc8968bf69e
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Jan Carlo Roleda <jancarlo.roleda@analog.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781822768; l=3198;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=gV6oKQFxNA63WFKwOrcK5L4yV4mZ7qOALubRwzqLyPY=;
 b=3SeBC/XBz7Okb2sRIg1Dc+rMIkcWIIbS9bt9jaBOOPUNDid/QjMZ+y6RAV6/QsYTnTjNmF3Ck
 Hb05M5unbOvACuDk59SCmxeXPID8SaVhG6zT5mNIS7d4vkbu5b5rLhL
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=SaHHsPRu c=1 sm=1 tr=0 ts=6a34753e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=itDfUeudex1bMM3OCFYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: aS6rb4jz6F3W2i7AAhWke6MpPqY-Fffd
X-Proofpoint-ORIG-GUID: aS6rb4jz6F3W2i7AAhWke6MpPqY-Fffd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwOCBTYWx0ZWRfX67A5i4be5RnD
 tVPG2SYRAv8/EBimMu3lf8/0f9aYoUwyBwLHH0LZBsaiPpb+1jkTA63Pv3jMgDz1u78XxuksDtJ
 jcWSHosMyI/WhLCOY8bE/rZZMIpG4vF6J3C81gWBgoyhra+fUvOLu85dHFWD8wyRE2P1ahvF6H6
 SpWGzpjUHSVioNF1ssSXqsOh+FiGeeS1FC+J+5Yct5vozJ6MpkGWH8TvXT/+LYfoEpkd1hTo2Pn
 pNOHM+KwmWPlV5PHCwVQ4nj9yC6NONyqewogHa8z6iaOBJZbd79oeW21tBTSoZ4i3yIhvaO+Ziu
 6FV6ThrE1q9QakSn25A8AvLZG7eGQxWBLUCyrJkct1fiiSGS5Zmww9IaYan2EvbmDp+ESIIgBBz
 yEoiwmewW0ROonoWFIEQPHD20kgihqrhgdswkvzdcuMRo9ntb386ht6PRhbv4Cx1nyp1iWmD+Rn
 t/lHRvCIukSgwYAHL9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwOCBTYWx0ZWRfX02eb4apR4Iif
 FUhAFvUj6u7vAytyKufRiNKa7y2JqTwo9LsDsidkKEFFa8vVWCm3epv9Jm2Xx0hYfgGHEiWJ955
 ttVAv27OMPD2Qo+L7BetwqIG2ChGZLBj3akr/kzsG/90rZL5ybhj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180208
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8685-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:jancarlo.roleda@analog.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 186E76A2F98

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
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

 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 181 ++++++++++++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  12 ++
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3208.c                        | 239 +++++++++++++++++++++
 5 files changed, 441 insertions(+)
---
base-commit: d43f1d792902ba0a53fd311bff2cf96095c7606d
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>


