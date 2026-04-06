Return-Path: <linux-leds+bounces-7634-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHjcHU5e02kEhwcAu9opvQ
	(envelope-from <linux-leds+bounces-7634-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 09:18:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D333A1F8C
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 09:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C757B300F126
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2026 07:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3FA3164A1;
	Mon,  6 Apr 2026 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fPntLWY8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561C3217F27;
	Mon,  6 Apr 2026 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775459880; cv=none; b=DkEq53afiZpDK0TxpxAtYhaCjrQskIoKV9QISTWZY6zsv8sERl/yl6Ar/9qgf9hHywJ8loUjfBVsXl8UeJvst9JOk4TNNNSkDRNzKpZd8pylvXgVLc7WDhGDm81DcGw6gkKCSrVs8E+MqEZYNAANDazkNTEJVQo+ddmhAWzopfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775459880; c=relaxed/simple;
	bh=S+PjdSaRo3lHHmtCINliXAUSAc69a9tphFBWjbjcEWQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=XzjWxRK4PhNszK7OC2cAUNOyBiA2TQYIIQ9Ezr4AuY/DvFeDQEUfCjrSKBV5CwZXCd0ZbdV7t4TdS9u80/FbDyyMGj2T3gIYN/6gm/8/U+kewMmdBzDCsL0S+cgutzgDzyBF7ou1ONKuLzB6pPP7D01ItyDYVCo5bQxkXQ2KafQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fPntLWY8; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6366OAVl3655237;
	Mon, 6 Apr 2026 03:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=bL2iwm/CSbRSrLI3ht2zV2h70Ki
	CfjxKW+CBEJadP9c=; b=fPntLWY8qlKIHSPDsJfmeJUA2aMsZJCQ0K5h724Y5c9
	EPMAtKFdVcO+yuvYgTHHXTJKy/s4NT0TouET5gXRHwX/LC7znwSf32U0g/gp3JAs
	rNgXHmT/zezhbhsd+Dw7Bp7khN0JpkAjDO8bzE6BjiDzz7zsXQbE/L6zEbCM8ETK
	bZdSwc/UHJgRbLzWUEmK8ALgXIo0siC5ffHPqfRmFcuICenikxHa44Zz+cUwBeD1
	cheohFngZKdx04fjxwKy8P7/AQ4vtXB1VUaiBDjtll3EiHprCQcVOXnSr/4hEY1i
	pBNdd/sCCE2MBjPbEGsqePB7Ih4OycmuAqIViQfO5Lw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4dbgy9un83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Apr 2026 03:17:56 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6367HtEV018034
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Apr 2026 03:17:55 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 6 Apr
 2026 03:17:55 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 6 Apr 2026 03:17:55 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.28])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6367HhUv004461;
	Mon, 6 Apr 2026 03:17:46 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH v3 0/2] Add support for LTC3208 multi-display driver
Date: Mon, 6 Apr 2026 15:17:04 +0800
Message-ID: <20260406-upstream-ltc3208-v3-0-7f0b1d20ee7a@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPBd02kC/33NTQrCMBCG4avIrI3kh8bElfcQF2k6aQNtU5Ial
 NK7m3alIC7fD+aZBRJGjwkuhwUiZp98GEuI4wFsZ8YWiW9KA6dcUsEUeUxpjmgG0s9WcKrI2Vq
 lpaqd1AjlbIro/HMnb/fSnU9ziK/9Q2bb+gfLjFBCWeWYY6iprK5mNH1oTzYMsGmZfwhc/hB4E
 URTW615LalWX8K6rm9zMSSN8wAAAA==
X-Change-ID: 20260318-upstream-ltc3208-7cc8968bf69e
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Jan Carlo Roleda <jancarlo.roleda@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775459863; l=1783;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=S+PjdSaRo3lHHmtCINliXAUSAc69a9tphFBWjbjcEWQ=;
 b=9yoBWcmRrYQg0jtVN9KZWwe4+U2cAvUCfOCwgDFpm0UYnKXbaWpnSx6ot9MuLh1xk9VNQ1Pe8
 8PRw3EYAcbfBAPX2lmkNagfEmkbIxRKRUXlaUje4NsYvBqUF3p8YWSu
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 4jIwiH5OlFU0A42XduvLuBcFNdAo5RIt
X-Proofpoint-GUID: 4jIwiH5OlFU0A42XduvLuBcFNdAo5RIt
X-Authority-Analysis: v=2.4 cv=OIgqHCaB c=1 sm=1 tr=0 ts=69d35e24 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=YeJ3jcQhQBvMQWeA9nIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2OSBTYWx0ZWRfX4dfkYcjynBe3
 YFdlQdNO8+88U+Dqch4idRJaRRL4bvsSh7c3MFU9No+a67KbtfU+bsF2ysDEV2opzt0ln3L1XGn
 fnFOMWJdSoWRSPVgxOVCuHdK3pzqe1RGdcAhRfZ+rTwgmagBb8lQcirqbC1rYxAcSDwk041FYPn
 IEZ/cnBq1QR/Twz0QlReILVsMgmQlxl4ptbvLf+5UBPAa+cMfnd0lrUfmhZ/jcknCTTcPXmDBqE
 TZ/N/QaWsI89PvYM7aEGdRNA4Jq/xEGli52kS6cM9ocUqIN2OlSyz5LwiV8k0PjLDiRQnI/yfj3
 uh6lLggxi/MDy87TTn0E9fjp2cZOnHueUHFIkUe3x16zlUlSQIJSiSs2woaKUDj8JwF8ONvuvik
 leaxKa4snbAM8YZlklFrI6e4UO9vb5UcG1t2Rlf7OMjU02mU9YphZnH5jnRaQqpfYcNCDOSoWqJ
 asnck8UZrbGrcSGMaYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060069
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7634-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:email,analog.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D0D333A1F8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
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
      leds: ltc3208: add driver
      dt-bindings: leds: Document LTC3208 Multidisplay LED Driver

 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 129 +++++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3208.c                        | 298 +++++++++++++++++++++
 5 files changed, 447 insertions(+)
---
base-commit: e68f95a51d1a8c1594b536c4d495cbea38d47561
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>


