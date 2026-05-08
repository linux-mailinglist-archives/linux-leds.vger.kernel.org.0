Return-Path: <linux-leds+bounces-8044-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ukBNidi/WkJcwAAu9opvQ
	(envelope-from <linux-leds+bounces-8044-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 06:10:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C91B4F15FA
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 06:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94584301D69A
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 04:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27615322DAF;
	Fri,  8 May 2026 04:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Zst17sfd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246C19D07A;
	Fri,  8 May 2026 04:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778213413; cv=none; b=kNbdcSl5lfDj7noxJC7PxG7tUflSXIu10swc/OIA36sCZ7ZGdCUxzsCOip8HdRxa8eStofIuhb0ffj1T8H+RBxo4ej/2XKJkwsXmf4aeKOJXAIFf4HU3UPcYC61+Og2Xo9+Ckh2rfmOMNHqdtAT31rKpmcFiParZzWMOHIwmh3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778213413; c=relaxed/simple;
	bh=Lov8zRi4ZdDJ6Rf2hL3bUCdLZv/jumyeWBcj6dsNe3o=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=kvtAo3/Pyr9naosybK6M4x9I+lieMA+O6TxZsr0Uk+ZoTbpKzZR0W1DgCeVOprFEjnYJiwFjWhrgxvP3Fxu0WSjJGRl+NayzrVSqzpQcWBtvKMOXFXLgf3LV+2k5cg4Qq55DeYuNvOd69dCXwSPbYEbVJmWZaM9OWc8P/tBL27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Zst17sfd; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6483vatR2003066;
	Fri, 8 May 2026 00:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=f+2NDxC4UzUBzeqx5m6Mpj4HpPr
	9g4VtJVVPS1O4Os4=; b=Zst17sfdVcRqABQCdriMcXn1YbS4cpRldBgRPBwpWqY
	wK4gbGFGlYF/3kXS/r3ZqGqHXHpyulnOma7thtrb8ax/rLMIRZowiIAzeQgsciS8
	789uQC+i6m4R4JBtflsk+DP0T6H+Z0tjQXEFRJbhgzC33LGty1rbUGbAPiFfRWUS
	JCQHukwKO9HO53JutU5mfTgpUgF8ygKlC/RdZLpBWWmIYqkzpKTiqEMdj2BH3MF9
	yioab4nG08xaXEzMg7glqOp+AGjxxa8v0v8aC3CMSjbWy/B6Mt4Vac4JafVuophR
	8hW754nmu5AYhrp4+jEYGv623Ths4POlcK6dAdiqLqA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dyv3ra85e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 00:10:05 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6484A4hh039197
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 May 2026 00:10:04 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 8 May
 2026 00:10:04 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 8 May 2026 00:10:04 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.71])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 64849pqo001480;
	Fri, 8 May 2026 00:09:54 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH v7 0/2] Add Support for LTC3220 18 Channel LED Driver
Date: Fri, 8 May 2026 12:09:48 +0800
Message-ID: <20260508-ltc3220-driver-v7-0-0f092ba54f23@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAxi/WkC/33OTU7DMBCG4atUXmPkGf8lrLgHYuHa49ZSSZBTW
 aAqd2fSDQELlt9YzyvfxEK10CKeDjdRqZWlzBMP/3AQ8RymE8mSeAtU6BQoJy/XqBGVTLU0qjK
 P4ehiHBOQEYzeK+XycQ++vPI+l+U61897v8F2/TPVQCrpNb8ll8GZ8TlM4TKfHuP8JrZWw50H7
 DyyT8poZYccTcqd1zvP7rfX7DNlB0jR5BA6b/a+/79hH+1owaNyEU3n7f/esgeLQSsah3D0nXf
 f3oDvvNv8ANYPHiil9MOv6/oFf+O6g+0BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778213392; l=4182;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=Lov8zRi4ZdDJ6Rf2hL3bUCdLZv/jumyeWBcj6dsNe3o=;
 b=aH2jqZ16LZyCS5e0mT/DaEJAFN9dcjC5cZ+2NgMgrEotbXKXdABGZbTUBof82u0+gCJiqNaSW
 Yu4qlZ599AeBafm+gGSvVXrtaqXKwbQFvDyCYtFenpxJIHwX3/UHRVR
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=O7UJeh9W c=1 sm=1 tr=0 ts=69fd621d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=W0g7KsB6ccMaKQzJvQQA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: jtR-rUk1ZZMzUBX5F5dRXKe_RFAiKT12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAzNiBTYWx0ZWRfX97hsfg4RnoyG
 wMoZ5Y/MHJk319/KOgnaO/ninXNEHv7ZUWDgZnQV2GQgusShRI32qqwkoUKFhViYCcyWGoIePd4
 3givMx2NRSNFa75PVZfjnH3asmCeYITxFKZcDjoYodGM7stcH2sbYOyt3K2EfEiwvCqKLVJQkoJ
 r3cX1RcyRO0Q4p9dRkpcyl7w2+6Pb5QSnGcO8+ZEGVnnamLf/Ov6XMArcSdh+thSSG4OLzBBVoG
 vbT0olTvh57i+zNZBFB/Recs28VLmO174QBZiR5H5RwbCU/5i7dFDJoHeIZ4/+8z1yYgKf8xxsf
 L1YGQC+YgYIGBQoZO2L9hD55pNsJlH8gpl/Wdn8nT+AFuoyWoyt09P+IpaLCufvx6doYEmhcDkp
 trfQtgRd79obj0xAeaqj/ZL2TeR7hZWIkoYh1JwVMddUFynLvsUjkARa/DA2pIxj+S2/2Qb6ubb
 e5ePPutr8qKct50+KOg==
X-Proofpoint-ORIG-GUID: jtR-rUk1ZZMzUBX5F5dRXKe_RFAiKT12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080036
X-Rspamd-Queue-Id: 3C91B4F15FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[analog.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8044-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,analog.com:mid,analog.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
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
Changes in v7:
- Add cahcetype on regmap
- Dropped struct ltc3220_state *ltc3220_state and use container_of()
- Rename ltc3220_state to ltc3220
- Dropped functions only used once and used inline instead.
- Loop variable changes
- Consistent decalaration for container_of
- Tabbing fixes
- Link to v6: https://lore.kernel.org/r/20260417-ltc3220-driver-v6-0-18157871eddd@analog.com

Changes in v6:
- Fix commit message
- Add manufacturer on Kconfig and improve description
- Rearrange register map and bitmask and improve naming
- Use regmap, also use update bits of regmap to avoid unnecessary
  structs
- Alignment and spacing fixes
- Use Define for magic naumbers
- Fix blink calculation
- Add comments on aggregated LED
- Fix variable name to something more understandable like i to led_index
- Link to v5: https://lore.kernel.org/r/20260126-ltc3220-driver-v5-0-152a30e98ab7@analog.com

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
 drivers/leds/Kconfig                               |  12 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3220.c                        | 413 +++++++++++++++++++++
 5 files changed, 554 insertions(+)
---
base-commit: 8856d7fe1758937ac528770f552ec58c388c255b
change-id: 20260106-ltc3220-driver-f9ab6cc9d1e4

Best regards,
-- 
Edelweise Escala <edelweise.escala@analog.com>


