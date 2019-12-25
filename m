Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF6F212A7AA
	for <lists+linux-leds@lfdr.de>; Wed, 25 Dec 2019 12:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfLYLQn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Dec 2019 06:16:43 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:36536 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbfLYLQm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 25 Dec 2019 06:16:42 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 047EEFB06;
        Wed, 25 Dec 2019 12:16:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Yl7lK3UUEFvp; Wed, 25 Dec 2019 12:16:40 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id A190740BD8; Wed, 25 Dec 2019 12:16:39 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] leds: lm3692x: Disable chip on brightness 0
Date:   Wed, 25 Dec 2019 12:16:36 +0100
Message-Id: <cover.1577272495.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Otherwise there's a hardly noticeable glow even with brightness 0. Also turning
off the regulator can save additional power.

This is on top of the "leds: lm3692x: Allow to set ovp and brigthness mode".
Without that applied there's a minor merge conflict since this introduces a new
variable in struct lm3692x_led as well. I did not want to lump it in there as
well since it's not related to any DT properties at all.

Guido Günther (3):
  leds: lm3692x: Move lm3692x_init and rename to lm3692x_leds_enable
  leds: lm3692x: Split out lm3692x_leds_disable
  leds: lm3692x: Disable chip on brightness 0

 drivers/leds/leds-lm3692x.c | 128 ++++++++++++++++++++++--------------
 1 file changed, 77 insertions(+), 51 deletions(-)

-- 
2.23.0

