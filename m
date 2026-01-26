Return-Path: <linux-leds+bounces-6758-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GN4OIsJd2lGawEAu9opvQ
	(envelope-from <linux-leds+bounces-6758-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 07:28:27 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF484882
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 07:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D13E300E3E8
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 06:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83301A317D;
	Mon, 26 Jan 2026 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="lZeQDnGv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6881E98E3;
	Mon, 26 Jan 2026 06:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408783; cv=none; b=SMYNSlH6Q18Qf9MHdzl9hr7VqMyvDt8lTSjsnAE7Y8T/XxlzdDajlByRN4Y1ogccme/LYioT5QSnsL/S7UY2oRL74ngr+imbWc9qpAL0V6+/YMAbTd+DRAzI0dN5w0XuHczxl6nHrCPQM/2MvhZXn2rX6mZEbSjAHfnJQzPIwGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408783; c=relaxed/simple;
	bh=3p/V/r4DhEAcx31W2QFR+FxnS1clOzdnIT8cCs7Eh00=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=mukhAdMqiny5hfsAq1i7BdTOHyFkoUTdPEGseLOHkqkRwQmUL2gi1xTr71yvL/UyUfTLEYVN6vmykWrS3PrgQwLZ4xG0S7ydaS7R5zLsjDFENOD28K/0yC+0hRSweShh3A3XG5tyjoCe2IOg9O6Pp0lTH6uylvbmm184vPk1JA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=lZeQDnGv; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q39tkB660370;
	Mon, 26 Jan 2026 01:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=NXPuQpz8N2/xRlrQwHN6Vyp2fop
	ojFvOqucqrHPWe8c=; b=lZeQDnGv0nWvl7BHcqa9aXGqAPvNrzeKCN4RP/oeI4K
	D38TiUp3glT9mEo1VACD0HcNQKCKp9v25W9exjhokrMiSmhmtha2YT4z1RGOaCeC
	FZTwt6Lxgs4iMZnqt0dd5NR42UDG6ejRQSr7mKmJ8m6DRIm7IiSkoxw5S5xqNgt/
	cDTCQ9rCm/NTkdHmzFiTbBvbaMiPgbIbht9kQvZKARCUGTaupAoeZwU0SO3wUuvg
	TtWbKJ8JpsDUA5TkIrlqwJSFY+JZFdW2bTKaF8j1Y093tHmhkWjv6BaX0NP5Yz4w
	h1JL0UeBJkD5XSGiClm8eCdGMZ4v1qr4cH/+ELQvpgQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4bvrt3nxa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 01:26:18 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 60Q6QHwk045202
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Jan 2026 01:26:17 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 26 Jan
 2026 01:26:17 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 26 Jan 2026 01:26:17 -0500
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.53])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 60Q6Q55G023811;
	Mon, 26 Jan 2026 01:26:08 -0500
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH v5 0/2] Add Support for LTC3219 18 Channel LED Driver
Date: Mon, 26 Jan 2026 14:25:57 +0800
Message-ID: <20260126-ltc3220-driver-v5-0-152a30e98ab7@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPUId2kC/3XOQQ7CIBCF4asY1mJgoGhdeQ/jAoehkmhraEM0p
 nd37KrauHxDvj+8RE85US/2q5fIVFKfupZHtV4JvPi2IZkCbwEKnNLKyeuABkDJkFOhLGPtzw6
 xDpqsYHTPFNNjCh5PvC+pH7r8nPpFf65/U0VLJbeG34KL2tn64Ft/7ZoNdjfxaRWYeQ0LD+yDs
 kZVu4g2xIU3M8/u1xv2kaLTQGij9wtv5375f8seq7rSW1AOwX75cRzfoncjbW0BAAA=
