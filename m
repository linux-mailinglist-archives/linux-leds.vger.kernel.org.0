Return-Path: <linux-leds+bounces-6679-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B7D3BED4
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 06:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EBC8835B299
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 05:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFDE352945;
	Tue, 20 Jan 2026 05:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Q/g9EdWX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9204346A12;
	Tue, 20 Jan 2026 05:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768887369; cv=none; b=rjgjR4APQH3ilnn+RssbvqA9lYVRxW7O3fR/pSXevYVntifo4BAsKUIXCbNA9uZ8IQgohGVkks/7Qj7HqT+Wd27QvvwOe1oKTzHqW7ubjmz/uTGcaxfiOrOnqfrEIZI1qm34ZzGO24zQ+fi+pV85zQshIkxhHtP1uc1OUEX7he4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768887369; c=relaxed/simple;
	bh=VOj+F6b04Uvx4/PTkL71kSg9cehOK6lgT4rpT5ehCHY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=rjSgQxvVcaxgHjZhbFzXtloVyz/2O6A+1lPyWoPVMygvAUDVacWhEFfnnDxpSw2I82Y7dkOV1q2LXNgA8eC4T1dQrM2HkfprBPMd5BsJXpmgUcRmLO+ZMq0q8iv3F5L8AZC7PdowSHkzUz7jtRt3xfaJ4MJiIs0DBkiGmzAhQCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Q/g9EdWX; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K425dP1516483;
	Tue, 20 Jan 2026 00:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=7rYxDrIcVr2E4+RXPzSRm5J4zpJ
	/hjmnUtEmsBJrIic=; b=Q/g9EdWXVfbPIpU5KveBRj6j0SY4y/QUsUUN8Z20Cuw
	oFBdEGciSQBrmPccpTkdu9Db52kSrqqWZnQ+3OkMkFux+Y3QOKDme5hWoqEbH/V6
	XjWMySszc2C+/3fDpzFFA/BGSfGTu1wiO1GMVmqRJHuXafOJYF10OsYHH0muakCm
	IwJ7e8aCeirlm9lvf5KkQUJ7JCEtwcfP9I0ulZJwKcBkqVj5VwweN19FLNkVe0lT
	mdnDf/T6YL/OUp8zVMMCCx+vT2ua77RgnbxtTRwNIZhJkrWodZlDHilkbmIbIe1M
	pjHx76KUUqVd5jxuxPdnTet78RHJN6ewt6tgbvw2cfQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4bt2ax88wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 00:35:56 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 60K5ZtoX049129
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jan 2026 00:35:55 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 20 Jan
 2026 00:35:55 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 20 Jan 2026 00:35:55 -0500
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.31])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 60K5ZhRH026625;
	Tue, 20 Jan 2026 00:35:46 -0500
From: Edelweise Escala <edelweise.escala@analog.com>
Subject: [PATCH v3 0/2] Add Support for LTC3220 18 Channel LED Driver
Date: Tue, 20 Jan 2026 13:35:05 +0800
Message-ID: <20260120-ltc3220-driver-v3-0-fef612ec4faa@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAoUb2kC/3WMwQ7CIBAFf8VwFrMsiNaT/2E8ICwtSS0GGqJp+
 u/SnjTG47yXmYllSoEyO20mlqiEHOJQQW43zHZmaIkHV5khoAYBmvejlYjAXQqFEveNuWlrGyd
 IsSo9EvnwXIOXa+Uu5DGm19ovYln/porgwA+yfk57oVVzNoPpY7uz8c6WVsEPX+CPj9V3oCTsj
 94q57/8eZ7fzYpzx+0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768887343; l=2337;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=VOj+F6b04Uvx4/PTkL71kSg9cehOK6lgT4rpT5ehCHY=;
 b=FlPRLQJf0yNWI3TOI9YdO4Xo4IpkJVSJA819tpOiSCWYxizL+Auw3sDdxbEx7awBueJDk1Llv
 LeO73BMvTvfA7/vPeK7QzHN/rM9B+S9S2eJJ830a5kqXjGyQHGwjz+L
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=Hvl72kTS c=1 sm=1 tr=0 ts=696f143c cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=G8gMnhxpCVIOteuZxq0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: WHQb3Na_da3QWaoTHUK1Xm5b72JlGfzi
X-Proofpoint-GUID: WHQb3Na_da3QWaoTHUK1Xm5b72JlGfzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA0NCBTYWx0ZWRfX31ZESog3YBZh
 CfDrf6+dxfsJJ6Xx+X2ijbAaCImdaQ/HWleJDCg3zMRDkQUv5s+1yNjdrF6xe93tG74O/QUSIHj
 fiT5hlVoGbde8bnw1XlnWJA05QDxdCodrsDxkMWWLij0lMHdG69xnz9guQhYTec1rT08bcQDhz4
 hHHfJzcDlX/8qvbXAwanamsT02vTXRKwMWc36sER52qKie2waITT6jen0M69QkO5Jb9b+KM5r3b
 v6ya9+NdOrTqVqOtXvH8hZ7sHxbV397TWk7g9DDLSzIWACu8gOtL0tRDUT/sNWcnzrxQ7B4WBbe
 uRrqSHYmqwHiszQQtUe0p1F3BbdQ0iZxPaYlV6IvGT6/KGy6F9TjfXnoqHm8XyhBkO3RzDV3Brl
 OXM+AZtAxBbXRCgQ6J17gCj79Kr+L9bZTrZ7aNAkga+irqZhUAYZxiL4Nmq0UtiD4Pjhb8xmkn3
 AALhQ2vV2x9CZEhom7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200044

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

Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
Changes in v3:
- Dropped quick-write on bindings and added aggregated led instead.
- Add aggregated led example.
- Modify quick write to check if there is aggregated led, if there is
  aggregated led enable quick write.
- Use DEFINE_SIMPLE_DEV_PM_OPS instead of SIMPLE_DEV_PM_OPS.
- Link to v2: https://lore.kernel.org/r/20260112-ltc3220-driver-v2-0-d043058fc4df@analog.com

Changes in v2:
leds-ltc3220.yaml changes
-Fix wrapping on description
-Improve description and commit messge to describe hardware
-Drop ltc3220-1
-Drop charge pump
ltc3220.c changes
-Fix wrapping
-Drop ltc3220-1
-Drop devname_mandatory
- Link to v1: https://lore.kernel.org/r/20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com

---
Edelweise Escala (2):
      dt-bindings: leds: Add LTC3220 18 channel LED Driver
      leds: ltc3220: Add Support for LTC3220 18 channel LED Driver

 .../devicetree/bindings/leds/leds-ltc3220.yaml     | 120 ++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  10 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3220.c                        | 457 +++++++++++++++++++++
 5 files changed, 596 insertions(+)
---
base-commit: 8856d7fe1758937ac528770f552ec58c388c255b
change-id: 20260106-ltc3220-driver-f9ab6cc9d1e4

Best regards,
-- 
Edelweise Escala <edelweise.escala@analog.com>


