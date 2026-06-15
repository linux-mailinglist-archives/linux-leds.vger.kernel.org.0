Return-Path: <linux-leds+bounces-8587-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dQLxCx2NL2rjCAUAu9opvQ
	(envelope-from <linux-leds+bounces-8587-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 07:26:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A868373A
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 07:26:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=w6f6S1F4;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8587-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8587-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 349CA3001322
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 05:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81ECA30C160;
	Mon, 15 Jun 2026 05:26:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC36A30B50A;
	Mon, 15 Jun 2026 05:26:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501210; cv=none; b=OZMwxdimDcgecdwxIYGw1IWFmeSn2hMresPfT8yCICyIoh1iYwHvvnOzVF7NVfIrpg0mveAXIScMygN0qgPMJ3nAL1mSJSUOENzGfSeQfa97Vo38TWXH5zK9cvB1/BHo8Dh1WRRgb6Mp84HBspdsbYu/lrJnD8WriNiiVNqZv/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501210; c=relaxed/simple;
	bh=fn8syrmkir0TTD0IDtLGfBZqW5BqWxL9YNbx4kDGXm8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=clucbk1PNDTO3HFLuH4sv8eTGun8Wm5nutvXJGJKlRABj9GCZl/TFl/vLKXDtZYt7ZPVnbryK8cUYwd/5bmOS/cYpkstTIlcN+1qBq75yxJ9u/HZGDA3ryfGBXAkmivTmqHaqSmjHosSnMIjO/D6hgqStAcLMSb7V9YzupBt4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=w6f6S1F4; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1n3114172032;
	Mon, 15 Jun 2026 01:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=tR9Oq+7fb29W7WwlsCh5QvuUu2C
	ZLEH3I+CgB0Tr0DI=; b=w6f6S1F4lo7LpTTj2AYny7DRYPSdgSPbLLu0HEKSdU/
	nyBBCuj0n8ED5Fmu2Jh8CJlmg8uv/uWR85kBz4ffu7ZAdtDFMMuLbXXBF7Z2fGAs
	ZbjIhZgwfBDQWpwxWuBnBqQQgs0snT2heeLER4Mz3opchS3wU10z459Lx8zRV80+
	DRYfdWjCnRzOFvKPBLb2l5jK8YzDQmY1E8sZoUesWmWjxwpmmQu1fM+aMFB4KEwE
	pbknz2tQmt0ltxrwQttUpj7kKJv1t0u753qRIQn+d6XM8B9zocEmqw03g6SyI1eM
	BUuSFuG+qzZCrvxyuKM8ErW9a3DHDXAZMd6fHMhmxsw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4es11xwf31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 01:26:35 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65F5QYCi014990
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jun 2026 01:26:34 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 15 Jun
 2026 01:26:33 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 15 Jun 2026 01:26:33 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com ([10.118.9.46])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65F5QJCM012830;
	Mon, 15 Jun 2026 01:26:22 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH v10 0/2] Add Support for LTC3220 18 Channel LED Driver
Date: Mon, 15 Jun 2026 13:26:07 +0800
Message-ID: <20260615-ltc3220-driver-v10-0-916562c88598@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO+ML2oC/33Oy07DQAwF0F9BsybI9rxZ8R+IxWQe7UilQUkVg
 ar+O243DViw9LXOtc9qqXOvi3p+OKu5rn3p05EHhMcHlffpuKtDLxwoAnKA4IbDKWsiGMrc1zo
 PLabR5RwLVqMYfcy19c9b4+sbz/u+nKb563ZgxWv6Z9WKAwxe8664hs7El3RMh2n3lKd3de1aa
 eORhCf2BYwGG1o2pQmvN57db6/Zt9ocUs2mpSS82Xr5v2GfbbToCVwmI7z931v2aClpqDGk0Qv
 v7t6gF95dfUDrg8daShHe372FILxnDw0ijcmaRlr4sPEYhQ/sK3qPGb3WTf4fN57k/cjeRWOhZ
 UKdxx/+crl8A83hZ7SuAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781501179; l=5483;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=fn8syrmkir0TTD0IDtLGfBZqW5BqWxL9YNbx4kDGXm8=;
 b=Vm4lYepj3pc7kgTXY+w3H/wTDUOEEbQr8l1hqGI5HmxOmszFI+mjvPketxQ89IGSQIOVRXo3F
 07UDaGEvIfmBKlkxFbVkJFsR0C/ZlokdQMrd1ciXuesA0aFSiJP2aM7
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: s9uKEJ2-VLgiOn9Xf_qHmB4-8nzQ-dt0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NCBTYWx0ZWRfXzIn/h6wxkbLc
 Ztb20SsEK0SVHCidk1dUDWiUraBZN/ZTzKsvRqJGm3ApB6N6/stHL3ioHm4yMdUk5UBOYT8G8Aa
 XNRq8gEG5udteASZs66wQQ473Fl7wg73dJpAP83WGMUxhgBjY3HN0tYjUSq1lITRcQw+9H5H2NU
 xU792y+A+CdwaB/R5Sbjc0wvkqU8AyAznk62ObYR04NTtLCLlq/ZM/m6K3B/txoukEF2JLMJvWS
 yCqHk8DBiIcw3ObbOH/bwaxDXT336KAS29wrta+n5HsK9QVRS6jN0ZhMftiWxYX2IgARCsjTvzT
 k2ug6RXzvd5Z+Ay5fVosH9re4AIcGmeyVQvG2roJdjOb6zqoxe4a21LvQrmpXrYUn4s3FxiHM+V
 tCVEwWaadnbTmaYbbCLY4hLsCvAHkN7yEHIrh2I0yB09dGXIv0UsNS2iVnf8N14403fljLb8sLE
 7qHq8CYjLm9IASY6TaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NCBTYWx0ZWRfX1J9V3B00lge8
 F9Nuw/rA5nzhroJLbo1+Qpgi25O0nYX/meWnk3Vm3p5aSd1wKE0A9cMYiU1sn+94cuHOVAGR4lA
 WAIFwuwE6YA94a1zRujkfH3QPxtuf3SDVQgHpNB17SaOL1+iSbRw
X-Proofpoint-GUID: s9uKEJ2-VLgiOn9Xf_qHmB4-8nzQ-dt0
X-Authority-Analysis: v=2.4 cv=WuAb99fv c=1 sm=1 tr=0 ts=6a2f8d0b cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=mrwdJ8biqqVtw7QHM48A:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8587-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,analog.com:dkim,analog.com:email,analog.com:mid,analog.com:from_mime];
	FORGED_SENDER(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:edelweise.escala@analog.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B91A868373A

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
 drivers/leds/leds-ltc3220.c                        | 467 +++++++++++++++++++++
 5 files changed, 620 insertions(+)
---
base-commit: 25025253476a64c186592d952c27f24bc3490e42
change-id: 20260106-ltc3220-driver-f9ab6cc9d1e4

Best regards,
-- 
Edelweise Escala <edelweise.escala@analog.com>