X-Change-ID: 20260106-ltc3220-driver-f9ab6cc9d1e4
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Edelweise Escala
	<edelweise.escala@analog.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769408765; l=3270;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=3p/V/r4DhEAcx31W2QFR+FxnS1clOzdnIT8cCs7Eh00=;
 b=qYo7hFeRLbRjzP1Dt65FPWIhR0RzfEct1jaGQkiAZX/k0K0oZ/tNIPzCXNjm07nDymB/mISP1
 Ez7Nxo5t7FBAGgepl1LwQzx2eqxM9wWkGn2+J5aLzTQQAX+RoTywFB1
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA1NCBTYWx0ZWRfX8NM97GjPcv2G
 seFlJKSrAt0cK3fExXiU5/2EiRaGiBuw9CQiB6Isi+79bd2+X2c2tinfOw9Mm0g2AOmYtGYcvYa
 jYgbHWCj1nUtE+K4JnU4yYUOY0JQLi9gyQdx2akr2Py/7V+S2uk2Ou6KbWFiSL/XtDCHPrr02ZK
 8s5D/Bj7Z1/1R3teh3Q41D0VHsCrjwSSbe135Wa1kRG99EVhFAySnVdIJ9HalybiwZTsOkm1RWG
 lx5eWUCXg90HqZg9eTVQCLo8iqtQCKDJ/njOu5hT4H0edIvUC/w7IJ+s04DYP4bBrb2Se0326x8
 dN1noKcHRShOVFX9AQmV6NFg63QdflDFoUuH4PmhcLvB9vDxn67AT1njYlaXjW7xOlMM9io5j+5
 6LCkb2FImdfYYGWUXafPefGAIVNq65VXc5wtDINnuMomJGKczAyyCtlvCuqmXlj8Rc0KJmVCe+e
 n42U15XCt05czFdTF4w==
X-Proofpoint-GUID: SKWP4F2DVP8R_6tHZI_bFLerfi5sQtWu
X-Authority-Analysis: v=2.4 cv=U/SfzOru c=1 sm=1 tr=0 ts=6977090a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=-2tFUoYDPrFf2wPfQ4cA:9
 a=QEXdDO2ut3YA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: SKWP4F2DVP8R_6tHZI_bFLerfi5sQtWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[analog.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6758-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,analog.com:email,analog.com:dkim,analog.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 83DF484882
X-Rspamd-Action: no action

The LTC3220/LTC3220-1 is a multi-display LED driver, which contains a
high-efficiency, low-noise charge pump to provide power to up to
18 LED current sources. The LEDs are individually configurable to
64-step linear brightness control, blinking and gradation control
via 2-wire I2C interface. The blinking and gradation configuration
is shared across all LED.

LTC3220 has a quick write function which allows changing the brightness
on all LEDS simultaneously when the brightness is changed on led 1.
For this leds are aggregated in the device tree and on probe we check
if led-sources exist to enable quick write. 
We would like to know if this approach is alright?
Another way we might want to know is, is it alright to just make a
virtual led for the quick write function. Changing brightness on 
the virtual led will change the brightness for all.

Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
Changes in v5:
- Missed rename on bindings filename in MAINTAINERS file
- Link to v4: https://lore.kernel.org/linux-leds/20260126-ltc3220-driver-v4-0-c59517206c24@analog.com

Changes in v4:
- Rename leds-ltc3220.yaml to adi,ltc3220.yaml
- Add Reviewed-by: Conor Dooley <conor.dooley@microchip.com> on
  adi,ltc3220.yaml
Other V1 comments I think already addressed
- Subject commit message was already changed to match hardware
- Fixed wrapping after description
- Dropped "Bindings for" in descriptions and improved description to match hardware
- Dropped adi,ltc3220-1
- Dropped redundant description on reset-gpios
- Dropped adi,force-cpo-level
- Dropped adi,quick-write in favor of aggregated LED
- Used consistent quotes ^led@([1-9]|1[0-8])$
- Fixed wrapping on error messages

- Link to v3: https://lore.kernel.org/r/20260120-ltc3220-driver-v3-0-fef612ec4faa@analog.com

Changes in v3:
- Dropped quick-write on bindings and added aggregated led instead.
- Add aggregated led example.
- Modify quick write to check if there is aggregated led, if there is
  aggregated led enable quick write.
- Use DEFINE_SIMPLE_DEV_PM_OPS instead of SIMPLE_DEV_PM_OPS.
- Link to v2: https://lore.kernel.org/r/20260112-ltc3220-driver-v2-0-d043058fc4df@analog.com

Changes in v2:
leds-ltc3220.yaml changes
- Fix wrapping on description
- Improve description and commit messge to describe hardware
- Drop ltc3220-1
- Drop charge pump
ltc3220.c changes
- Fix wrapping
- Drop ltc3220-1
- Drop devname_mandatory
- Link to v1: https://lore.kernel.org/r/20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com

---
Edelweise Escala (2):
      dt-bindings: leds: Add LTC3220 18 channel LED Driver
      leds: ltc3220: Add Support for LTC3220 18 channel LED Driver

 .../devicetree/bindings/leds/adi,ltc3220.yaml      | 120 ++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  10 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3220.c                        | 455 +++++++++++++++++++++
 5 files changed, 594 insertions(+)
---
base-commit: 8856d7fe1758937ac528770f552ec58c388c255b
change-id: 20260106-ltc3220-driver-f9ab6cc9d1e4

Best regards,
-- 
Edelweise Escala <edelweise.escala@analog.com>


