Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F347812058E
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2019 13:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbfLPM2L (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Dec 2019 07:28:11 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:33310 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727427AbfLPM2K (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Dec 2019 07:28:10 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id E974FFB05;
        Mon, 16 Dec 2019 13:28:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QqYTTr5bAsRt; Mon, 16 Dec 2019 13:28:07 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 7D8BF498AE; Mon, 16 Dec 2019 13:28:06 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] leds: lm3692x: Allow to set ovp and brigthness mode
Date:   Mon, 16 Dec 2019 13:28:04 +0100
Message-Id: <cover.1576499103.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Overvoltage protection and brightness mode are currently hardcoded
as disabled in the driver. Make these configurable via DT.

Guido Günther (2):
  dt: bindings: lm3692x: Document new properties
  leds: lm3692x: Allow to set ovp and brigthness mode

 .../devicetree/bindings/leds/leds-lm3692x.txt |  4 ++
 drivers/leds/leds-lm3692x.c                   | 43 ++++++++++++++++---
 2 files changed, 41 insertions(+), 6 deletions(-)

-- 
2.23.0

