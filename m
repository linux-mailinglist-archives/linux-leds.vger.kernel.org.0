Return-Path: <linux-leds+bounces-7750-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLdIFaMA4mna0QAAu9opvQ
	(envelope-from <linux-leds+bounces-7750-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 11:42:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1841975C
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 11:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 403E73043D73
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFAC3AC0FF;
	Fri, 17 Apr 2026 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="OC+2JyVo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB89392C2A;
	Fri, 17 Apr 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418974; cv=none; b=pswpU+ymCV6FOUi1xhob2U6EIdqN7GOe3UF32RDJdZvd6ObF+uKMQ2W7II4w2dnJ9z4TcdeCL4JYnpjfUbuG5K7p8l1p+vu3WJeTTC3SjScNl0HQ6c6zwM6BS2GxXOMbN6IknAWE3RmIYOWH12ku62xjrwXcV8tI5cM5HcAsXVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418974; c=relaxed/simple;
	bh=v9tHhY1o+rWXC3qQwdj4wKf+nh8bguz7yCmVc0hoTAw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=a+0OsNTSDcwW+AEFkyvd1YOtLYFtawrVMUnr0YffKgOcAiHwI9wu9qXXVhA4eRnoJ1XvglpL7jdAQzDxGLXmpa4FBv13l+YwGfwF2mHFAMasziWMEKCcXoly8F1IrGgpf8G/pN5HMp1frjohgcrfj+F/3a++WXgwEr5VRcfn/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=OC+2JyVo; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7MA6W1700016;
	Fri, 17 Apr 2026 05:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=EVi5ub0sdGNkerY6W2AigjKU0Qv
	mNH3i0SnkRlrLzvU=; b=OC+2JyVo2Oy7SHTfow/isc3/jeyPBH8km7lNcb86eJ6
	rDwGRyYCW6ef2NXkh7G+iVrqaQNQqKC0Qx9ElI0+zhJFs9UAhAyJCecWAb7oG53S
	quMvhceVDJ40EfeSBUXdLkGIxZdlrKAwKptgdQAm70ybJ/T5bBfSN1IKRFjngFzb
	5VU8iYSDfUmU9UUa3+5i5K5qE8913K7wpr7P1RjX1l5JZ4fL7fDTqBEJFz9FLeWG
	z9k3WV2rv5sa+B4qIoCREwdwozFEfxu5ZeRiOyGYJgm6p+nkAk91ln1KY+nrknJN
	fNnb32+xxD0FEU5vcsnF/FCGhLmnmwLjBA1NO+i9BRA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dk4cm2sd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 05:42:48 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63H9gl1b019659
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Apr 2026 05:42:47 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 17 Apr 2026 05:42:47 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 17 Apr 2026 05:42:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 17 Apr 2026 05:42:47 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com ([10.118.4.168])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63H9gZIh000824;
	Fri, 17 Apr 2026 05:42:38 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH v6 0/2] Add Support for LTC3220 18 Channel LED Driver
Date: Fri, 17 Apr 2026 17:42:26 +0800
Message-ID: <20260417-ltc3220-driver-v6-0-18157871eddd@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIIA4mkC/33Oz24CIRDH8VcxnKVhhj8rnnyPpgeEQUl017CGt
 DH77h09bUva42/I5xseYqZaaBb7zUNUamUu08jDbTcinsN4IlkSb4EKnQLl5OUeNaKSqZZGVWY
 fji5Gn4CMYHSrlMvnK/j+wftc5vtUv179Bs/rn6kGUslB81tyGZzxhzCGy3R6i9NVPFsNVx6w8
 8g+KaOV3eVoUu68Xnl2v71mnyk7QIomh9B5s/b9/w37aL2FAZWLaDpv//eWPVgMWpHfhePwwy/
 L8g2Tv7OBrQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776418955; l=3791;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=v9tHhY1o+rWXC3qQwdj4wKf+nh8bguz7yCmVc0hoTAw=;
 b=6CAbgjZH6mA9AYyL0A75IDqpEVqm7woFfLk5WPlcjXMcF+0WBiq2E39QP55Ebmgkr8lVlbW45
 n73WTpdrKp1CvTeMrVFcSo0ECQFDMQmUwlrf/ZiOaScuvuarGWIpQxX
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=dpDrzVg4 c=1 sm=1 tr=0 ts=69e20098 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=ug16CcPq06YyOAJwHUsA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: RbF2PMqr1wQmVV9UkzW-QT5r8Jf45d2m
X-Proofpoint-GUID: RbF2PMqr1wQmVV9UkzW-QT5r8Jf45d2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA5NiBTYWx0ZWRfX5quT+KizBFIo
 Ufox9Mbm59nRpvpTZ7OrWBlqqcf9W9AUNsg7zvV3a7FFTmsXTpol7IKzbeIL5h2mTQmc0TjW5Im
 1GHej5qRgRgNL4MAmJA/erh0e/yzFEri8h4kc1g43HORdL9HuQgT+XmBsjJRhsNT7wymtm7c3wN
 h9ptMQxvgRZu4RCyf+BoDKKHQtEt+pA6KZNqoKhoW4Ut/FITEsEwoziwQfY0RRZ/pxsEob2rAwk
 MypnBptSepF4/1pxNKD60tDxm+/qGICIRObqdzucOs3m8JtOabc0umSAXrIZ8pA/PmuhiFmhmR9
 40D3WKIyoeryxNNZlHYVCeqVx37UDyYHJbscf7mTa++yNnV33fiHjrsClkV+iD3yzZxRqwoSi0i
 Bv3maXTzXbNe1lOQZzbeyJC/YkX0qZWKRSmP2Q53LVh/MMD2xnT032mJ8Kp2MchaiKX3HBPlfWL
 sD/wALbg0SS2jG3hn7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170096
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
	TAGGED_FROM(0.00)[bounces-7750-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,analog.com:dkim,analog.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BAD1841975C
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
 drivers/leds/leds-ltc3220.c                        | 418 +++++++++++++++++++++
 5 files changed, 559 insertions(+)
---
base-commit: 8856d7fe1758937ac528770f552ec58c388c255b
change-id: 20260106-ltc3220-driver-f9ab6cc9d1e4

Best regards,
-- 
Edelweise Escala <edelweise.escala@analog.com>


