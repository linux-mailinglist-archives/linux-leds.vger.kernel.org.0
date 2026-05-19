Return-Path: <linux-leds+bounces-8199-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QADADoW5C2qfLgUAu9opvQ
	(envelope-from <linux-leds+bounces-8199-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 03:14:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4EF575EEC
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 03:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E3C73015887
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 01:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AD2257855;
	Tue, 19 May 2026 01:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="j1yjOouP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B276272631;
	Tue, 19 May 2026 01:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779153280; cv=none; b=SlzuDz9I6dmiyEJ6WAz8qS5KFRw/Nhgg6Z4Npt6QgBfoetqVGnKxZb7xzRDPZ64p9KiGIPm+ggr4IfcBGLoilWP/HVWzhOLhaLcRirJPdLXBrHUhPDrC9aOZ9OHW3p+cXFeJWeYQaV7YyQUTk4wlWZjPxQiJqmf5p3HQSUhwld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779153280; c=relaxed/simple;
	bh=fzIhQV90tCBithAYBkR7kBEj86fUz/RqnUF2cxz3K0s=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=NPamc8OLazguY+dzmT5rgIZpb3UqXA+ywuh7METnFCo5gKxYewy80z/whTSw+A2OqowbTsSxZeiddSA/9DPa5EQQl/kEc3e6DDwwh9moKUlCNZoAlMwgnpFXEL0fiKAzoER3SjoxXA7QHDA97Ca3dAQZLpMH9m/7+1HKM5wzLJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=j1yjOouP; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IJUxtd175009;
	Mon, 18 May 2026 21:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=0KFmRAnGetvIKHEUP1YN9rbfBBj
	GCFEL/Y17m+jvn/0=; b=j1yjOouPCkEnibBzuLcKgoxG7AU46jOpVOagVNxQD6W
	oKiWvxt18PZiQ35KfU+r1oNh4BmAWDwoA4TLoswMbkfoF233thvXXE+nQbtIsKEF
	V6Ls78AdyHzouK2sg0qgxuY01n3PseESvrKGNs4FhOpkVptWhZZXPKOvVXOiPSCX
	ywwODATlSayxMSZv4Y+BCDjXHUmq4kfIlSPG2HL1FPUmbcOqD1vvixlR+Je7qT4B
	3XIrdeLKXhhIol4JQJXiCf4YMYaA/BTitM8sJ2F4AfAqeeAcRNuDwpRNm9L+E11y
	f7Cpv7zL0xHppMmoM2YVnENP81ksq6ZA11yRyfkeH6A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4e76wd67kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 21:14:35 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 64J1EYD9049147
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 May 2026 21:14:34 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 18 May 2026 21:14:34 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 18 May 2026 21:14:34 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 18 May 2026 21:14:34 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.71])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 64J1EMo4020456;
	Mon, 18 May 2026 21:14:25 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH v8 0/2] Add Support for LTC3220 18 Channel LED Driver
Date: Tue, 19 May 2026 09:14:17 +0800
Message-ID: <20260519-ltc3220-driver-v8-0-e1771c1733f7@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGm5C2oC/33Oy07DMBCF4VepvMZoZnxnxXsgFo4vraWSVE4Vg
 aq8O043DViwPGN9v3xjc6olzezlcGM1LWUu09iGfTqwcPLjMfES22YEpAFB8/M1CCLgsZYlVZ6
 dH3QILmKSrKFLTbl83oNv722fynyd6te9v+B2/TO1IAduRHuLOqOW7tWP/jwdn8P0wbbWQjuP1
 HlqPoIUoGwOMubOi51v7rcXzeeUNVIKMnvfebn3/f9l80E5hYZAB5KdV/971Twq8gKSs34wndc
 PL9F0Xm/eojLWYIoxdt48vALbedM8ZHA0eCUziR9+XddvvyGM9C0CAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779153262; l=4416;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=fzIhQV90tCBithAYBkR7kBEj86fUz/RqnUF2cxz3K0s=;
 b=0eWn0KmzUlVg1+mwMZTsYjHDiLo/2tK7V/d4QxbOkd4Zwm/BnmU0ky5I7Ykz5kp6HaGrWfNHT
 SEbEoukeHZ6BA8LfmrWwQ00f17ZyqYU1a1zv4ZxbnxZhvSMvPxbyl0K
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAwOSBTYWx0ZWRfX95s/hNsJArLi
 vxdlepJsoNfBk3FT9Hai/+3DRJkeJ63ccc943X9EKP+Cc+OFxSO63r2GsG2yltwELBqHxHxtPx9
 V+oyonpBxOYLZPoySQ/iBoLX/JKze5Sd7UrYHrPdHmOSiFyzvCzE9iRfme+pQoQzODr1qBmZI1V
 oSNJ/FvwrNb0+qoqfRVAAJrlcjx5trqw83H5NFaaLN37BH4pV43DADYvTAc+JtXs/23Wfjw2um9
 eR4leCwvbYO2hYLs5o/Q7lX+Kux88uBaHr9idZHQCRu+fjPNrM0JgI5pG6Cn0nhEEGJOsby8WxH
 aeHLp0MHe8WToG/GxIRk0ILzqWv8pidJYTgvibGZM3Q/NzKqmPHZPfXLEwJ4Zr8j4l4hccYz/Td
 aYi6puvFAwB/m8I1GMHlVxJgm36me/6SAA1ipuY2JEk9HRzJ/z2yXCkahSn5tfgD7aEGautz3Ug
 TTrHg93OaJrKjuWe40w==
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a0bb97b cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=4Xd0EAwewyHj09yvGKcA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: 0Pu8THvj_cIratMHdM0ODXM8C0AJrp7I
X-Proofpoint-GUID: 0Pu8THvj_cIratMHdM0ODXM8C0AJrp7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190009
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[analog.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8199-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,analog.com:mid,analog.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9D4EF575EEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v8:
- Add '>' on descriptions with multiple paragraph
- Change led registers to hex
- Change cache type to REGCACHE_FLAT_S
- Link to v7: https://lore.kernel.org/r/20260508-ltc3220-driver-v7-0-0f092ba54f23@analog.com

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

 .../devicetree/bindings/leds/adi,ltc3220.yaml      | 121 ++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  12 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3220.c                        | 413 +++++++++++++++++++++
 5 files changed, 555 insertions(+)
---
base-commit: 8856d7fe1758937ac528770f552ec58c388c255b
change-id: 20260106-ltc3220-driver-f9ab6cc9d1e4

Best regards,
-- 
Edelweise Escala <edelweise.escala@analog.com>


