Return-Path: <linux-leds+bounces-8608-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oi3hOseoMGr/VwUAu9opvQ
	(envelope-from <linux-leds+bounces-8608-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 03:37:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6395B68B4AC
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 03:37:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=qbbiZqSQ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8608-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8608-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F35330173B8
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 01:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAECF37882A;
	Tue, 16 Jun 2026 01:37:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BDA1DD9AC;
	Tue, 16 Jun 2026 01:37:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781573829; cv=none; b=YdND7pj/s9eAgxZ9nR/svjrvgtsTSf0NIjDsfyWMZ+EWub1dk/2C/XuuwXmN1Bw3xQGRC1UiWivOz3lXTJqNZaD0j9sXjmgEAZatA6hFK+eD4WacpmiU/UAHCjSNvCxQixTkGN9ULoaw1vJOMhHyIGJ5OSuOBzaF3Jiky7yWntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781573829; c=relaxed/simple;
	bh=/DGMxfJNb3yQtFYM/bSbAvTHCX1bFhH6GCp8sKY8KWo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=b8iym/Vrlmx/sE8mZN4I8y67WARopelvTo/Ee0MuaX4Qq9AAR7gp7lsYYsh6QjFoZm7c6L2xtiTYUjymfR098Djrx4DN7E8+yRihjs/djZeO9VTou7rYy8BXGLNPEz/riisgJmwVPCutWkq5aqGBKuqaxO5oAqohWAZZ4To7AS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=qbbiZqSQ; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OGFR2592628;
	Mon, 15 Jun 2026 21:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=znuPydhjdW9zlbm3DyIsXKMtXJJ
	t2RuftmoBqa/GvY0=; b=qbbiZqSQt/inr8L6qe0YjxTHbSLQulfC+fa1x4wjY1V
	S2GFzKhh3jGaPQ/m4i02Oux/CeLG6B/njNdVBh0MecIB3ZFxsuKRLM4cX07STa/9
	s8NR9HqDYwpd+cbxHKpKNqJG270OnPnwexLS/V7uNaawdy+upz2qO1Bgr4yOvirw
	WShHeok9kweE24nFFvpRkn4biR3FSZYk685FYIP/YPE8/Y6GcVDH/reWMQUYqJpX
	PpOx8CbRcFKCqiAamJ3ZVidi5HOHwofEdtx0oiIZAzuDdxv64If4ai/QvZ/OYK3U
	GssXyfRfo+EYuE0PJIFQ7YvGiOwc2KZv76jjchC0YlA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4etuk6gajw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 21:37:05 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65G1b4sr002300
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jun 2026 21:37:04 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 15 Jun 2026 21:37:04 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 15 Jun 2026 21:37:04 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 15 Jun 2026 21:37:04 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65G1aphn005255;
	Mon, 15 Jun 2026 21:36:54 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH v11 0/2] Add Support for LTC3220 18 Channel LED Driver
Date: Tue, 16 Jun 2026 09:36:42 +0800
Message-ID: <20260616-ltc3220-driver-v11-0-6e51dd97ced6@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqoMGoC/33Sy07DQAwF0F9Bs2aQ7Xmz4j8Qi8k82kilQUkVg
 ar+O243DViwtEfn+i7mrJY2j21Rzw9nNbd1XMbpyAPi44Mq+3zcNT1WXigC8oDg9eFUDBHoOo9
 rm3VPefClpIrNKkYfc+vj5y3x9Y3n/bicpvnrdmDF6/bPqBU16GD4rfqO3qaXfMyHafdUpnd1z
 Vpp45GEJ/YVrAEXe7G1C282nt1vb9j31j1SK7bnLLzdetnfsi8uOQwEvpAV3v3vHXt0lA20FPM
 QhPd3bzEI768+ogsxYKu1Ch/u3kEUPrCHDomG7GwnI3zceEzCR/YNQ8CCwZgu+6eNJ3k/sffJO
 uiF0JRBeIR7gEcnPxD31wm981RidCn+SLhcLt+PMgE58AIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781573812; l=5766;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=/DGMxfJNb3yQtFYM/bSbAvTHCX1bFhH6GCp8sKY8KWo=;
 b=Alq7pzeWpLqa1D/tXrjNGS2Wa8tmBe0IhZKg6aLjHnFU0X8qjtAXEw8u6T1TDNnxberreDWGh
 /rWfgCATMg3CE0T/wZP84ZcBh3vFNcZ8HvIuRug2X5fZsDywt5CrhuN
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAxMyBTYWx0ZWRfX/lC+mCiC+mNc
 QQWvyDD7inaWNXwvZw8gSgkDE9rcwq7j6jSDTQDWZK8ubXl7ZPtAOq47ljEN1kIgcEFkdosxe9f
 BWE5RcL5RJEHMQzoFftB/PDxIZzITmGlH02TBR7KSUdzxTi2X/OY
