Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0134131536
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jan 2020 16:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgAFPtD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Jan 2020 10:49:03 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:41128 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbgAFPtD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 Jan 2020 10:49:03 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id B8FD1FB09;
        Mon,  6 Jan 2020 16:48:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9ozlM3C6QP1l; Mon,  6 Jan 2020 16:48:57 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 0C76649D3F; Mon,  6 Jan 2020 16:48:55 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] leds: lm3692x: Allow to set ovp and brigthness mode
Date:   Mon,  6 Jan 2020 16:48:49 +0100
Message-Id: <cover.1578324703.git.agx@sigxcpu.org>
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

This v4 moves the exponential brightness mode to the back of the series
as per Pavel's request:

  https://lore.kernel.org/linux-next/20200106103233.GA32426@amd/T/#m93270a9bf10b88e060f4e4cf5701c527476de985

The end result is identical and i've tested everything still works when
dropping the last to patches and checked compiltion via

  git rebase -i ... -exec 'make ... Image dtbs'

Patches are against linux-leds-next.

Changes from v3
- Move exponential mode patches to the back of the series
  https://lore.kernel.org/linux-next/20200106103233.GA32426@amd/T/#m93270a9bf10b88e060f4e4cf5701c527476de985
- Add Rob's Reviewed-by:, thanks!

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

Guido Günther (6):
  leds: lm3692x: Make sure we don't exceed the maximum led current
  leds: lm3692x: Move lm3692x_init and rename to lm3692x_leds_enable
  leds: lm3692x: Split out lm3692x_leds_disable
  leds: lm3692x: Disable chip on brightness 0
  dt: bindings: lm3692x: Add ti,brightness-mapping-exponential property
  leds: lm3692x: Allow to configure brigthness mode

 .../devicetree/bindings/leds/leds-lm3692x.txt |   3 +
 drivers/leds/leds-lm3692x.c                   | 165 ++++++++++++------
 2 files changed, 113 insertions(+), 55 deletions(-)

-- 
2.23.0

