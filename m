Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 906891301E7
	for <lists+linux-leds@lfdr.de>; Sat,  4 Jan 2020 11:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgADKyd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Jan 2020 05:54:33 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:40172 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbgADKyd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 4 Jan 2020 05:54:33 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 16572FB02;
        Sat,  4 Jan 2020 11:54:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id p7bQUniFPXNl; Sat,  4 Jan 2020 11:54:27 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 074E049AA7; Sat,  4 Jan 2020 11:54:25 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] leds: lm3692x: Allow to set ovp and brigthness mode
Date:   Sat,  4 Jan 2020 11:54:16 +0100
Message-Id: <cover.1578134779.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Overvoltage protection and brightness mode are currently hardcoded
as 29V and disabled in the driver. Make these configurable via DT.

Besides addressing review comments v3 folds in the patches to
disable the chip and turn of the regulator on brightness 0 from

  https://lore.kernel.org/linux-leds/20191226101419.GE4033@amd/T/#t

Besides addressing review comments v2 also allows to limit the maximum led
current.

Patches are against next-20191220.

Changes from v2
- As per review comment from Pavel Machek
  https://lore.kernel.org/linux-leds/20191226100615.GA4033@amd/T/#u
  - Use default value in DT example
  https://lore.kernel.org/linux-leds/20191226100842.GC4033@amd/T/#u
  - Use uppercase LED in commit message
  https://lore.kernel.org/linux-leds/20191226101336.GD4033@amd/T/#u
  - Fix typo in commit message
  - Use correct return value when checking if property is present
  - Fold in
    https://lore.kernel.org/linux-leds/20191226101419.GE4033@amd/T/#t
- Add Acked-By's from Pavel Machek, thanks!

Changes from v1
- As per review comments by Dan Murphy
  https://lore.kernel.org/linux-leds/3d66b07d-b4c5-43e6-4378-d63cc84b8d43@ti.com/
  - Split commits per propoerty
  - Add new properties to DT example too
  - Drop dev_dbg() statements
  - ovp: fix 21V value parsing
  - ovp: Set correct default value if DT parsing fails
- As per review comments by Pavel Machek
  https://lore.kernel.org/linux-leds/20191221191515.GF32732@amd/
  - Fix defaults (which is 29V)
  - Use uV as Unit for ovp property
- Change property name to 'ti,ovp-microvolt' to make it shorter
- Honor led-max-microamp to not exceed the maximum led current

Guido Günther (9):
  dt: bindings: lm3692x: Add ti,ovp-microvolt property
  leds: lm3692x: Allow to configure over voltage protection
  dt: bindings: lm3692x: Add ti,brightness-mapping-exponential property
  leds: lm3692x: Allow to configure brigthness mode
  dt: bindings: lm3692x: Add led-max-microamp property
  leds: lm3692x: Make sure we don't exceed the maximum led current
  leds: lm3692x: Move lm3692x_init and rename to lm3692x_leds_enable
  leds: lm3692x: Split out lm3692x_leds_disable
  leds: lm3692x: Disable chip on brightness 0

 .../devicetree/bindings/leds/leds-lm3692x.txt |  11 +
 drivers/leds/leds-lm3692x.c                   | 195 +++++++++++++-----
 2 files changed, 149 insertions(+), 57 deletions(-)

-- 
2.23.0

