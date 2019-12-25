Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDEBF12A7A6
	for <lists+linux-leds@lfdr.de>; Wed, 25 Dec 2019 12:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfLYLH1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Dec 2019 06:07:27 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:36294 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbfLYLH0 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 25 Dec 2019 06:07:26 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 8EBCDFB04;
        Wed, 25 Dec 2019 12:07:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SHGpHxTKvx2y; Wed, 25 Dec 2019 12:07:19 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 3D39F40BD8; Wed, 25 Dec 2019 12:07:19 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] leds: lm3692x: Allow to set ovp and brigthness mode
Date:   Wed, 25 Dec 2019 12:07:13 +0100
Message-Id: <cover.1577271823.git.agx@sigxcpu.org>
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

Besides addressing review comments v2 also allows to limit the maximum led
current.

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

To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,Pavel Machek <pavel@ucw.cz>,Dan Murphy <dmurphy@ti.com>,Rob Herring <robh+dt@kernel.org>,Mark Rutland <mark.rutland@arm.com>,linux-leds@vger.kernel.org,devicetree@vger.kernel.org,linux-kernel@vger.kernel.org


Guido Günther (6):
  dt: bindings: lm3692x: Add ti,ovp-microvolt property
  leds: lm3692x: Allow to configure over voltage protection
  dt: bindings: lm3692x: Add ti,brightness-mapping-exponential property
  leds: lm3692x: Allow to configure brigthness mode
  dt: bindings: lm3692x: Add led-max-microamp property
  leds: lm3692x: Make sure we don't exceed the maximum led current

 .../devicetree/bindings/leds/leds-lm3692x.txt | 11 +++
 drivers/leds/leds-lm3692x.c                   | 67 +++++++++++++++++--
 2 files changed, 72 insertions(+), 6 deletions(-)

-- 
2.23.0

