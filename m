Return-Path: <linux-leds+bounces-8345-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JN8H8ADGGqdZggAu9opvQ
	(envelope-from <linux-leds+bounces-8345-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 10:58:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C905EF13E
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 10:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3C15302EBB4
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 08:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221AB389DF3;
	Thu, 28 May 2026 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="VlPF1aCB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F8346A14;
	Thu, 28 May 2026 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958261; cv=none; b=ndB9D9mOkTXGc1UngJAH+hQOnxwQYlynnqNBLERSVNlIR6Im6Chzx4Sr6k4+T60eWVhS8gEp5cjybX6Ywh06A3mOCwjAMZX7SB5sRMYZz/11jci2dJN4O00DoM/JALcGWshBXgMXL/dGZiq/DS3UPmaUtRpOoNoS9L9oP/7AMAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958261; c=relaxed/simple;
	bh=INLSw80uimzkf/X8WkclJMiZI4XzlRtU7F1l779Tj2k=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=B+7GkoCIl0tuq99ef/hqrSOKPxtha0wkhWtCxssEXudNraBycticHB6eAjGMcjFsOUUWikgFPOFxD5tekZjBJSzqnuFpR0L6YQnEC7t1XkJwxmmEKYP+Aqn/+m6H0+M6kZKcK5T5yneLpyowG5OJs6LhVNgv3qlC2qoDWQW7X40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=VlPF1aCB; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8fRgP651298;
	Thu, 28 May 2026 04:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=F0VrqbaFKCJO0Phr8rGim3wlfjx
	8ECMGLgnLb0OIvO4=; b=VlPF1aCB8Qjym6gex7fsDpNdCSbCyVyuzW0rNaGXcrM
	5+7ZBgYjLvqxlC5b6JlFPEeEPNYlJk9F2OHRf4Zw9gL7pB4SVQLPqnlfs0Yn9Mar
	jw8rIOO1s/PQitmx1HXvhNN432MhzuVoZkbIIWKTxWy0PJ3EfKF8Kb2+QlbzT2sm
	GF8CFEXwYZnAqcEv128fEoRKWSgI4Ub0izrOGYbcMd3qbCcSmdvLUpM2FFOGfCQo
	c+rtT5xqjgYP/2kFRI1W0T9hTErpQ6WdEnlwPA+9z7SMYZMdueeCbwViUMPIa491
	/JzG6cJIdy7lf/2fZrNFVfZS0TMPqcd+hDJI66Lzdfw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4ee7x4241b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 04:50:56 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 64S8otvI037627
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 May 2026 04:50:55 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 28 May
 2026 04:50:54 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 28 May 2026 04:50:54 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.71])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 64S8ohpg017193;
	Thu, 28 May 2026 04:50:45 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH v9 0/2] Add Support for LTC3220 18 Channel LED Driver
Date: Thu, 28 May 2026 16:49:39 +0800
Message-ID: <20260528-ltc3220-driver-v9-0-69450fc213cb@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQBGGoC/33OTU7DMBAF4KtUXmPkGf+z4h6IhWOPW0slqZwqA
 lW5O043DViwfDP6nt6NzVQLzezlcGOVljKXaWzBPx1YPIXxSLyklhkKNAKE4edrlIiCp1oWqjz
 7MJgYfQJSrKFLpVw+74Vv7y2fynyd6te9f4Ht+mfVAlxwK9svmQxG+dcwhvN0fI7TB9u6Ftx5w
 M5j80koKbTLUaXcebnzzf32svlM2QBSVDmEzqu97/er5qP2GiwKE1F1Xv/vdfOgMUhB3oXBdt4
 8vALbebN5B9o6C5RS6rx9eC1c523zIguPQ9Aqo+y823nwnXfNE1gLEayU+ef+dV2/ARqn8eNtA
 gAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779958243; l=5022;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=INLSw80uimzkf/X8WkclJMiZI4XzlRtU7F1l779Tj2k=;
 b=rG0nrUOAo3spQsNYlcIYz8ZM0ZD7U7tZiCrwPH6hyPn/IejtNhA7f+Kcrj6KoZDCU8PnSEYY+
 6CeW1lDabcEDF7TDa00/lQmKNfLkFjv2Q8o5gxZDBHLTxoBG4fHVgpm
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a1801f0 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=lDDPbOU8p52JHVfxhooA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA4NyBTYWx0ZWRfX6r4l7o6+USQv
 zggVeCl1G/Edq8rNxMc+jGgS3kXg2qE7Vriwb1z9Ut4Vkuodn1OhG3EB5/Svc4wrjzLZPHz8L4q
 8QhNPSrSvdXf+n9tmv505NRZHrwIM8MQ9rIQ8HYN14hCVUCySlcf8ugzgYgKE0wgbdS5JELY5kW
 UxmtaPLnjxyhh4lkvnWcyji9uxks+6dQ+K5T2hDaOJEhDf6Q6fQB2zr7hu/GQm6Q1SOR1tze6Mz
 u2HvuYRrEtEISdhc4D1aMjV+Bv0DEg+DC5j1Xm6hKCypMRzNEuaBLlTHbYqd6+PXMgEQzqA0/7u
 fG68tBJ6uAyqzf0a0TAUWMtZVNUtTNaEV/5OKKMZIh/e4MWVkiMILpKDoCWJUa9CHas1njuKlLB
 FdsF+4n1CQqciI77IdW26l8vx+ZmIilybZsy9e4LNBFKwMQzsYeL3VO0WVaMCZmX2kf7nAFvZQS
 w1U0ZA9ewhO0RzH6m3w==
X-Proofpoint-ORIG-GUID: OiJIwSl6q9S6LkaDXx1XSti-8EUmh8Ee
X-Proofpoint-GUID: OiJIwSl6q9S6LkaDXx1XSti-8EUmh8Ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[analog.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8345-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,analog.com:mid,analog.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 86C905EF13E
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
 drivers/leds/leds-ltc3220.c                        | 440 +++++++++++++++++++++
 5 files changed, 593 insertions(+)
---
base-commit: 25025253476a64c186592d952c27f24bc3490e42
change-id: 20260106-ltc3220-driver-f9ab6cc9d1e4

Best regards,
-- 
Edelweise Escala <edelweise.escala@analog.com>


