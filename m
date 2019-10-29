Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04170E8894
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2019 13:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731109AbfJ2Mqb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Oct 2019 08:46:31 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37023 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfJ2Mqb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Oct 2019 08:46:31 -0400
Received: by mail-lj1-f196.google.com with SMTP id v2so855045lji.4;
        Tue, 29 Oct 2019 05:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=SmXBqMQnjI4Fb5pWVH79fOjCH7aXT9QQnr1eIyZGvcI=;
        b=kPxmtU27XbTFQ7uutYG2u2XGr3StpvZt+PuJr1Dybqisjhs8IhRuoJrDGX9OpRJ1Ih
         Zh0s0mw+8J5zVuc7yQN/1+mddx+SNjmP0Bs0Qc/hnuU47FHqnzpMbDd1TAkGxOl7IYpt
         KyXAV4BrCYO2bi3JBGOPMoDqQkbUJYISuusZFtzBr2mD+wR5Ie2Il1E1so/NmSJKIqPC
         tvxL9wpYv8Qmt1vzvp8A38BavkrlByksRy2QAxCkPjKnL7hYvRjZVP/Bqd2xv1uQH7/t
         FhnADoccjucxEMt4dhZbKijUPi8l40shVSloIeQYh52YpN/Q8xRI42xv0DGtpBtzUF/I
         guog==
X-Gm-Message-State: APjAAAVAVv/DI9qYkGiAk6DKIDZUcBwZ1zcSR1ULBFuSFJ8evLbHzB2e
        5iyLwuz2h19JNW3LC0O0GyA=
X-Google-Smtp-Source: APXvYqxkVCm41zzITF3FOQIAQ/XackjtVW6az/7Nr0u8MJdACHufwvUnYj0VlJFrRh9QckkFGTGyZA==
X-Received: by 2002:a05:651c:1023:: with SMTP id w3mr2506858ljm.79.1572353188859;
        Tue, 29 Oct 2019 05:46:28 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id z26sm2237139lfg.94.2019.10.29.05.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 05:46:28 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:46:20 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/5] leds: Add DT node finding and parsing to core
Message-ID: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

RFC series improving common LED binding parsing support

Qucik grep for 'for_each' or 'linux,default-trigger' says it all.

Multiple LED controller drivers implement the very similar looping
through the child DT nodes in order to locate the LED nodes and read
and support the common LED dt bindings. Implementing this same
stuff for all LED controllers gets old pretty fast.

This RFC contains 3 suggestions:

Simplest is adding support for parsing the linux,default-trigger,
and default-state DT properties in led-core.

More interesting part is adding correct LED DT node lookup in
LED core. This RFC uses LED DT node names as a 'key' in a same
way regulator framework does for regulators. The thing is that
this approach requires the LED controller binding to dictate allowed
LED node names - which may or may not be doable. I need your help to
evaluate this and suggest better options :) If we still look at the
regulators, the regulator core did originally use "regulator-core"
property to do driver data/DT node pairing - but has since then
changed the approach to using the DT node names.

Last and least clear point is isolating the led_classdev to be owned
by the LED core. Controller drivers should pretty much never touch
it after the initialization. So one approach would be that drivers
only provided initialization data and operations to the core.

The patch series contains the led-core and led-class changes which
introduce (yet another) APIs for registering led class device to
core. Adding new interface is probably not the best option - one
might consider changing the (devm_)led_classdev_register_ext to do
what this new RFC API is doing.

In addition to core changes this series converted two (randomly
selected) existing drivers to use the new API. This can give an
overview how offloading the DT parsing to core could simplify many
of the LED controlled drivers.

Patches HAVE NOT BEEN TESTED other than for compiling. They are
only intended to be a starting point for discussion - and if the
ideas are seen worthy - then the patches should be further worked
and properly tested before being applied.

Matti Vaittinen (5):
  leds: Add common LED binding parsing support to LED class/core
  dt-bindings: an30259a: example for using fixed LED node names.
  leds: an30259a: Offload DT node locating and parsing to core
  dt-bindings: lm3692x: example for using fixed LED node names.
  leds: lm3692x: Offload DT node locating and parsing to core

 .../bindings/leds/leds-an30259a.txt           |   9 +-
 .../devicetree/bindings/leds/leds-lm3692x.txt |   4 +-
 drivers/leds/led-class.c                      | 247 +++++++++++++++++-
 drivers/leds/led-core.c                       | 111 +++++---
 drivers/leds/leds-an30259a.c                  | 181 ++++++-------
 drivers/leds/leds-lm3692x.c                   |  75 +++---
 include/linux/leds.h                          | 144 +++++++++-
 7 files changed, 586 insertions(+), 185 deletions(-)

-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
