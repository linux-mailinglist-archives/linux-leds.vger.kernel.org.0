Return-Path: <linux-leds+bounces-6754-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GruBUWxdmm7UgEAu9opvQ
	(envelope-from <linux-leds+bounces-6754-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 01:11:49 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 772DE832CE
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 01:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 052B0300565E
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 00:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBAD1548C;
	Mon, 26 Jan 2026 00:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="mbe4f/1u"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655E27494;
	Mon, 26 Jan 2026 00:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769386304; cv=none; b=pTssCCdcYDW6OZXqWYlqYeFvLlTd6jgNZ2IqCv/y5p3lLWHZjyI08mLKn9joQmPB8Q5uCrAzy9DM35Lvkwv71mY+EULr6TAGQBoDkfDWYROrwVoWI8T6N3W88OG31Ji+0NJywfwnHcSEbwLTUK0x5JjOGsTnueSDDcEKB9rOeFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769386304; c=relaxed/simple;
	bh=AVJQwNr7YA0Jh2wEIkgHr/e26KvU4Gfu64JEiFTF38M=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=cii4raseJrIkf6T1K6R+NffiW4FNoz21OdIbFqLPDMiStzIfYFhw3Eiq4MJv7no30cRkgxA+fl/1a0bVxfDHOXrg92soIVyG2JjvvfBx0KDpjwqsGVibEtp2GbExAmiKKwZ5r0ymTsETEao8lMf1ZvJK3gsNK6dz7xX+mXXsL98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=mbe4f/1u; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PHAGDr1196918;
	Sun, 25 Jan 2026 19:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=c5TFwl6yDaZFXpl1U8aIlsh22BZ
	r+Vwq8ixrNUpyqpU=; b=mbe4f/1uTLnIK2LCdsiE1dC6ByRNxlpmbyciGfJ0ff/
	W5vOxAval3qHJuT8qPGrKbPi20QXoZznESz5FkyrYkY1y5LsyD9/QtASnsoQiToi
	5BWXh2kxdsttoDddUQOWQO47LzucXGiEC3dOarb4za2LhaeAPNQyn9CV/6IBuJeR
	2c+jW3J5+KyCG6FEP0PVZRicyre/mu57wVwAJCwrj0VBPJ7pGQe0jgjQo6ZQuN0j
	ibtzAZBW2JtbCeA/AXATX9Q054+c5haC2OhMIiTLh8SARt0ZWVUQebsFmsp1Sjrz
	XKz+Z2dnyAD22673mmd//J40BYpofarKr0acBbQg4hg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4bwd9dt4xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Jan 2026 19:11:26 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 60Q0BPxO004287
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 25 Jan 2026 19:11:25 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sun, 25 Jan
 2026 19:11:25 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 25 Jan 2026 19:11:25 -0500
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.53])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 60Q0BBni003036;
	Sun, 25 Jan 2026 19:11:13 -0500
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH v4 0/2] Add Support for LTC3220 18 Channel LED Driver
Date: Mon, 26 Jan 2026 08:10:42 +0800
Message-ID: <20260126-ltc3220-driver-v4-0-c59517206c24@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKxdmkC/3XMQQ7CIBCF4as0rMXAgGhdeQ/jAmFoSWox0BBN0
 7tLu6o2Lt9Mvn8kCaPHRM7VSCJmn3zoy5C7iphW9w1Sb8smwEAxzhTtBiMAGLXRZ4zU1fqujKk
 tR0kKekZ0/rUEr7eyW5+GEN9LP/P5+jeVOWX0KMrPKseVrC+6111o9iY8yNzKsPIcNh6Kt0wKd
 jg5I63beLHyxf16UbxDpzigkU7rLz9N0we+eZmTLQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769386271; l=3091;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=AVJQwNr7YA0Jh2wEIkgHr/e26KvU4Gfu64JEiFTF38M=;
 b=/l7GRFGxuGYBpxBWWkVNUCH7hjNTJtnch6X7pcIrfI1Ayuncwx0WpemjqYqbIbbpcXRcWz/PF
 soy00PEYmz2Bs3uOszf0CiTAxX1iQwyu6Tdi41CGlhOqsJvhF2ehz8Y
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: soW2HGxYtuHMB5ypsbYJjuEZfUDl-reO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAwMCBTYWx0ZWRfXzDaLfa79npls
 a3oaIgOrmzShD4QPbuoYU7l1s/1CVALL+ttP5M6KMtIAk+Vbkw2nU2nKOGo/pTWBHVNMIos8VI1
 2MhusNI/zLbE9cr6P7mBxA8cGIUTOsgPaCv/OcUAV20qF2MTgdz8YAZZQvh7QYMRETl//esuWNv
 3QKTRkGuhs3cYwXrXkAZrS+uRkFEJPffJZ30IwP5jP/HCNHLKpj1H3btaaFReA7IVfvoSEP+Qwe
 jNP67/cY7yZ0ZdMQFaVb1Br109ZCgUp753jBM09Yjn1dKY7UYT4AyALa/jTbhPXb4/2wQ7Oszpl
 6Ovcg3W0c2/NPmvmb4ijwmLj+xU8xD3ru/c++KcdicC+cGfxr3o18u56sS+ssv3bDvD8MeoLyIn
 gSjrzia+ZMN/xKe35JO48IEI+ZtgW6UMZDteyOEv4ONkV6TtnTgq3IPaGwKENmrA7/ntGcsZkYg
 yi5pAwt3q2rMPGw/nqA==
X-Proofpoint-GUID: soW2HGxYtuHMB5ypsbYJjuEZfUDl-reO
X-Authority-Analysis: v=2.4 cv=NLDYOk6g c=1 sm=1 tr=0 ts=6976b12e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=keJ0f5baLatADGrQDnUA:9
 a=QEXdDO2ut3YA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6754-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[analog.com:+]
X-Rspamd-Queue-Id: 772DE832CE
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


