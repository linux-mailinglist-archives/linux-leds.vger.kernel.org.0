Return-Path: <linux-leds+bounces-6533-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C7BCF6C75
	for <lists+linux-leds@lfdr.de>; Tue, 06 Jan 2026 06:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EED03019948
	for <lists+linux-leds@lfdr.de>; Tue,  6 Jan 2026 05:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206B12FDC37;
	Tue,  6 Jan 2026 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Jr4Oub1e"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ECB279794;
	Tue,  6 Jan 2026 05:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767677252; cv=none; b=VdsuEJBMBvx9B2hIn+Ea5uMbJgIeEj3x2Act3Gst7hQY/4cm15W5rB6w1EYB0Ngv88iq3Rw8IXxVw2NDN4Z7WXZWqvHsmow6j3nKTZYRQ6mbPq3X70HyGpAbbKq8tNYPVVA7pvnrklwDeKqeY6syBjpu525YWPqx+X/InU487BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767677252; c=relaxed/simple;
	bh=+pAtOnrecXggS20Wc0JZCuWrTaFnP3oo9azvnXs82w4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=KpbrGstcF1+PhQis+2dNvje+dl8XzymS5HUMBsc8+yy5RcH1uj2ZTMOV2YTC+KjtXS+UJPy5BGmYSMhDut713fo7z5N3t4jxW/UH0TjkLdYRJtf068WJEZrafF/lBkj9PGCEMNM++n00w4PSDuJebj8nFVhyL+lcUZY4qJU7TSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Jr4Oub1e; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6064iZeK3806549;
	Tue, 6 Jan 2026 00:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=w62ePTfOIb9dUYd+Ed9Rn/candU
	kikYFEhzF1dpuXR0=; b=Jr4Oub1eDbVpDSv3tPLw2l410fJ5YaDHLoGAEXbClcB
	MccvNd4JoQtaA2veBnDyNe/OnYLRzho3K03W8GGB+YHAbwrrqj2HY+h8xOG5GOmo
	McJ0Lv18WNx2DFOvb26Ug9HkxQlHkS0ertN05x8soocDL7kwEtJw7BQdCwkcqpMN
	Ru/vlggU8Ii9LrCi25JQMUIfxJjhsMIREGBar04fpGuH4MW9AR5AuNDLosGhIvBU
	l/MX1ZM6zXLyJo+JTZF2lZiHO3fnvi37P7v7weydTYgiug+3OdiZtSyzmEJBFteH
	SpMid1M1+ag16X51C5/MuAUjKQnKRouaVzzLh94ix0Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4bgbcem986-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 00:27:27 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6065RQ84021534
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jan 2026 00:27:26 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 6 Jan 2026 00:27:25 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 6 Jan 2026 00:27:25 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 6 Jan 2026 00:27:25 -0500
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.58])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6065RF6o016126;
	Tue, 6 Jan 2026 00:27:18 -0500
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH 0/2] Add Support for LTC3220 18 Channel LED Driver
Date: Tue, 6 Jan 2026 13:27:06 +0800
Message-ID: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqdXGkC/x3MQQqAIBBA0avIrBPUQrCrRAvTqQbCYgwJwrsnL
 d/i/xcyMmGGUbzAWCjTmRp0JyDsPm0oKTaDUcYqraw87tAbo2RkKshydX6xIbiocYAWXYwrPf9
 wmmv9AMyWRNJgAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767677235; l=1573;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=+pAtOnrecXggS20Wc0JZCuWrTaFnP3oo9azvnXs82w4=;
 b=+jsJMtvAhZM4/sdIrBN6/U5ssz76VtK2LSzJ0B3cp/WKY2OF7KujJXRYw39fD6R0+cCZqJWUZ
 nC024S9KEQJBfdyBrv6FQqyeGpn9bM7kN6IOacN2T/FWaKZo7/JNcY2
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=b4C/I9Gx c=1 sm=1 tr=0 ts=695c9d3f cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gAnH3GRIAAAA:8 a=tfZQpLiCuOg4snQlxIoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: HM2Vo8NtfvCEfx9mybjKIp_waMQFlB4i
X-Proofpoint-ORIG-GUID: HM2Vo8NtfvCEfx9mybjKIp_waMQFlB4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0MyBTYWx0ZWRfX6k/w3liOBQ1E
 IQqA4KVYJXSAMI8z43M3l/9359s17FbvCxhvp7PI3QBHFyqwwpPHZcA2W6/T1ePfdcXjv23KGKl
 pXTvU+535pnNH/fVOhdaKGbB7jsETeIfDEk1a+udZsORbDYrws0v20/d/OoSroo5btvERP+DAG8
 Cqoq7LUxqkJAu8rWEJBhf3tDeF+yRRirrBNsuAKgnNFUOQRfpwHwnUowxE8gVoP7KXyUUb4vKU2
 IIjg9AKI6x9eTw3LpZGv1bYmVtrwUqJZ81/enCg6rAUAZEX32EqinXkuL0u8fywf8m8I7HkNG1C
 mRCQAyOUaem5R4O/JMg1108XMnIypGYmo6d+9LASPmhLnNh14BXGwkE+r3kn2K97C/Z3ivSt0CF
 o/p4/zlncM9uKtPlIGvAtqms4n/YgY6vtMIU9BCOJiAm9aY5d7X7EW63cP/pLabXGKsiP7zH5Rw
 +KFloET0O0jluNrYGJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060043

The LTC3220/LTC3220-1 is a multi-display LED driver, which contains a high-efficiency,
low-noise charge pump to provide power to up to 18 LED current sources.
The LEDs are individually configurable to 64-step linear brightness control,
blinking and gradation control via 2-wire I2C interface.
The blinking and gradation configuration is shared across all LED.

LTC3220 has a quick write function which allows changing the brightness
on all LEDS simultaneously when the brightness is changed on led 1.
For this we made quick write a device property which user can set on the device tree.
We would like to know if this approach is alright?
Another way we might want to know is, is it alright to just make a virtual led for the quick write function.
Changing brightness on the virtual led will change the brightness for all.

Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
Edelweise Escala (2):
      dt-bindings: leds: Document LTC3220 18 channel LED Driver
      leds: ltc3220: add driver

 .../devicetree/bindings/leds/leds-ltc3220.yaml     | 131 ++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  10 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3220.c                        | 465 +++++++++++++++++++++
 5 files changed, 615 insertions(+)
---
base-commit: 8856d7fe1758937ac528770f552ec58c388c255b
change-id: 20260106-ltc3220-driver-f9ab6cc9d1e4

Best regards,
-- 
Edelweise Escala <edelweise.escala@analog.com>


