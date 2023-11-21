Return-Path: <linux-leds+bounces-75-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B577F374B
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 21:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF7C01C20D1C
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 20:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA2B5467E;
	Tue, 21 Nov 2023 20:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="OOK5L/8p"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40871A3;
	Tue, 21 Nov 2023 12:28:51 -0800 (PST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DE1C912005B;
	Tue, 21 Nov 2023 23:28:48 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DE1C912005B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1700598528;
	bh=tXkfiDo5nH25tN3BRa0nuqNWCwi/ObmvTMsqxKwhc0w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=OOK5L/8pgZNMxL3Eh03iMcpLcOm6iPHZLu/+qBxNd90v1Id9W0OCgnbdkCQGR+9tA
	 w5JQiSGKsxcsi/S22602evQidM8Q0iTXmC2QsMEDGW/VVx+SXKPnqQLtIBLSEnF5o7
	 J0iuHf/7sF2wEdF81UKKozuT1gLsFconNr7w0VMKbUvOAeOoIl8C/G45zRpqwNS3+L
	 Lcr3EA2ib41M4/6UgNDGEbIooy4dlHx5ymfGVuO754oJBYjSinwtREVcuwndm62nOp
	 8mMPFOwvM2qwUu1jKdHvW+x30yP/4xOQ9+1KpqW7vxFyrZTr73rOMDUs5Cn+o/xe7K
	 hlVjcxnTbP5og==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 21 Nov 2023 23:28:47 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 23:28:47 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <lee@kernel.org>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<andy.shevchenko@gmail.com>
CC: <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v4 00/11] leds: aw200xx: several driver updates
Date: Tue, 21 Nov 2023 23:28:24 +0300
Message-ID: <20231121202835.28152-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181514 [Nov 21 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 3 0.3.3 e5c6a18a9a9bff0226d530c5b790210c0bd117c8, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;doc.awinic.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/11/21 19:45:00
X-KSMG-LinksScanning: Clean, bases: 2023/11/21 19:46:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/21 17:47:00 #22495004
X-KSMG-AntiVirus-Status: Clean, skipped

The following patch series includes several updates for the AW200XX LED
driver:
    - some small fixes and optimizations to the driver implementation:
      delays, autodimming calculation, disable_locking regmap flag,
      display_rows calculation in runtime;
    - fix LED device tree node pattern to accept LED names counting not
      only from 0 to f;
    - add missing reg constraints;
    - support HWEN hardware control, which allows enabling or disabling
      AW200XX RTL logic from the main SoC using a GPIO pin;
    - introduce the new AW20108 LED controller, the datasheet for this
      controller can be found at [1].

Changes v4 since v3 at [4]
    - properly handle max_source = 0 situations
    - fix Rob's dt_binding_check alerts

Changes v3 since v2 at [3]:
    - handle all cases during hwen gpio get routine execution
    - rename 'hwen-gpios' to standard 'enable-gpios'
    - properly handle aw200xx_probe_get_display_rows() ret values
    - fix timestamp format in the comments and commit messages
    - expand LEDS_AW200XX config and dt-bindings description
    - describe reg constraints for all compatible variants
    - add Conor's Acked-by tag

Changes v2 since v1 at [2]:
    - rebase on the latest aw200xx changes from lee/leds git repo
    - some commit messages rewording
    - replace legacy gpio_* API with gpiod_* and devm_gpiod_* API
    - rename dt property awinic,hwen-gpio to hwen-gpios according to
      gpiod API
    - use fsleep() instead of usleep_range() per Andy's suggestion
    - add max_brightness parameter to led cdev to restrict
      set_brightness() overflow
    - provide reg constraints as Rob suggested
    - move hwen-gpios to proper dt node in the bindings example

Links:
    [1] https://doc.awinic.com/doc/20230609wm/8a9a9ac8-1d8f-4e75-bf7a-67a04465c153.pdf
    [2] https://lore.kernel.org/all/20231006160437.15627-1-ddrokosov@salutedevices.com/
    [3] https://lore.kernel.org/all/20231018182943.18700-1-ddrokosov@salutedevices.com/
    [4] https://lore.kernel.org/all/20231101142445.8753-1-ddrokosov@salutedevices.com/

Dmitry Rokosov (3):
  leds: aw200xx: support HWEN hardware control
  dt-bindings: leds: aw200xx: introduce optional enable-gpios property
  dt-bindings: leds: aw200xx: fix led pattern and add reg constraints

George Stark (7):
  leds: aw200xx: calculate dts property display_rows in the driver
  dt-bindings: leds: aw200xx: remove property "awinic,display-rows"
  leds: aw200xx: add delay after software reset
  leds: aw200xx: enable disable_locking flag in regmap config
  leds: aw200xx: improve autodim calculation method
  leds: aw200xx: add support for aw20108 device
  dt-bindings: leds: awinic,aw200xx: add AW20108 device

Martin Kurbanov (1):
  leds: aw200xx: fix write to DIM parameter

 .../bindings/leds/awinic,aw200xx.yaml         |  95 ++++++++++++-----
 drivers/leds/Kconfig                          |  14 ++-
 drivers/leds/leds-aw200xx.c                   | 100 +++++++++++++++---
 3 files changed, 163 insertions(+), 46 deletions(-)

-- 
2.36.0


