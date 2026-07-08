Return-Path: <linux-leds+bounces-8958-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5SHfCBH3TWpIAwIAu9opvQ
	(envelope-from <linux-leds+bounces-8958-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 09:06:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4B1722778
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 09:06:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=g5K1cZ+p;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8958-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8958-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A154330A1F5F
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 07:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC8F3F2109;
	Wed,  8 Jul 2026 07:00:52 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469E03ABD8F;
	Wed,  8 Jul 2026 07:00:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494046; cv=none; b=tGsWH8flumZWL7xTo28aMS9fXetsQUwPeUeJTPz2nDynctm0AgXrscso0EXro4JNpRlYVj7yDAx6gLNB+jHZD8dofWfNpPeIosS1/8/7ixcMRy637Ej2JeQiA6xxUq3UDoVlZCn/jNErC+Of8ZDSRY76XXQRzdBCGrXNn8h9iV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494046; c=relaxed/simple;
	bh=RIf3M6skJJI9tjpmkwbwbuOmZNP6CpodEp2TQA9ms1s=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=lEAFPUuLoFwUUk2X3CBJ0a4Mj30EDwdgExhOJAbYRvad9AfmaGJgzH8+1CyaIR5f2Z5TVHS9wrwEmrlwl3Ec31gropXV0qFfS6Tm3CX6bDEts98lf0WAb+iZBPBiGn/amqZYs/cg2uylCqJnNCHERQwEP8n21hu/5RYShrTBHeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=g5K1cZ+p; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6684RBod1316435;
	Wed, 8 Jul 2026 03:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=JOPbgJ1t0lf/GZdUwk2pKDVLdpI
	Hp0B8/hLCdGPrNuE=; b=g5K1cZ+piUI0kzD/+R9DOdQ6Ct4XaVHNMGvxmSQ+DWC
	2Hcgjz1tr+VggRYZbvT3DzYymVl/TcMzOHUj0FcTnqruEsJtU/HfBk3Cb9LhUjW/
	6uB2E+HjyuyEQvVN4su1ivRh09NOdd85Uqf+7anZ3wbt4zQJ22QcARLUyZxCJu5o
	+2N3HWM+O/3w0uLkPHYcXh+Cb7Opw0pB6rXwXHwTqa5j0Lgrq2BMDPaSWeonzGhP
	N5Y4shbtrG1UbZ5knWtZhhMTMa+4GcFr0puNuWuF5VvyWE9DWk8vZBurTcCAtVBM
	g2p1DfmK/fh0jF7noRuqNAFTNuALiwP2Vj4s9+fM36w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f9fhp0pek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 03:00:27 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66870QjV044494
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jul 2026 03:00:26 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 8 Jul
 2026 03:00:25 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 8 Jul 2026 03:00:25 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.21])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66870ADC006727;
	Wed, 8 Jul 2026 03:00:13 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH v7 0/2] Add support for LTC3208 multi-display driver
Date: Wed, 8 Jul 2026 15:00:05 +0800
Message-ID: <20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHX1TWoC/33QS27DIBAG4KtErEs1A3iArnqPKgsbhgQpsSPbt
 VJFvntxNnFlq2L1I803j4cYuM88iI/DQ/Q85SF3bQn27SDCuW5PLHMsWShQBBqd/L4NY8/1VV7
 GoBU4aUNwnlyTyLMoZbeeU74/ya9jyec8jF3/8+ww4fL7DzahBAlYJUzIHqj6rNv60p3eQ3cVi
 zaplaBoR1BF0LEJ3quGwLuNoF+CgT1BF8EmaDAqYLb1RjArAfcEs8zgnOGo2fi03aJ6CYR+R6i
 WO9gqogNa3kaglaD0jkBFSIGa6K3xSH+FeZ5/AXPllz/7AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783494010; l=3971;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=RIf3M6skJJI9tjpmkwbwbuOmZNP6CpodEp2TQA9ms1s=;
 b=E+CVqYI2IuOvJuvqSKkiSthQfB+7YIn/O/hrIXnpoRQXFyDCXrZU8rrzEuCVeoEu9+Ku7J7ep
 ZnddBHOTGsQANiLlzY+LVDDw93ps5+hTye2c/V1nlgLIbs66bNkWxFD
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: OuQ6-TifsXUEBHDrjTvjftBlmT1AxSKz
X-Authority-Analysis: v=2.4 cv=Zobd7d7G c=1 sm=1 tr=0 ts=6a4df58b cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=itDfUeudex1bMM3OCFYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NCBTYWx0ZWRfX12dvf5KR3wXk
 y1Oy8zOrFBK6z/vQnV2G+EnjmVyVBZG1g+uhC9nyHju5a6huwfqlBRmT1dL1pOd37BSM7jJhb2v
 FfROkiarNzuESJQKnZzbj5IRqFoGY2+ncipYdDKkTA96PG4D+aNBm9CQGg+zsBdpcbumJi7jqAd
 YANlUrlNybEPJz5k6Z1blMSzniRJvJYGhRSKC7QUGj6aKy+X6JNxoQ7p9i3/FvprOZQDcGguQOs
 ginxKXpHhy6c+40L54j/iWYEJm15fcu7kVAaTjAp0wgkq5JOm0Gt/QpozaXC1wXnN1EMK05El9G
 qDkXPiO67OsvCsOtnqOH9RKGROcMlM2igQDqp8O7wpX6NgqoMct0FMo9zDg6s0rOaEyZuCseJwa
 1/Biis8q8MtZGTWtD4O+YtEjwu+wDlCS7HCuk8oxoQBcpTYP9ZU8YCZNjpZ2iNHh/VJ6P6szW0V
 9trIZMfpsFNNC29B3EQ==
X-Proofpoint-GUID: OuQ6-TifsXUEBHDrjTvjftBlmT1AxSKz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NCBTYWx0ZWRfX+6oXRgUy2LCO
 b++IxFG75h7yxdc64PZo4L57X9DM3GgTqIIeJ8sstnY0Idiy5yOZgUD/aph+Qs3vseSp9BjyHBg
 dqgOKvI04iW+hh72cdNlF4OAoFCCsHcTFn7TYO4k01swKXxFbJfl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8958-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,analog.com:from_mime,analog.com:email,analog.com:mid,analog.com:dkim];
	FORGED_SENDER(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:u.kleine-koenig@baylibre.com,m:jancarlo.roleda@analog.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 7F4B1722778

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
Changes in v7:
- added reg_defaults to regmap_config
- removed i2c_client and regmap from ltc3208 struct data
- fixed typo comment in driver commit description
- fixed string formatting of u32 chan data in probe
- added explicit CPO set to 0 in probe
- Link to v6: https://lore.kernel.org/r/20260623-upstream-ltc3208-v6-0-fc6bd9749166@analog.com

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
 drivers/leds/leds-ltc3208.c                        | 251 +++++++++++++++++++++
 5 files changed, 453 insertions(+)
---
base-commit: d43f1d792902ba0a53fd311bff2cf96095c7606d
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>


