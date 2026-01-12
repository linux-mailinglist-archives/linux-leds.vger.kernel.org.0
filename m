Return-Path: <linux-leds+bounces-6621-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CFED115D8
	for <lists+linux-leds@lfdr.de>; Mon, 12 Jan 2026 10:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58C603009430
	for <lists+linux-leds@lfdr.de>; Mon, 12 Jan 2026 09:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0515E346AD6;
	Mon, 12 Jan 2026 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="yOTljhOm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F41346776;
	Mon, 12 Jan 2026 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208409; cv=none; b=h+AAyDVnD3gAPmg2QeVN4AkeWzcFSncWieZU2LRSnsfakr9HjpQLpiSrOSsXOriFU3975uS/0Bfkh8VYQFCx+EMOoxk/8a/AHmf54v1Bv9lXe31DXf7YSQBg0c6VuSfY/jr4/qYQGnnresXFK5/r9+rAxWPfZfHqNj4O/5h1vGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208409; c=relaxed/simple;
	bh=eKpgJNDjppYUS2d5G+U+kXwkrdmfy7DNup/waw54YCI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=iP8nkm7RibusUFMAHFYPf1RPLfISrRI8EGsbhto97w+5ev+NZW85MYN8aEL01URL8Z+GGbRIGUxei4JaVNADoJT8EgC1KoqHmcPOhudYXP5gAwf15hdqy5POb1PM4DRCzXmITW10AWUrnLN+/PLsML8lMYvl35ZzHsDkZAS/93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=yOTljhOm; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C6FTac3797043;
	Mon, 12 Jan 2026 04:00:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=eye8L581vv9XQT1J36MU9sVHftr
	8BusJWpnp0/mEOmI=; b=yOTljhOmK2+txaoti0w6OpNOQt1cVHObu01Jitbip6g
	7D9SeZltlmey1mtDftzNbyLg0JUUUeShed2luqdnCWNLhk8Z8dqUir66HoKSGF8+
	E/zsABxbKrxJWCn6R7GGaIpxV9hI4pg6/Io1rflPBLx7h5SIbt4IQfcIeSR7dcZ4
	qe22UA64CvyaJpEYe/LAg5QdmNHuksvmc2IIksGXUy9m0+rMY8cXEbJt47LWYCai
	zHzpmYhnkYVWvwTaxPomymNxfpretCHICEeCk2MondM2DAFIYQjANybV5QxHnu55
	ysNIzHVgJNnn+JwxGPM20kIbkYAO2xq3q02cCdLNh8A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4bmuhcrxa7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 04:00:02 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 60C901ZQ016126
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Jan 2026 04:00:01 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 12 Jan 2026 04:00:01 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 12 Jan 2026 04:00:01 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 12 Jan 2026 04:00:01 -0500
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-dSnw7wZQW59.ad.analog.com [10.118.4.152] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 60C8xn3D027902;
	Mon, 12 Jan 2026 03:59:52 -0500
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH v2 0/2] Add Support for LTC3220 18 Channel LED Driver V2
Date: Mon, 12 Jan 2026 16:55:53 +0800
Message-ID: <20260112-ltc3220-driver-v2-0-d043058fc4df@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABm3ZGkC/3WMQQ7CIBBFr9LMWgzQBoMr72G6QBjaSWoxQ0M0D
 XcXu3f5/s97O2RkwgzXbgfGQpnS2kCfOvCzWycUFBqDltpIJY1YNt9rLUVgKsgiWvcw3tugcIA
 mvRgjvY/gfWw8U94Sf45+Ub/1b6ooIcWlb18wUZnB3tzqljSdfXrCWGv9AlmedhytAAAA
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
	<edelweise.escala@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768208389; l=2081;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=eKpgJNDjppYUS2d5G+U+kXwkrdmfy7DNup/waw54YCI=;
 b=LWLxEqSH46jlXAjaXGssFWRBMUXmvdSs3ralcBoRH+I118I8vF7HlFkjSnq6hrJ5CYIPsb4b5
 +9RmVEYQDhQCmeOacZLRrdRkHewciX9Yh8EaNUt1vBJwLMFlo34tAH+
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=dOOrWeZb c=1 sm=1 tr=0 ts=6964b812 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=oNZzZGKLbrry4k1XXYEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: bFIS4GR1sgmBsRkploOMrIg1vsibCbrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MCBTYWx0ZWRfXzCQEBc/rRUhj
 LmFiTXGzEbNhXzTmv933lxkYrF2LGTmUG/faTKkDV+uYBCSiCkWIFjCnEwzSUEkW0gLF1Q12MZf
 b8GMheIv2FKZny+Nira1BOgOcd3EutgoFfs1VH+fAxxNilGB36H87RYLzY4MFJ6MrMG+teim1cH
 zSS49NVnEzlO+TFCVKMliuvsaFFZW3jfmceZs7CgBZvCkwJQAoDxNIf/kYDroebWYJaPvToTccF
 JBFimA71MVN8TlnT0i3RPTXdmco4A5VqyQanwE+mfAb+3PVAcwDoWw+/uuOnswser5tHM/LEgZ5
 q6AiM1+TWW25PEPva0NkxbPxW0oIaEr+YFv0FhsoT787rmwlORPyg8SwC1o/S5r1CZ6poQLqjzK
 Pu1SJ+FP5RPpVMChBbYhUmBXqSCG9ypunRmOcwu3gpsKArbZkAZ7ti294n8HJsbIYoAJrMvoOBm
 pXCR+g6YjfXxWrbai9A==
X-Proofpoint-ORIG-GUID: bFIS4GR1sgmBsRkploOMrIg1vsibCbrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120070

The LTC3220/LTC3220-1 is a multi-display LED driver, which contains a
high-efficiency, low-noise charge pump to provide power to up to
18 LED current sources. The LEDs are individually configurable to
64-step linear brightness control, blinking and gradation control
via 2-wire I2C interface. The blinking and gradation configuration
is shared across all LED.

LTC3220 has a quick write function which allows changing the brightness
on all LEDS simultaneously when the brightness is changed on led 1.
For this we made quick write a device property which user can set on the 
device tree. We would like to know if this approach is alright?
Another way we might want to know is, is it alright to just make a
virtual led for the quick write function. Changing brightness on 
the virtual led will change the brightness for all.

V2 Changelog:
leds-ltc3220.yaml changes
-Fix wrapping on description
-Improve description and commit messge to describe hardware
-Drop ltc3220-1
-Drop charge pump
ltc3220.c changes
-Fix wrapping
-Drop ltc3220-1
-Drop devname_mandatory 

Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com

---
Edelweise Escala (2):
      dt-bindings: leds: Add LTC3220 18 channel LED Driver
      leds: ltc3220: Add Support for LTC3220 18 channel LED Driver

 .../devicetree/bindings/leds/leds-ltc3220.yaml     | 120 ++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  10 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3220.c                        | 440 +++++++++++++++++++++
 5 files changed, 579 insertions(+)
---
base-commit: 8856d7fe1758937ac528770f552ec58c388c255b
change-id: 20260106-ltc3220-driver-f9ab6cc9d1e4

Best regards,
-- 
Edelweise Escala <edelweise.escala@analog.com>