X-Authority-Analysis: v=2.4 cv=e+82j6p/ c=1 sm=1 tr=0 ts=6a30a8c1 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=j9jCsMPMehH6t7H-GJEA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: t4_wa8l9O5BU9MjHfLK_Hanet5bBzUWn
X-Proofpoint-ORIG-GUID: t4_wa8l9O5BU9MjHfLK_Hanet5bBzUWn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAxMyBTYWx0ZWRfXxUxCTBO2P5Mp
 88S9xGFqwdlW43OPcS+It6klyjrBiI7IxxvtdxYcDLhP7YJG/CkqlH4cLRm4nzlauZpY+SJea1X
 1lDnnmiBabiHO2yRcbAjT9hbmcmo2IaNf6TsuHHMcaImhmPy9ZbKcfh99+ox08jQcdjUHN+19vj
 GLMSHo35xFl9zJsLltiZNt4/y71urLEudnSikBwbVTv8Cmfc+CMcPr+IptUIMpHSYc0g9ea8uJd
 ZAB0ASc3wqWr1WFxXzNe6EGNHvAQccNKms1lhWIbF5zo/AgoAuMueG/ZlcYCJXp/es2lVjn42aX
 Qxk8mdche0ReRlnTn90hGkVsqXGGStXAwf4stA+s+xJXAsNFtY5fCeLOVd1oGV3uoRSyt2suzcj
 YePUue1QFuMeJD/0bPRUKZkOqevUZK4wNUwo8D04q/kRr5OhjsJM7dZqB43U2zVssESwPWeIajs
 ZZGCq9SK73znTnVK+0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160013
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8608-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:email,vger.kernel.org:from_smtp,analog.com:dkim,analog.com:email,analog.com:mid,analog.com:from_mime];
	FORGED_SENDER(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:edelweise.escala@analog.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6395B68B4AC

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
Changes in v11:
- Add guards to check for double reg
- Add led_classdev_suspend/resume
- Return -EOPNOTSUPP for repeat request not 1
- Single write instead of write+read for blink
- Link to v10: https://lore.kernel.org/r/20260615-ltc3220-driver-v10-0-916562c88598@analog.com

Changes in v10:
- Remove volatile reg
- Add regacache_sync on resume
- Add delays on reset
- Remove early return and let software rset even if there is reset
- Set to max brightness before blink
- Two pass validation approach to avoid premature sysfs exposure
- Use pointer arithmetic for container_of
- Remove unused macros
- Add missing property header
- Link to v9: https://lore.kernel.org/r/20260528-ltc3220-driver-v9-0-69450fc213cb@analog.com

Changes in v9:
- Add address-cells and size-cells in required
- Restrict to reg 1 if led-sources is present
- Make set brightness only change brighntess for nomal mode,
  blink and gradation is now handled only in its respective triggers.
- Fix blink to change mode on blink set
- Make pattern clear only change brightness and not change gradation
  mode so it won't affect other leds.
- Add checks if ever there is duplicate reg in the bindings.
- Add REGMAP_I2C on Kconfig
- Rebase on Latest next
- Link to v8: https://lore.kernel.org/r/20260519-ltc3220-driver-v8-0-e1771c1733f7@analog.com

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

 .../devicetree/bindings/leds/adi,ltc3220.yaml      | 131 ++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  13 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3220.c                        | 480 +++++++++++++++++++++
 5 files changed, 633 insertions(+)
---
base-commit: 25025253476a64c186592d952c27f24bc3490e42
change-id: 20260106-ltc3220-driver-f9ab6cc9d1e4

Best regards,
-- 
Edelweise Escala <edelweise.escala@analog.com>


